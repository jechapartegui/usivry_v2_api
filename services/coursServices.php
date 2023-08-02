<?php class CoursService {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function add($cours) {
        $sql = "INSERT INTO cours (nom, jour_semaine, heure, duree, prof_principal_id, lieu_id, age_requis, niveau_requis, saison_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$cours->nom, $cours->jour_semaine, $cours->heure, $cours->duree, $cours->prof_principal_id, $cours->lieu_id, $cours->age_requis, $cours->niveau_requis, $cours->saison_id]);
        return $this->db->lastInsertId();
    }

    public function update($cours) {
        $sql = "UPDATE cours SET nom=?, jour_semaine=?, heure=?, duree=?, prof_principal_id=?, lieu_id=?, age_requis=?, niveau_requis=?, saison_id=? WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$cours->nom, $cours->jour_semaine, $cours->heure, $cours->duree, $cours->prof_principal_id, $cours->lieu_id, $cours->age_requis, $cours->niveau_requis, $cours->saison_id, $cours->id]);
    }

    public function delete($id) {
        $sql = "DELETE FROM cours WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$id]);
    }

    public function get($id) {
        $sql = "SELECT * FROM cours WHERE id=?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public function getAll() {
        $sql = "SELECT * FROM cours";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function getAll_bySaison($saison_id) {
        $sql = "SELECT * FROM cours where saison_id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$saison_id]);
        return $stmt->fetchAll();
    }
}