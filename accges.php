<?php

include ('connect.php');

if(!empty($_POST['rech']) && isset($_POST['recherche']))
{
    $sarch = htmlspecialchars($_POST['rech']);

  $req=$bdd->query("SELECT * FROM document WHERE motClesDoc LIKE '%$sarch%' || themeDoc LIKE '%$sarch%'  ORDER BY idDoc DESC");
  $req->execute();
  $res = $req->fetchAll();




  }

?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="wnameth=device-wit=wnameth, initial scale=1">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <title></title>
  </head>
  <body>
    <body>  <div class="image" style="background-image:url('img/1.jpg')">
      
      
   <div class="">

     <?php 
       include ('headerges.php');
    ?>
     <table>
       <tr>
         <td>
            <div class="row jumbotron col-sm-5" style="background-color:  #ffc107 ;">
        
            <table class="container-blue;text-center"  >
            <tr>
              <td>
                <div class="form-group">
                    <a href="enrEtu.php"> <img src="img/images.jpeg" class="form-control col-sm-7"type="submit" height="60" width="60"><a href="enrEtu.php">Ajouter Mémoire</a></a>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                <div class="form-group">
                    <a href="enrEnc.php"> <img src="img/enc.jpg" class="form-control col-sm-7"type="submit" height="60" width="60"><a href="enrEnc.php">Ajouter Encadreur</a></a>
                </div>
              </td>
            </tr>
            <tr>
              <td>
                <div class="form-group">
                    <a href=""> <img src="img/edit.jpeg" class="form-control col-sm-7"type="submit" height="60" width="60"><a href="listemem.php">Liste Memo</a></a>
                </div>
              </td>
            </tr>
           
                    </table>
        </form>
      </div>
         </td>
         <td>
           <div class="container col-md-9" ><br><br>
             <?php
      if (isset($res)) {?>
      
       <?php
        foreach ($res as $r):?>
        <a href="details.php?id=<?= $r['idDoc']?>"><b> <?php echo '<sup>['. $r['extention'].']</sup>'. $r['themeDoc']. " - Mentions : ".$r['mentionsObtenue'];?> </a></b>
          <p>
            <?php echo substr($r['resume'], 0, 300) . '...<br>';?>
          </p>
            <?php
          endforeach;
          }
          ?>
      <br>

    </div>

      
            <br>
          </table>
         </td>
       </tr>
     </table>
        </div>
   </div>
    </body>
  </html>

  </body>
</html>
