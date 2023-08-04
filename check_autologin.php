<?php
include_once ("config/session.php");
include_once("config/restServer.php");
include_once("config/database.php");
require_once ("class/ridersServices.php");

// Connect to database
$database=new database();
$con = $database->getConnection();
$server = new restServer();
$data = $server->initRest();

$userId=-1;
$federation=null;
$language='EN';

$user=new RiderService($con);
if (isset($_SESSION['user_id'])){
	// Session still ok...
	$userId=$_SESSION['user_id'];
	$secUser = $user->getRidersbyid($userId);
	$ph='--SESSION-OK--';
}

if (!isset($_COOKIE['login_key']) && $userId<1){
    $server->getHttpStatusMessage(401);
    exit;
} else {
	if (isset($_COOKIE['login_key'])){
		$lk=$_COOKIE['login_key'];
		// Do we have correct format data in the cookie?
		if (preg_match('/^(\d+);(.+)$/',$lk,$items)){
			$uId=$items[1];
			$ph=$items[2];
		} else {
		    $server->getHttpStatusMessage(401);
		    exit;
		}
		$secUser = $user->getRidersbyid($uId);
		// Additional cookies...
		
		if (isset($_COOKIE['language'])){
			$language=$_COOKIE['language'];
		}
	}
}
//Check if the hash is ok...

if (empty((array)$secUser)){
    $server->getHttpStatusMessage(401);
    exit;
}

if ($ph!='--SESSION-OK--'){
	// Check the hash...
	$passHash=$secUser->getAutoLoginCookieToken();
	if ($ph!=$passHash){
	    $server->getHttpStatusMessage(401);
	    exit;
	}
}



$_SESSION['user_id']=$secUser[0]['compte']; // ID of the user...
$_SESSION['language']=$language;

if ($ph!='--SESSION-OK--'){
	// Cookie is valid for 30 days... refresh it again...
	setcookie('login_key',$secUser->id . ";" . $passHash,time()+3600*24*30);
	setcookie('federation',$_SESSION['federation'],time()+3600*24*30);
	setcookie('language',$_SESSION['language'],time()+3600*24*30);
}

// Send success response...
header("Content-Type:Content-Type:application/json"); // to be add to restserver
print json_encode(array('displayName'=>$secUser->firstname,'login'=>$secUser->getLogin(),'user_id'=>$secUser->id,'permissions'=>$perms,'isReferee'=>$ref));

