<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['id']))
    $id = $_POST['id'];


 if($task=='new'){
   try {
    $sql  = "select * from master_jproduk ";
	$sql .= "WHERE KatProdukid = '".$_POST['txt1']."' and JProdukName = '".$_POST['txt2']."' and RoleId = '".$_SESSION['RoleId']."' ";
	$result = mysqli_query($connect, $sql);
	if (mysqli_num_rows($result) > 0){
		die('found');
		return false;
	}

    $sql = "insert into master_jproduk (KatProdukId, JProdukName, StatusAct, RoleId) values ( ";
    $sql .= " '" . $_POST['txt1'] . "', ";
    $sql .= " '" . $_POST['txt2'] . "', ";
    $status = 0;
    if(isset($_POST['txt3']))
    $status = 1;
    $sql .= " '" . $status . "', ";
    $sql .= " '" . $_SESSION['RoleId'] . "' ";
    $sql .= " )";
    mysqli_query($connect, $sql);
    loguser($sql);
    die("sukses");
   } catch (Exception $e) {
       die('error');
       return false;
   }

 }

 if($task=='edit'){
  try{
   $sql  = "update master_jproduk set ";
   $sql .= "KatProdukId = '".$_POST['txt1']."', ";
   $sql .= "JProdukName = '".$_POST['txt2']."', ";

     $status = 0;
    if(isset($_POST['txt3']))
     $status = 1;

   $sql .= "StatusAct = '".$status."' ";
   $sql .= "where JProdukId = '".$id."' ";
   mysqli_query($connect, $sql)or die ("error");
   loguser($sql);
   die("sukses");
  } catch (Exception $e) {
       die('error');
       return false;
   }
}

 if($task=='del'){
  try{
    $sql  = "Select * from c_jproduk WHERE ";
	$sql .= "a = '".$id."' or ";
	$sql .= "b = '".$id."' ";
	$result = mysqli_query($connect, $sql);
   if(mysqli_num_rows($result)==0){
     $sql = "DELETE FROM master_jproduk WHERE JProdukId ='".$id."'";
     mysqli_query($connect, $sql)or die ("error");
     loguser($sql);
     die("sukses");
   } else die("nodel");
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=='load'){
   $sql = "SELECT * from master_jproduk
           where JProdukId = '".$id."' and RoleId = '".$_SESSION['RoleId']."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr).'}';

 }

 //close connection
 mysqli_close($connect);
?>