<?php
// Destinataire
class MailService{
    public function __construct()
    {
    }
function SendMailPassword($login, $password){
$destinataire = "jechapartegui@gmail.com";

// Sujet de l'e-mail
$sujet = "Réinitialisation du mot de passe";

// Message de l'e-mail
$message = "Votre mot de passe a été réinitialisé avec la valeur ". $password ." pour le login ". $login;

// En-têtes de l'e-mail
$headers = "From: usivry.roller@gmail.com\r\n";
$headers .= "Reply-To: usivry.roller@gmail.com\r\n";
$headers .= "Content-Type: text/plain; charset=UTF-8\r\n";

// Envoi de l'e-mail
if (mail($destinataire, $sujet, $message, $headers)) {
    return true;
} else {
    return false;
}
    
}
}
?>