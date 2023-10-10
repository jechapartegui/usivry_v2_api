<?php

class params{
    private $mdp = "KaSeona2211!";
    private $admin_site = "jecha266";

    private $host = "smtp.gmail.com";
    private $user = "usivry.roller@gmail.com";
    private $pswmail = "Roller94200";
    function getMagicWord(){
        return $this->mdp;
    }
    function getPsw(){
        return $this->admin_site;
    }
    function getPswMail(){
        return $this->pswmail;
    }
    function getUser(){
        return $this->user;
    }
    function getHost(){
        return $this->host;
    }



    function calculerAge($dateNaissance) {
        $aujourdHui = new DateTime();
        $dateNaissance = new DateTime($dateNaissance);
        $difference = $dateNaissance->diff($aujourdHui);
        return $difference->y; // Renvoie l'âge en années
    }

    function getNiveaux($niveau) {
        $niveaux = ['débutant', 'intermédiaire', 'avancé'];
        $result = [];
    
        $niveauIndex = array_search($niveau, $niveaux);
    
        if ($niveauIndex !== false) {
            for ($i = 0; $i <= $niveauIndex; $i++) {
                $result[] = $niveaux[$i];
            }
        }
    
        return $result;
    }
}

?>