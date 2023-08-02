<?php

class InscriptionService {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function add($inscription) {
        $sql = "INSERT INTO inscription (rider_id, seance_id, date_inscription) VALUES (?, ?, NOW())";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$inscription->personne->id, $inscription->seance->id]);
        return $this->db->lastInsertId();
    }

    public function get($id) {
        $sql = "SELECT * FROM inscription WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public function getAll_BySeance($id_seance) {
        $sql = "SELECT rider_id FROM inscription where seance_id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id_seance]);
        return $stmt->fetchAll();
    }

    public function getAll_ByCours($id_cours) {
        $sql = "SELECT distinct(rider_id) FROM inscription i inner join seance s on s.id = i.seance_id WHERE s.cours_id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id_cours]);
        return $stmt->fetchAll();
    }

    public function getAll_ByRider($rider_id, $saison_id) {
        $sql = "SELECT distinct(rider_id) FROM inscription i inner join seance s on s.id = i.seance_id 
        inner join cours c on c.id = s.cours_id
        WHERE i.rider_id = ? and c.saison_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$rider_id, $saison_id]);
        return $stmt->fetchAll();
    }


    public function delete($id) {
        $sql = "DELETE FROM inscription WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$id]);
    }
}
