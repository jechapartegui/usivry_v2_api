<?php
include_once("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
require_once("class/class.php");
require_once("services/ridersServices.php");
require_once("services/seanceServices.php");
require_once("services/saisonServices.php");

// Connect to database
$database = new database();
$con = $database->getConnection();
$server = new restServer();
$data = $server->initRest();

if (!isset($_SESSION['user_id'])) {
    $server->getHttpStatusMessage(401, "NO_USER_FOUND");
    exit;
}

if (!isset($data['command'])) {
    $server->getHttpStatusMessage(400, "NO_COMMAND_FOUND");
    exit;
} else {
    $command = $data['command'];
    $RiderService = new RiderService($con);
    $user_id = $_SESSION['user_id'];
    $admin = $RiderService->est_admin_compte($user_id);
    $seanceServices = new SeanceService($con);
    switch ($command) {
        case 'add':
            if (!isset($data['seance'])) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
            } 
            if(!$admin){
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {               
                    $result = $seanceServices->add($data['seance']);
              
            }
            break;       
        case 'update':
            if (!isset($data['seance'])) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
            } 
            if(!$admin){
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $result = $seanceServices->update($data['seance']);
            }
            break;
       
        case 'get':
            if (!isset($data['id'])) {
                $server->getHttpStatusMessage(401, "NO_ID_FOUND");
                exit;
            }  
            if(!$admin){
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $result = $seanceServices->get($data['id']);
            }
            break;
        case 'get_all':
            if (isset($data['season_id'])) {
                $season_id = $data['season_id'];
            } else {
                $s = new SaisonService($con);
                $season_id = $s->getActive();
            }
            if (!isset($data['password'])) {
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $p =  new params();
                if($data['password'] != $p->getPsw()){
                    $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                    exit;
                } else {
                    $result = $seanceServices->getAll($season_id);
                }
            }           
            break;
        case 'get_seanceprevue':           
            if (!isset($data['password'])) {
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $p =  new params();
                if($data['password'] != $p->getPsw()){
                    $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                    exit;
                } else {
                        $result = $seanceServices->get_seanceprevue();
                }
            }
            break;
        case 'get_seance_plagedate':           
            if (!isset($data['password'])) {
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $p =  new params();
                if($data['password'] != $p->getPsw()){
                    $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                    exit;
                } else {
                        $result = $seanceServices->get_seance_plagedate();
                }
            }
            break;
        case 'delete':
            if (!isset($data['id'])) {
                $server->getHttpStatusMessage(401, "NO_ID_FOUND");
                exit;
            }             
            if(!$admin){
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $result = $seanceServices->delete($data['id']);
            }
            break;
    }

    print json_encode($result);
}