<?php

session_start();
// We need to keep the federation in the session so we will set it again after removing everything!!!

session_unset();

if (isset($_COOKIE['login_key'])){
	// Remove the login cookie on explicit logout!
	setcookie('login_key','',1);
}

if (isset($_COOKIE['language'])){
	setcookie('language','',1);
}

print json_encode(array('result'=>'OK','username'=>''));
