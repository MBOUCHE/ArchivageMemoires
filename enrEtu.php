<?php
  include ('connect.php');

  $req=$bdd->query("SELECT * FROM encadreur ORDER BY nomEnc ");
  $req->execute();
  $res = $req->fetchAll();

  $sel=$bdd->query("SELECT * FROM mentions ");
  $sel->execute();
  $rs = $sel->fetchAll();

  $rq=$bdd->query("SELECT * FROM parcours ");
  $rq->execute();
  $re = $rq->fetchAll();

  $cy=$bdd->query("SELECT * FROM cycle ");
  $cy->execute();
  $cyc = $cy->fetchAll();

if(isset($_POST['enrEtu']))
{

  $nomEtu = htmlspecialchars($_POST['nomEtu']);
  $prenomEtu = htmlspecialchars($_POST['prenomEtu']);
  $dateNaisEtu = htmlspecialchars($_POST['dateNaisEtu']);
  $matEtu = htmlspecialchars($_POST['matEtu']);
  $emailEtu = htmlspecialchars($_POST['emailEtu']);
  $phoneEtu = htmlspecialchars($_POST['phoneEtu']);
  $encadreur = htmlspecialchars($_POST['encadreur']);
  $cycle = htmlspecialchars($_POST['cycle']);
  $filiere = htmlspecialchars($_POST['mentions']);
  $parcours = htmlspecialchars($_POST['parcours']);
  $dateEnr = date("Y-m-d ");
  //$dateTTT = date()
  //$dateFabrication = htmlspecialchars($_POST['dateFabrication']);


  if(!empty($_POST['nomEtu']) AND !empty($_POST['emailEtu'])AND !empty($_POST['phoneEtu']) AND !empty($_POST['dateNaisEtu']) AND !empty($_POST['matEtu']) )
  {


        $insertEtu = $bdd->prepare("INSERT INTO etudiant(nomEtu, prenomEtu, dateNais, MatEtu, EMailEtu, PhoneEtu, idcyc, idMent, idparcours, idEnc, dateEnr) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $insertEtu->execute(array($nomEtu, $prenomEtu, $dateNaisEtu, $matEtu, $emailEtu, $phoneEtu, $cycle, $filiere, $parcours, $encadreur, $dateEnr));

        header('Location: enrDoc.php');

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

  </head>
  <body><div class="image" style="background-image:url('img/1.jpg')">


    <div class="">

      
     <?php 
       include ('headerges.php');
    ?>

          <div class="container jumbotron" style="background-color:inherit">
              <br>

    <div class="jumbotron col-sm-4 container" style="background-color:#ffc107;">
      <form  method="post" name="form1" id="demoForm">
        <h3 class="text-center"style="color: #e67e22 "><b> <i>ENREGISTREMENT D'UN MEMOIRE</i> </b></h3>

        <table class="container-blue" style="background-color:#ffc107;" ><br>

      <th style="color:white"><u>ETUDIANT</u></th>
          <tr>
          <td>
              <div class="form-group">
                <label for="nomEtu">nom</label>
                <input type="text" name="nomEtu" value="" class="form-control">
              </div>
            </td>
          </tr>

          <tr>
            <td>
              <div class="form-group">
              <label for="prenomEtu">prenom</label>
              <input type="text" name="prenomEtu" value="" class="form-control">
            </div>
            </td>
          </tr>

          <tr>
            <td>
              <div class="form-group">
                <label for="emailEtu">E-mail</label>
                <input type="text" name="emailEtu" value="" class="form-control">
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="form-group">
                <label for="phoneEtu">Telephone</label>
                <input type="text" name="phoneEtu" value="" class="form-control">
              </div>
            </td>
          </tr>

          <tr>
            <td>
              <div class="form-group">
                <label for="dateNaisEtu">date de naissance</label>
                <input type="date" name="dateNaisEtu" value="" class="form-control">
              </div>
            </td>

          <tr>
            <td>
              <div class="form-group">
                <label for="matEtu">matricule</label>
                <input type="text" name="matEtu" value="" class="form-control">
              </div>

            </div>
            <div class="form-group">
              <label for="Encadreur">Encadreur</label>
              <select class="form-control" name="encadreur">
              <?php
              if ($res != NULL) {
                foreach ($res as $r): ?>
                  <option value="<?= $r['idEnc']; ?>">
                    <?php echo $r['nomEnc'].' '. $r['prenomEnc'];?>
                  </option>
                <?php
                  endforeach;
                  }
                  ?>
              </select>
            </div>

                <div class="form-group">
                  <label for="cycle">Cycle</label>
                  <select class="form-control" id="cycleEtu" name="cycle">
                    <?php
                    if ($cyc != NULL) {
                      foreach ($cyc as $r): ?>
                        <option value="<?= $r['idcyc']; ?>">
                          <?php echo $r['nomcyc'];?>
                        </option>
                      <?php
                        endforeach;
                        }
                        ?>
                  </select>
                </div><br>


                <div class="form-group">
                  <label for="">Mentions</label>
                  <select class="form-control" name="mentions">
                        <option value="1"> GIN </option>
                        <option value="2"> GIM </option>
                        <option value="3"> GBIO </option>
                  </select>
                </div>

                <div class="form-group">
                  <label for="">Parcours</label>
                  <select class="form-control" name="parcours">
                       
                  </select>
                </div>

            </td>
          </tr>
        </table>

        <div class="form-group">

        <input type="submit" name="enrEtu" value="Envoyer" class="btn btn-dark"></input>
        </div>

      </form>
    </div>
  </div>

   <?php 
       include ('footer.php');
    ?>

  <script type="text/javascript">
  function removeAllOptions(sel, removeGrp) {
      var len, groups, par;
      if (removeGrp) {
          groups = sel.getElementsByTagName('optgroup');
          len = groups.length;
          for (var i=len; i; i--) {
              sel.removeChild( groups[i-1] );
          }
      }

      len = sel.options.length;
      for (var i=len; i; i--) {
          par = sel.options[i-1].parentNode;
          par.removeChild( sel.options[i-1] );
      }
  }

  function appendDataToSelect(sel, obj) {
      var f = document.createDocumentFragment();
      var labels = [], group, opts;

      function addOptions(obj) {
          var f = document.createDocumentFragment();
          var o;

          for (var i=0, len=obj.text.length; i<len; i++) {
              o = document.createElement('option');
              o.appendChild( document.createTextNode( obj.text[i] ) );

              if ( obj.value ) {
                  o.value = obj.value[i];
              }

              f.appendChild(o);
          }
          return f;
      }

      if ( obj.text ) {
          opts = addOptions(obj);
          f.appendChild(opts);
      } else {
          for ( var prop in obj ) {
              if ( obj.hasOwnProperty(prop) ) {
                  labels.push(prop);
              }
          }

          for (var i=0, len=labels.length; i<len; i++) {
              group = document.createElement('optgroup');
              group.label = labels[i];
              f.appendChild(group);
              opts = addOptions(obj[ labels[i] ] );
              group.appendChild(opts);
          }
      }
      sel.appendChild(f);
  }

  // anonymous function assigned to onchange event of controlling select list
  document.forms['demoForm'].elements['mentions'].onchange = function(e) {
      // name of associated select list
      var relName = 'parcours';

      // reference to associated select list
      var relList = this.form.elements[ relName ];

      // get data from object literal based on selection in controlling select list (this.value)
      var obj = Select_List_Data[ relName ][ this.value ];

      // remove current option elements
      removeAllOptions(relList, true);

      // call function to add optgroup/option elements
      // pass reference to associated select list and data for new options
      appendDataToSelect(relList, obj);
  };

  // object literal holds data for optgroup/option elements
  var Select_List_Data = {

      // name of associated select list
      'parcours': {

          // names match option values in controlling select list
          '1': {

                  text: ['GIN', 'GLO', 'RES/INT'],
                  value: ['1', '9', '10']

          },
          '3': {

              text: ['IAB', 'ABB', 'GEN'],
              value: ['6', '7', '8']
          },
          '2': {

                  text: ['GTE', 'GEL', 'MIP', 'GMP'],
                  value: ['2', '3', '4', '5']

          }
      }

  };

  // populate associated select list when page loads
  window.onload = function() {
      var form = document.forms['demoForm'];

      // reference to controlling select list
      var sel = form.elements['mentions'];
      sel.selectedIndex = 0;

      // name of associated select list
      var relName = 'parcours';


      // reference to associated select list
      var rel = form.elements[ relName ];

      // get data for associated select list passing its name
      // and value of selected in controlling select list
      var data = Select_List_Data[ relName ][ sel.value ];

      // add options to associated select list
      appendDataToSelect(rel, data);
  };

  </script>


  </body>
</html>
