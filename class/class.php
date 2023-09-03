<?php 

class Rider {
    public $id;
    public $nom;
    public $prenom;
    public $nomcomplet;
    public $date_naissance;
    public $sexe;
    public $niveau;
    public $mot_de_passe;
    public $email;
    public $essai_restant;
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

    public function __construct() {
        $utils=new utils();
        $this->nomcomplet = $utils->convert_texte($this->nom . " " . $this->prenom);
        $this->prenom = $utils->convert_texte($this->prenom);
        $this->nom = $utils->convert_texte($this->nom);
        if($this->sexe==0){
            $this->sexe = false;
        } else {
            $this->sexe = true;
        }
        if($this->est_admin==0){
            $this->est_admin = false;
        } else {
            $this->est_admin = true;
        }
        if($this->est_prof==0){
            $this->est_prof = false;
        } else {
            $this->est_prof = true;
        }
        if($this->est_inscrit==0){
            $this->est_inscrit = false;
        } else {
            $this->est_inscrit = true;
        }
    }
}

class Cours {
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
    public $niveau_requis;
    public $saison_id;
}


class Seance {
    public $id;
    public $seance_id;
    public $cours;
    public $libelle;
    public $date_seance;
    public $heure_debut;
    public $duree_cours;
    public $lieu_id;
    public $lieu;
    public $statut;
    public $age_requis;
    public $age_maximum;
    public $niveau_requis;
    public $professeurs;

    public function __construct() {
        $this->professeurs = array();
    }
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
    public $statut;
    public $statut_seance;

    public $rider_libelle;
    public $contact_urgence;
    public $professeurs;
}

class Saison{
    public $id;
    public $nom;
    public $active;
}

class KeyValuePair{
    public $key;
    public $value;

}