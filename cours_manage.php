<?php
include_once("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
include_once("config/params.php");
require_once("class/class.php");
require_once("services/ridersServices.php");
require_once("services/saisonServices.php");
require_once("services/coursServices.php");
require_once("services/groupeServices.php");


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
$coursServices = new CoursService($con);
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
        if (!isset($data['cours'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        }
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            $cours = $coursServices->add($data['cours'], $season_id);
            $groupeServices->add_lien($cours->id, 'cours', $cours->groupes);
            $result = $cours->id;
        }
        break;
    case 'update':
        if (!isset($data['cours'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        }
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            $cours =  $coursServices->ToCours($data['cours']);
            $result = $coursServices->update($cours);
            $LG = new Lien_Groupe();
            $LG->objet_id = $cours->id;
            $LG->objet_type = "cours";
            $LG->groupes = array();
            foreach ($seance->groupes as $item) {
                array_push($LG->groupes, $item['id']);
            }
            $groupeServices->update_lien($LG);
            $result = true;
        }
        break;

    case 'get':
        if (!isset($data['id'])) {
            $server->getHttpStatusMessage(401, "NO_ID_FOUND");
            exit;
        }
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            $cours = $coursServices->get($data['id']);
            $cours->groupes = $groupeServices->get_lien_objet_id($cours->id, 'cours');
            $result = $cours;
        }
        break;
    case 'get_all':
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        }
        if (isset($data['season_id'])) {
            $season_id = $data['season_id'];
            $result = $coursServices->get_all($season_id);
        } else {
            $result = $coursServices->get_all();
        }
        foreach ($result as $cours) {
            $cours->groupes = $groupeServices->get_lien_objet_id($cours->id, 'cours');
        }
        break;
        
    case 'get_all_light':
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        }
        if (isset($data['season_id'])) {
            $season_id = $data['season_id'];
            $result = $coursServices->get_all_light($season_id);
        } else {
            $result = $coursServices->get_all_light();
        }

        break;
    case 'get_seasons_light':
        if (!$admin && !$prof) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {

            $result = $s->getAllLight();
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
            $result = $coursServices->delete($data['id']);
            $groupeServices->delete_lien_objet_type($data['id'], 'cours');
        }
        break;
}

print json_encode($result);
