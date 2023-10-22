<?php 

    //GET All Categories
    include '../database.php';
    
    $sql = '';
    $json = array();
        
    $sql = "SELECT questions.category, COUNT(*) AS category_total_questions FROM questions GROUP BY questions.category ORDER BY RAND()";
            
    $statement = $conn->prepare($sql);
    $statement->execute();
        
    if($statement->rowCount()) {
        while($row = $statement->fetch(PDO::FETCH_ASSOC)){
            $json[] = $row;
        }
    } else if(!$statement->rowCount()) {
        $json['status'] = 0;
        $json['message'] = "No Data Found";
    }  
        
    header('Content-Type:Application/json');
    echo json_encode($json); 
    
?>