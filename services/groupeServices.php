<?php class GroupeService {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function ToGroupe($data){
        $groupe = new Groupe();
        foreach ($data as $attribut => $valeur) {           
                $groupe->$attribut = $valeur;
        }      
        return $groupe;
    }
    public function ToLien_Groupe($data){
        $groupe = new Lien_Groupe();
        foreach ($data as $attribut => $valeur) {           
                $groupe->$attribut = $valeur;
        }      
        return $groupe;
    }

    public function add_lien($id,$objet_type,$liste_ids){
        foreach ($liste_ids as $objet_id) {
            $sql = "INSERT INTO lien_groupe(groupe_id, objet_id, objet_type) VALUES ($id,$objet_id,'$objet_type')";
            $stmt = $this->db->prepare($sql);
            $stmt->execute();
        }
        return true;    
    }
    public function add_1lien($lien_groupe){
            $sql = "INSERT INTO lien_groupe(groupe_id, objet_id, objet_type) VALUES ($lien_groupe->groupe_id,$lien_groupe->objet_id,'$lien_groupe->objet_type')";
            $stmt = $this->db->prepare($sql);
            $stmt->execute();  
            return true;    
        }

    public function update_lien($groupe_id, $objet_type,$new_lien){    
       $current_lien = $this->get_lien_objet_type($groupe_id,$objet_type);
       foreach ($new_lien as $new_lien_groupe) {
        $new_lien_groupe = $this->ToLien_Groupe($new_lien_groupe);
        $exist = false;
        foreach ($current_lien as $old_lien_groupe) {
            if(($old_lien_groupe->groupe_id == $new_lien_groupe->groupe_id) &&  ($old_lien_groupe->objet_id == $new_lien_groupe->objet_id) && ($old_lien_groupe->objet_type == $new_lien_groupe->objet_type)){
                $exist = true;
            }
        }
        if($exist == false){
            $this->add_1lien($new_lien_groupe);
        }
       }
       foreach ($current_lien as $old_lien_groupe) {
            $exist = false;
            foreach ($new_lien as $new_lien_groupe) {
                $new_lien_groupe = $this->ToLien_Groupe($new_lien_groupe);
                if(($old_lien_groupe->groupe_id == $new_lien_groupe->groupe_id) &&  ($old_lien_groupe->objet_id == $new_lien_groupe->objet_id) && ($old_lien_groupe->objet_type == $new_lien_groupe->objet_type)){
                    $exist = true;
                }
            }
            if($exist == false){
                $this->delete_1lien($old_lien_groupe);
            }
       }
       return true;    
    }
    public function get_lien_objet_type($groupe_id,$objet_type){
        $sql = "SELECT * FROM lien_groupe WHERE groupe_id = $groupe_id and objet_type = $objet_type";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();     
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Lien_Groupe');    
        $liens_groupe = $stmt->fetchAll();     
        return $liens_groupe;      
    }  
    public function get_lien_groupe($groupe_id){
        $sql = "SELECT * FROM lien_groupe WHERE groupe_id = $groupe_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();     
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Lien_Groupe');    
        $liens_groupe = $stmt->fetchAll();     
        return $liens_groupe;      
    }   
     public function delete_lien_groupe($groupe_id){
        $sql = "DELETE FROM lien_groupe WWHERE groupe_id = $groupe_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(); 
        return true;    
    }
    public function delete_lien_objet_type($groupe_id, $objet_type){
       $sql = "DELETE FROM lien_groupe WHERE groupe_id = $groupe_id and objet_type = $objet_type";
       $stmt = $this->db->prepare($sql);
       $stmt->execute(); 
       return true;    
   }
    public function delete_1lien($lien_groupe){
        $sql = "DELETE FROM lien_groupe WHERE WHERE groupe_id = $lien_groupe->groupe_id and objet_type = $lien_groupe->objet_type and objet_id = $lien_groupe->objet_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(); 
        return true;    
    }

    public function add($groupe){
        $groupe = $this->ToGroupe($groupe);
        $sql = "INSERT INTO groupes(nom, saison_id) VALUES ('$groupe->nom',$groupe->saison_id)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();  
        return $stmt->lastInsertId();    
    }
    public function update($groupe){
        $groupe = $this->ToGroupe($groupe);
        $sql = "UPDATE groupes SET nom='$groupe->nom',saison_id=$groupe->saison_id WHERE id=$groupe->id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();  
        return true;    
    }
    public function delete($groupe){
        $groupe = $this->ToGroupe($groupe);
        $sql = "DELETE FROM groupes WHERE id = $groupe->id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();  
        return true;    
    }
    public function get($id){
        $sql = "SELECT * FROM groupes WHERE id = $id";            
        $stmt = $this->db->prepare($sql);
        $stmt->execute();  
        $groupes = $stmt->setFetchMode(PDO::FETCH_CLASS, 'Groupe');    
        return $groupes;    
    }
    public function get_all($saison_id = 0){
        if($saison_id >0){
            $sql = "SELECT * FROM groupes WHERE saison_id = $saison_id";
        } else {
            $sql = "SELECT * FROM groupes";
        }
        $stmt = $this->db->prepare($sql);
        $stmt->execute();  
        $groupes = $stmt->setFetchMode(PDO::FETCH_CLASS, 'Groupe');    
        return $groupes;  

    }

}
