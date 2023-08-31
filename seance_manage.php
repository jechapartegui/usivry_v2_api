<?php
include_once("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
require_once("class/class.php");
require_once("services/ridersServices.php");
require_once("services/seanceServices.php");
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
    if ($name == "password") {
        $password = $value;
    }
    if ($name == "date_ref") {
        $date_ref = $value;
    }
    if ($name == "user_id") {
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
$seanceServices = new SeanceService($con);
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
            if (!isset($data['seance'])) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
            }
            if (!$admin) {
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $result = $seanceServices->add($data['seance']);
            }
            break;
        case 'load_seance':
            if (!isset($data['id'])) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
            }
            if (!$prof) {
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $inscriptionseanceServices = new InscriptionService($con);
                $result = $inscriptionseanceServices->load_seance($data['id'], $season_id);
            }
            break;
        case 'update_inscription_seance':
            if (!isset($data['inscription'])) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
            }
            if (!$prof) {
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $inscriptionseanceServices = new InscriptionService($con);
                $result = $inscriptionseanceServices->update_inscription_seance($data['inscription']);
            }
            break;
        case 'update':
            if (!isset($data['seance'])) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
            }
           
                $result = $seanceServices->update($data['seance']);
           
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
                $result = $seanceServices->get($data['id']);
            }
            break;
        case 'get_all':
            if (isset($data['season_id'])) {
                $season_id = $data['season_id'];
            }
            $result = $seanceServices->getAll($season_id);
            break;
        case 'get_seanceprevue':
            $result = $seanceServices->get_seanceprevue();
            break;
        case 'get_seance_plagedate':           
            $result = $seanceServices->get_seance_plagedate();
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
                $result = $seanceServices->delete($data['id']);
            }
            break;
    }

    print json_encode($result);
