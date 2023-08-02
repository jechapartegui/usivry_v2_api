<?php 
class SeanceService {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function add($seance) {
        $sql = "INSERT INTO seance (cours_id, date_seance, heure_debut, duree_cours, lieu_id, statut, professeurs) VALUES (?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$seance->cours->id, $seance->date_seance, $seance->heure_debut, $seance->duree_cours, $seance->lieu_id, $seance->statut, implode(',', $seance->professeurs)]);
        return $this->db->lastInsertId();
    }

    public function update($seance) {
        $sql = "UPDATE seance SET cours_id=?, date_seance=?, heure_debut=?, duree_cours=?, lieu_id=?, statut=?, professeurs=? WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$seance->cours->id, $seance->date_seance, $seance->heure_debut, $seance->duree_cours, $seance->lieu_id, $seance->statut, implode(',', $seance->professeurs), $seance->id]);
    }

    public function delete($id) {
        $sql = "DELETE FROM seance WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$id]);
    }

    public function get($id) {
        $sql = "SELECT * FROM seance WHERE id=?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public function getAll() {
        $sql = "SELECT * FROM seance";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    public function get_seanceprevue() {
        $sql = "SELECT * FROM seance where statut = 'prévue'";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function get_seance_plagedate() {
        $referenceDate = date('Y-m-d'); // Date de référence (jour J)
    
        $startDate = date('Y-m-d', strtotime("-5 days", strtotime($referenceDate)));
        $endDate = date('Y-m-d', strtotime("+30 days", strtotime($referenceDate)));
    
        $sql = "SELECT * FROM seance WHERE date_seance >= ? AND date_seance <= ?";
        $stmt = $this->db->prepare($sql);
    
        $stmt->execute([$startDate, $endDate]);
        return $stmt->fetchAll();
    }
    
}
