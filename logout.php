<?php
include_once ("config/session.php");
// We need to keep the federation in the session so we will set it again after removing everything!!!

session_unset();


print json_encode(array('result'=>'OK','username'=>''));
