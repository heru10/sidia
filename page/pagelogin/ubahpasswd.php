<?php
  session_start();
  include "../../conf.php";

  if(isset($_REQUEST['old']))
  $pass_old = md5($_REQUEST['old']);
  if(isset($_REQUEST['news']))
  $pass_new = md5($_REQUEST['news']);

  $sql = "select * from people where PeopleId = '".$_SESSION['PeopleId']."' and key2 = '".$pass_old."' ";
  $result = mysqli_query($connect, $sql) or die ('Error 1');
  $jml = mysqli_num_rows($result);

  if($jml > 0){
    $sql = "UPDATE people SET Key1 = '".$_REQUEST['news']."', Key2 = '".$pass_new."' WHERE PeopleId = '".$_SESSION['PeopleId']."'  ";
    $result = mysqli_query($connect, $sql) or die ('Error2');
    die("sukses");
  } else {
    die("nosukses");
  }

?>