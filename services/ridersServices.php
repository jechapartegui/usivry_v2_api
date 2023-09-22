<?php
include_once("config/params.php");
include_once("class/class.php");
include_once("class/utils.php");
class RiderService
{
    private $db;

    public function __construct($db)
    {
        $this->db = $db;
    }

    public function ToRider($data)
    {
        $rider = new Rider();
        foreach ($data as $attribut => $valeur) {
            $rider->$attribut = $valeur;
        }
        $dateNaissance = new DateTime($rider->date_naissance);
        $rider->date_naissance = $dateNaissance->format('Y-m-d');
        if ($rider->sexe == TRUE) {
            $rider->sexe = 1;
        }
        if ($rider->sexe == FALSE) {
            $rider->sexe = 0;
        }

        return $rider;
    }

    public function addrider_new_account($rider)
    {
        $rider = $this->ToRider($rider);
        $compte = $this->checkAndInsertAccount($rider->email, $rider->mot_de_passe);
        if(!is_numeric($compte)){
            return $compte;
        }
        //sans update du mot de passe
        $sql = "INSERT INTO riders (nom, prenom, date_naissance, sexe, niveau,  essai_restant, est_prof, est_admin, compte, adresse, telephone, personne_prevenir, telephone_personne_prevenir) VALUES (?,?,?,?,?,?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$rider->nom, $rider->prenom, $rider->date_naissance, $rider->sexe, $rider->niveau,   $rider->essai_restant, $rider->est_prof, $rider->est_admin, $compte, $rider->adresse, $rider->telephone, $rider->personne_prevenir, $rider->telephone_personne_prevenir]);
        return $this->db->lastInsertId();
    }
    public function addrider_existingaccount($rider)
    {

        $rider = $this->ToRider($rider);
        $compte = $this->CheckLogin($rider->email, $rider->mot_de_passe);        
        if(!is_numeric($compte)){
            return $compte;
        }
        //sans update du mot de passe
        $sql = "INSERT INTO riders (nom, prenom, date_naissance, sexe, niveau,  essai_restant, est_prof, est_admin, compte, adresse, telephone, personne_prevenir, telephone_personne_prevenir) VALUES (?,?,?,?,?,?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$rider->nom, $rider->prenom, $rider->date_naissance, $rider->sexe, $rider->niveau,   $rider->essai_restant, $rider->est_prof, $rider->est_admin, $compte, $rider->adresse, $rider->telephone, $rider->personne_prevenir, $rider->telephone_personne_prevenir]);
        $id = $this->db->lastInsertId();
        return $id;
    }

    function checkAndInsertAccount($login, $password)
    {
        // Vérifier si le compte existe déjà avec le login donné
        $sql = "SELECT id FROM compte WHERE login = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$login]);
        $account = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($account) {
            // Le compte existe déjà, renvoyer l'ID du compte existant
            return "LOGIN_ALREADY_EXISTS";
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
    function ReturnOrInsertAccount($login, $password)
    {
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



    public function search($search, $season_id, $all, $this_season){
        if($all==true){
            $sql = "SELECT r.*, c.login as email,  
             CASE 
                WHEN i1.rider_id IS NOT NULL THEN true 
                ELSE false 
            END as est_inscrit
            FROM riders r inner join compte c on c.id = r.compte             
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = ". $this_season ."
            WHERE `nom` LIKE '%". $search ."%' or prenom like '%". $search ."%' order by r.nom asc";
        } else {
            $sql = "SELECT r.*, c.login as email,  
            CASE 
               WHEN i1.rider_id IS NOT NULL THEN true 
               ELSE false 
            END as est_inscrit
            FROM riders r inner join compte c on c.id = r.compte 
            inner join inscription_saison i on i.rider_id = r.id 
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = ". $this_season ."
            WHERE (r.`nom` LIKE '%". $search ."%' or prenom like '%". $search ."%') and i.saison_id = ". $season_id . " order by r.nom asc";
        }
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Rider');
        return $stmt->fetchAll();
    }
    public function get_all($season_id, $all, $this_season){
        if($all==true){
            $sql = "SELECT r.*, c.login as email,  
            CASE 
               WHEN i1.rider_id IS NOT NULL THEN true 
               ELSE false 
           END as est_inscrit
           FROM riders r inner join compte c on c.id = r.compte 
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id =". $this_season ."
           order by r.nom asc";
        } else {
            $sql = "SELECT r.*, true as 'est_inscrit', c.login as email,  
            CASE 
               WHEN i1.rider_id IS NOT NULL THEN true 
               ELSE false 
           END as est_inscrit
           FROM riders r inner join compte c on c.id = r.compte 
           inner join inscription_saison i on i.rider_id = r.id 
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = ". $this_season ."
           WHERE  i.saison_id = ". $season_id ." order by r.nom asc";
        }
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Rider');
        return $stmt->fetchAll();
    }

    public function search_light($search, $season_id, $all, $this_season){
        if($all==true){
            $sql = "SELECT r.id as 'key', CONCAT(r.prenom, ' ',r.nom) as 'value'
            FROM riders r inner join compte c on c.id = r.compte             
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = ". $this_season ."
            WHERE `nom` LIKE '%". $search ."%' or prenom like '%". $search ."%' order by r.nom asc";
        } else {
            $sql = "SELECT r.id as 'key', CONCAT(r.prenom, ' ',r.nom) as 'value'
            FROM riders r inner join compte c on c.id = r.compte 
            inner join inscription_saison i on i.rider_id = r.id 
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = ". $this_season ."
            WHERE (r.`nom` LIKE '%". $search ."%' or prenom like '%". $search ."%') and i.saison_id = ". $season_id . " order by r.nom asc";
        }
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'KeyValuePair');
        return $stmt->fetchAll();
    }
    public function get_all_light($season_id, $all, $this_season){
        if($all==true){
            $sql = "SELECT r.id as 'key', CONCAT(r.prenom, ' ',r.nom) as 'value'
           FROM riders r inner join compte c on c.id = r.compte 
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id =". $this_season ."
           order by r.nom asc";
        } else {
            $sql = "SELECT r.id as 'key', CONCAT(r.prenom, ' ',r.nom) as 'value'
           FROM riders r inner join compte c on c.id = r.compte 
           inner join inscription_saison i on i.rider_id = r.id 
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = ". $this_season ."
           WHERE  i.saison_id = ". $season_id ." order by r.nom asc";
        }
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'KeyValuePair');
        return $stmt->fetchAll();
    }

    public function generateRandomString($length = 8) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!/,ùàéà';
        $randomString = '';
        $charLength = strlen($characters);
    
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charLength - 1)];
        }
    
        return $randomString;
    }
    


    public function add_range($riders)
    {
        $liste_id = array();
        foreach ($riders as $rider__) {
            $rider = $this->ToRider($rider__);
            $rider_id  = $this->exist($rider);
            if ($rider_id == 0) {
                $compte = $this->ReturnOrInsertAccount($rider->email, $rider->mot_de_passe);             
                //sans update du mot de passe
                $sql = "INSERT INTO riders (nom, prenom, date_naissance, sexe, niveau,  essai_restant, est_prof, est_admin, compte, adresse, telephone, personne_prevenir, telephone_personne_prevenir) VALUES (?,?,?,?,?,?, ?,  ?, ?, ?, ?, ?, ?)";
                $stmt = $this->db->prepare($sql);
                $stmt->execute([$rider->nom, $rider->prenom, $rider->date_naissance, $rider->sexe, $rider->niveau,   $rider->essai_restant, $rider->est_prof, $rider->est_admin, $compte, $rider->adresse, $rider->telephone, $rider->personne_prevenir, $rider->telephone_personne_prevenir]);
                $rider_id =  $this->db->lastInsertId();
            }
            array_push($liste_id, $rider_id);
        }

        return $liste_id;
    }

    public function getSeances($rider, $remove_inscription,$this_season)   {
        $p = new params();
        //Age + niveau requis  + date
        $referenceDate = date('Y-m-d'); // Date de référence (jour J)
        // $niveaux = $p->getNiveaux($rider->niveau);
        // $inClause = implode(',', array_fill(0, count($niveaux), '?'));
        $age = $p->calculerAge($rider->date_naissance);
        $startDate = date('Y-m-d', strtotime($referenceDate));
        $endDate = date('Y-m-d', strtotime("+30 days", strtotime($referenceDate)));
        if($rider->est_inscrit == false){
            $rider->niveau = 'avancé';
        }
        $niveaux = $p->getNiveaux($rider->niveau);
        $inClause = implode(',', array_fill(0, count($niveaux), '?'));

        // Entourer chaque niveau par des quotes
        $inClause = implode(',', array_map(function () {
            return '?';
        }, $niveaux));
       
        $sql = "SELECT  s.seance_id as seance_id, c.id as cours, s.libelle as libelle, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, s.statut as statut, s.age_requis as age_requis,  s.age_requis as age_maximum, s.niveau_requis as niveau_requis
        FROM seance s 
        INNER JOIN cours c ON s.cours = c.id 
        INNER JOIN lieu l ON s.lieu_id = l.id 
        WHERE s.date_seance >= ? AND s.date_seance <= ? AND s.age_requis <= ? AND s.age_maximum >= ? AND s.niveau_requis IN ($inClause) AND c.saison_id = " . $this_season;

        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $bindValueArray = [$startDate, $endDate, $age, $age];
        $bindValueArray = array_merge($bindValueArray, $niveaux); // Ajoute les niveaux requis à la liste des valeurs à binder
        $stmt->execute($bindValueArray);
        $ss = $stmt->fetchAll();
        $seances = array();
        if($remove_inscription){
            foreach ($ss as $s) {
                # code...
                $est_seance = false;
                foreach ($rider->inscriptions as $i) {
                    if($i->seance_id == $s->seance_id){
                        $est_seance = true;
                    }
                }
                if($est_seance == false){
                    array_push($seances,$s);
                }
    
            }
        } else {
            $seances = $ss;
        }
        foreach ($seances as $seance) {
            $seance->professeurs = $this->get_prof_seance($seance->seance_id);
        }
        return $seances;
    }
    public function getInscriptions($id,$this_season)
    {
        $sql = "SELECT i.id as id, s.seance_id as seance_id, c.id as cours, s.libelle as libelle, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, i.statut as statut, s.age_requis as age_requis, s.age_maximum as age_maximum,  s.niveau_requis as niveau_requis
        FROM inscription i inner join seance s on i.seance_id = s.seance_id inner join cours c on s.cours = c.id inner join lieu l on s.lieu_id = l.id WHERE i.rider_id = ? AND i.statut IS NOT NULL AND c.saison_id = " . $this_season;
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $stmt->execute([$id]);
        $inscriptions = $stmt->fetchAll();
        foreach ($inscriptions as $seance) {
            $seance->professeurs = $this->get_prof_seance($seance->seance_id);
        }
        return $inscriptions;
    }
    public function get_prof_seance($seance_id){
        $sql = "SELECT s.professeur_id as 'key', concat(r.prenom,' ', r.nom) as 'value' from seance_professeur s inner join riders r on r.id = s.professeur_id where s.seance_id=?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$seance_id]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'KeyValuePair');
        return $stmt->fetchAll();
    }

    public function getSeancesProf($rider_id,$this_season){
        $sql = "SELECT  s.seance_id as seance_id, c.id as cours, s.libelle as libelle, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, s.statut as statut, s.age_requis as age_requis, s.age_maximum as age_maximum, s.niveau_requis as niveau_requis
        FROM seance s 
        inner join seance_professeur sp on sp.seance_id = s.seance_id
        INNER JOIN cours c ON s.cours = c.id 
        INNER JOIN lieu l ON s.lieu_id = l.id 
        WHERE sp.professeur_id = ? AND c.saison_id = " . $this_season . "  ";

        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');      
        $stmt->execute([$rider_id]);
        $seances = $stmt->fetchAll();
        foreach ($seances as $seance) {
            $seance->professeurs = $this->get_prof_seance($seance->seance_id);
        }
        return $seances;
    }

    public function exist($rider)
    {
        $sql = "SELECT id FROM riders WHERE prenom = ? AND nom = ? AND date_naissance = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$rider->prenom, $rider->nom, $rider->date_naissance]);
        $rowCount = $stmt->rowCount();
        if ($rowCount > 0) {
            $stmt->setFetchMode(PDO::FETCH_CLASS, 'Rider');    
            return $rider['id'];
        } else {
            return 0;
        }
    }


    public function get_login($id){
        $sql = "SELECT login FROM compte WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public function update_mail($_id, $mail)
    {
      
        $stmt = $this->db->prepare('UPDATE compte set 
            login = ?
            where id = ?
        ');
        $stmt->execute([
            $mail,
            $_id
        ]);
        return true;
    }

    public function update_psw($_id, $_psw)
    {
        $classparam = new params();
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
    public function update_psw_compte($login, $_psw)
    {
        $classparam = new params();
        $pepper = $classparam->getMagicWord();
        $pwd_peppered = hash_hmac("sha256", $_psw, $pepper);
        $stmt = $this->db->prepare('UPDATE compte set 
            password = ?
            where login = ?
        ');
        $stmt->execute([
            $pwd_peppered,
            $login
        ]);

        return true;
    }

    public function get($id, $this_season)
    {
        $sql = "SELECT r.*, c.login as email,  CASE 
        WHEN i1.rider_id IS NOT NULL THEN true 
        ELSE false 
        END as est_inscrit
        FROM riders r 
        inner join compte c on c.id = r.compte            
        LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = ". $this_season ."
        WHERE r.compte = ? order by r.nom asc";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Rider');
        return $stmt->fetchAll();
    }

    public function est_admin($id)
    {
        $sql = "SELECT est_admin FROM riders WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        $res = $stmt->fetch();
        if ($res == 1) {
            return true;
        } else {
            return false;
        }
    }
    public function est_admin_compte($id)
    {
        $sql = "SELECT * FROM riders WHERE compte = ? and est_admin =1";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        $stmt->fetchAll();
        $rowCount = $stmt->rowCount();
        if ($rowCount > 0) {
            return true;
        } else {
            return false;
        }
    }
    public function est_prof_compte($id)
    {
        $sql = "SELECT * FROM riders WHERE compte = ? and est_prof =1";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        $stmt->fetchAll();
        $rowCount = $stmt->rowCount();
        if ($rowCount > 0) {
            return true;
        } else {
            return false;
        }
    }

    public function getAll()
    {
        $sql = "SELECT r.*, c.login as email FROM riders r inner join compte c on c.id = r.compte";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    public function update_level($niveau, $id)
    {
        $sql = "UPDATE riders SET niveau=? WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$niveau, $id]);
    }
    public function update($rider)
    {
        $rider = $this->ToRider($rider);
        $sql = "UPDATE riders SET nom=?, prenom=?, date_naissance=?, sexe=?, niveau=?, adresse=?, essai_restant=?, est_prof=?, est_admin=?, telephone=?, personne_prevenir=?, telephone_personne_prevenir=? WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$rider->nom, $rider->prenom, $rider->date_naissance, $rider->sexe, $rider->niveau, $rider->adresse, $rider->essai_restant, $rider->est_prof, $rider->est_admin, $rider->personne_prevenir, $rider->personne_prevenir, $rider->telephone_personne_prevenir, $rider->id]);
    }

    public function delete($id)
    {
        $sql = "DELETE FROM riders WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$id]);
    }

    public function getRidersbyid($id)
    {
        $stmt = $this->db->prepare('SELECT r.*, c.login as email FROM riders r inner join compte c on c.id = r.compte WHERE compte=? order by r.nom asc');
        $stmt->execute([$id]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Rider');
        $users = $stmt->fetchAll();
        return $users;
    }

    public function get_prof_light()
    {
        $stmt = $this->db->prepare("select id as 'key', concat(prenom,' ', nom) as 'value' from riders where est_prof=1;");
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'KeyValuePair');
        $users = $stmt->fetchAll();
        return $users;
    }

    public function CheckLogin($login, $password)
    {
        // function to check login/pwd
        if (!empty($login) && !empty($password)) {
            $stmt = $this->db->prepare('select * from compte where login=?');
            $stmt->execute([$login]);
            $users = $stmt->fetch();
            if ($users) {
                if ($this->verifyCurrentPassword($users['id'], $password) == 1) {
                   return $users['id'];
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
    public function getUserByLogin($login, $password,$saison_id)
    {
        
        // function to check login/pwd
        if (!empty($login) && !empty($password)) {
            $stmt = $this->db->prepare('select * from compte where login=?');
            $stmt->execute([$login]);
            $users = $stmt->fetch();
            if ($users) {
                if ($this->verifyCurrentPassword($users['id'], $password) == 1) {
                    $sql = "SELECT r.*, c.login as email,  
                    CASE 
                       WHEN i1.rider_id IS NOT NULL THEN true 
                       ELSE false 
                   END as est_inscrit
                   FROM riders r inner join compte c on c.id = r.compte 
                    LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = ". $saison_id ."
                   
                    WHERE r.compte=? order by r.nom asc";
                    $stmt = $this->db->prepare($sql);
                    $stmt->execute([$users['id']]);
                    $stmt->setFetchMode(PDO::FETCH_CLASS, 'Rider');
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
