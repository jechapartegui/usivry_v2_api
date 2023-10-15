<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

include_once("config/params.php");
require 'phpmailer/src/Exception.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';
// Destinataire
class MailService
{
    public $mail;
    public $to;
    public $message;
    public $subject;
    public function __construct()
    {
        $this->mail = new PHPMailer();
        $this->mail->IsSMTP();
        $this->mail->Host = 'ssl0.ovh.net';               //Adresse IP ou DNS du serveur SMTP
        $this->mail->Port = 465;                          //Port TCP du serveur SMTP
        $this->mail->SMTPAuth = 1;                        //Utiliser l'identification

        if ($this->mail->SMTPAuth) {
            $this->mail->SMTPSecure = 'ssl';               //Protocole de sécurisation des échanges avec le SMTP
            $this->mail->Username   =  'contact@usivryroller.fr';
            $this->mail->Password   =  'Roller94200';        //Adresse email à utiliser         //Mot de passe de l'adresse email à utiliser
        }
        $this->mail->CharSet = 'UTF-8'; //Format d'encodage à utiliser pour les caractères
        $this->mail->From       =  'contact@usivryroller.fr';                //L'email à afficher pour l'envoi
        $this->mail->FromName   = 'Contact USI Roller';             //L'alias à afficher pour l'envoi

    }
    public function SendMail()
    {
        // Créez une nouvelle instance de PHPMailer
        $this->mail->Subject    =  'Mon sujet';                      //Le sujet du mail
        $this->mail->WordWrap   = 50;                                //Nombre de caracteres pour le retour a la ligne automatique
        $this->mail->AltBody = 'Mon message en texte brut';            //Texte brut
        $this->mail->IsHTML(false);                                  //Préciser qu'il faut utiliser le texte brut

        $this->mail->MsgHTML('<div>Mon message en <code>HTML</code></div>');                         //Le contenu au format HTML
        $this->mail->IsHTML(true);

        $list_emails_to = array('jechapartegui@gmail.com', 'usivry.roller@gmail.com');
        foreach ($list_emails_to  as $key => $email) {
            $this->mail->AddAddress($email);
        }
        if (!$this->mail->send()) {
            echo $this->mail->ErrorInfo;
        } else {
            echo 'Message bien envoyé';
        }
    }

    public function SendMailPassword($login, $password)
    {

        $this->mail->Subject    =  'Réinitialisation du mot de passe';                      //Le sujet du mail
        $this->mail->WordWrap   = 200;                     //Préciser qu'il faut utiliser le texte brut

        $this->mail->MsgHTML('<div>Bonjour,<br/>Votre mot de passe a été réinitialisé avec la valeur ' . $password . ' pour le login ' . $login . '<br/>Sportivement,<br/>US Ivry Roller</div>');                         //Le contenu au format HTML
        $this->mail->IsHTML(true);
        $this->mail->AddAddress($login);
        if (!$this->mail->send()) {
            echo $this->mail->ErrorInfo;
        }
    }

    public function NotifierAnnulation($seance, $message, $inscrits)
    {
        foreach ($inscrits as $inscrit) {
            $this->mail->Subject    =  "Annulation de la séance : " . $seance->libelle;                      //Le sujet du mail
            $this->mail->WordWrap   = 200;                     //Préciser qu'il faut utiliser le texte brut
            $login = $inscrit['login'];
            $this->mail->MsgHTML("<div>Bonjour $login,<br/>
        La séance " .$seance->libelle ." ( ". $seance->lieu ." ) - le ". $seance->date_seance->format('l j F Y') . "- à " . $seance->heure_debut ." est annulée pour le motif suivant : <br/>
        $message <br/>Veuillez nous en excuser<br/>Sportivement,<br/>US Ivry Roller</div>");                         //Le contenu au format HTML
            $this->mail->IsHTML(true);
            $this->mail->AddAddress($login);
            if (!$this->mail->send()) {
                echo $this->mail->ErrorInfo;
            }
        }
    }

    public function MailDispo($comptes)
    {
        $retour = "";
        foreach ($comptes as $compte) {
            $this->mail->Subject    =  'Cours de roller disponibles';                      //Le sujet du mail
            $this->mail->WordWrap   = 200;                     //Préciser qu'il faut utiliser le texte brut
            $str = "<div>Bonjour,<br/>
            Vous trouverez ci-dessous les séances disponibles au sein de l'US Ivry Roller pour les adhérents associés au compte " . $compte->login . "<br/>";
            foreach ($compte->riders as $rider) {
                if (count($rider->seances) > 0 || count($rider->inscriptions) > 0) {

                    if (count($rider->seances) > 0) {
                        $str = $str . "Pour " . $rider->prenom . " " . $rider->nom . ", voici les séances disponibles :<br/><ul>";
                        foreach ($rider->seances as $seance) {
                            $newDate = date("d-m-Y", strtotime($seance->date_seance));  
                            $str = $str . "<li>" . $seance->libelle . " (" . $seance->lieu . ")  le  " . $newDate . "  à " . $seance->heure_debut . " - Durée : " . $seance->duree_cours . " minutes</li>";
                        }
                        $str = $str . "</ul><br/>";
                    }
                    if (count($rider->inscriptions) > 0) {
                        $str = $str . "Pour " . $rider->prenom . " " . $rider->nom . ", il existe une inscription / absence prévue sur :<br/><ul>";
                        foreach ($rider->inscriptions as $seance) {
                            $newDate = date("d-m-Y", strtotime($seance->date_seance));  
                            $str = $str . "<li>" . $seance->statut . " : " . $seance->libelle . " (" . $seance->lieu . ")  le  " . $newDate . "  à " . $seance->heure_debut . " - Durée : " . $seance->duree_cours . " minutes</li>";
                        }
                        $str = $str . "</ul><br/>";
                    }
                } else {
                    $str = $str . "Pour " . $rider->prenom . " " . $rider->nom . ", pas de séance disponible ces prochains jours.<br/>";
                }
            }
            $str  = $str . "Pour vous inscrire ou désinscrire à une séance, connectez-vous sur votre espace : <a href='http://www.usivryroller.fr/login'>http://www.usivryroller.fr/login</a>. Pour rappel votre login est cette adresse email.<br/>
            Merci d'avance pour vos retours, cela nous permettra de vous proposer une offre toujours plus adaptée.<br/>
            Sportivement<br/>
            La team USI Roller<br/>";
            $this->mail->MsgHTML($str);                         //Le contenu au format HTML
            $this->mail->IsHTML(true);
            $this->mail->clearAllRecipients();
            $this->mail->AddAddress($compte->login);
            if (!$this->mail->send()) {
               $retour = $retour . "Envoi " . $compte->login . "OK\n";
            } else {                
                $retour = $retour . "Envoi " . $compte->login . "non OK : ". $this->mail->ErrorInfo ."\n";
            }
        }
        return $retour;
    }

    public function EnvoyerAdmin($essai, $listprof){
        $this->mail->Subject    =  "Ajout d'un essai - RollerDay";    
       
        $newDate = date("d-m-Y", strtotime($essai->seance->date_seance));                    //Le sujet du mail
        $this->mail->WordWrap   = 200;                     //Préciser qu'il faut utiliser le texte brut

        $this->mail->MsgHTML('<div>Voici les information pour créer le Roller Day : <br/>
        <ul>
            <li>Nom Prenom : ' . $essai->rider->nom . ' ' . $essai->rider->prenom . '</li>
            <li>Date de naissance : ' . $essai->rider->date_naissance . '</li>
            <li>Mail : ' . $essai->rider->email . '</li>
            <li>Adresse : ' . $essai->rider->adresse . '</li>
            <li>Téléphone : ' . $essai->rider->telephone . '</li>
        </ul> 
        Pour la séance : <br/>
        <ul>
        <li>Libellé : ' . $essai->seance->libelle . '</li>
        <li>Date  : ' . $newDate . '</li>
        <li>Heure : ' . $essai->seance->heure_debut . '</li>
    </ul> 
       <br/>Sportivement,<br/>US Ivry Roller</div>');                         //Le contenu au format HTML
        $this->mail->IsHTML(true);

        $this->mail->AddAddress("usivry.roller@gmail.com");
        foreach ($listprof as $prrrof) {
            $this->mail->AddAddress($prrrof);
        }
        if (!$this->mail->send()) {
            echo $this->mail->ErrorInfo;
        }
    }
    public function ConfirmerEssai($essai){
        $prof = "";
        
        $this->mail->Subject    =  "Confirmation du cours d'essai";                      //Le sujet du mail
        $this->mail->WordWrap   = 200;   
                          //Préciser qu'il faut utiliser le texte brut

        $this->mail->MsgHTML('<div>Bonjour <br/>
        Voici le récapitulatif pour la séance  : <br/>
        <ul>
            <li>Nom Prenom : ' . $essai->rider->nom . ' ' . $essai->rider->prenom . '</li>
            <li>Date de naissance : ' . $essai->rider->date_naissance . '</li>
            <li>Mail : ' . $essai->rider->email . '</li>
            <li>Adresse : ' . $essai->rider->adresse . '</li>
            <li>Téléphone : ' . $essai->rider->telephone . '</li>
        </ul> 
        Pour la séance : <br/>
        <ul>
        <li>Libellé : ' . $essai->seance->libelle . '</li>
        <li>Date  : ' . $essai->seance->date_seance . '</li>
        <li>Heure : ' . $essai->seance->heure_debut . '</li>

    </ul> 
       <br/>Sportivement,<br/>US Ivry Roller</div>');                         //Le contenu au format HTML
        $this->mail->IsHTML(true);
        $this->mail->AddAddress($essai->rider->email);
        if (!$this->mail->send()) {
            echo $this->mail->ErrorInfo;
        }
    }

    public function MailTest($comptes){
        $this->mail->Subject    =  'Cours de roller disponibles';                      //Le sujet du mail
        $this->mail->WordWrap   = 200;    
        $str = "";
        foreach ($comptes as $compte) {
                 //Préciser qu'il faut utiliser le texte brut
            $str = $str. "<div>Bonjour,<br/>
            Vous trouverez ci-dessous les séances disponibles au sein de l'US Ivry Roller pour les adhérents associés au compte " . $compte->login . "<br/>";
            foreach ($compte->riders as $rider) {
                if (count($rider->seances) > 0 || count($rider->inscriptions) > 0) {

                    if (count($rider->seances) > 0) {
                        $str = $str . "Pour " . $rider->prenom . " " . $rider->nom . ", voici les séances disponibles :<br/><ul>";
                        foreach ($rider->seances as $seance) {
                            $newDate = date("d-m-Y", strtotime($seance->date_seance));  
                            $str = $str . "<li>" . $seance->libelle . " (" . $seance->lieu . ") le " . $newDate . " à " . $seance->heure_debut . " - Durée : " . $seance->duree_cours . " minutes</li>";
                        }
                        $str = $str . "</ul><br/>";
                    }
                    if (count($rider->inscriptions) > 0) {
                        $str = $str . "Pour " . $rider->prenom . " " . $rider->nom . ", il existe une inscription / absence prévue sur :<br/><ul>";
                        foreach ($rider->inscriptions as $seance) {
                            $newDate = date("d-m-Y", strtotime($seance->date_seance));  
                            $str = $str . "<li>" . $seance->statut . " : " . $seance->libelle . " (" . $seance->lieu . ") - le " . $newDate . " à " . $seance->heure_debut . " - Durée : " . $seance->duree_cours . " minutes</li>";
                        }
                        $str = $str . "</ul><br/>";
                    }
                } else {
                    $str = $str . "Pour " . $rider->prenom . " " . $rider->nom . ", pas de séance disponible ces prochains jours.<br/>";
                }
            }
            $str  = $str . "Pour vous inscrire ou désinscrire à une séance, connectez-vous sur votre espace : <a href='http://www.usivryroller.fr/login'>http://www.usivryroller.fr/login</a>. Pour rappel votre login est cette adresse email.<br/>
            Merci d'avance pour vos retours, cela nous permettra de vous proposer une offre toujours plus adaptée.<br/>
            Sportivement<br/>
            La team USI Roller<br/>";
          
        }
        $this->mail->MsgHTML($str);                         //Le contenu au format HTML
        $this->mail->IsHTML(true);
        $this->mail->clearAddresses();
        $this->mail->AddAddress('usivry.roller@gmail.com');
        if (!$this->mail->send()) {
            return "Envoi " . $compte->login . "OK\n";
        } else {                
            return "Envoi " . $compte->login . "non OK : ". $this->mail->ErrorInfo ."\n";
        }
    }
    public function MailTestVide(){
        $this->mail->Subject    =  'Cours de roller disponibles';                      //Le sujet du mail
        $this->mail->WordWrap   = 200;    
        $str = "Voici un mail test";
        $this->mail->MsgHTML($str);                         //Le contenu au format HTML
        $this->mail->IsHTML(true);
        $this->mail->AddAddress('usivry.roller@gmail.com');
        if (!$this->mail->send()) {
            return "Envoi  OK\n";
        } else {                
            return "Envoi non OK : ". $this->mail->ErrorInfo ."\n";
        }
    }
}
