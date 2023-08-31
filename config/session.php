<?php
/**
 * Created by PhpStorm.
 * User: Nicolas
 * Date: 11-06-19
 * Time: 14:21
 */
ini_set( "session.gc_maxlifetime", 7200 );

session_start();

// Make sure we have a canary set
if (!isset($_SESSION['canary'])) {
    session_regenerate_id(true);
    $_SESSION['canary'] = [
        'birth' => time(),
        'IP' => $_SERVER['REMOTE_ADDR']
    ];
}
if ($_SESSION['canary']['IP'] !== $_SERVER['REMOTE_ADDR']) {
    session_regenerate_id(true);
    // Delete everything:
    // Except federation...
    foreach (array_keys($_SESSION) as $key) {
    	if ($key!='federation'){
	        unset($_SESSION[$key]);
	}
    }
    $_SESSION['canary'] = [
        'birth' => time(),
        'IP' => $_SERVER['REMOTE_ADDR']
    ];
}
// Regenerate session ID every five minutes:
// Doing this will cause the session to be lost if idle for more than 5 minutes.
/*if ($_SESSION['canary']['birth'] < time() - 300) {
    session_regenerate_id(true);
    $_SESSION['canary']['birth'] = time();
}*/
