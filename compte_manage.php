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
        if (!isset($data['compte'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        }
        if (!$admin) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        } else {
            $compte = $RiderService->ToCompte($data['compte']);
            $compte = $RiderService->checkAndInsertAccount($compte->login, $compte->password);
            $result = $compte->id;
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
            $result = $RiderService->get_account($data['compte_id']);
        }
        break;
    case 'exist':
        if (!isset($data['login'])) {
            $server->getHttpStatusMessage(401, "NO_LOGIN_FOUND");
            exit;
        } else {
            $result = $RiderService->ExistAccount($data['login']);
        }
        break;
    case 'get_all':
        $result = $RiderService->get_all_account($season_id);
        break;
    case 'update_mail_relance':
        if (!isset($data['compte_id'])) {
            $server->getHttpStatusMessage(401, "NO_ID_FOUND");
            exit;
        } else {
            $compte = $RiderService->get_account($data['compte_id']);
            $ma = 1;
            if ($compte->mail_active == 1) {
                $ma = 0;
            }
            $result = $RiderService->update_mail_active($compte->id, $ma);
        }

        break;
    case 'attacher':
        if (!$admin && !$prof) {
            $server->getHttpStatusMessage(401, "UNAUTHORIZED");
            exit;
        }
        if (!isset($data['compte_id']) || !isset($data['rider_id'])) {
            $server->getHttpStatusMessage(401, "NO_ID_FOUND");
            exit;
        }
        $rider = $RiderService->getRidersbyid($data['rider_id']);
        $rider->compte = $data['compte_id'];
        $result = $RiderService->update($rider);
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
            $riders = $rider->getUserByLogin($login, $psw, $season_id);
            foreach ($riders as $r) {
                $r->compte = 0;
                $RiderService->update($r);
            }
            $result = $RiderService->delete_account($data['id']);
        }
        break;
}

print json_encode($result);
