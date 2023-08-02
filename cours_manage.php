<?php
include_once("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
require_once("class/class.php");
require_once("services/ridersServices.php");
require_once("services/coursServices.php");

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
    $RiderService = new RiderService($conn);
    $user_id = $_SESSION['user_id'];
    $admin = $RiderService->est_admin($user_id);
    $coursServices = new CoursService($conn);
    switch ($command) {
        case 'add':
            if (!isset($data['cours'])) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
            } 
            if(!$admin){
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {               
                    $result = $coursServices->add($data['cours']);
              
            }
            break;       
        case 'update':
            if (!isset($data['cours'])) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
            } 
            if(!$admin){
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
            if(!$admin){
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $result = $coursServices->get($data['id']);
            }
            break;
        case 'get_all':
            if(!$admin){
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
            $result = $coursServices->getAll();
            }
            break;
        case 'get_all_byseason':
            if (!isset($data['season_id'])) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
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
                        $result = $coursServices->getAll_bySaison($data['season_id']);
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
                $result = $coursServices->delete($data['id']);
            }
            break;
    }

    print json_encode($result);
}