<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'phpmailer/src/Exception.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';
// Destinataire
class MailService{
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
        
        if($this->mail->SMTPAuth){
            $this->mail->SMTPSecure = 'ssl';               //Protocole de sécurisation des échanges avec le SMTP
            $this->mail->Username   =  'contact@usivryroller.fr';   //Adresse email à utiliser
            $this->mail->Password   =  'Roller94200';         //Mot de passe de l'adresse email à utiliser
        }
        $this->to = "jechapartegui@gmail.com";
        $this->mail->CharSet = 'UTF-8'; //Format d'encodage à utiliser pour les caractères
        $this->mail->From       =  'contact@usivryroller.fr';                //L'email à afficher pour l'envoi
        $this->mail->FromName   = 'Contact USI Roller';             //L'alias à afficher pour l'envoi

    }
    public function SendMail(){
// Créez une nouvelle instance de PHPMailer
$this->mail->Subject    =  'Mon sujet';                      //Le sujet du mail
$this->mail->WordWrap   = 50; 			                   //Nombre de caracteres pour le retour a la ligne automatique
$this->mail->AltBody = 'Mon message en texte brut'; 	       //Texte brut
$this->mail->IsHTML(false);                                  //Préciser qu'il faut utiliser le texte brut

$this->mail->MsgHTML('<div>Mon message en <code>HTML</code></div>'); 		                //Le contenu au format HTML
$this->mail->IsHTML(true);

$list_emails_to = array('jechapartegui@gmail.com','usivry.roller@gmail.com');
foreach ($list_emails_to  as $key => $email) {
    $this->mail->AddAddress($email);
}
if (!$this->mail->send()) {
    echo $this->mail->ErrorInfo;
} else{
    echo 'Message bien envoyé';
}
}

public function SendMailPassword($login, $password){
    $this->mail->Subject    =  'Réinitialisation du mot de passe';                      //Le sujet du mail
$this->mail->WordWrap   = 200;                     //Préciser qu'il faut utiliser le texte brut

$this->mail->MsgHTML('<div>Bonjour,<br/>Votre mot de passe a été réinitialisé avec la valeur '. $password .' pour le login '. $login .'<br/>Sportivement,<br/>US Ivry Roller</div>'); 		                //Le contenu au format HTML
$this->mail->IsHTML(true);
$this->mail->AddAddress($login);
if (!$this->mail->send()) {
    echo $this->mail->ErrorInfo;
}
    
}

public function MailDispo($riders){
    $this->mail->Subject    =  'Cours de roller disponibles';                      //Le sujet du mail
$this->mail->WordWrap   = 200;                     //Préciser qu'il faut utiliser le texte brut
$str = "<div>Bonjour,<br/>
Voici les différents cours disponibles sur les 10 prochains jours <br/>";

$this->mail->MsgHTML($str); 		                //Le contenu au format HTML
$this->mail->IsHTML(true);
$this->mail->AddAddress("jechapartegui@gmail.com");
if (!$this->mail->send()) {
    echo $this->mail->ErrorInfo;
}
    
}
}
?>