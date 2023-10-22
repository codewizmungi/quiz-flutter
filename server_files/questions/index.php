<?php 

    //GET All Questions by Category
    include '../database.php';
    
    $json = array();
    $sql = '';
    
    if(isset($_POST['category']) && isset($_POST['no_of_questions'])){
        
        $category = $_POST['category'];
        $no_of_questions = $_POST['no_of_questions'];
 
        if($no_of_questions === "5" || $no_of_questions === "10"){
            
            $sql = "SELECT * FROM questions WHERE category = '$category' ORDER BY RAND() LIMIT $no_of_questions";
        }else{
            $sql = "SELECT * FROM questions WHERE category = '$category' ORDER BY RAND() LIMIT 10";
        }
        
        $statement = $conn->prepare($sql);
        $statement->execute();
            
        if($statement->rowCount()) {
            while($row = $statement->fetch(PDO::FETCH_ASSOC)){
                $json[] = $row;
            }
        } elseif(!$statement->rowCount()) {
            $json['status'] = 0;
            $json['message'] = "No Data Found";
        }  
        
    }else{
        $json['status'] = 0;
        $json['message'] = "Some fields are missing";
    }
    
    header('Content-Type:Application/json');
    echo json_encode($json); 
    
?>