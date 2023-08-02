<?php
include_once("config/params.php");
include_once("class/class.php");
class RiderService {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function add($rider) {

        //sans update du mot de passe
        $sql = "INSERT INTO riders (nom, prenom, date_naissance, sexe, niveau, email, essai_restant, est_prof, est_admin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$rider->nom, $rider->prenom, $rider->dateNaissance, $rider->sexe, $rider->niveau,  $rider->email, $rider->essaiRestant, $rider->estProf, $rider->estAdmin]);
        return $this->db->lastInsertId();
    }

    public function add_withpsw($rider) {

        //sans update du mot de passe
        $sql = "INSERT INTO riders (nom, prenom, date_naissance, sexe, niveau, email, essai_restant, est_prof, est_admin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$rider->nom, $rider->prenom, $rider->dateNaissance, $rider->sexe, $rider->niveau,  $rider->email, $rider->essaiRestant, $rider->estProf, $rider->estAdmin]);
        $id = $this->db->lastInsertId();
        $this->update_psw($id, $rider->motDePasse);
        return $id;
    }

    public function add_range($riders){
        $liste_id = array();
        foreach ($riders as $rider) {
            $rider_id  = $this->exist($rider);
            if($rider_id > 0){
                $rider_id = $this->add($rider);
                $this->update_psw($rider_id, "ivry");
            }
            array_push($liste_id,$rider_id);
        }
        return $liste_id;
    }

    public function exist($rider): bool {
        $sql = "SELECT id FROM riders WHERE prenom = ? AND nom = ? AND date_naissance = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$rider->prenom, $rider->nom, $rider->dateNaissance]);
        $rowCount = $stmt->rowCount();
        if($rowCount > 0 ){
            return $stmt->fetch();
        } else {
            return 0;
        }
    }
    public function update_psw($_id, $_psw)
    {   $classparam = new params();
        $pepper = $classparam->getMagicWord();
        $pwd_peppered = hash_hmac("sha256", $_psw, $pepper);

        $stmt = $this->db->prepare('UPDATE riders set 
            mot_de_passe = ?
            where id = ?
        ');
        $stmt->execute([
            $pwd_peppered,
            $_id
        ]);
        return true;
    }

    public function get($id) {
        $sql = "SELECT * FROM riders WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public function est_admin($id) {
        $sql = "SELECT est_admin FROM riders WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public function getAll() {
        $sql = "SELECT * FROM riders";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function update($rider) {
        $sql = "UPDATE riders SET nom=?, prenom=?, date_naissance=?, sexe=?, niveau=?, email=?, essai_restant=?, est_prof=?, est_admin=? WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$rider->nom, $rider->prenom, $rider->dateNaissance, $rider->sexe, $rider->niveau, $rider->motDePasse, $rider->email, $rider->essaiRestant, $rider->estProf, $rider->estAdmin, $rider->id]);
    }

    public function delete($id) {
        $sql = "DELETE FROM riders WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$id]);
    }
}