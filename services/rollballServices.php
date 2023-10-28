<?php
include_once("config/params.php");
include_once("class/class.php");
include_once("class/utils.php");
 class RollBallServices {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function ToTeam($data)
    {
        $seance = new Team();
        foreach ($data as $attribut => $valeur) {
            $seance->$attribut = $valeur;
        }
        return $seance;
    }

    public function checksimilar($team){
        $sql = "SELECT * FROM rb_teams where sexe = $team->sexe and nom_long='$team->nom_long'";
        $stmt = $this->db->prepare($sql); 
        $stmt->execute();
        $rowCount = $stmt->rowCount();
        if($rowCount > 0){
            return "SIMILAR_LONG_NAME";
        }
        $sql = "SELECT * FROM rb_teams where sexe = $team->sexe and nom_court='$team->nom_court'";
        $stmt = $this->db->prepare($sql); 
        $stmt->execute();
        $rowCount = $stmt->rowCount();
        if($rowCount > 0){
            return "SIMILAR_SHORT_NAME";
        }
        return "OK";
    }
    public function add($team) {
        $sql = "INSERT INTO rb_teams (nom_long, nom_court, couleur_1, couleur_2, pays, sexe, paiement, email, phone, not_enough, how_many, contact) VALUES 
        ('$team->nom_long','$team->nom_court','$team->couleur_1','$team->couleur_2','$team->pays',$team->sexe,$team->paiement,'$team->email','$team->phone',$team->not_enough,$team->how_many,'$team->contact')";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $this->db->lastInsertId();
    }

    public function update($lieu) {
        $sql = "UPDATE lieu SET nom=?, adresse=? WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$lieu->nom, $lieu->adresse, $lieu->id]);
    }

    public function delete($id) {
        $sql = "DELETE FROM lieu WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$id]);
    }

    public function get($id) {
        $sql = "SELECT * FROM lieu WHERE id=?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public function getAll() {
        $sql = "SELECT * FROM lieu";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Lieu');
        $stmt->execute();
        return $stmt->fetchAll();
    }

    
    public function getAllLight() {
        $sql = "SELECT id as 'key', nom as 'value' FROM lieu";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'KeyValuePair');
        $stmt->execute();
        return $stmt->fetchAll();
    }
}