<?php

class ConnectionManager {

  public function getConnection() {
    $servername = 'localhost';
    $dbname = 'spmproject';
    $username = 'root';
    $password = '' ;
    $url  = "mysql:host=$servername;dbname=$dbname";
    $port = 3306;
        
        // Create connection
        $conn = new PDO("mysql:host=$servername;dbname=$dbname; port={$port}", $username, $password);     
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // if fail, exception will be thrown

        // Return connection object
        return $conn;


    // return new PDO($url, $username, $password);
  }

}

?>