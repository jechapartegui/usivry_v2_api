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
        if (!isset($data['groupe'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        }
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            $groupe = $groupeServices->ToGroupe($data['groupe']);
            if ($groupe->saison_id == 0) {
                $groupe->saison_id = $season_id;
            }
            $groupe->id = $groupeServices->add($groupe);
            $result = $groupe->id;
        }
        break;
    case 'update':
        if (!isset($data['groupe'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        }
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            $result = $groupeServices->update($data['groupe']);
        }
        break;

    case 'get':
        if (!isset($data['id'])) {
            $server->getHttpStatusMessage(401, "NO_ID_FOUND");
            exit;
        }
        if (!$admin && !$prof) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            $result = $groupeServices->get($data['id']);
        }
        break;
    case 'get_all':
        if (isset($data['season_id'])) {
            $season_id = $data['season_id'];
        }
        $result = $groupeServices->get_all($season_id);
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
            $result = $groupeServices->delete($data['id']);
            $groupeServices->delete_lien_groupe($data['id']);
        }
        break;
    case 'update_lien_groupe':
        if (!isset($data['lien_groupe'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        } else {
            $lien_groupe = $groupeServices->ToLien_Groupe($data['lien_groupe']);
            $result = $groupeServices->update_lien($lien_groupe);
        }
        break;

    case 'get_all_lien_groupe_objet_id':
        if ((!isset($data['objet_type'])) || (!isset($data['objet_id']))) {
            $server->getHttpStatusMessage(401, "NO_ID_FOUND");
            exit;
        } else {
            $result = $groupeServices->get_lien_objet_id($data['objet_id'], $data['objet_type']);
        }
        break;
    case 'get_all_lien_groupe_groupe_id':
        if (!isset($data['groupe_id'])) {
            $server->getHttpStatusMessage(401, "NO_ID_FOUND");
            exit;
        } else {
            $result = $groupeServices->get_lien_groupe($data['groupe_id']);
        }
        break;
    case 'get_all_lien_groupe_objet_type':
        if (!isset($data['objet_type'])) {
            $server->getHttpStatusMessage(401, "NO_ID_FOUND");
            exit;
        } else {
            $result = $groupeServices->get_lien_objet_type($data['objet_type']);
        }
        break;
}

print json_encode($result);
