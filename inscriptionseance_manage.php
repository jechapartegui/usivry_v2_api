<?php
include_once("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
require_once("class/class.php");
require_once("services/ridersServices.php");
require_once("services/inscriptionServices.php");

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
    $inscriptionseanceServices = new InscriptionService($con);
    switch ($command) {
        case 'add':
            if (!isset($data['inscription'])) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
            } 
            if(!$admin){
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {               
                    $result = $inscriptionseanceServices->add($data['inscription']);
              
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
                $result = $inscriptionseanceServices->get($data['id']);
            }
            break;
       
        case 'get_all_seance':    
            if (!isset($data['seance_id'])) {
                $server->getHttpStatusMessage(401, "NO_ID_FOUND");
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
                        $result = $inscriptionseanceServices->getAll_BySeance($data['seance_id']);
                }
            }
            break;
        case 'get_all_cours':    
            if (!isset($data['cours_id'])) {
                $server->getHttpStatusMessage(401, "NO_ID_FOUND");
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
                        $result = $inscriptionseanceServices->getAll_ByCours($data['cours_id']);
                }
            }
            break;
            case 'get_all_rider':    
                if( (!isset($data['rider_id'])) || (!isset($data['saison_id'])) ){
                    $server->getHttpStatusMessage(401, "NO_ID_FOUND");
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
                            $result = $inscriptionseanceServices->getAll_ByRider($data['rider_id'],$data['saison_id']);
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
                $result = $inscriptionseanceServices->delete($data['id']);
            }
            break;
    }

    print json_encode($result);
}