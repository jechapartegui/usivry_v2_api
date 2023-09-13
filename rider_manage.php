<?php
include_once("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
include_once("config/params.php");
require_once("class/class.php");
require_once("services/ridersServices.php");
require_once("services/saisonServices.php");
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
        }
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            if (isset($data['with_psw'])) {
                $result = $RiderService->addrider_new_account($data['rider']);
            } else {
                $result = $RiderService->addrider_existingaccount($data['rider']);
            }
            if (!is_numeric($result)) {
                $server->getHttpStatusMessage(401, $result);
                exit;
            }
            if (isset($data['inscription_saison_encours'])) {
                $is = new InscriptionSaisonService($conn);
                $is->add($season_id, $result);
            }
        }
        break;
    case 'create':
        if (!isset($data['rider'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        }

        if (isset($data['with_psw'])) {
            $result = $RiderService->addrider_new_account($data['rider']);
        } else {
            $result = $RiderService->addrider_existingaccount($data['rider']);
        }
        if (!is_numeric($result)) {
            $server->getHttpStatusMessage(401, $result);
            exit;
        }
        if (isset($data['inscription_saison_encours'])) {
            $is = new InscriptionSaisonService($conn);
            $is->add($season_id, $result);
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
        }
        $result = $RiderService->add_range($data['riders']);
        $is = new InscriptionSaisonService($con);
        foreach ($result as $id) {
            $is->add($season_id, $id);
        }
        break;
    case 'update':      
        if (!isset($data['rider'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        } else {
            $result = $RiderService->update($data['rider']);
        }
        break;
    case 'update_level':      
        if (!isset($data['id']) || !isset($data['niveau'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        } else {
            $result = $RiderService->update_level($data['niveau'], $data['id']);
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
            $rd->inscriptions = $RiderService->getInscriptions($rd->id,$season_id);
            $rd->seances = $RiderService->getSeances($rd, true,$season_id);
            if ($rd->est_prof) {
                $rd->seances_prof = $RiderService->getSeancesProf($rd->id,$season_id);
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
        }
        break;
}

print json_encode($result);
