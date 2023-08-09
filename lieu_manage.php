<?php
include_once("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
require_once("class/class.php");
require_once("services/lieuServices.php");
require_once("services/ridersServices.php");

// Connect to database
$database = new database();
$con = $database->getConnection();
$server = new restServer();
$data = $server->initRest();

if (!isset($data['command'])) {
    $server->getHttpStatusMessage(400, "NO_COMMAND_FOUND");
    exit;
} else {
    $command = $data['command'];
    $user_id = $_SESSION['user_id'];
    $RiderService = new RiderService($con);
    $admin = $RiderService->est_admin_compte($user_id);
    $lieuservice = new LieuService($con);
    switch ($command) {
        case 'add':
            if (!isset($_SESSION['user_id'])) {
                $server->getHttpStatusMessage(401, "NO_USER_FOUND");
                exit;
            }
            if (!isset($data['lieu'])) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
            } 
            if(!$admin){
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {               
                    $result = $lieuservice->add($data['lieu']);
              
            }
            break;       
        case 'update':
            if (!isset($_SESSION['user_id'])) {
                $server->getHttpStatusMessage(401, "NO_USER_FOUND");
                exit;
            }
            if (!isset($data['lieu'])) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
            } 
            if(!$admin){
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $result = $lieuservice->update($data['lieu']);
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
                $result = $lieuservice->get($data['id']);
            }
            break;
        case 'get_all':
            if (!isset($data['password'])) {
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $p =  new params();
                if($data['password'] != $p->getPsw()){
                    $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                    exit;
                } else {
                        $result = $lieuservice->getAll();
                }
            }
            break;
        case 'get_all_light':            
            if (!isset($data['password'])) {
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $p =  new params();
                if($data['password'] != $p->getPsw()){
                    $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                    exit;
                } else {
                        $result = $lieuservice->getAllLight();
                }
            }
            break;
        case 'delete':
            if (!isset($_SESSION['user_id'])) {
                $server->getHttpStatusMessage(401, "NO_USER_FOUND");
                exit;
            }
            if (!isset($data['id'])) {
                $server->getHttpStatusMessage(401, "NO_ID_FOUND");
                exit;
            }             
            if(!$admin){
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $result = $lieuservice->delete($data['id']);
            }
            break;
    }

    print json_encode($result);
}