<?php class CoursService {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function ToCours($data){
        $cours = new Cours();
        foreach ($data as $attribut => $valeur) {           
                $cours->$attribut = $valeur;
        }      
        return $cours;
    }


    public function add($cours, $season_id) {
        if(!isset($cours['saison_id']) || $cours['saison_id']==0){
            $cours['saison_id'] = $season_id;
        }
        $cours = $this->ToCours($cours);       
        $sql = "INSERT INTO cours (nom, jour_semaine, heure, duree, prof_principal_id, lieu_id, age_requis, age_maximum, saison_id, place_maximum, convocation_nominative) 
        VALUES ('$cours->nom', '$cours->jour_semaine', '$cours->heure', $cours->duree, $cours->prof_principal_id, $cours->lieu_id, $cours->age_requis, $cours->age_requis, $cours->age_maximum, $cours->saison_id, $cours->place_maximum, $cours->convocation_nominative)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $cours->id = $this->db->lastInsertId();
        return $cours;

    }

    public function update($cours) {
        $cours = $this->ToCours($cours);       
        $sql = "UPDATE cours SET nom='$cours->nom',jour_semaine='$cours->jour_semaine',heure='$cours->heure',duree='$cours->duree',prof_principal_id=$cours->prof_principal_id,
        lieu_id=$cours->lieu_id,age_requis=$cours->age_requis,age_maximum=$cours->age_maximum,saison_id=$cours->saison_id,place_maximum=$cours->place_maximum,convocation_nominative='$cours->convocation_nominative' WHERE id=$cours->id";
        $stmt = $this->db->prepare($sql);
         $stmt->execute();
         return $cours->id;
    }

    public function delete($id) {
        $sql = "DELETE FROM cours WHERE id=$id";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute();
    }

    public function get($id) {
        $sql = "SELECT c.*, CONCAT(r.prenom, ' ', r.nom) as prof_principal_nom, l.nom as lieu_nom FROM cours c 
        inner join riders r on r.id = c.prof_principal_id
        inner join lieu l on l.id = c.lieu_id WHERE id=?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Cours');
        $res = $stmt->fetch();
        return $res;
    }

    public function get_all($saison_id = 0) {
        $sql = "SELECT c.*, CONCAT(r.prenom, ' ', r.nom) as prof_principal_nom, l.nom as lieu_nom FROM cours c 
        inner join riders r on r.id = c.prof_principal_id
        inner join lieu l on l.id = c.lieu_id";
        if($saison_id > 0){
            $sql = $sql . " WHERE saison_id = $saison_id";
        }
        $sql = $sql . " order by c.heure asc" ;
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Cours');
        $res = $stmt->fetchAll();       
        return $res;
    }
    public function get_all_light($saison_id = 0) {
        $sql = "SELECT id as 'key', nom as 'value' FROM cours";
        if($saison_id > 0){
            $sql = $sql . " WHERE saison_id = $saison_id";
        }
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'KeyValuePair');
        $res = $stmt->fetchAll();       
        return $res;
    }
}