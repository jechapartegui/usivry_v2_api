<?php
include_once("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
include_once("config/params.php");
require_once("class/class.php");
require_once("services/ridersServices.php");
require_once("services/saisonServices.php");
require_once("services/coursServices.php");


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
                $result = $coursServices->add($data['cours'], $season_id);
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
                $result = $coursServices->update($data['cours']);
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
                $result = $coursServices->get($data['id']);
            }
            break;
        case 'get_all':
            if (!$admin) {
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $result = $coursServices->getAll();
            }
            break;

        case 'get_all_byseason':
            if (isset($data['season_id'])) {
                $season_id = $data['season_id'];
            }
            $result = $coursServices->getAll_bySaison($season_id);
            break;
        case 'get_all_light_byseason':
            if (isset($data['season_id'])) {
                $season_id = $data['season_id'];
            }
            $result = $coursServices->getAllLight_bySaison($season_id);
            break;
        case 'get_seasons_light':
            if (!$admin) {
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
            }
            break;
    }

    print json_encode($result);
