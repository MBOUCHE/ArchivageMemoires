<?php
include ('connect.php');
  
  $id = $_GET['id'];

  $ment = $bdd->query("SELECT * FROM document WHERE idDoc = $id ");
  $ment->execute();
  $cycl = $ment->fetch();
  $url = $cycl['urlFich'];
   
   ?>


<!DOCTYPE html>
<html>
<head>
</head>
<body class="login"style="background-color:">

  <div>

     <?php 
       include ('header.php');
    ?>


        <div class="col-md-6" align="center">
            <div class="panel panel-default">

                <div class="panel-body" >
                    
                        <div class="container"align="center">
                          <p>
                           <?php echo $cycl['resume']; ?>
                          </p>
                          <a href="<?= $url ?>"><button class="btn btn-dark" > Consulter ...</button></a>
                        </div>
                  
                    </div>
                </div>
            </div>
        </div><br><br><br><br><br><br><br>

</body>
</html>

