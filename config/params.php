<?php

class params{
    private $mdp = "KaSeona2211!";
    private $admin_site = "jecha266";
    function getMagicWord(){
        return $this->mdp;
    }
    function getPsw(){
        return $this->admin_site;
    }
}

?>