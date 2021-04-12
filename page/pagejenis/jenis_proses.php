<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['id']))
    $id = $_POST['id'];


 if($task=='new'){
   try {
    $sql  = "select * from master_jnaskah ";
	$sql .= "WHERE JenisNaskah = '".$_POST['txt1']."' ";
	$result = mysqli_query($connect, $sql);
	if (mysqli_num_rows($result) > 0){
		die('found');
		return false;
	}

    $sql = "select (max(JenisId)+1) as id ";
    $sql .= "from master_jnaskah ";
    $result = mysqli_query($connect, $sql);
    if (mysqli_num_rows($result) > 0){
        while($row = mysqli_fetch_array($result)){
          $ClIds = $row['id'];
        }
    }
    $sql = "insert into master_jnaskah values( ";
    $sql .= $ClIds.", ";
    $sql .= " '" . $_POST['txt1'] . "' ";
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
   $sql  = "update master_jnaskah set ";
   $sql .= "JenisNaskah = '".$_POST['txt1']."' ";
   $sql .= "where JenisId = '".$id."' ";
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
    $sql = "SELECT * FROM c_jenis where ";
    $sql .= "a = '".$id."' or ";
    $sql .= "b = '".$id."' or ";
    $sql .= "c = '".$id."' ";
    $res = mysqli_query($connect, $sql);
    if(mysqli_num_rows($res)>0){
      die('found');
    }
    $sql = "DELETE FROM master_jnaskah WHERE JenisId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error");
    loguser($sql);
    die("sukses");
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=='load'){
   $sql = "SELECT JenisId, JenisNaskah from master_jnaskah where JenisId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr).'}';

 }

 //close connection
 mysqli_close($connect);
?>