<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['id']))
    $id = $_POST['id'];


 if($task=='new'){
   try {
    $sql  = "select * from groupjabatan ";
	$sql .= "WHERE GroupName = '".$_POST['txt1']."' ";
	$result = mysqli_query($connect, $sql);
	if (mysqli_num_rows($result) > 0){
		die('found');
		return false;
	}

    $sql = "select (max(GroupId)+1) as id ";
    $sql .= "from groupjabatan ";
    $result = mysqli_query($connect, $sql);
    if (mysqli_num_rows($result) > 0){
        while($row = mysqli_fetch_array($result)){
          $ClIds = $row['id'];
        }
    }
    $sql = "insert into groupjabatan values( ";
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

   $sql  = "update groupjabatan set ";
   $sql .= "GroupName = '".$_POST['txt1']."' ";
   $sql .= "where GroupId = '".$id."' ";
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
    $sql = "select GroupId from role where GroupId = '".$id."' ";
    $result = mysqli_query($connect, $sql);
   if(mysqli_num_rows($result)==0){
    $sql = "DELETE FROM groupjabatan WHERE GroupId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error");
    loguser($sql);
    die("sukses");
   } else {
     die("xfound");
   }
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=='load'){
   $sql = "SELECT GroupId, GroupName from groupjabatan where GroupId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr).'}';

 }

 //close connection
 mysqli_close($connect);
?>