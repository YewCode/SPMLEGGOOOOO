<?php

    //date_default_timezone_set('Asia/Singapore');

    spl_autoload_register(
        function ($class){
            require_once  "db/$class.php";
        }
    );

    require_once 'ConnectionManager.php';

?>
