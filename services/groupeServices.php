<?php class GroupeService
{
    private $db;

    public function __construct($db)
    {
        $this->db = $db;
    }

    public function ToGroupe($data)
    {
        $groupe = new Groupe();
        foreach ($data as $attribut => $valeur) {
            $groupe->$attribut = $valeur;
        }
        return $groupe;
    }
    public function ToLien_Groupe($data)
    {
        $groupe = new Lien_Groupe();
        foreach ($data as $attribut => $valeur) {
            $groupe->$attribut = $valeur;
        }
        return $groupe;
    }

    public function add_lien($objet_id, $objet_type, $groupes)
    {
        foreach ($groupes as $groupe) {
            $sql = "INSERT INTO lien_groupe(groupe_id, objet_id, objet_type) VALUES (" . $groupe['id'] . ", $objet_id,'$objet_type')";
            $stmt = $this->db->prepare($sql);
            $stmt->execute();
        }
        return true;
    }

    public function add_1lien($objet_id, $objet_type, $groupe_id)
    {
        $sql = "INSERT INTO lien_groupe(groupe_id, objet_id, objet_type) VALUES ($groupe_id,$objet_id,'$objet_type')";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return true;
    }

    //vision centrée sur l'objet
    public function update_lien($lien_groupe)
    {
        //ajouter ce qui n'y sont pas
        $nouveau_lien_groupe = $this->ToLien_Groupe($lien_groupe);
        $ancien_lien = $this->get_lien_groupe_objet_id($lien_groupe->objet_id, $lien_groupe->objet_type);
        if (isset($nouveau_lien_groupe->groupes)) {
            foreach ($nouveau_lien_groupe->groupes as $nouveau_groupe_id) {
                $exist = false;
                if (isset($ancien_lien->groupes)) {
                    foreach ($ancien_lien->groupes as $ancien_groupe_id) {
                        if ($nouveau_groupe_id == $ancien_groupe_id) {
                            $exist = true;
                        }
                    }
                }
                if ($exist == false) {
                    $this->add_1lien($nouveau_lien_groupe->objet_id, $nouveau_lien_groupe->objet_type, $nouveau_groupe_id);
                }
            }
        }
        //Retirer ceux qui manquent
        if (isset($ancien_lien->groupes)) {
            foreach ($ancien_lien->groupes as $ancien_groupe_id) {
                $exist = false;
                if (isset($nouveau_lien_groupe->groupes)) {
                    foreach ($nouveau_lien_groupe->groupes as $nouveau_groupe_id) {
                        if ($nouveau_groupe_id == $ancien_groupe_id) {
                            $exist = true;
                        }
                    }
                }
                if ($exist == false) {
                    $this->delete_1lien($ancien_lien->objet_id, $ancien_lien->objet_type, $ancien_groupe_id);
                }
            }
        }
        return true;
    }

    public function get_lien_objet_type($objet_type)
    {
        $sql = "SELECT * FROM lien_groupe WHERE objet_type = '$objet_type'";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Lien_Groupe');
        $liens_groupe = $stmt->fetchAll();
        return $liens_groupe;
    }
    public function get_lien_objet_id($objet_id, $objet_type)
    {
        $sql = "SELECT g.* FROM groupes g inner join lien_groupe lg on g.id = lg.groupe_id WHERE lg.objet_id = $objet_id and lg.objet_type = '$objet_type'";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Groupe');
        $liens_groupe = $stmt->fetchAll();
        return $liens_groupe;
    }
    public function get_lien_groupe_objet_id($objet_id, $objet_type)
    {
        $sql = "SELECT groupe_id FROM lien_groupe WHERE objet_type = '$objet_type' and  objet_id = $objet_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $liens_groupe = $stmt->fetchAll();
        $LG = new Lien_Groupe();
        $LG->objet_id = $objet_id;
        $LG->objet_type = $objet_type;
        $LG->groupes = array();
        foreach ($liens_groupe as $lien) {
            array_push($LG->groupes, $lien['groupe_id']);
        }
        return $LG;
    }
    public function get_lien_groupe($groupe_id)
    {
        $sql = "SELECT * FROM lien_groupe WHERE groupe_id = $groupe_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Lien_Groupe');
        $liens_groupe = $stmt->fetchAll();
        return $liens_groupe;
    }
    public function delete_lien_groupe($groupe_id)
    {
        $sql = "DELETE FROM lien_groupe WHERE groupe_id = $groupe_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return true;
    }
    public function delete_lien_objet_type($groupe_id, $objet_type)
    {
        $sql = "DELETE FROM lien_groupe WHERE groupe_id = $groupe_id and objet_type = $objet_type";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return true;
    }
    public function delete_lien_objet($objet_id, $objet_type)
    {
        $sql = "DELETE FROM lien_groupe WHERE objet_id = $objet_id and objet_type = '$objet_type'";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return true;
    }
    public function delete_1lien($objet_id, $objet_type, $groupe_id)
    {
        $sql = "DELETE FROM lien_groupe WHERE  groupe_id = $groupe_id and objet_type = '$objet_type' and objet_id = $objet_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return true;
    }

    public function add($groupe)
    {
        $groupe = $this->ToGroupe($groupe);
        $sql = "INSERT INTO groupes(nom, saison_id) VALUES ('$groupe->nom',$groupe->saison_id)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $this->db->lastInsertId();
    }
    public function update($groupe)
    {
        $groupe = $this->ToGroupe($groupe);
        $sql = "UPDATE groupes SET nom='$groupe->nom',saison_id=$groupe->saison_id WHERE id=$groupe->id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return true;
    }
    public function delete($id)
    {
        $sql = "DELETE FROM groupes WHERE id = $id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return true;
    }
    public function get($id)
    {
        $sql = "SELECT * FROM groupes WHERE id = $id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $groupes = $stmt->setFetchMode(PDO::FETCH_CLASS, 'Groupe');
        return $groupes;
    }
    public function get_all($saison_id = 0)
    {
        if ($saison_id > 0) {
            $sql = "SELECT * FROM groupes WHERE saison_id = $saison_id";
        } else {
            $sql = "SELECT * FROM groupes";
        }
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Groupe');
        $groupes = $stmt->fetchAll();
        return $groupes;
    }
}
