<?php
  include ('connect.php');

  $req=$bdd->query("SELECT COUNT(idEtu) as nbUser FROM etudiant");
  $req->execute();
  $res = $req->fetch();
  $nbUser = $res['nbUser'];

  if (!empty($_FILES) AND $_FILES['docpdf']['error']==0) {
    $nomFich = $_FILES['docpdf']['name'];
    $extention = strrchr($nomFich, '.');


    $cheminFich = $_FILES['docpdf']['tmp_name'];
    $destFich = 'Memoires/'.$nomFich;

    $extAuto = array('.pdf', '.PDF' );

    if (in_array($extention, $extAuto)) {
        if (move_uploaded_file($cheminFich, $destFich)) {
        echo "";
        }
    }

    if(isset($_POST['enrDoc']))
    {

      $theme = htmlspecialchars($_POST['theme']);
      $motcle = htmlspecialchars($_POST['motcle']);
      $type = htmlspecialchars($_POST['type']);
      $mentObt = htmlspecialchars($_POST['mentObt']);
       $resume = htmlspecialchars($_POST['resume']);

      $dateEnr = date("Y-m-d ");

            $insertDOC = $bdd->prepare("INSERT INTO document(themeDoc, motClesDoc, resume, idEtudiant, typeDoc,  mentionsObtenue, docPDF, urlFich, extention, dateEnr) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $insertDOC->execute(array($theme, $motcle, $resume, $nbUser, $type, $mentObt, $nomFich, $destFich, $extention, $dateEnr));

            header('Location: accges.php');


    }
  }



?>

<!DOCTYPE html>
<html lang="en" dir="ltr">

  <head>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-wit=width, initial scale=1">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <script type="text/javascript">
          <link rel="stylesheet" href="js/bootstrap.min.js">
          <link rel="stylesheet" href="js/ermem1.js">
    </script>

    <link rel="stylesheet" href="css/style.css">

  </head>
   <body><div class="image" style="background-image:url('img/1.jpg')">


   <div>
      <?php 
       include ('headerges.php');
    ?>

     <div class="container jumbotron " style="background-color:inherit">
        <div class=" text-center"style="color:#0ABAB5">

              <br>
        </div>


      <div class=" jumbotron col-sm-4 container" style="background-color:#ffc107;">
        <h3  class=" text-center"style="color: #e67e22 "><b> ENREGISTRER UN DOCUMENT </b></h3>
        <form class="container col-sm-15 demoForm"  method="post"  id="demoForm" style="color:#343a40" enctype="multipart/form-data">
          <div class="form-group">
            <label for="Theme">Theme</label>
            <input type="text" name="theme" value="" id="Theme" class="form-control" required>
          </div>

        <div class="form-group">
          <label for="motcle">mots cle</label>
          <input type="text" name="motcle" value="" id="motcle" class="form-control" required>
        </div>

        <div class="form-group">
          <label for="motcle">Resume</label>
          <input type="textarea" name="resume" value="" id="resume" class="form-control" required>
        </div>

          <div class="form-group">
            <label for="type">Type</label>
            <select class="form-control" value = "" name="type" id="type" required>
              <option value="Publique">Memoire</option>
              <option value="Privee">Projet</option>

            </select>

          <div class="form-group">
            <label for="mentObt">Mentions Obtenue</label>
            <select class="form-control" name="mentObt" value="Tres-bien" id="mentObt" required>
              <option value="Excellent">Excellent</option>
              <option value="Tres-bien">Tres-bien</option>
              <option value="Bien">Bien</option>
              <option value="Assez-bien">Assez-bien</option>
              <option value="Passable">Passable</option>
            </select>
          </div>
          <div class="form-group">
            <label for="doc"> Le document en PDF</label>
            <input type="file" name="docpdf"  id="docpdf" class="form-control" required>
          </div>
          <input type="submit" name="enrDoc" value="Envoyer" class="btn btn-dark" ></input>
        
        </form>
      </div>
    </div>

    <?php 
       include ('footer.php');
    ?>
   </div>

  </body>
</html>
