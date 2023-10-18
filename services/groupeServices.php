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

    public function add_lien($id,$item,$liste){

    }
    public function update_lien($id,$item,$liste){
        
    }
    public function get_lien($id,$item){
        
    }   
     public function delete_lien($id,$item){
        
    }

}
