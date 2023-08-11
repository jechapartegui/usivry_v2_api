<?php

class InscriptionService {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }
        public function ToInscription($data){
        $inscription = new Inscription();
        foreach ($data as $attribut => $valeur) {           
                $inscription->$attribut = $valeur;
        }
        

        return $inscription;
    }

    public function add($inscription) {
        $inscription = $this->ToInscription($inscription);
        $sql = "INSERT INTO inscription (rider_id, seance_id, date_inscription) VALUES (?, ?, NOW())";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$inscription->rider_id, $inscription->seance_id]);
        return $this->db->lastInsertId();
    }

    public function get($id) {
        $sql = "SELECT s.id as id, c.id as cours, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, i.statut as statut, s.age_requis as age_requis, s.niveau_requis as niveau_requis
        FROM inscription i inner join seance s on i.seance_id = s.id inner join cours c on s.cours = c.id inner join lieu l on s.lieu_id = l.id WHERE id = ?";
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
