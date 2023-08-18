<?php 
class SeanceService {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function ToSeance($data){
        $seance = new Seance();
        foreach ($data as $attribut => $valeur) {           
                $seance->$attribut = $valeur;
        }
        

        return $seance;
    }

    public function add_prof($seance_id,$prof,$presence = "présent"){
        $sql = "INSERT INTO seance_professeur (seance_id, professeur_id, statut) VALUES (?, ?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$seance_id, $prof, $presence]);
    }

    public function delete_prof($seance_id,$prof =0){
        if($prof == 0){
            $sql = "DELETE FROM seance_professeur WHERE seance_id=?";
            $stmt = $this->db->prepare($sql);
        } else {
            $sql = "DELETE FROM seance_professeur WHERE seance_id=? and professeur_id = ?";
            $stmt = $this->db->prepare($sql);
        }
    }
    public function update_prof($seance_id,$prof,$presence){
        $sql = "UPDATE seance_professeur SET  statut=? WHERE seance_id=? and professeur_id = ?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$presence, $seance_id, $prof]);
 
    }

    public function get_prof_seance($seance_id){
        $sql = "SELECT s.professeur_id as 'key', concat(r.prenom,' ', r.nom) as 'value' from seance_professeur s inner join riders r on r.id = s.professeur_id where seance_id=?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$seance_id]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'KeyValuePair');
        return $stmt->fetchAll();
    }


    public function add($seance) {
        $seance = $this->ToSeance($seance);
        $sql = "INSERT INTO seance (cours, date_seance, heure_debut, duree_cours, lieu_id, statut, niveau_requis, age_requis) VALUES (?, ?, ?, ?, ?, ?,?,?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$seance->cours, $seance->date_seance, $seance->heure_debut, $seance->duree_cours, $seance->lieu_id, $seance->statut, $seance->niveau_requis, $seance->age_requis]);
        $seance_id = $this->db->lastInsertId();
        foreach ($seance->professeurs as $prof) {
           $this->add_prof($seance_id, $prof);
        }
        return $seance_id;

    }

    public function update($seance) {
        $seance = $this->ToSeance($seance);
        $sql = "UPDATE seance SET cours=?, date_seance=?, heure_debut=?, duree_cours=?, lieu_id=?, statut=?, niveau_requis= ?, age_requis =? WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$seance->cours->id, $seance->date_seance, $seance->heure_debut, $seance->duree_cours, $seance->lieu_id, $seance->statut, $seance->niveau_requis, $seance->age_requis, $seance->seance_id]);
    }

    public function delete($id) {
        $sql = "DELETE FROM seance WHERE id=?";
        $stmt = $this->db->prepare($sql);
        $this->delete_prof($id);
        return $stmt->execute([$id]);
        
    }

    public function get($id) {
        $sql = "SELECT * FROM seance WHERE id=?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        $seance = $stmt->fetch();
        $seance->professeurs = $this->get_prof_seance($id);
        return $seance;
    }

    public function getAll($season_id) {
        $sql = "SELECT s.seance_id as seance_id, c.id as cours, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, s.statut as statut, s.age_requis as age_requis, s.niveau_requis as niveau_requis
        FROM seance s inner join cours c on s.cours = c.id inner join lieu l on s.lieu_id = l.id WHERE c.saison_id = ? order by s.date_seance desc";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $stmt->execute([$season_id]);
        $seances = $stmt->fetchAll();
        foreach ($seances as $seance) {
            $seance->professeurs = $this->get_prof_seance($seance->id);
        }
        return $seances;
    }
    public function get_seanceprevue() {
        $sql = "SELECT s.seance_id as seance_id, c.id as cours, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, s.statut as statut, c.age_requis as age_requis, s.niveau_requis as niveau_requis
        FROM seance s inner join cours c on s.cours = c.id inner join lieu l on s.lieu_id = l.id WHERE statut = 'prévue' order by s.date_seance desc";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $stmt->execute();
        $seances = $stmt->fetchAll();
        foreach ($seances as $seance) {
            $seance->professeurs = $this->get_prof_seance($seance->id);
        }
        return $seances;
    }

    public function get_seance_plagedate() {
        $referenceDate = date('Y-m-d'); // Date de référence (jour J)
    
        $startDate = date('Y-m-d', strtotime("-5 days", strtotime($referenceDate)));
        $endDate = date('Y-m-d', strtotime("+30 days", strtotime($referenceDate)));
    
        $sql = "SELECT s.seance_id as seance_id, c.id as cours, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, s.statut as statut, s.age_requis as age_requis, c.niveau_requis as niveau_requis
        FROM seance s inner join cours c on s.cours = c.id inner join lieu l on s.lieu_id = l.id WHERE s.date_seance >= ? AND s.date_seance <= ? order by s.date_seance desc";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $stmt->execute([$startDate, $endDate]);
        $seances = $stmt->fetchAll();
        foreach ($seances as $seance) {
            $seance->professeurs = $this->get_prof_seance($seance->id);
        }
        return $seances;
    }
    
}
