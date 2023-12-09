<?php

session_start();

include ('connect.php');

if(isset($_POST['connect']))
{
  $nom = htmlspecialchars($_POST['nomU']);
  $pwd = $_POST['pwd'];

  if (!empty($nom) AND !empty($pwd))
   {
    $requser = $bdd->prepare('SELECT * FROM gestionnaire WHERE nomUser = ? AND passGes = ?');
    $requser->execute(array($nom, $pwd));
    $userexist = $requser->rowCount();

    if($userexist==1)
    {
      $userinfo = $requser->fetch();
      $_SESSION['id']= $userinfo['id'];
      $_SESSION['nom']= $userinfo['nom'];
      header("Location: accges.php?id=".$_SESSION['id']);

    }
    else
    {
      $error = 'Mauvaise Donnees';
    }
  }
  else
  {
    $error = 'Veillez saisir tout les champs!';
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
    </script>
      <link href="css/signin.css" rel="stylesheet">
  </head>
  <body  background-color="lightblue">
    <div class="col-sm-4">

    </div>
    <div class="col-sm-3">
     

      <div class=""><br><br>

  <div class="container jumbotron" style="background-color:   #45b39d  ;height:450px;width:350px;">

     <div class="text-center">
        <img src="img\connect.jpg" class="img-circle" style="height:91px; width:111px;" ><br>
      </div><br>

        <form class="" method="POST" >
          <label for="inputEmail">Nom d'Utilisateur</label>
          <input type="text" id="Email" class="form-control" name="nomU" required autofocus><br>
          <label for="inputPassword">Mot De Passe</label>
          <input type="password" id="Password" class="form-control" name="pwd"  required><br>
          <div class="text-center">
              <button class="btn btn-lg btn-primary btn-warning" type="submit" name="connect">Connexion</button>
          </div>

          </div class="mb-3">
          <div class="">


          </div>

        </form>
    </div>
  </div>

  </body>
</html>
