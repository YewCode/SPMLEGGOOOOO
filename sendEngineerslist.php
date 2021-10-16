<?php
    // 1. autoload the classes
    spl_autoload_register(
        function($class){
            require_once"db/$class.php";
        }
    );
  
    // 2. Get the list of flower objects from DAO.
    $dao = new EngineerDAO();
    $array = $dao->retrieveAll();

    var_dump( $array);



?>