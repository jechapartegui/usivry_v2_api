<?php
include_once ("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
include_once("services/ridersServices.php");
include_once("services/saisonServices.php");
include_once("services/mailServices.php");
include_once("services/groupeServices.php");

// Connect to database
$database=new database();
$con = $database->getConnection();
$server = new restServer();
$data = $server->initRest();
$ss = new SaisonService($con);
$season_id = $ss->getActive();
$rider=new RiderService($con);
$groupeServices=new GroupeService($con);
$mail=new MailService();
if (isset($data['logout'])){
	session_unset();
	exit;
}
if (isset($data['renvoi_mdp']) && isset($data['login']) ){
	
	$randomstring = $rider->generateRandomString(8);
	$val = $rider->update_psw_compte($data['login'],$randomstring);
	if($val){		
		$mail->SendMailPassword($data['login'],$randomstring);
		print json_encode($val);
		exit;
	} else {
		$server->getHttpStatusMessage(401, "UNKNOWN_ERROR");
		exit;
	}
}
if (!isset($data['username'])){
    $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
    exit;
}
if (!isset($data['password'])){
    $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
    exit;
}
if (!isset($data['stayLoggedIn'])){
    $server->getHttpStatusMessage(401, "NO_OBJECT_FOUND");
    exit;
}

$login=trim($data['username']);
$psw=$data['password'];
$sli=$data['stayLoggedIn']/1;

// Check that the connection is OK!
if ( !$con ) {
	//echo "Error: " . mysqli_connect_error();
	//  die( 'connect error: '.mysqli_connect_error() );
    $server->getHttpStatusMessage(503, "NO_DB_FOUND");
	exit;
}

$riders = $rider->getUserByLogin($login,$psw,$season_id );
if (is_string($riders)){
    $server->getHttpStatusMessage(401,$riders);
    exit;
}
foreach ($riders as $rd) {
	$rd->groupes = $groupeServices->get_lien_objet_id($rd->id,'rider');
	$rd->inscriptions = $rider->getInscriptions($rd->id,$season_id);
	$rd->seances = $rider->getSeances($rd, true,$season_id);
	if($rd->est_prof){
		$rd->seances_prof = $rider->getSeancesProf($rd->id,$season_id);
	}
	if(isset($rd->inscriptions)) {
		$inscriptions = array();
		foreach ($rd->inscriptions as $inscr) {
			$inscr->groupes = $groupeServices->get_lien_objet_id($inscr->seance_id,'séance');
			$exist = false;
			foreach ($inscr->groupes as $group_seance) {
				foreach ($rd->groupes as $group_rider) {
					if($group_rider->id == $group_seance->id){
						$exist = true;
					}
				}
			}
			if($exist){
				array_push($inscriptions, $inscr);
			}
		}
		$rd->inscriptions = $inscriptions;
	}
	if(isset($rd->seances)) {
		$seances = array();
		foreach ($rd->seances as $sz) {
			$sz->groupes = $groupeServices->get_lien_objet_id($sz->seance_id,'séance');
			$exist = false;
			foreach ($sz->groupes as $group_seance) {
				foreach ($rd->groupes as $group_rider) {
					if($group_rider->id == $group_seance->id){
						$exist = true;
					}
				}
			}
			if($exist){
				array_push($seances, $sz);
			}
		}
		$rd->seances = $seances;
	}	
	
}


if ($riders && count($riders) > 0) {
    $_SESSION['user_id'] = $riders[0]->compte;
} else {
    $server->getHttpStatusMessage(401,"NO_ACCOUNT");
    exit;
}// ID of the rider...

if ($sli==1){
	// Since we use hashed version of the hashed password if password is changed the cookie based login will fail until refreshed.
	$passHash = hash("sha256",$psw);
	// Cookie is valid for 30 days...
	setcookie('login_key',$riders[0]->compte . ";" . $passHash,time()+3600*24*30);	
	if (isset($_SESSION['language'])){
		setcookie('language',$_SESSION['language'],time()+3600*24*30);
	}
} else {
	// Remove login cookie if it isn't requested but exists...
	if (isset($_COOKIE['login_key'])){
		unset($_COOKIE['login_key']);
		setcookie('login_key',null,-1);
	}

	if (isset($_COOKIE['language'])){
		unset($_COOKIE['language']);
		setcookie('language','',-1);
	}
}

// Send success response...
header("Content-Type:Content-Type:application/json"); // to be add to restserver
print json_encode($riders);