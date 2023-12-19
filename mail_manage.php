<?php
include_once("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
include_once("config/params.php");
require_once("class/class.php");
require_once("services/ridersServices.php");
require_once("services/saisonServices.php");


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
$saisonservice = new SaisonService($con);
if ($user_id > 0) {
    $logged = true;
    $admin = $RiderService->est_admin_compte($user_id);
    $prof = $RiderService->est_prof_compte($user_id);
} else {
    $logged = false;
}
$season_id = $saisonservice->getActive();
switch ($command) {
    case 'sen':       
        if (!isset($data['mail'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        }
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            $saison = $saisonservice->ToSaison($data['saison']);
            $result = $saisonservice->add($saison);
        }
        break;
    case 'update':      
        if (!isset($data['saison'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        }
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            $saison = $saisonservice->ToSaison($data['saison']);
            $result = $saisonservice->update($saison);
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
            $result = $saisonservice->get($data['id']);
        }
        break;
    case 'get_all':
        $result = $saisonservice->getAll();
        break;
    case 'get_all_light':
        $result = $saisonservice->getAllLight();
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
            $result = $saisonservice->delete($data['id']);
        }
        break;
}

print json_encode($result);
