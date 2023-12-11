<?php class LieuService {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }
    public function ToLieu($data)
    {
        $lieu = new Lieu();
        foreach ($data as $attribut => $valeur) {
            $lieu->$attribut = $valeur;
        }
        return $lieu;
    }

    public function add($lieu) {
        $sql = "INSERT INTO lieu (nom, adresse) VALUES (?, ?)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$lieu->nom, $lieu->adresse]);
        return $this->db->lastInsertId();
    }

    public function update($lieu) {
        $sql = "UPDATE lieu SET nom=?, adresse=? WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$lieu->nom, $lieu->adresse, $lieu->id]);
    }

    public function delete($id) {
        $sql = "DELETE FROM lieu WHERE id=?";
        $stmt = $this->db->prepare($sql);
        return $stmt->execute([$id]);
    }

    public function get($id) {
        $sql = "SELECT * FROM lieu WHERE id=?";
        $stmt = $this->db->prepare($sql);
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    public function getAll() {
        $sql = "SELECT * FROM lieu";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'Lieu');
        $stmt->execute();
        return $stmt->fetchAll();
    }

    
    public function getAllLight() {
        $sql = "SELECT id as 'key', nom as 'value' FROM lieu";
        $stmt = $this->db->prepare($sql);
        $stmt->setFetchMode(PDO::FETCH_CLASS, 'KeyValuePair');
        $stmt->execute();
        return $stmt->fetchAll();
    }
}