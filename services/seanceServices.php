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
            if ($attribut == "place_maximum" && $valeur == "") {
                $seance->$attribut = -1;
            }
            if ($attribut == "age_maximum" && $valeur == "") {
                $seance->$attribut = 99;
            }
            if ($attribut == "convocation_nominative" && $valeur == "") {
                $seance->$attribut = 0;
            }
            if ($attribut == "essai_possible" && $valeur == "") {
                $seance->$attribut = 0;
            }
        }


        return $seance;
    }
    // PROF SEANCE
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

    public function add($seance)
    {
        $seance = $this->ToSeance($seance);
        $sql = "INSERT INTO seance (cours, libelle, date_seance, heure_debut, duree_cours, lieu_id, statut,  
        age_requis, age_maximum, place_maximum, essai_possible, notes, info_seance, convocation_nominative) 
        VALUES ($seance->cours, '$seance->libelle','$seance->date_seance','$seance->heure_debut', $seance->duree_cours, $seance->lieu_id, '$seance->statut',
        $seance->age_requis,$seance->age_maximum, $seance->place_maximum, $seance->essai_possible, '$seance->notes', '$seance->info_seance', $seance->convocation_nominative)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $seance_id = $this->db->lastInsertId();
        foreach ($seance->professeurs as $prof) {
            $this->add_prof($seance_id, $prof['key']);
        }
        return $seance_id;
    }
    public function update($seance)
    {
        $seance = $this->ToSeance($seance);
        $sql = "UPDATE seance SET cours=$seance->cours, libelle='$seance->libelle',date_seance='$seance->date_seance', heure_debut='$seance->heure_debut', convocation_nominative=$seance->convocation_nominative,
        duree_cours=$seance->duree_cours, lieu_id=$seance->lieu_id, statut='$seance->statut', age_requis =$seance->age_requis, age_maximum = $seance->age_maximum, 
        place_maximum=$seance->place_maximum, essai_possible=$seance->place_maximum, notes='$seance->notes', info_seance='$seance->info_seance' WHERE seance_id=$seance->seance_id";
        $stmt = $this->db->prepare($sql);
        $retour =  $stmt->execute();
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
        $sql = "SELECT * FROM seance WHERE seance_id=$id";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $stmt->execute();
        $seance = $stmt->fetch();
        $seance->professeurs = $this->get_prof_seance($id);
        return $seance;
    }

    public function getAll($season_id, $all = false)
    {
        if ($all) {
            $sql = "SELECT s.seance_id as seance_id, s.libelle as libelle, c.id as cours, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, s.statut as statut, s.age_requis as age_requis, s.age_maximum as age_maximum,  s.place_maximum, s.notes, s.essai_possible, s.info_seance, s.convocation_nominative
            FROM seance s inner join cours c on s.cours = c.id inner join lieu l on s.lieu_id = l.id WHERE c.saison_id = $season_id order by s.date_seance desc";
        } else {
            $sql = "SELECT s.seance_id as seance_id, s.libelle as libelle, c.id as cours, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, s.statut as statut, s.age_requis as age_requis, s.age_maximum as age_maximum, s.place_maximum, s.notes, s.essai_possible, s.info_seance, s.convocation_nominative
            FROM seance s inner join cours c on s.cours = c.id inner join lieu l on s.lieu_id = l.id WHERE c.saison_id = $season_id and s.statut = 'prévue' order by s.date_seance desc";
        }
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $stmt->execute();
        $seances = $stmt->fetchAll();
        foreach ($seances as $seance) {
            $seance->professeurs = $this->get_prof_seance($seance->seance_id);
        }
        return $seances;
    }
    public function get_relance()
    {

        $date_min = date('Y-m-d'); // Date de référence (jour J) 
        $date_max = date('Y-m-d', strtotime("+15 days", strtotime($date_min)));
        $sql = "select distinct c.id, c.login 
        from compte c 
        inner join riders r on r.compte=c.id 
        left join inscription_saison i on i.rider_id = r.id 
        left join saison s on s.id = i.saison_id 
        where s.active = 1 and c.mail_active = 1;";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Compte');
        $stmt->execute();
        $comptes = $stmt->fetchAll();
        $p = new params();
        foreach ($comptes as $compte) {
            $compte->riders = array();
            $sql = "SELECT id, prenom, nom, date_naissance FROM riders WHERE compte = " . $compte->id;
            $stmt = $this->db->prepare($sql);
            $stmt->setFetchMode(PDO::FETCH_CLASS, 'Rider');
            $stmt->execute();
            $compte->riders = $stmt->fetchAll();
            foreach ($compte->riders as $rider) {
                $age = $p->calculerAge($rider->date_naissance);
                $sql = "SELECT groupe_id FROM lien_groupe WHERE objet_id = $rider->id and objet_type = 'rider'";
                $stmt = $this->db->prepare($sql);
                $stmt->execute();
                $rider->groupes = $stmt->fetchAll();
                // $niveaux = $p->getNiveaux($rider->niveau);
                // $inClause = implode(',', array_fill(0, count($niveaux), '?'));

                // // Entourer chaque niveau par des quotes
                // $inClause = implode(',', array_map(function () {
                //     return '?';
                // }, $niveaux));
                $rider->seances = array();
                $rider->inscriptions = array();
                $sql = "SELECT distinct s.seance_id as seance_id, c.id as cours, s.libelle as libelle, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.nom as lieu, s.info_seance as info_seance
                    FROM seance s 
                    INNER JOIN cours c ON s.cours = c.id 
                    INNER JOIN lieu l ON s.lieu_id = l.id 
                    inner join lien_groupe lg1 on lg1.objet_id = s.seance_id and lg1.objet_type = 'séance'
                    inner join lien_groupe lg2 on lg1.groupe_id = lg2.groupe_id and lg2.objet_id = $rider->id and lg2.objet_type = 'rider'
                    WHERE s.date_seance >= '$date_min' AND s.date_seance <= '$date_max' AND s.age_requis <= $age AND s.age_maximum >= $age AND s.statut = 'prévue' order by s.date_seance asc ";
                $stmt = $this->db->prepare($sql);
                $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
                $stmt->execute();
                $ss = $stmt->fetchAll();
                foreach ($ss as $seance) {
                    $sql = "SELECT * FROM `inscription` WHERE `statut` is not null and rider_id = " . $rider->id . " AND seance_id = " . $seance->seance_id;
                    $stmt = $this->db->prepare($sql);
                    $stmt->execute();
                    $stmt->setFetchMode(PDO::FETCH_CLASS, 'Inscription');
                    $resinsc = $stmt->fetch();
                    $rowCount = $stmt->rowCount();
                    if ($rowCount == 0) {
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

    public function get_seanceprevue($this_season)
    {
        $sql = "SELECT s.seance_id as seance_id, s.libelle as libelle, c.id as cours, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, s.statut as statut, c.age_requis as age_requis, s.age_maximum as age_maximum,  s.place_maximum, s.essai_possible, s.info_seance, s.convocation_nominative
        FROM seance s inner join cours c on s.cours = c.id inner join lieu l on s.lieu_id = l.id WHERE statut = 'prévue' AND c.saison_id = " . $this_season . "  order by s.date_seance desc";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $stmt->execute();
        $seances = $stmt->fetchAll();
        foreach ($seances as $seance) {
            $seance->professeurs = $this->get_prof_seance($seance->seance_id);
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

        $sql = "SELECT s.seance_id as seance_id, c.id as id, s.libelle as libelle, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, s.statut as statut, s.age_requis as age_requis, s.age_maximum as age_maximum,  s.place_maximum, s.essai_possible, s.info_seance, s.convocation_nominative
        FROM seance s inner join cours c on s.cours = c.id inner join lieu l on s.lieu_id = l.id WHERE s.date_seance >= ? AND s.date_seance <= ? AND c.saison_id = " . $this_season . " order by s.date_seance asc";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $stmt->execute([$startDate, $endDate]);
        $seances = $stmt->fetchAll();
        foreach ($seances as $seance) {
            $seance->professeurs = $this->get_prof_seance($seance->seance_id);
        }
        return $seances;
    }
}
