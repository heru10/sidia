<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['id']))
    $id = $_POST['id'];


 if($task=='new'){
   try {
    $sql  = "select * from master_detailproduk ";
	$sql .= "WHERE DetailProdukid = '".$_POST['txt1']."' and JProdukid = '".$_POST['txt2']."' and DetailProdukName = '".$_POST['txt3']."' and RoleId = '".$_SESSION['RoleId']."' ";
	$result = mysqli_query($connect, $sql);
	if (mysqli_num_rows($result) > 0){
		die('found');
		return false;
	}


    $sql = "insert into master_detailproduk (KatProdukId, JProdukId, DetailProdukName , StatusAct, RoleId) values ( ";
    $sql .= " '" . $_POST['txt1'] . "', ";
    $sql .= " '" . $_POST['txt2'] . "', ";
    $sql .= " '" . $_POST['txt3'] . "', ";
    $status = 0;
    if(isset($_POST['txt4']))
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
   $sql  = "update master_detailproduk set ";
   $sql .= "KatProdukId = '".$_POST['txt1']."', ";
   $sql .= "JProdukId = '".$_POST['txt2']."', ";
   $sql .= "DetailProdukName = '".$_POST['txt3']."', ";

     $status = 0;
    if(isset($_POST['txt4']))
     $status = 1;

   $sql .= "StatusAct = '".$status."' ";
   $sql .= "where DetailProdukId = '".$id."' ";
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
    $sql  = "Select DetailProdukId from regarsipvital ";
	$sql .= "WHERE DetailProdukId = '".$id."' ";
	$result = mysqli_query($connect, $sql);
   if(mysqli_num_rows($result)==0){
     $sql = "DELETE FROM master_detailproduk WHERE DetailProdukId ='".$id."'";
     mysqli_query($connect, $sql)or die ("error");
     loguser($sql);
     die("sukses");
   } else die("nodel");
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=='load'){
   $sql = "SELECT * from master_detailproduk
           where DetailProdukId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr).'}';

 }

 if($task=='loadkp'){
   $sql = "select JProdukId, JProdukName from master_jproduk where StatusAct = '1' and KatProdukId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   while($row=mysqli_fetch_array($result))
     echo "<option value='".$row['JProdukId']."'>".$row['JProdukName']."</option>";
 }
 //close connection
 mysqli_close($connect);
?>