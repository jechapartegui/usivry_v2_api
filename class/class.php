<?php 

class Rider {
    public $id;
    public $nom;
    public $prenom;
    public $date_naissance;
    public $sexe;
    public $niveau;
    public $mot_de_passe;
    public $email;
    public $essai_restant;
    public $est_prof;
    public $est_admin;
}

class Cours {
    public $id;
    public $nom;
    public $jour_semaine;
    public $heure;
    public $duree;
    public $prof_principal_id;
    public $lieu_id;
    public $age_requis;
    public $niveau_requis;
    public $saison_id;
}


class Seance {
    public $id;
    public $cours;
    public $date_seance;
    public $heure_debut;
    public $duree_cours;
    public $lieu_id;
    public $statut;
    public $professeurs;
}

class Lieu{
    public $id;
    public $nom;
    public $adresse;
}

class Inscription {
    public $id;
    public $rider_id;
    public $seance_id;
    public $date_inscription;
}

class Saison{
    public $id;
    public $nom;
    public $active;
}