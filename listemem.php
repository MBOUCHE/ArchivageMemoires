<!DOCTYPE html>
<html>
    <head>
        <!-- En-tête de la page -->
        <meta charset="utf-8" />
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <title>Titre</title>
    </head>

    <body>
     <div  style="background-color: silver;">
            <?php
            include ('connect.php');

              $reponse = $bdd->query("SELECT * FROM document, etudiant, parcours WHERE etudiant.idEtu = document.idEtudiant and etudiant.idparcours = parcours.idpar");
              $donnees = $reponse->fetchAll();?>

              <table class="table table-bordered" style="background-color:   white ;">
                <tr style="background-color:   orange ;"><th>Thème</th><th>Type</th><th>Nom de l\'etudiant</th><th>Parcours</th><th>Note du Juri</th></tr>
                    <?php
                    foreach ($donnees as $key) {
                        echo '<tr>
                                <td>'.$key['themeDoc'].'</td>'.
                                '<td>'.$key['typeDoc'].'</td>'.
                                '<td>'.$key['nomEtu'].'</td>'.
                                '<td>'.$key['nompar'].'</td>'.
                                '<td>'.$key['mentionsObtenue'].'</td>
                              </tr>';
                    }
                  //mysql_close();
                  //$bdd->close();
            ?>
          </table>
        </div>
    </body>
</html>

