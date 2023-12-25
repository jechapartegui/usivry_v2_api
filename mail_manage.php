<?php
include_once("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
include_once("config/params.php");
require_once("class/class.php");
require_once("services/ridersServices.php");
require_once("services/saisonServices.php");
require_once("services/mailServices.php");


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
$admin = false;
$prof = false;
foreach (getallheaders() as $name => $value) {
    if (strtolower($name) == "password") {
        $password = $value;
    }
    if (strtolower($name) == "project") {
        $project = $value;
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
$mailServices = new MailService($con);
if ($user_id > 0) {
    $logged = true;
    $admin = $RiderService->est_admin_compte($user_id);
    $prof = $RiderService->est_prof_compte($user_id);
} else {
    $logged = false;
}
$season_id = $saisonservice->getActive();
switch ($command) {
    case 'send':       
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

    case 'load':
        if (!isset($data['mail'])) {
            $server->getHttpStatusMessage(401, "NO_MAIL_FOUND");
            exit;
        }
        if (!$prof && !$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            $mail = $mailServices->ToMailData($data['mail']);
            $result = $mailServices->Load($mail,$project);
        }
        break;
    case 'get_all':
        $result = $saisonservice->getAllLight();
        break;
    case 'delete':        
        if (!isset($data['id'])) {
            $server->getHttpStatusMessage(401, "NO_ID_FOUND");
            exit;
        }
        if (!$est_prof && !$est_admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            $result = $saisonservice->delete($data['id']);
        }
        break;
}

print json_encode($result);
