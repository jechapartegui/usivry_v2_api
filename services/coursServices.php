<?php class CoursService {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function ToCours($data){
        $cours = new Cours();
        foreach ($data as $attribut => $valeur) {           
                $cours->$attribut = $valeur;
        }
        

        return $cours;
    }


    public function add($cours, $season_id) {
        if(!isset($cours['saison_id']) || $cours['saison_id']==0){
            $cours['saison_id'] = $season_id;
        }
        $cours = $this->ToCours($cours);
        if (is_array($cours->niveau_requis)) {
            $niveau = implode(',', $cours->niveau_requis);
        } else {
            $niveau = $cours->niveau_requis;
        }
        $sql = "INSERT INTO cours (nom, jour_semaine, heure, duree, prof_principal_id, lieu_id, age_requis, niveau_requis, saison_id, place_maximum) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$cours->nom, $cours->jour_semaine, $cours->heure, $cours->duree, $cours->prof_principal_id, $cours->lieu_id, $cours->age_requis, $niveau, $cours->saison_id, $cours->place_maximum]);
        return $this->db->lastInsertId();
    }

    public function update($cours) {
        $cours = $this->ToCours($cours);
        if (is_array($cours->niveau_requis)) {
            $niveau = implode(',', $cours->niveau_requis);
        } else {
            $niveau = $cours->niveau_requis;
        }
        $sql = "UPDATE cours SET nom=?, jour_semaine=?, heure=?, duree=?, prof_principal_id=?, lieu_id=?, age_requis=?, niveau_requis=?, saison_id=?, place_maximum = ? WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$cours->nom, $cours->jour_semaine, $cours->heure, $cours->duree, $cours->prof_principal_id, $cours->lieu_id, $cours->age_requis, $niveau, $cours->saison_id, $cours->place_maximum, $cours->id]);
    }

    public function delete($id) {
        $sql = "DELETE FROM cours WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$id]);
    }

    public function get($id) {
        $sql = "SELECT *, CONCAT(r.prenom, ' ', r.nom) as prof_principal_nom, l.nom as lieu_nom FROM cours c 
        inner join riders r on r.id = c.prof_principal_id
        inner join lieu l on l.id = c.lieu_id WHERE id=?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Cours');
        return $stmt->fetch();
    }

    public function getAll() {
        $sql = "SELECT *, CONCAT(r.prenom, ' ', r.nom) as prof_principal_nom, l.nom as lieu_nom FROM cours c 
        inner join riders r on r.id = c.prof_principal_id
        inner join lieu l on l.id = c.lieu_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Cours');
        return $stmt->fetchAll();
    }

    public function getAll_bySaison($saison_id) {
        $sql = "SELECT c.*, 
        CONCAT(r.prenom, ' ', r.nom) as prof_principal_nom, l.nom as lieu_nom FROM cours c 
        inner join riders r on r.id = c.prof_principal_id
        inner join lieu l on l.id = c.lieu_id
         where saison_id = ? order by c.heure asc";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$saison_id]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Cours');
        return $stmt->fetchAll();
    }
    public function getAllLight_bySaison($saison_id) {
        $sql = "SELECT id as 'key', nom as 'value' FROM cours where saison_id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$saison_id]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'KeyValuePair');
        return $stmt->fetchAll();
    }
}