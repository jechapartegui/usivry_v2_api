<?php
include_once("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
include_once("config/params.php");
require_once("class/class.php");
require_once("services/ridersServices.php");
require_once("services/saisonServices.php");
require_once("services/groupeServices.php");
require_once("services/inscriptionsaisonServices.php");

// Connect to database
$database = new database();
$con = $database->getConnection();
$server = new restServer();
$data = $server->initRest();

if (!isset($data['command'])) {
    $server->getHttpStatusMessage(401, "NO_COMMAND_FOUND");
    exit;
} else {
    $command = $data['command'];
}

$season_id = 1;
$user_id = -1;
$est_admin = false;
$est_prof = false;
foreach (getallheaders() as $name => $value) {
    if (strtolower($name) == "password") {
        $password = $value;
    }
    if (strtolower($name) == "dateref") {
        $date_ref = $value;
    }
    if (strtolower($name) == "userid") {
        $user_id = $value;
    }
}
$concat = $user_id . $date_ref;
$p = new params();
$pepper = $p->getPsw();
$pwd_peppered = hash_hmac("sha256", $concat, $pepper);

if ($pwd_peppered != $password) {
    $server->getHttpStatusMessage(401, "UNAUTHORIZED");
    exit;
}
$RiderService = new RiderService($con);
$groupeServices = new GroupeService($con);
$s = new SaisonService($con);
if ($user_id > 0) {
    $logged = true;
    $admin = $RiderService->est_admin_compte($user_id);
    $prof = $RiderService->est_prof_compte($user_id);
} else {
    $logged = false;
}
$season_id = $s->getActive();

switch ($command) {
    case 'add':
        if (!isset($data['rider'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        } else {
            $rider = $RiderService->ToRider($data['rider']);
        }
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            if (isset($data['with_psw'])) {
                $id = $RiderService->addrider_new_account($rider);
            } else {
                $id = $RiderService->addrider_existingaccount($rider);
            }
            if (!is_numeric($id)) {
                $server->getHttpStatusMessage(401, $id);
                exit;
            }
            if (isset($data['inscription_saison_encours'])) {
                $is = new InscriptionSaisonService($conn);
                $is->add($season_id, $id);
            }
            $LG = new Lien_Groupe();
            $LG->objet_id = $id;
            $LG->objet_type = "rider";
            $LG->groupes = array();
            foreach ($rider->groupes as $item) {
                array_push($LG->groupes, $item['id']);
            }
            $groupeServices->update_lien($LG);
            $result = $id;
        }
        break;
    case 'create':
        if (!isset($data['rider'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        } else {
            $rider = $RiderService->ToRider($data['rider']);
        }

        if (isset($data['with_psw'])) {
            $id = $RiderService->addrider_new_account($rider);
        } else {
            $id = $RiderService->addrider_existingaccount($rider);
        }
        if (!is_numeric($id)) {
            $server->getHttpStatusMessage(401, $id);
            exit;
        } else {
            if (isset($data['inscription_saison_encours'])) {
                $is = new InscriptionSaisonService($conn);
                $is->add($season_id, $id);
            }
            $LG = new Lien_Groupe();
            $LG->objet_id = $id;
            $LG->objet_type = "rider";
            $LG->groupes = array();
            foreach ($rider->groupes as $item) {
                array_push($LG->groupes, $item['id']);
            }
            $groupeServices->update_lien($LG);
            $result = $id;
        }
        break;
    case 'add_range':
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        }
        if (!isset($data['riders'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        } else {
            $is = new InscriptionSaisonService($con);
            foreach ($data['riders'] as $rider) {
                $rider = $RiderService->ToRider($rider);
                $rider->id  = $RiderService->exist($rider);
                $rider->id = $RiderService->add_or_update($rider);
                $is->add($season_id, $rider->id);
                $LG = new Lien_Groupe();
                $LG->objet_id = $rider->id;
                $LG->objet_type = "rider";
                $LG->groupes = array();
                foreach ($rider->groupes as $item) {
                    array_push($LG->groupes, $item['id']);
                }
                $groupeServices->update_lien($LG);
            }
            $result = true;
        }
        break;
    case 'update':
        if (!isset($data['rider'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        } else {
            $rider =  $RiderService->ToRider($data['rider']);
            $result = $RiderService->update($rider);
            $LG = new Lien_Groupe();
            $LG->objet_id = $rider->id;
            $LG->objet_type = "rider";
            $LG->groupes = array();
            foreach ($rider->groupes as $item) {
                array_push($LG->groupes, $item['id']);
            }
            $groupeServices->update_lien($LG);
            $result = true;
        }
        break;
    case 'get_account':
        if (!isset($data['id'])) {
            $server->getHttpStatusMessage(401, "NO_ID_FOUND");
            exit;
        } else {
            $result = $RiderService->get_account($data['id']);
        }
        break;
    case 'update_mail':
        if (!isset($data['compte'])) {
            $server->getHttpStatusMessage(401, "NO_ACCOUNT_FOUND");
            exit;
        } else  if (!isset($data['password'])) {
            $server->getHttpStatusMessage(401, "NO_PASSWORD_FOUND");
            exit;
        } else if (!isset($data['mail'])) {
            $server->getHttpStatusMessage(401, "NO_MAIL_FOUND");
            exit;
        } else {
            $previousmail = $RiderService->get_login($data['compte']);
            $riders = $RiderService->getUserByLogin($previousmail['login'], $data['password'], $season_id);
            if (is_string($riders)) {
                $server->getHttpStatusMessage(401, $riders);
                exit;
            } else {
                $result = $RiderService->update_mail($data['compte'], $data['mail']);
            }
        }
        break;
    case 'update_mail_active':
        if (!isset($data['compte'])) {
            $server->getHttpStatusMessage(401, "NO_ACCOUNT_FOUND");
            exit;
        } else  if (!isset($data['mail_active'])) {
            $server->getHttpStatusMessage(401, "NO_INFO_FOUND");
            exit;
        } else {
            $result = $RiderService->update_mail_active($data['compte'], $data['mail_active']);
        }
        break;
    case 'update_password':
        if ((!isset($data['email']) || (!isset($data['mdp_actuel'])) || (!isset($data['new_mdp'])))) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        } else {
            $riders = $RiderService->getUserByLogin($data['email'], $data['mdp_actuel'], $season_id);
            if (is_string($riders)) {
                $server->getHttpStatusMessage(401, $riders);
                exit;
            } else {
                $result = $RiderService->update_psw($riders[0]->compte, $data['new_mdp']);
            }
        }
        break;
    case 'get':

        if (!isset($data['id'])) {
            $server->getHttpStatusMessage(401, "NO_ID_FOUND");
            exit;
        }
        $result = $RiderService->get($data['id'], $season_id);
        foreach ($result as $rd) {
            $rd->groupes = $groupeServices->get_lien_objet_id($rd->id,'rider');
            $rd->inscriptions = $RiderService->getInscriptions($rd->id,$season_id);
            $rd->seances = $RiderService->getSeances($rd, true,$season_id);
            if($rd->est_prof){
                $rd->seances_prof = $RiderService->getSeancesProf($rd->id,$season_id);
            }
            if(isset($rd->inscriptions)) {
                $inscriptions = array();
                foreach ($rd->inscriptions as $inscr) {
                    $inscr->groupes = $groupeServices->get_lien_objet_id($inscr->seance_id,'séance');
                    $exist = false;
                    foreach ($inscr->groupes as $group_seance) {
                        foreach ($rd->groupes as $group_rider) {
                            if($group_rider->id == $group_seance->id){
                                $exist = true;
                            }
                        }
                    }
                    if($exist){
                        array_push($inscriptions, $inscr);
                    }
                }
                $rd->inscriptions = $inscriptions;
            }
            if(isset($rd->seances)) {
                $seances = array();
                foreach ($rd->seances as $sz) {
                    $sz->groupes = $groupeServices->get_lien_objet_id($sz->seance_id,'séance');
                    $exist = false;
                    foreach ($sz->groupes as $group_seance) {
                        foreach ($rd->groupes as $group_rider) {
                            if($group_rider->id == $group_seance->id){
                                $exist = true;
                            }
                        }
                    }
                    if($exist){
                        array_push($seances, $sz);
                    }
                }
                $rd->seances = $seances;
            }	
            
        }
        break;
    case 'get_all':
        $this_season = $season_id;
        $all = false;
        if (isset($data['season_id'])) {
            $season_id = $data['season_id'];
        }
        if (isset($data['all'])) {
            $all = true;
        }
        if (isset($data['search'])) {
            $result = $RiderService->search($data['search'], $season_id, $all, $this_season);
        } else {
            $result = $RiderService->get_all($season_id, $all, $this_season);
        }
        foreach ($result as $rd) {
            $rd->groupes = $groupeServices->get_lien_objet_id($rd->id, 'rider');
        }
        
        break;
    case 'get_all_light':
        $this_season = $season_id;
        $all = false;
        if (isset($data['season_id'])) {
            $season_id = $data['season_id'];
        }
        if (isset($data['all'])) {
            $all = true;
        }
        if (isset($data['search'])) {
            $result = $RiderService->search_light($data['search'], $season_id, $all, $this_season);
        } else {
            $result = $RiderService->get_all_light($season_id, $all, $this_season);
        }

        break;
    case 'get_prof_light':
        if (!$admin && !$prof) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            $result = $RiderService->get_prof_light();
        }
        break;
    case 'register':
        if (!isset($data['id'])) {
            $server->getHttpStatusMessage(401, "NO_ID_FOUND");
            exit;
        }
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            $is = new InscriptionSaisonService($con);
            $result = $is->add($season_id, $data['id']);
        }
        break;
    case 'delete':
        if (!isset($data['id'])) {
            $server->getHttpStatusMessage(401, "NO_ID_FOUND");
            exit;
        }
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            $result = $RiderService->delete($data['id']);
            $groupeServices->delete_lien_objet($data['id'], 'rider');
        }
        break;
}
print json_encode($result);
