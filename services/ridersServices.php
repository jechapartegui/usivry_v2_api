<?php
include_once("config/params.php");
include_once("class/class.php");
class RiderService {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function ToRider($data){
        $rider = new Rider();
        foreach ($data as $attribut => $valeur) {           
                $rider->$attribut = $valeur;
        }
        $dateNaissance = new DateTime($rider->date_naissance);
        $rider->date_naissance = $dateNaissance->format('Y-m-d');
        if($rider->sexe == TRUE){
            $rider->sexe = 1;
        } 
        if($rider->sexe == FALSE){
            $rider->sexe = 0;
        } 

        return $rider;
    }

    public function add($rider) {

        //sans update du mot de passe
        $compte = $this->checkAndInsertAccount($rider->email, $rider->mot_de_passe);
        $sql = "INSERT INTO riders (nom, prenom, date_naissance, sexe, niveau,  essai_restant, est_prof, est_admin, compte, adresse, telephone, personne_prevenir, telephone_personne_prevenir) VALUES (?,?,?,?,?,?, ?,  ?, ?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$rider->nom, $rider->prenom, $rider->date_naissance, $rider->sexe, $rider->niveau,   $rider->essai_restant, $rider->est_prof, $rider->est_admin, $compte,$rider->adresse,$rider->telephone,$rider->personne_prevenir,$rider->telephone_personne_prevenir]);
        return $this->db->lastInsertId();
    }

    function checkAndInsertAccount($login, $password) {
        // Vérifier si le compte existe déjà avec le login donné
        $sql = "SELECT id FROM compte WHERE login = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$login]);
        $account = $stmt->fetch(PDO::FETCH_ASSOC);
    
        if ($account) {
            // Le compte existe déjà, renvoyer l'ID du compte existant
            return $account['id'];
        } else {
            // Le compte n'existe pas, l'ajouter à la table compte
            $classparam = new params();
            $pepper = $classparam->getMagicWord();
            $pwd_peppered = hash_hmac("sha256", $password, $pepper);
            $stmt = $this->db->prepare('INSERT INTO compte (login, password, registration_date) VALUES (?, ?, NOW())');
            $stmt->execute([$login, $pwd_peppered]);
    
            // Récupérer l'ID du compte nouvellement inséré
            return $this->db->lastInsertId();
        }
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
        foreach ($riders as $rider__) {
            $rider = $this->ToRider($rider__);            
            $rider_id  = $this->exist($rider);
            if($rider_id == 0){
                $rider_id = $this->add($rider);
            }
            array_push($liste_id,$rider_id);
        }
        
        var_dump($liste_id);
        return $liste_id;
    }

    public function getSeances($id){

    }
    
    public function getInscriptions($id){
        
    }

    public function exist($rider) {
        $sql = "SELECT id FROM riders WHERE prenom = ? AND nom = ? AND date_naissance = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$rider->prenom, $rider->nom, $rider->date_naissance]);
        $rowCount = $stmt->rowCount();
        if($rowCount > 0 ){
            $rider = $stmt->fetch(PDO::FETCH_ASSOC);
            return $rider['id'];
        } else {
            return 0;
        }
    }
    public function update_psw($_id, $_psw)
    {   $classparam = new params();
        $pepper = $classparam->getMagicWord();
        $pwd_peppered = hash_hmac("sha256", $_psw, $pepper);

        $stmt = $this->db->prepare('UPDATE compte set 
            password = ?
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
        return $stmt->execute([$rider->nom, $rider->prenom, $rider->dateNaissance, $rider->sexe, $rider->niveau, $rider->mot_de_passe, $rider->email, $rider->essaiRestant, $rider->estProf, $rider->estAdmin, $rider->id]);
    }

    public function delete($id) {
        $sql = "DELETE FROM riders WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$id]);
    }

    public function getRidersbyid($id)  {
        $stmt = $this->db->prepare('select * from riders where compte=?');
        $stmt->execute([$id]);
        $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $users;
    }
    
    public function getUserByLogin($login, $password)
    {
        // function to check login/pwd
        if (!empty($login) && !empty($password)) {
            $stmt = $this->db->prepare('select * from compte where login=?');
            $stmt->execute([$login]);
            $users = $stmt->fetch();
            if ($users) {
                if ($this->verifyCurrentPassword($users['id'], $password) == 1) {
                    $stmt = $this->db->prepare('select * from riders where compte=?');
                    $stmt->execute([$users['id']]);
                    $riders = $stmt->fetchAll();
                    return ($riders);
                } else {
                    return "INCORRECT_PASSWORD";
                }
            } else {

                return "INCORRECT_LOGIN";
            }
        } else {
            return "NO_VALUE_SET";
        }
    }
    public function verifyCurrentPassword($userId, $password)
    {
        $stmt = $this->db->prepare("select password from compte where id=?");
        $stmt->execute([$userId]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $classparam = new params();
        $pepper = $classparam->getMagicWord();
        $pwd_peppered = hash_hmac("sha256", $password, $pepper);
        $pwd_hashed = $result['password'];
        if ($pwd_peppered === $pwd_hashed) {
            return 1;
        } else {
            return 0;
        }
    }
}