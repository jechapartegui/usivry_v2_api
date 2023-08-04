<?php
include_once("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
include_once("config/params.php");
require_once("class/class.php");
require_once("services/ridersServices.php");
require_once("services/saisonServices.php");
require_once("services/inscriptionsaisonServices.php");

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
    $RiderService = new RiderService($con);
    switch ($command) {
        case 'add':
            if (!isset($_SESSION['user_id'])) {
                $server->getHttpStatusMessage(401, "NO_USER_FOUND");
                exit;
            }
            
            $admin = $RiderService->est_admin($_SESSION['user_id']);
            if (!isset($data['rider'])) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
            } 
            if(!$admin){
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                if (isset($data['with_psw'])) {
                    $result = $RiderService->add_withpsw($data['rider']);

                } else {
                    $result = $RiderService->add($data['rider']);
                }
                if (isset($data['inscription_saison_encours'])) {
                    $s = new SaisonService($conn);
                    $season_id = $s->getActive();
                    $is = new InscriptionSaisonService($conn);
                    $is->add($season_id, $result);
                }
            }
            break;
        case 'create':
                if (!isset($data['rider'])) {
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
                        if (isset($data['with_psw'])) {
                            $result = $RiderService->add_withpsw($data['rider']);
        
                        } else {
                            $result = $RiderService->add($data['rider']);
                        }
                        if (isset($data['inscription_saison_encours'])) {
                            $s = new SaisonService($conn);
                            $season_id = $s->getActive();
                            $is = new InscriptionSaisonService($conn);
                            $is->add($season_id, $result);
                        }
                    }
                }
                break;
            case 'add_range':
                if (!isset($data['riders'])) {
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
                       $result = $RiderService->add_range($data['riders']);
                       $s = new SaisonService($con);
                        $season_id = $s->getActive();
                        $is = new InscriptionSaisonService($con);
                        foreach ($result as $id) {
                            $is->add($season_id, $id);
                        }
                    }
                }
                break;
        case 'update':
            if (!isset($_SESSION['user_id'])) {
                $server->getHttpStatusMessage(401, "NO_USER_FOUND");
                exit;
            }
            $admin = $RiderService->est_admin($_SESSION['user_id']);
            if (!isset($data['rider'])) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
            } else {
                $result = $RiderService->update($data['rider']);
            }
            break;
        case 'update_passowrd':
            if (!isset($_SESSION['user_id'])) {
                $server->getHttpStatusMessage(401, "NO_USER_FOUND");
                exit;
            }
            $admin = $RiderService->est_admin($_SESSION['user_id']);
            if ((!isset($data['id']) || (!isset($data['password'])))) {
                $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
                exit;
            } else {
                $result = $RiderService->update_psw($data['id'], $data['password']);
            }
            break;
        case 'get':
            $admin = $RiderService->est_admin($_SESSION['user_id']);
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
                $result = $RiderService->get($data['id']);
            }
            break;

        case 'delete':
            if (!isset($_SESSION['user_id'])) {
                $server->getHttpStatusMessage(401, "NO_USER_FOUND");
                exit;
            }
            $admin = $RiderService->est_admin($_SESSION['user_id']);
            if (!isset($data['id'])) {
                $server->getHttpStatusMessage(401, "NO_ID_FOUND");
                exit;
            }             
            if(!$admin){
                $server->getHttpStatusMessage(401, "UNAUTHORIZED");
                exit;
            } else {
                $result = $RiderService->delete($data['id']);
            }
            break;
    }

    print json_encode($result);
}