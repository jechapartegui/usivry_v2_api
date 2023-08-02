<?php 

class Rider {
    public $id;
    public $nom;
    public $prenom;
    public $dateNaissance;
    public $sexe;
    public $niveau;
    public $motDePasse;
    public $email;
    public $essaiRestant;
    public $estProf;
    public $estAdmin;
}

class Cours {
    public $id;
    public $nom;
    public $jourSemaine;
    public $heure;
    public $duree;
    public $professeurPrincipal;
    public $gymnaseReference;
    public $ageRequis;
    public $niveauRequis;
}


class Seance {
    public $id;
    public $cours;
    public $dateSeance;
    public $heureDebut;
    public $dureeCours;
    public $gymnase;
    public $professeurs;
}

class Inscription {
    public $id;
    public $personne;
    public $seance;
    public $dateInscription;
}