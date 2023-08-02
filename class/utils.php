<?php
/**
 * Created by PhpStorm.
 * User: Nicolas
 * Date: 08-06-19
 * Time: 14:18
 */

class utils
{
    function convert_texte($texte){
        //proteger les accents encodé en UTF8
        $texte=str_replace('é', '&#233;',$texte);
        $texte=str_replace('è', '&#232;', $texte);
        $texte=str_replace('ê', '&#234;', $texte);
        $texte=str_replace('ë', '&#235;', $texte);
        $texte=str_replace('ï', '&#239;', $texte);
        $texte=str_replace('í', '&iacute;', $texte);
        $texte=str_replace('î', '&#238;', $texte);
        $texte=str_replace('ü', '&#252;', $texte);
        $texte=str_replace('ü', '&#252;', $texte);
        $texte=str_replace('Ü', '&Uuml;', $texte);
        $texte=str_replace('ö', '&#246;', $texte);
        $texte=str_replace('ô', '&#244;', $texte);
        $texte=str_replace('ř', '&#345;', $texte);
        $texte=str_replace('ä', '&auml;',$texte);
        $texte=str_replace('á', '&aacute;',$texte);
        $texte=str_replace('Á', '&Aacute;',$texte);
        $texte=str_replace('Â', '&Acirc;',$texte);
        $texte=str_replace('Ä', '&Auml;',$texte);
        $texte=str_replace('ç','&ccedil;',$texte);
        $texte=str_replace('Ç','&Ccedil;',$texte);
        //convert texte spéciaux
        $texte=str_replace('Ã–', '&#214;', $texte);
        $texte=str_replace('Åˆ', '&#328;', $texte);
        $texte=str_replace('Ä›', '&#247;', $texte);
        $texte=str_replace('ÄŒ', '&#223;', $texte);
        $texte=str_replace('Å™', '&#345;', $texte);
        $texte=str_replace('É', '&Eacute;',$texte);
        $texte=str_replace('È', '&Egrave;', $texte);
        $texte=str_replace('Ê', '&Ecirc;', $texte);
        $texte=str_replace('Ë', '&Euml;', $texte);
        $texte=str_replace('°', '&deg;', $texte);
        $texte=stripslashes(mb_convert_encoding($texte,'iso-8859-1'));
        $texte=str_replace('&#214;','Ö', $texte);
        $texte=str_replace('&#328;','ň', $texte);
        $texte=str_replace('&#247;','ě', $texte);
        $texte=str_replace('&#223;', 'Č', $texte);
        $texte=str_replace('&#345;', 'ř', $texte);
        $texte=str_replace('&#233;', 'é',$texte);
        $texte=str_replace('&#232;', 'è', $texte);
        $texte=str_replace('&#234;', 'ê', $texte);
        $texte=str_replace('&#235;', 'ë', $texte);
        $texte=str_replace('&#239;', 'ï', $texte);
        $texte=str_replace('&iacute;', 'í', $texte);
        $texte=str_replace('&#238;', 'î', $texte);
        $texte=str_replace('&#252;', 'ü', $texte);
        $texte=str_replace('&Uuml;', 'Ü', $texte);
        $texte=str_replace('&#246;', 'ö', $texte);
        $texte=str_replace('&#244;', 'ô', $texte);
        $texte=str_replace('&auml;', 'ä',$texte);
        $texte=str_replace('&aacute;', 'á',$texte);
        $texte=str_replace('&Aacute;', 'Á',$texte);
        $texte=str_replace('&Acirc;', 'Â',$texte);
        $texte=str_replace('&Auml;', 'Ä',$texte);
        $texte=str_replace('&ccedil;','ç',$texte);
        $texte=str_replace('&Ccedil;','Ç',$texte);
        $texte=str_replace('&Eacute;', 'É',$texte);
        $texte=str_replace('&Egrave;', 'È', $texte);
        $texte=str_replace('&Ecirc;', 'Ê', $texte);
        $texte=str_replace('&Euml;', 'Ë', $texte);
        $texte=str_replace('&deg;', '°', $texte);
        return $texte;
    }
}