<?php

if(isset($_POST['restore'])){
include "../../conf1.php";
echo $nama_file=$_FILES['datafile']['name'];
$ukuran=$_FILES['datafile']['size'];
if ($nama_file==""){
  echo "Fatal Error";
}
else{
//definisikan variabel file dan alamat file
  $uploaddir='../../restore_db/';
  $alamatfile=$uploaddir.$nama_file;
  if (move_uploaded_file($_FILES['datafile']['tmp_name'],$alamatfile)){
      $filename = './'.$uploaddir.$nama_file.'';
      $templine = '';
      $lines = file($filename);
          foreach ($lines as $line){
              if (substr($line, 0, 2) == '--' || $line == '')
              continue;
              $templine .= $line;
              if (substr(trim($line), -1, 1) == ';'){
                  mysqli_query($connect, $templine) or print('Error performing query /' . $templine . '/: ' . mysql_error());
                  $templine = '';
              }
          }
          loguser('Backup&nbsp;'.$templine);
      die('sukses');
  }
  else{
      die('error');
  }
}

}
else{
 unset($_POST['restore']);
}


?>