<?php
include_once("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
include_once("config/params.php");
require_once("class/class.php");
require_once("services/mailServices.php");
require_once("services/rollballServices.php");

// Connect to database
$database = new database();
$con = $database->getConnection();
$server = new restServer();
$data = $server->initRest();
var_dump("huuh");
if (!isset($data['command'])) {
    $server->getHttpStatusMessage(401, "NO_COMMAND_FOUND");
    exit;
} else {
    $command = $data['command'];
}

$season_id = 1;
$user_id = 0;
foreach (getallheaders() as $name => $value) {
    if (strtolower($name) == "password") {
        $password = $value;
    }
    if (strtolower($name) == "dateref") {
        $date_ref = $value;
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
$rbs = new RollBallServices($con);
switch ($command) {
    case 'subscribe':
        if (!isset($data['team'])) {
            $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
            exit;
        } else {
            $team = $rbs->ToTeam($data['team']);
            $id = $rbs->add($team);
            if ($id > 0) {
                $mailServices = new MailService();
                $mailServices->ConfirmRollBall($team);
                $result = true;
            } else {
                $result = false;
            }
        }
        break;
}

print json_encode($result);
