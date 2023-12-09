<?php
include ('connect.php');

if(!empty($_POST['recherche']))
{
    $sarch = htmlspecialchars($_POST['recherche']);

  $req=$bdd->query("SELECT * FROM document WHERE motClesDoc LIKE '%$sarch%' || themeDoc LIKE '%$sarch%'   ORDER BY idDoc DESC");
  $req->execute();
  $res = $req->fetchAll();

  $ment=$bdd->query("SELECT idEtu, nomEtu FROM document, etudiant WHERE etudiant.idEtu = document.idEtudiant");
  $ment->execute();
  $cycl = $ment->fetchAll();



  }

?>
<DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-wit, initial-scale=1">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript">
          <link rel="stylesheet" href="js/bootstrap.min.js">
    </script>
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
    <div class="image" style="background-image:url('img/1.jpg')">

    <?php
        include ('header.php');
?>
    <div class="row ">

    <div class="container col-md-8" ><br><br>

      <?php
      if (isset($res)) {
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
    </div>
     </div>
  </body>
</html>
