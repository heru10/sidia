<?php
  include "../../conf.php";

 echo $sql = "select * from detailvital where DetailVitalId = '". $_GET['ids'] ."' and Ker = '".$_GET['ket']."' ";
 $result = mysqli_query($connect, $sql) or die ('Error');


?>