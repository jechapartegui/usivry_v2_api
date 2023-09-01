<?php
include_once("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
include_once("config/params.php");
require_once("class/class.php");
require_once("services/ridersServices.php");
require_once("services/saisonServices.php");
require_once("services/inscriptionServices.php");


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
$inscriptionseanceServices = new InscriptionService($con);
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
        if (!isset($data['inscription'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        }
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            $result = $inscriptionseanceServices->add($data['inscription']);
        }
        break;
    case 'update':
        if (!isset($data['inscription'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        } else {
            $result = $inscriptionseanceServices->update($data['inscription']);
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
            $result = $inscriptionseanceServices->get($data['id']);
        }
        break;

    case 'get_all_seance':
        if (!isset($data['seance_id'])) {
            $server->getHttpStatusMessage(401, "NO_ID_FOUND");
            exit;
        }
        $result = $inscriptionseanceServices->getAll_BySeance($data['seance_id']);
        break;
    case 'get_all_cours':
        if (!isset($data['cours_id'])) {
            $server->getHttpStatusMessage(401, "NO_ID_FOUND");
            exit;
        }
        $result = $inscriptionseanceServices->getAll_ByCours($data['cours_id']);
        break;
    case 'get_all_rider':
        if ((!isset($data['rider_id'])) || (!isset($data['saison_id']))) {
            $server->getHttpStatusMessage(401, "NO_ID_FOUND");
            exit;
        }
        $result = $inscriptionseanceServices->getAll_ByRider($data['rider_id'], $data['saison_id']);
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
            $result = $inscriptionseanceServices->delete($data['id']);
        }
        break;
}

print json_encode($result);
