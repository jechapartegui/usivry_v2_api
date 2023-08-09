<?php
include_once("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
require_once("class/class.php");
require_once("services/ridersServices.php");
require_once("services/inscriptionsaisonServices.php");

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
    $admin = $RiderService->est_admin_compte($user_id);
    $inscriptionsaisonServices = new InscriptionSaisonService($conn);
    switch ($command) {
        case 'add':
            if ((!isset($data['saison_id'])) || (!isset($data['rider_id']))) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
            } 
            if(!$admin){
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {               
                    $result = $inscriptionsaisonServices->add($data['saison_id'], $data['rider_id']);
              
            }
            break;       
        
        case 'get_all_saison':    
            if (!isset($data['saison_id'])) {
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
                        $result = $inscriptionsaisonServices->getAll_Bysaison($data['saison_id']);
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
                $result = $inscriptionsaisonServices->delete($data['saison_id'], $data['rider_id']);
            }
            break;
    }

    print json_encode($result);
}