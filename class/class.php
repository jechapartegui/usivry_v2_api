<?php

class Rider
{
    public $id;
    public $nom;
    public $prenom;
    public $nomcomplet;
    public $date_naissance;
    public $sexe;
    public $niveau;
    public $mot_de_passe;
    public $email;
    public $est_prof;
    public $est_admin;
    public $est_inscrit;
    public $compte;
    public $adresse;
    public $seances;
    public $telephone;
    public $personne_prevenir;
    public $telephone_personne_prevenir;
    public $seances_prof;
    public $inscriptions;
    public $groupes;

    public function __construct()
    {
        $utils = new utils();
        $this->nomcomplet = $utils->convert_texte($this->nom . " " . $this->prenom);
        $this->prenom = $utils->convert_texte($this->prenom);
        $this->nom = $utils->convert_texte($this->nom);
        if ($this->sexe == 0) {
            $this->sexe = false;
        } else {
            $this->sexe = true;
        }
        if ($this->est_admin == 0) {
            $this->est_admin = false;
        } else {
            $this->est_admin = true;
        }
        if ($this->est_prof == 0) {
            $this->est_prof = false;
        } else {
            $this->est_prof = true;
        }
        if ($this->est_inscrit == 0) {
            $this->est_inscrit = false;
        } else {
            $this->est_inscrit = true;
        }
    }
}

class Cours
{
    public $id;
    public $nom;
    public $jour_semaine;
    public $heure;
    public $duree;
    public $prof_principal_id;
    public $prof_principal_nom;
    public $lieu_id;
    public $lieu_nom;
    public $age_requis;
    public $age_maximum;
    public $saison_id;
    public $place_maximum = null;
    public $convocation_nominative = false;
    public $groupes;

    public function __construct()
    {
        $utils = new utils();
        $this->nom = $utils->convert_texte($this->nom);
        if ($this->convocation_nominative == 0) {
            $this->convocation_nominative = false;
        } else {
            $this->convocation_nominative = true;
        }
    }
}


class Seance
{
    public $id;
    public $seance_id;
    public $cours;
    public $libelle;
    public $date_seance;
    public $heure_debut;
    public $duree_seance;
    public $lieu_id;
    public $lieu;
    public $statut;
    public $age_requis;
    public $age_maximum;
    public $groupes;
    public $professeurs;
    public $place_maximum;
    public $essai_possible;
    public $notes;
    public $info_seance;
    public $convocation_nominative;

    public function __construct()
    {
        $this->professeurs = array();
        if ($this->essai_possible == 0) {
            $this->essai_possible = false;
        } else {
            $this->essai_possible = true;
        }
        if ($this->convocation_nominative == 0) {
            $this->convocation_nominative = false;
        } else {
            $this->convocation_nominative = true;
        }
        
    }
}

class Team{
    public $nom_long;
    public $nom_court;
    public $contact;
    public $couleur_1;
    public $couleur_2;
    public $pays;
    public $sexe;
    public $email;
    public $phone;
    public $paiement;
    public $not_enough;
    public $how_many;
    public function __construct()
    {
      
        if ($this->not_enough == 0) {
            $this->not_enough = false;
        } else {
            $this->not_enough = true;
        }
        if ($this->sexe == 0) {
            $this->sexe = false;
        } else {
            $this->sexe = true;
        }
    }
}

class Lieu
{
    public $id;
    public $nom;
    public $adresse;
}

class Inscription
{
    public $id;
    public $rider_id;
    public $seance_id;
    public $date_inscription;
    public $statut;
    public $statut_seance;
    public $rider_libelle;
    public $contact_urgence;
    public $professeurs;
    public $hors_liste;
}

class Saison
{
    public $id;
    public $nom;
    public $active;
}

class KeyValuePair
{
    public $key;
    public $value;
}

class Groupe
{
    public $id;
    public $nom;
    public $saison_id;
}

class Lien_Groupe
{
    public $groupes;
    public $objet_id;
    public $objet_type;
}


class Compte{
    public $id;
    public $login;
    public $registration_date;
    public $mail_active;
    public $password;
    public $riders;
}

class MailData{
    public $subject;
    public $to;
    public $content;
}
