<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['id']))
    $id = $_POST['id'];


 if($task=='new'){
   try {
    $sql  = "select * from master_tperkembangan ";
	$sql .= "WHERE TPName = '".$_POST['txt1']."' ";
	$result = mysqli_query($connect, $sql);
	if (mysqli_num_rows($result) > 0){
		die('found');
		return false;
	}

    $sql = "select (max(TPId)+1) as id ";
    $sql .= "from master_tperkembangan ";
    $result = mysqli_query($connect, $sql);
    if (mysqli_num_rows($result) > 0){
        while($row = mysqli_fetch_array($result)){
          $ClIds = $row['id'];
        }
    }
    $sql = "insert into master_tperkembangan (TPId, TPName) values( ";
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
   $sql  = "update master_tperkembangan set ";
   $sql .= "TPName = '".$_POST['txt1']."' ";
   $sql .= "where TPId = '".$id."' ";
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
    $sql = "DELETE FROM master_tperkembangan WHERE TPId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error");
    loguser($sql);
    die("sukses");
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=='load'){
   $sql = "SELECT TPId, TPName from master_tperkembangan where TPId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr).'}';

 }
//  function getNumber(){
//    $ids="";
//    $sql = "select (max(ClId)+1) as id ";
//    $sql .= "from klasifikasi ";
//    $result = mysqli_query($connect, $sql);
//    if (mysqli_num_rows($result) > 0){
//        while($row = mysqli_fetch_array($result)){
//          $ids = $row[0];
//    }
//    }
//    return $ids;
//    }

//    function getParentCode($ClId){
//		$sql = "select ClCode as id ";
//		$sql .= "from klasifikasi ";
//		$sql .= "where ClId = '" . $ClId . "'";
//		//echo $query . "<br />";
//		$result = mysqli_query($connect, $sql);
//		if (mysqli_num_rows($result) > 0){
//			while($row = mysqli_fetch_array($result)){
//				$id = $row[0];
//			}
//		}
//		if($id != "SK"){
//			$id .= ".";
//		}
//
//		if($id == "SK"){
//			$id="";
//		}
//		return $id;
//	}


     //close connection
 mysqli_close($connect);
?>