<?php
include_once("config/params.php");
class InscriptionSaisonService {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function add($saisonId, $riderId) {
        $sql = "INSERT INTO inscription_saison (rider_id, saison_id) VALUES (?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$riderId, $saisonId]);
        return true;
    }

    public function delete($saisonId, $riderId) {
        $sql = "DELETE FROM inscription_saison where rider_id= ? and saison_id = ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$riderId, $saisonId]);
        return true;
    }

    public function getAll_BySaison($saison_id) {
        $sql = "SELECT rider_id FROM inscription_saison where saison_id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$saison_id]);
        return $stmt->fetchAll();
    }
    
}