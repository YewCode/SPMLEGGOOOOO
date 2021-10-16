<?php

class EngineerDAO {
    // Constructor is removed.
    // Remove all hardcoding.
    // Retrieve data from the database instead.


    // Return : an indexed array of NationalFlower objects
    public  function retrieveAll() {
        // step 1
        $connMgr = new ConnectionManager();
        $pdo = $connMgr->getConnection();

        // step 2
        $sql = "select * from Engineer";
        $stmt = $pdo->prepare($sql);

        $stmt->setFetchMode(PDO::FETCH_ASSOC);

        $stmt->execute();

        $result = [];

        while ($row = $stmt->fetch()) {
            $result[] = new Engineer ($row["EngineerID"],$row["Name"], $row["Role"]);
        }

        $stmt->closeCursor();
        $pdo = null;

        return $result;
    }

    // To get a list of countries from the database
    // Return : an indexed array of string (country name) 
    
}

?>

