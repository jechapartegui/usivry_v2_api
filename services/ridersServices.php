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
        if ($rider->est_admin == TRUE) {
            $rider->est_admin = 1;
        } else {
            $rider->est_admin = 0;
        }
        if ($rider->est_prof == TRUE) {
            $rider->est_prof = 1;
        } else {
            $rider->est_prof = 0;
        }

        return $rider;
    }

    public function ToCompte($data)
    {
        $compte = new Compte();
        foreach ($data as $attribut => $valeur) {
            $compte->$attribut = $valeur;
        }       
        if ($compte->mail_active == TRUE) {
            $compte->mail_active = 1;
        }
        if ($compte->mail_active == FALSE) {
            $compte->mail_active = 0;
        }
      

        return $compte;
    }
    public function add_account($compte)
    {
        //sans update du mot de passe
        $sql = " INSERT INTO `compte`(`login`, `password`, `registration_date`, `mail_active`) VALUES (?,?,NOW(),?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$compte->login, $compte->password, $compte->mail_active]);
        return $this->db->lastInsertId();
    }
   

    public function addrider_new_account($rider)
    {
        $compte = $this->checkAndInsertAccount($rider->email, $rider->mot_de_passe);
        if (!is_numeric($compte)) {
            return $compte;
        }
        //sans update du mot de passe
        $sql = "INSERT INTO riders (nom, prenom, date_naissance, sexe, est_prof, est_admin, compte, adresse, telephone, personne_prevenir, telephone_personne_prevenir) VALUES (?,?,?,?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$rider->nom, $rider->prenom, $rider->date_naissance, $rider->sexe, $rider->est_prof, $rider->est_admin, $compte, $rider->adresse, $rider->telephone, $rider->personne_prevenir, $rider->telephone_personne_prevenir]);
        return $this->db->lastInsertId();
    }
    public function addrider_existingaccount($rider)
    {

        $compte = $this->CheckLogin($rider->email, $rider->mot_de_passe);
        if (!is_numeric($compte)) {
            return $compte;
        }
        //sans update du mot de passe
        $sql = "INSERT INTO riders (nom, prenom, date_naissance, sexe, est_prof, est_admin, compte, adresse, telephone, personne_prevenir, telephone_personne_prevenir) VALUES (?,?,?,?,?,?,  ?, ?,  ?, ?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$rider->nom, $rider->prenom, $rider->date_naissance, $rider->sexe, $rider->est_prof, $rider->est_admin, $compte, $rider->adresse, $rider->telephone, $rider->personne_prevenir, $rider->telephone_personne_prevenir]);
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
            $stmt = $this->db->prepare('INSERT INTO compte (login, password, registration_date, mail_active) VALUES (?, ?, NOW(), 1)');
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
            $stmt = $this->db->prepare('INSERT INTO compte (login, password, registration_date, mail_active) VALUES (?, ?, NOW(), 1)');
            $stmt->execute([$login, $pwd_peppered]);

            // Récupérer l'ID du compte nouvellement inséré
            return $this->db->lastInsertId();
        }
    }

    public function GetEmailProf($professeurs)
    {
        $mailprof = array();
        foreach ($professeurs as $prof) {
            $sql = "Select c.login from riders r inner join compte c on r.compte = c.id where r.id = " . $prof['key'];
            $stmt = $this->db->prepare($sql);
            $stmt->execute();
            $login =  $stmt->fetch();
            array_push($mailprof, $login['login']);
        }
        return $mailprof;
    }

    public function search($search, $season_id, $all, $this_season)
    {
        if ($all == true) {
            $sql = "SELECT r.*, c.login as email,  
             CASE 
                WHEN i1.rider_id IS NOT NULL THEN true 
                ELSE false 
            END as est_inscrit
            FROM riders r inner join compte c on c.id = r.compte             
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = " . $this_season . "
            WHERE `nom` LIKE '%" . $search . "%' or prenom like '%" . $search . "%' order by r.nom asc";
        } else {
            $sql = "SELECT r.*, c.login as email,  
            CASE 
               WHEN i1.rider_id IS NOT NULL THEN true 
               ELSE false 
            END as est_inscrit
            FROM riders r inner join compte c on c.id = r.compte 
            inner join inscription_saison i on i.rider_id = r.id 
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = " . $this_season . "
            WHERE (r.`nom` LIKE '%" . $search . "%' or prenom like '%" . $search . "%') and i.saison_id = " . $season_id . " order by r.nom asc";
        }
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Rider');
        return $stmt->fetchAll();
    }
    public function get_all($season_id, $all, $this_season)
    {
        if ($all == true) {
            $sql = "SELECT r.*, c.login as email,  
            CASE 
               WHEN i1.rider_id IS NOT NULL THEN true 
               ELSE false 
           END as est_inscrit
           FROM riders r inner join compte c on c.id = r.compte 
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id =" . $this_season . "
           order by r.nom asc";
        } else {
            $sql = "SELECT r.*, true as 'est_inscrit', c.login as email,  
            CASE 
               WHEN i1.rider_id IS NOT NULL THEN true 
               ELSE false 
           END as est_inscrit
           FROM riders r inner join compte c on c.id = r.compte 
           inner join inscription_saison i on i.rider_id = r.id 
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = " . $this_season . "
           WHERE  i.saison_id = " . $season_id . " order by r.nom asc";
        }
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Rider');
        return $stmt->fetchAll();
    }

    public function search_light($search, $season_id, $all, $this_season)
    {
        if ($all == true) {
            $sql = "SELECT r.id as 'key', CONCAT(r.prenom, ' ',r.nom) as 'value'
            FROM riders r inner join compte c on c.id = r.compte             
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = " . $this_season . "
            WHERE `nom` LIKE '%" . $search . "%' or prenom like '%" . $search . "%' order by r.nom asc";
        } else {
            $sql = "SELECT r.id as 'key', CONCAT(r.prenom, ' ',r.nom) as 'value'
            FROM riders r inner join compte c on c.id = r.compte 
            inner join inscription_saison i on i.rider_id = r.id 
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = " . $this_season . "
            WHERE (r.`nom` LIKE '%" . $search . "%' or prenom like '%" . $search . "%') and i.saison_id = " . $season_id . " order by r.nom asc";
        }
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'KeyValuePair');
        return $stmt->fetchAll();
    }
    public function get_all_light($season_id, $all, $this_season)
    {
        if ($all == true) {
            $sql = "SELECT r.id as 'key', CONCAT(r.prenom, ' ',r.nom) as 'value'
           FROM riders r inner join compte c on c.id = r.compte 
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id =" . $this_season . "
           order by r.nom asc";
        } else {
            $sql = "SELECT r.id as 'key', CONCAT(r.prenom, ' ',r.nom) as 'value'
           FROM riders r inner join compte c on c.id = r.compte 
           inner join inscription_saison i on i.rider_id = r.id 
            LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = " . $this_season . "
           WHERE  i.saison_id = " . $season_id . " order by r.nom asc";
        }
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'KeyValuePair');
        return $stmt->fetchAll();
    }

    public function generateRandomString($length = 8)
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
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
            $rider->id  = $this->exist($rider);
            if ($rider->id == 0) {
                $compte = $this->ReturnOrInsertAccount($rider->email, $rider->mot_de_passe);
                //sans update du mot de passe
                $sql = "INSERT INTO riders (nom, prenom, date_naissance, sexe, est_prof, est_admin, compte, adresse, telephone, personne_prevenir, telephone_personne_prevenir) VALUES (?,?,?,?,?,?,   ?, ?, ?, ?, ?, ?)";
                $stmt = $this->db->prepare($sql);
                $stmt->execute([$rider->nom, $rider->prenom, $rider->date_naissance, $rider->sexe, $rider->est_prof, $rider->est_admin, $compte, $rider->adresse, $rider->telephone, $rider->personne_prevenir, $rider->telephone_personne_prevenir]);
                $rider->id =  $this->db->lastInsertId();
            } else {
                $this->update_addrange($rider);
            }
            array_push($liste_id, $rider->id);
        }

        return $liste_id;
    }

    public function add_or_update($rider)
    {
        if ($rider->id == 0) {
            $compte = $this->ReturnOrInsertAccount($rider->email, $rider->mot_de_passe);
            //sans update du mot de passe
            $sql = "INSERT INTO riders (nom, prenom, date_naissance, sexe, est_prof, est_admin, compte, adresse, telephone, personne_prevenir, telephone_personne_prevenir)
             VALUES (?,?,'$rider->date_naissance',$rider->sexe,$rider->est_prof,$rider->est_admin,$compte,?, '$rider->telephone',?, '$rider->telephone_personne_prevenir')";
            $stmt = $this->db->prepare($sql);
            $stmt->execute([$rider->nom, $rider->prenom, $rider->adresse, $rider->personne_prevenir]);
            return $this->db->lastInsertId();
        } else {
            $sql = "UPDATE riders SET  sexe=$rider->sexe, adresse=?, telephone='$rider->telephone', personne_prevenir=?, telephone_personne_prevenir='$rider->telephone_personne_prevenir' WHERE id=$rider->id";
            $stmt = $this->db->prepare($sql);
            $stmt->execute([$rider->adresse, $rider->personne_prevenir]);
            return $rider->id;
        }
    }

    public function getSeances($rider, $remove_inscription, $this_season)
    {
        $p = new params();
        $date_min = date('Y-m-d'); // Date de référence (jour J)
        $age = $p->calculerAge($rider->date_naissance);
        $date_max = date('Y-m-d', strtotime("+30 days", strtotime($date_min)));
        $sql = "SELECT  s.seance_id as seance_id, c.id as cours, s.libelle as libelle, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, s.statut as statut, s.age_requis as age_requis,  s.age_requis as age_maximum, s.info_seance as info_seance
        FROM seance s 
        INNER JOIN cours c ON s.cours = c.id 
        INNER JOIN lieu l ON s.lieu_id = l.id 
        WHERE s.date_seance >= '$date_min' AND s.date_seance <= '$date_max' AND s.age_requis <= $age AND s.age_maximum >= $age AND c.saison_id = " . $this_season;

        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $stmt->execute();
        $ss = $stmt->fetchAll();
        $seances = array();
        if ($remove_inscription) {
            foreach ($ss as $s) {
                # code...
                $est_seance = false;
                foreach ($rider->inscriptions as $i) {
                    if ($i->seance_id == $s->seance_id) {
                        $est_seance = true;
                    }
                }
                if ($est_seance == false) {
                    array_push($seances, $s);
                }
            }
        } else {
            $seances = $ss;
        }
        foreach ($seances as $seance) {
            $seance->professeurs = $this->get_prof_seance($seance->seance_id);
            //Get groupe
        }
        return $seances;
    }
    public function getInscriptions($id, $this_season)
    {
        $sql = "SELECT i.id as id, s.seance_id as seance_id, c.id as cours, s.libelle as libelle, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, i.statut as statut, s.age_requis as age_requis, s.age_maximum as age_maximum, s.info_seance as info_seance
        FROM inscription i inner join seance s on i.seance_id = s.seance_id inner join cours c on s.cours = c.id inner join lieu l on s.lieu_id = l.id WHERE i.rider_id = ? AND i.statut IS NOT NULL AND s.date_seance > DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND c.saison_id = " . $this_season . " and s.statut = 'prévue'";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $stmt->execute([$id]);
        $inscriptions = $stmt->fetchAll();
        foreach ($inscriptions as $seance) {
            $seance->professeurs = $this->get_prof_seance($seance->seance_id);
        }
        return $inscriptions;
    }
    public function get_prof_seance($seance_id)
    {
        $sql = "SELECT s.professeur_id as 'key', concat(r.prenom,' ', r.nom) as 'value' from seance_professeur s inner join riders r on r.id = s.professeur_id inner join seance se on se.seance_id = s.seance_id where s.seance_id=$seance_id and se.statut = 'prévue'";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'KeyValuePair');
        return $stmt->fetchAll();
    }

    public function getSeancesProf($rider_id, $this_season)
    {
        $referenceDate = date('Y-m-d'); // Date de référence (jour J)     
        $dateref = date('Y-m-d', strtotime("-5 days", strtotime($referenceDate)));
        $sql = "SELECT  s.seance_id as seance_id, c.id as cours, s.libelle as libelle, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, s.statut as statut, s.age_requis as age_requis, s.age_maximum as age_maximum, s.info_seance as info_seance
        FROM seance s 
        inner join seance_professeur sp on sp.seance_id = s.seance_id
        INNER JOIN cours c ON s.cours = c.id 
        INNER JOIN lieu l ON s.lieu_id = l.id 
        WHERE sp.professeur_id = ? AND c.saison_id = " . $this_season . " AND s.date_seance >= ? ";

        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Seance');
        $stmt->execute([$rider_id, $dateref]);
        $seances = $stmt->fetchAll();
        foreach ($seances as $seance) {
            $seance->professeurs = $this->get_prof_seance($seance->seance_id);
            //Get groupe
        }

        return $seances;
    }

    public function exist($rider)
    {
        $sql = "SELECT r.id FROM riders r inner join compte c on c.id =r.compte WHERE LOWER(r.prenom) like ? AND LOWER(r.nom) like ? AND LOWER(c.login) = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([strtolower($rider->prenom), strtolower($rider->nom), strtolower($rider->email)]);
        $rowCount = $stmt->rowCount();
        if ($rowCount > 0) {
            $res = $stmt->fetch();
            return $res['id'];
        } else {
            return 0;
        }
    }


    public function get_login($id)
    {
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

    public function update_mail_active($_id, $mail_active)
    {

        $stmt = $this->db->prepare('UPDATE compte set 
            mail_active = ?
            where id = ?
        ');
        $stmt->execute([
            $mail_active,
            $_id
        ]);
        return true;
    }

    public function get_all_account($saison_id)
    {
        $stmt = $this->db->prepare("SELECT distinct c.* FROM `compte` c inner join riders r on r.compte = c.id inner join inscription_saison i on i.rider_id = r.id where i.saison_id = $saison_id");
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Compte');
        $stmt->execute();
        $comptes = $stmt->fetchAll();
        foreach ($comptes as $compte) {
            $stmt = $this->db->prepare("select r.* from riders r inner join inscription_saison i on i.rider_id = r.id where compte= $compte->id and i.saison_id = $saison_id");
            $stmt->setFetchMode(PDO::FETCH_CLASS, 'Rider');
            $stmt->execute();
            $compte->riders = $stmt->fetchAll();
        }
        return $comptes;
    }
    public function get_account($_id)
    {

        $stmt = $this->db->prepare('select id, login, mail_active from compte where id = ?');
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Compte');
        $stmt->execute([$_id]);
        return $stmt->fetch();
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
        LEFT JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = " . $this_season . "
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
    public function update($rider)
    {
        $rider = $this->ToRider($rider);
        $sql = "UPDATE riders SET nom=?, prenom=?, date_naissance=?, sexe=?,  adresse=?, est_prof=?, est_admin=?, telephone=?, personne_prevenir=?, telephone_personne_prevenir=? WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$rider->nom, $rider->prenom, $rider->date_naissance, $rider->sexe, $rider->adresse,  $rider->est_prof, $rider->est_admin, $rider->telephone, $rider->personne_prevenir, $rider->telephone_personne_prevenir, $rider->id]);
    }

    public function update_addrange($rider)
    {
        $rider = $this->ToRider($rider);
        $sql = "UPDATE riders SET  sexe=?, adresse=?, telephone=?, personne_prevenir=?, telephone_personne_prevenir=? WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$rider->sexe, $rider->adresse,  $rider->telephone, $rider->personne_prevenir, $rider->telephone_personne_prevenir, $rider->id]);
    }

    public function delete($id)
    {
        $sql = "DELETE FROM riders WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$id]);
    }
    
    public function delete_account($id)
    {
        $sql = "DELETE FROM compte WHERE id = ?";
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
    public function getUserByLogin($login, $password, $saison_id)
    {
        // function to check login/pwd
        if (!empty($login) && !empty($password)) {
            $stmt = $this->db->prepare('select * from compte where login=?');
            $stmt->execute([$login]);
            $users = $stmt->fetch();
            if ($users) {
                if ($this->verifyCurrentPassword($users['id'], $password) == 1) {
                    $sql = "SELECT r.*, c.login as email,  
                    true as est_inscrit
                   FROM riders r inner join compte c on c.id = r.compte 
                    inner JOIN inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = " . $saison_id . "
                   
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
