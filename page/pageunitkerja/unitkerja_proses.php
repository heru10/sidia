<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];
  if(isset($_POST['id']))
    $id = $_POST['id'];

 if($task=='new'){
  $sql = "select * from role where KodeUnit = '".$_POST['txt1A']."' and RoleName = '".$_POST['txt2']."' ";
  $result = mysqli_query($connect, $sql);
  $found = mysqli_num_rows($result);
 if($found == 0){
  $coderole = code('F_',15);
  $sql = "select count(RoleId)+1 as c from role where RoleParentId like '".$_POST['txt1']."%' ";
  //die($sql);
  $role = mysqli_fetch_array(mysqli_query($connect, $sql));
  $roleid = $_POST['txt1'].".".$role['c'];


  $sql =  "insert into role ";
  $sql .= "(RoleId, GroupId, KodeUnit, RoleName, Deskripsi, RoleParentId, CodeRole) values ";
  $sql .= "('".$roleid."','".$_POST['txt3']."', '".$_POST['txt1A']."', '".$_POST['txt2']."','".$_POST['txt4']."','".$_POST['txt1']."', '". $coderole . "'  )";
  mysqli_query($connect, $sql) or die ("error");


  $path = "../../Upload_Files/".$coderole;
  if (!is_dir($path)) {
    mkdir($path, 0777,true);
  } else
     die ("errdir");
  loguser($sql);
  die("sukses");
  } else {
    die("found");
  }
 } else if($task=='edit'){

   $sql  = "update role set ";
   $sql .= "GroupId = '".$_POST['txt3']."', ";
   $sql .= "KodeUnit = '".$_POST['txt1A']."', ";
   $sql .= "RoleName = '".$_POST['txt2']."', ";
   $sql .= "Deskripsi = '".$_POST['txt4']."', ";
   $sql .= "RoleParentId = '".$_POST['txt1']."' ";
   $sql .= "where RoleId = '".$id."' ";
   mysqli_query($connect, $sql)or die ("error");
   loguser($sql);
   die("sukses");
  //else {die("found");}

 }else if($task=='del'){

   $sql = "select * from role where RoleParentId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   if(mysqli_num_rows($result)!=0)
      die('found');


   $sql = "select * from people where RoleId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   if(mysqli_num_rows($result)!=0)
     die('found');

    $sql = "select CodeRole from role where RoleId = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    $row = mysqli_fetch_array($result);
    $path = "../../Upload_Files/".$row['CodeRole'];
    //die($path);
    if (is_dir($path)) {
      rmdir($path);
    } else
       die ("errdir");

    $sql = "DELETE FROM role WHERE RoleId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error");
    loguser($sql);
    die("sukses");
 }else{
   $sql = "select * from role where RoleId='".$id."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr).'}';
 }
 //close connection
 mysqli_close($connect);

?>