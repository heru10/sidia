<?php

   include_once "../../conf.php";
   $task = $_REQUEST['task'];


   if($task=='load'){
    $id = $_REQUEST['id'];
    $sql = "select *, master_klaskeamanan.KeamananName from klasifikasi INNER JOIN master_klaskeamanan ON master_klaskeamanan.ClKeamanan = klasifikasi.ClKeamanan
            INNER JOIN role_klasifikasi ON role_klasifikasi.ClId = klasifikasi.ClId
            where klasifikasi.ClId='".$id."' ";
    $result = mysqli_query($connect, $sql);
    //$arr = mysqli_fetch_object($result);
    $arr = array();
    while($arre = mysqli_fetch_object($result)){
      $arr[] = $arre;
    }
    echo '{"items":'. json_encode($arr).'}';

   } elseif($task=='loadg'){
     $rid = $_REQUEST['rid'];
     $ridArry = explode("#",$rid);
     $GHA = "";
     foreach($ridArry as $id){
     $sql = "select GroupName from groupjabatan where GroupId='".$id."' ";
     $result = mysqli_query($connect, $sql);
     $row = mysqli_fetch_array($result);
     $GHA .=  $row['GroupName'].", ";
     }
     echo $GHA = substr($GHA, 0, -2);
   } else {
     $rid = $_REQUEST['rid'];
     $sql = "select RoleName from role where RoleId='".$rid."' ";
     $result = mysqli_query($connect, $sql);
     $row = mysqli_fetch_array($result);
     echo $row['RoleName'];
   }
   mysqli_close($connect);
?>