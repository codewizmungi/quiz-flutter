<?php

    $db_host = 'DB HOST HERE';
    $db_name = 'DB NAME HERE';
    $db_user = 'DB USERNAME HERE';
    $db_user_pass = 'DB USER PASSWORD HERE';

    try {
    	$conn = new PDO("mysql:host=$db_host;dbname=$db_name", $db_user, $db_user_pass);
    	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        echo 'Connection Error: '. $e->getMessage();
    }

?>