<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['id']))
    $id = $_POST['id'];


 if($task=='new'){
   try {
	/*Request Dian Sainproof, 7648 | Tri Wibowo, 25/02/2019  
    $sql = "select * from master_kodekerja where Kode = '".$_POST['txt1']."' or Uraian = '".$_POST['txt2']."' ";
	*/	
	$sql = "select * from master_kodekerja where Kode = '".$_POST['txt1']."'";
	
    $result = mysqli_query($connect, $sql);
   if(mysqli_num_rows($result)==0){
    $sql = "insert into master_kodekerja (DetailProdukId, Kode, Uraian, StatusAct) values ( ";
    $sql .= " '" . $_POST['txt4'] . "', ";
    $sql .= " '" . $_POST['txt1'] . "', ";
    $sql .= " '" . $_POST['txt2'] . "', ";
    $status = 0;
    if(isset($_POST['txt3']))
    $status = 1;
    $sql .= " '" . $status . "' ";
    $sql .= " )";
    mysqli_query($connect, $sql);
    loguser($sql);
    die("sukses");
    } else
        die("found");
   } catch (Exception $e) {
       die('error');
       return false;
   }

 }

 if($task=='edit'){
  try{
   $sql  = "update master_kodekerja set ";
   $sql .= "Kode = '".$_POST['txt1']."', ";
   $sql .= "Uraian = '".$_POST['txt2']."', ";
   $sql .= "DetailProdukId = '".$_POST['txt4']."', ";

     $status = 0;
    if(isset($_POST['txt3']))
     $status = 1;

   $sql .= "StatusAct = '".$status."' ";
   $sql .= "where KodeId = '".$id."' ";
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
    $sql  = "Select KodeId from metadata_dok ";
	$sql .= "WHERE KodeId = '".$id."' ";
	$result = mysqli_query($connect, $sql);
   if(mysqli_num_rows($result)==0){
     $sql = "DELETE FROM master_kodekerja WHERE KodeId ='".$id."'";
     mysqli_query($connect, $sql)or die ("error");
     loguser($sql);
     die("sukses");
   } else die("nodel");
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=='load'){
   $sql = "SELECT * from master_kodekerja
           where KodeId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr).'}';

 }

 //close connection
 mysqli_close($connect);
?>