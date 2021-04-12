<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['id']))
    $id = $_POST['id'];


 if($task=='new'){
   try {
    $sql  = "select * from master_media ";
	$sql .= "WHERE MediaName = '".$_POST['txt1']."' ";
	$result = mysqli_query($connect, $sql);
	if (mysqli_num_rows($result) > 0){
		die('found');
		return false;
	}

    $sql = "select (max(MediaId)+1) as id ";
    $sql .= "from master_media ";
    $result = mysqli_query($connect, $sql);
    if (mysqli_num_rows($result) > 0){
        while($row = mysqli_fetch_array($result)){
          $ClIds = $row['id'];
        }
    }
    $sql = "insert into master_media values( ";
    $sql .= $ClIds.", ";
    $sql .= " '" . $_POST['txt1'] . "' ";
    $sql .= " )";
    mysqli_query($connect, $sql);
    die("sukses");
   } catch (Exception $e) {
       die('error');
       return false;
   }

 }

 if($task=='edit'){
  try{

   $sql  = "update master_media set ";
   $sql .= "MediaName = '".$_POST['txt1']."' ";
   $sql .= "where MediaId = '".$id."' ";
   mysqli_query($connect, $sql)or die ("error");
   die("sukses");
  } catch (Exception $e) {
       die('error');
       return false;
   }
}

 if($task=='del'){
  try{
    $sql = "DELETE FROM master_media WHERE MediaId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error");
    die("sukses");
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=='load'){
   $sql = "SELECT MediaId, MediaName from master_media where MediaId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr).'}';

 }

 //close connection
 mysqli_close($connect);
?>