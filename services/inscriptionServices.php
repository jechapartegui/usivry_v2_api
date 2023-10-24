<?php

class InscriptionService
{
    private $db;

    public function __construct($db)
    {
        $this->db = $db;
    }
    public function ToInscription($data)
    {
        $inscription = new Inscription();
        foreach ($data as $attribut => $valeur) {
            $inscription->$attribut = $valeur;
        }


        return $inscription;
    }

    public function add($inscription)
    {
        $inscription = $this->ToInscription($inscription);
        $sql = "INSERT INTO inscription (rider_id, seance_id, date_inscription, statut, statut_seance) VALUES (?, ?, NOW(), ?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$inscription->rider_id, $inscription->seance_id, $inscription->statut, $inscription->statut_seance]);
        return $this->db->lastInsertId();
    }
    public function update($inscription)
    {
        $inscription = $this->ToInscription($inscription);
        $sql = "UPDATE inscription SET statut = ?, statut_seance = ? WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$inscription->statut, $inscription->statut_seance, $inscription->id]);
        return true;
    }

    public function get($id)
    {
        $sql = "SELECT s.seance_id as seance_id, c.id as cours, s.date_seance as date_seance, s.heure_debut as heure_debut, s.duree_cours as duree_cours, l.id as lieu_id, l.nom as lieu, i.statut as statut, i.statut_seance as statut_seance, s.age_requis as age_requis, s.niveau_requis as niveau_requis
        FROM inscription i inner join seance s on i.seance_id = s.seance_id inner join cours c on s.cours = c.id inner join lieu l on s.lieu_id = l.id WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Inscription');
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public function getAll_BySeance($id_seance)
    {
        $sql = "SELECT id,rider_id, statut,statut_seance FROM inscription where seance_id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id_seance]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Inscription');
        return $stmt->fetchAll();
    }

    public function getAll_ByCours($id_cours)
    {
        $sql = "SELECT distinct(rider_id) FROM inscription i inner join seance s on s.seance_id = i.seance_id WHERE s.cours_id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Inscription');
        $stmt->execute([$id_cours]);
        return $stmt->fetchAll();
    }

    public function getAll_ByRider($rider_id, $saison_id)
    {
        $sql = "SELECT distinct(rider_id) FROM inscription i inner join seance s on s.seance_id = i.seance_id 
        inner join cours c on c.id = s.cours_id
        WHERE i.rider_id = ? and c.saison_id";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Inscription');
        $stmt->execute([$rider_id, $saison_id]);
        return $stmt->fetchAll();
    }


    public function delete($id)
    {
        $sql = "DELETE FROM inscription WHERE id = ?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$id]);
    }

    public function load_seance($id, $this_season)
    {
        $sql = "SELECT age_requis, age_maximum FROM seance WHERE seance_id = ?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        $res =  $stmt->fetch();        
        $age_min = $res['age_requis'] * 365 -10;
        $age_max = $res['age_maximum'] * 365 +10;
        $sql = "SELECT groupe_id FROM lien_groupe WHERE objet_id = $id and objet_type = 'séance'";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        $groupes =  $stmt->fetchAll();  
        $elements = explode(",", $groupes); // Divise la chaîne en un tableau en utilisant la virgule comme séparateur
        $quotedElements = array_map(function($element) {
            return "'" . $element . "'";
        }, $elements); // Ajoute des guillemets simples autour de chaque élément
        
        $groupe = "(" . implode(",", $quotedElements) . ")";              
        $sql = "SELECT DISTINCT
        r.id as rider_id,
        CONCAT(r.prenom, ' ', r.nom) as rider_libelle,
        CONCAT(r.personne_prevenir, ' ', r.telephone_personne_prevenir) as contact_urgence
    FROM
        riders r
    INNER JOIN
        inscription_saison i1 ON i1.rider_id = r.id AND i1.saison_id = " . $this_season . " 
    LEFT JOIN
        lien_groupe lg on lg.objet_type = 'rider' and lg.objet_id = r.id
    WHERE
        DATEDIFF(CURDATE(), r.date_naissance) < " . $age_max . " AND DATEDIFF(CURDATE(), r.date_naissance) > " . $age_min . " AND lg.groupe_id IN "  . $groupe . "
    ORDER BY
        r.prenom ASC;";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Inscription');
        $stmt->execute();
        $list_rider= $stmt->fetchAll();
        $inscrits = $this->getAll_BySeance($id);
        foreach ($inscrits as $inscrit) {
            $rider_id = $inscrit->rider_id;
            $est_list = false;
            foreach($list_rider as $rr){
                if ($rr->rider_id == $rider_id) {
                    $rr->statut = $inscrit->statut;
                    $rr->hors_liste = false;
                    $rr->id = $inscrit->id;
                    $est_list = true;
                    $rr->statut_seance = $inscrit->statut_seance;
                }
            }
            if(!$est_list){
                 $sql = "SELECT
                r.id as rider_id,
                CONCAT(r.prenom, ' ', r.nom) as rider_libelle,
                CONCAT(r.personne_prevenir, ' ', r.telephone_personne_prevenir) as contact_urgence
            FROM
                riders r
                WHERE r.id = ? ";
                $stmt = $this->db->prepare($sql);
                $stmt->execute([$rider_id]);
                $stmt->setFetchMode(PDO::FETCH_CLASS, 'Inscription');
                $rider = $stmt->fetch();
                $rider->statut = $inscrit->statut;
                $rider->hors_liste = true;
                $rider->id = $inscrit->id;
                $rider->statut_seance = $inscrit->statut_seance;
                array_push($list_rider, $rider);
            }
           
        }
        return $list_rider;
        
    }

    public function update_inscription_seance($inscription){
        $inscription = $this->ToInscription($inscription);
        if($inscription->id == 0){
            $inscription->id = $this->add($inscription);
        } else {
            $this->update($inscription);
        }
        return $inscription;
    }
}
