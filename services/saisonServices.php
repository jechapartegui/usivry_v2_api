<?php
include_once("config/params.php");
include_once("class/class.php");
class SaisonService {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function add($saison) {

        //sans update du mot de passe
        $sql = "INSERT INTO saison (nom, active) VALUES (?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$saison->nom, $saison->active]);
        return $this->db->lastInsertId();
    }


    public function get($id) {
        $sql = "SELECT * FROM saison WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        return $stmt->fetch();
    }
    public function getActive() {
        $sql = "SELECT * FROM saison WHERE active = 1";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $res = $stmt->fetch(PDO::FETCH_ASSOC);
        return $res['id'];
    }

    public function getAll() {
        $sql = "SELECT * FROM saison";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    public function getAllLight() {
        $sql = "SELECT id as 'key' ,nom as 'value' FROM saison order by id desc";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'KeyValuePair');
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function update($saison) {
        $sql = "UPDATE saison SET nom=?, active=?  WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$saison->nom, $saison->active,$saison->id]);
    }

    public function deleteRider($id) {
        $sql = "DELETE FROM saison WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$id]);
    }
}