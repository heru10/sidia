<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['id']))
    $id = $_POST['id'];


 if($task=='new'){
   try {
    $sql  = "select * from master_katproduk ";
	$sql .= "WHERE KatProdukName = '".$_POST['txt1']."' and RoleId = '".$_SESSION['RoleId']."' ";
	$result = mysqli_query($connect, $sql);
	if (mysqli_num_rows($result) > 0){
		die('found');
		return false;
	}

//    $sql = "select (max(KatProdukId)+1) as id ";
//    $sql .= "from master_katproduk ";
//    $result = mysqli_query($connect, $sql);
//    if (mysqli_num_rows($result) > 0){
//        while($row = mysqli_fetch_array($result)){
//          $Ids = $row['id'];
//        }
//    }

    $status = 1;
    if(!isset($_POST['txt2']))
     $status = 0;



    $sql = "insert into master_katproduk(KatProdukName, StatusAct, RoleId)values( ";
    $sql .= " '" . $_POST['txt1'] . "', ";
    $sql .= "'".$status."', ";
    $sql .= "'".$_SESSION['RoleId']."' ";
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

   $sql  = "update master_katproduk set ";
   $sql .= "KatProdukName = '".$_POST['txt1']."', ";

   $status = 1;
    if(!isset($_POST['txt2']))
     $status = 0;

   $sql .= "StatusAct = '".$status."' ";
   $sql .= "where KatProdukId = '".$id."' ";
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
    $sql  = "Select * from c_katproduk WHERE ";
	$sql .= " a = '".$id."' or ";
	$sql .= " b = '".$id."' or ";
	$sql .= " c = '".$id."' ";
	$result = mysqli_query($connect, $sql);
   if(mysqli_num_rows($result)==0){
    $sql = "DELETE FROM master_katproduk WHERE KatProdukId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error");
    loguser($sql);
    die("sukses");
   } else die ('nodel');
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=='load'){
   $sql = "SELECT KatProdukId, KatProdukName, StatusAct from master_katproduk where KatProdukId = '".$id."' and RoleId = '".$_SESSION['RoleId']."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr).'}';
 }

 //close connection
 mysqli_close($connect);
?>