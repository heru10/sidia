<?php
  session_start();
  include "../../conf.php";
  if(isset($_REQUEST['task'])){
  $kode = $_REQUEST['kode'];
  $log = $_REQUEST['task'];
  $sql = "insert into log_archive(LogDok, PeopleId, LogDate, RoleId, Kode) values ('".$log."', '".$_SESSION['PeopleId']."', '".date('Y-m-d H:i:s')."', '".$_SESSION['RoleId']."','".$kode."')";
          mysqli_query($connect, $sql);
  }
?>