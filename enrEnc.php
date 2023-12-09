<?php
  include ('connect.php');

  session_start();
$id_user =  $_SESSION['id'];

  $sel=$bdd->query("SELECT * FROM categorie ");
  $sel->execute();
  $rs = $sel->fetchAll();

  if(isset($_POST['enrEnc']))
  {

  	$nomEnc = htmlspecialchars($_POST['nomEnc']);
  	$prenomEnc = htmlspecialchars($_POST['prenomEnc']);
  	$emailEnc = htmlspecialchars($_POST['emailEnc']);
  	$phoneEnc = htmlspecialchars($_POST['phoneEnc']);
  	$catEnc = htmlspecialchars($_POST['catEnc']);
  	$dateEnt = date("Y-m-d ");
  	//$dateTTT = date()
  	//$dateFabrication = htmlspecialchars($_POST['dateFabrication']);


  	if(!empty($_POST['nomEnc'])AND !empty($_POST['prenomEnc'])AND !empty($_POST['emailEnc'])AND !empty($_POST['catEnc']) )
  	{


  				$insertEnc = $bdd->prepare("INSERT INTO encadreur(nomEnc, prenomEnc, EMailEnc, phoneEnc, idcat, dateEnr) VALUES (?, ?, ?, ?, ?, ?)");
  				$insertEnc->execute(array($nomEnc, $prenomEnc, $emailEnc, $phoneEnc, $catEnc, 	$dateEnt));

  	}
  	else
  	{
  		$error = 'Veillez saisir a tout les champs!!!';
  	}
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
     <body><div class="image" style="background-image:url('img/1.jpg')">



      <div >
        <?php 
       include ('headerges.php');
    ?>
    <br>



      <div class="jumbotron col-sm-4 container" style="background-color:#0ABAB5;">
        <h3 class="text-center"style="color: #117a65 "><b><i>ENREGISREMENT D'UN MEMOIRE</i></b>  </h3>
        <form  action="enrEnc.php" method="post" name="form1" align="center">

          <table class="container-blue;text-center" style="background-color:#0ABAB5;" >
          <th style="color:white">ENCADREUR</th><br>
            <tr>
              <td>
                <div class="form-group">
                  <label for="nomEnc">nom</label>
                  <input type="text" name="nomEnc" value="" class="form-control">
                </div>
              </td>
            </tr>

            <tr>
              <td>
                <div class="form-group">
                <label for="prenomEnc">prenom</label>
                <input type="text" name="prenomEnc" value="" class="form-control">
              </div>
              </td>

            </tr>

            <tr>
              <td>
                <div class="form-group">
                  <label for="emailEnc">E-mail</label>
                  <input type="text" name="emailEnc" value="" class="form-control">
                </div>
              </td>

            </tr>
            <tr>
              <td>
                <div class="form-group">
                  <label for="phoneEnc">Telephone</label>
                  <input type="text" name="phoneEnc" value="" class="form-control">
                </div>
              </td>
            </tr>
                <td>
                  <div class="form-group">
                    <label for="matEtu">Categorie</label>
                    <select class="form-control" name="catEnc">
                      <?php
                      if ($rs != NULL) {
                        foreach ($rs as $r): ?>
                          <option value="<?= $r['idcat']; ?>">
                            <?php echo $r['nomcat'];?>
                          </option>
                        <?php
                          endforeach;
                          }
                          ?>

                    </select>

                  </div>
                </td>
            </tr>
          </table>

          <div class="form-group">

           <input type="submit"  value="Envoyer" name="enrEnc" class="btn btn-warning"></input>
          </div>

        </form>
      </div>
    </div>
      </div>

    </body>
  </html>

  </body>
</html>
