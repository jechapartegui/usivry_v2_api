<?php
class SeanceService
{
    private $db;

    public function __construct($db)
    {
        $this->db = $db;
    }

    public function ToSeance($data)
    {
        $seance = new Seance();
        foreach ($data as $attribut => $valeur) {
            $seance->$attribut = $valeur;
        }


        return $seance;
    }

    public function add_prof($seance_id, $prof)
    {
        $sql = "INSERT INTO seance_professeur (seance_id, professeur_id) VALUES (?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$seance_id, $prof]);
    }

    public function delete_prof($seance_id, $prof = null)
    {
        if ($prof == null) {
            $sql = "DELETE FROM seance_professeur WHERE seance_id=?";
            $stmt = $this->db->prepare($sql);
            $stmt->execute([$seance_id]);
        } else {
            $sql = "DELETE FROM seance_professeur WHERE seance_id=? and professeur_id = ?";
            $stmt = $this->db->prepare($sql);
            $stmt->execute([$seance_id, $prof]);
        }
        return true;
    }

    public function get_prof_seance($seance_id)
    {
        $sql = "SELECT s.professeur_id as 'key', concat(r.prenom,' ', r.nom) as 'value' from seance_professeur s inner join riders r on r.id = s.professeur_id where seance_id=?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$seance_id]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'KeyValuePair');
        return $stmt->fetchAll();
    }


    public function add($seance)
    {
        $seance = $this->ToSeance($seance);
        if (is_array($seance->niveau_requis)) {
            $niveau = implode(',', $seance->niveau_requis);
        } else {
            $niveau = $seance->niveau_requis;
        }
        $sql = "INSERT INTO seance (cours, libelle, date_seance, heure_debut, duree_cours, lieu_id, statut, niveau_requis, age_requis, age_maximum, place_maximum, essai_possible, notes, info_seance) VALUES (?, ?,?, ?, ?, ?, ?,?,?, ?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$seance->cours, $seance->libelle, $seance->date_seance, $seance->heure_debut, $seance->duree_cours, $seance->lieu_id, $seance->statut, $niveau, $seance->age_requis, $seance->age_maximum, $seance->place_maximum, $seance->essai_possible, $seance->notes, $seance->info_seance]);
        $seance_id = $this->db->lastInsertId();
        foreach ($seance->professeurs as $prof) {
            $this->add_prof($seance_id, $prof['key']);
        }
        return $seance_id;
    }
    public function get_relance(){

        $date_min = date('Y-m-d'); // Date de référence (jour J)
        // $niveaux = $p->getNiveaux($rider->niveau);
        // $inClause = implode(',', array_fill(0, count($niveaux), '?'));   
        $date_max = date('Y-m-d', strtotime("+10 days", strtotime($date_min)));  
        $sql = "select distinct c.id, c.login from compte c inner join riders r on r.compte=c.id left join inscription_saison i on i.rider_id = r.id left join saison s on s.id = i.saison_id where s.active = 1;";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Compte');
        $stmt->execute();
        $comptes = $stmt->fetchAll();
        $p = new params();        
        foreach ($comptes as $compte) {
            $compte->riders = array();
            $sql = "SELECT id, prenom, nom, date_naissance, niveau FROM riders WHERE compte = ". $compte->id;
            $stmt = $this->db->prepare($sql);
            $stmt->setFetchMode(PDO::FETCH_CLASS, 'Rider');
            $stmt->execute();
            $compte->riders = $stmt->fetchAll();
            foreach ($compte->riders as $rider) {
                    $age = $p->calculerAge($rider->date_naissance);
                    $niveaux = $p->getNiveaux($rider->niveau);
                    $inClause = implode(',', array_fill(0, count($niveaux), '?'));
            
                    // Entourer chaque niveau par des quotes
                    $inClause = implode(',', array_map(function () {
                        return '?';
                    }, $niveaux));
                    $rider->seances = array();
                    $rider->inscriptions = array();
                    $sql = "SELECT  s.seance_id as seance_id, c.id as cours, s.libelle as libelle, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.nom as lieu, s.info_seance as info_seance
                    FROM seance s 
                    INNER JOIN cours c ON s.cours = c.id 
                    INNER JOIN lieu l ON s.lieu_id = l.id 
                    WHERE s.date_seance >= '$date_min' AND s.date_seance <= '$date_max' AND s.age_requis <= $age AND s.age_maximum >= $age AND s.niveau_requis LIKE '%$rider->niveau%'  AND s.statut = 'prévue'";
                   $stmt = $this->db->prepare($sql);
                    $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance'); // Ajoute les niveaux requis à la liste des valeurs à binder
                    $stmt->execute();
                    $ss = $stmt->fetchAll();                    
                    foreach ($ss as $seance) {
                        $sql = "SELECT * FROM `inscription` WHERE `statut` is not null and rider_id = ". $rider->id . " AND seance_id = " . $seance->seance_id ;
                        $stmt = $this->db->prepare($sql);
                        $stmt->execute();     
                        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Inscription');    
                        $resinsc = $stmt->fetch();     
                        $rowCount = $stmt->rowCount();                        
                        if($rowCount == 0 ){
                            array_push($rider->seances, $seance);
                        } else {
                            $seance->statut = $resinsc->statut;      
                            array_push($rider->inscriptions, $seance);
                        }
                    }
            }
               
                
            

        }
        return $comptes;
    }

    public function update_prof_list($seance_id, $professeur)
    {
        $sql = "SELECT professeur_id from seance_professeur where seance_id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$seance_id]);
        $list = $stmt->fetchAll();
        foreach ($list as $item) {
            $remove = true;
            foreach ($professeur as $kvp) {
                if ($item['professeur_id'] == $kvp['key']) {
                    $remove = false;
                }
            }
            if ($remove == true) {
                $this->delete_prof($seance_id, $item['professeur_id']);
            }
        }
        foreach ($professeur as $kvp) {
            $add = true;
            foreach ($list as $item) {
                if ($item['professeur_id'] == $kvp['key']) {
                    $add = false;
                }
            }
            if ($add == true) {
                $this->add_prof($seance_id, $kvp['key']);
            }
        }
        return true;
    }
    public function update($seance)
    {
        $seance = $this->ToSeance($seance);
        if (is_array($seance->niveau_requis)) {
            $niveau = implode(',', $seance->niveau_requis);
        } else {
            $niveau = $seance->niveau_requis;
        }
        $sql = "UPDATE seance SET cours=?, libelle=?,date_seance=?, heure_debut=?, duree_cours=?, lieu_id=?, statut=?, niveau_requis= ?, age_requis =?, age_maximum = ?, place_maximum=?, essai_possible=?, notes=?, info_seance=? WHERE seance_id=?";
        $stmt = $this->db->prepare($sql);
        $retour =  $stmt->execute([$seance->cours, $seance->libelle, $seance->date_seance, $seance->heure_debut, $seance->duree_cours, $seance->lieu_id, $seance->statut, $niveau, $seance->age_requis, $seance->age_maximum, $seance->place_maximum, $seance->essai_possible, $seance->notes, $seance->info_seance,$seance->seance_id]);
        if ($retour == true) {
            $retour = $this->update_prof_list($seance->seance_id, $seance->professeurs);
        }
        return $retour;
    }

    public function delete($id)
    {
        $sql = "DELETE FROM seance WHERE seance_id=?";
        $stmt = $this->db->prepare($sql);
        $this->delete_prof($id);
        return $stmt->execute([$id]);
    }

    public function get($id)
    {
        $sql = "SELECT * FROM seance WHERE seance_id=?";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $stmt->execute([$id]);
        $seance = $stmt->fetch();
        $seance->professeurs = $this->get_prof_seance($id);
        $seance->niveau_requis = explode(",",$seance->niveau_requis);
        return $seance;
    }

    public function getAll($season_id, $all = false)
    {
        if($all){
            $sql = "SELECT s.seance_id as seance_id, s.libelle as libelle, c.id as cours, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, s.statut as statut, s.age_requis as age_requis, s.age_maximum as age_maximum, s.niveau_requis as niveau_requis, s.place_maximum, s.notes, s.essai_possible, s.info_seance
            FROM seance s inner join cours c on s.cours = c.id inner join lieu l on s.lieu_id = l.id WHERE c.saison_id = ? order by s.date_seance desc";
        } else {
            $sql = "SELECT s.seance_id as seance_id, s.libelle as libelle, c.id as cours, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, s.statut as statut, s.age_requis as age_requis, s.age_maximum as age_maximum, s.niveau_requis as niveau_requis, s.place_maximum, s.notes, s.essai_possible, s.info_seance
            FROM seance s inner join cours c on s.cours = c.id inner join lieu l on s.lieu_id = l.id WHERE c.saison_id = ? and s.statut = 'prévue' order by s.date_seance desc";
        }
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $stmt->execute([$season_id]);
        $seances = $stmt->fetchAll();
        foreach ($seances as $seance) {
            $seance->professeurs = $this->get_prof_seance($seance->seance_id);
            $seance->niveau_requis = explode(",",$seance->niveau_requis);
        }
        return $seances;
    }
    public function get_seanceprevue($this_season)
    {
        $sql = "SELECT s.seance_id as seance_id, s.libelle as libelle, c.id as cours, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, s.statut as statut, c.age_requis as age_requis, s.age_maximum as age_maximum,  s.niveau_requis as niveau_requis,s.place_maximum, s.essai_possible, s.info_seance
        FROM seance s inner join cours c on s.cours = c.id inner join lieu l on s.lieu_id = l.id WHERE statut = 'prévue' AND c.saison_id = " . $this_season . "  order by s.date_seance desc";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $stmt->execute();
        $seances = $stmt->fetchAll();
        foreach ($seances as $seance) {
            $seance->professeurs = $this->get_prof_seance($seance->seance_id);
            $seance->niveau_requis = explode(",",$seance->niveau_requis);
        }
        return $seances;
    }

    public function get_Inscrits($id)
    {
        $sql = "select DISTINCT c.login from compte c inner join riders r on r.compte =c.id inner join inscription i on i.rider_id = r.id where i.seance_id = $id and statut = 'présent'";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $inscrits = $stmt->fetchAll();
        return $inscrits;
    }


    public function get_seance_plagedate($this_season)
    {
        $referenceDate = date('Y-m-d'); // Date de référence (jour J)

        $startDate = date('Y-m-d', strtotime($referenceDate));
        $endDate = date('Y-m-d', strtotime("+30 days", strtotime($referenceDate)));

        $sql = "SELECT s.seance_id as seance_id, c.id as id, s.libelle as libelle, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, s.statut as statut, s.age_requis as age_requis, s.age_maximum as age_maximum,  c.niveau_requis as niveau_requis, s.place_maximum, s.essai_possible, s.info_seance
        FROM seance s inner join cours c on s.cours = c.id inner join lieu l on s.lieu_id = l.id WHERE s.date_seance >= ? AND s.date_seance <= ? AND c.saison_id = " . $this_season . " order by s.date_seance asc";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $stmt->execute([$startDate, $endDate]);
        $seances = $stmt->fetchAll();
        foreach ($seances as $seance) {
            $seance->professeurs = $this->get_prof_seance($seance->seance_id);
            $seance->niveau_requis = explode(",",$seance->niveau_requis);
        }
        return $seances;
    }
}
