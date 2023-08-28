<?php 
class Database
{

    // Define new db connections here per federation. The key is the shortName as defined in the frontend settings.
    // The default DB name will be used when there is no matching key.
  
    private $host = "xnydyfvjecha.mysql.db";
    private $user = "xnydyfvjecha";
    private $pass = "Gulfed2606";
    private $dbname = "xnydyfvjecha";

    private $dbh;
    private $error;

    public function __construct()
    {
       

        $dsn = "mysql:host=" . $this->host . ";dbname=" . $this->dbname;
        // Set options
        $options = array(
            PDO::ATTR_PERSISTENT => true,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        );
        // Create a new PDO instanace
        try {
            $this->dbh = new PDO($dsn, $this->user, $this->pass, $options);
            $this->dbh->exec('SET CHARACTER SET utf8');
        }
        // Catch any errors
        catch (PDOException $e) {
            $this->error = $e->getMessage();
        }
    }

    public function getConnection()
    {
        return $this->dbh;
    }




    
}
