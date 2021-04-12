<?php

   include_once "../../conf.php";
   $id = $_REQUEST['id'];
   $sql = "select * from klasifikasi where ClId='".$id."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr).'}';
   mysqli_close($connect);
?>