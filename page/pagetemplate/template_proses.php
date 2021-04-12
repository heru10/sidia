<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['id']))
    $id = $_POST['id'];


 if($task=='new'){
   try {
    $sql  = "select * from template ";
	$sql .= "WHERE Judul = '".$_POST['txt1']."' ";
	$result = mysqli_query($connect, $sql);
	if (mysqli_num_rows($result) > 0){
		die('found');
		return false;
	}

    $sql = "select (max(IdTemp)+1) as id ";
    $sql .= "from template ";
    $result = mysqli_query($connect, $sql);
    if (mysqli_num_rows($result) > 0){
        while($row = mysqli_fetch_array($result)){
          $ClIds = $row['id'];
        }
    }

    $fname = $_FILES['myfiles']['name'];
    $tmpfiles = $_FILES["myfiles"]["tmp_name"];
    $path = "fileupload/";
    $target_file = $path . basename($fname);
    if (!file_exists($target_file)){
            move_uploaded_file($tmpfiles, $target_file);

      $sql = "insert into template values( ";
      $sql .= "'',";
      $sql .= " '" . $_POST['txt1'] . "', ";
      $sql .= " '" . $target_file . "', ";
      $sql .= " '".date('Y-m-d H:i:s')."', ";
      $sql .= " '".$_SESSION['PeopleId']."' )";

      mysqli_query($connect, $sql);
      loguser($sql);
      die("sukses");
    }
   } catch (Exception $e) {
       die('error');
       return false;
   }

 }

 if($task=='edit'){
  try{
    $fname = $_FILES['myfiles']['name'];
    if(!empty($fname)){
    $sql = "select Filename From template Where IdTemp = '".$id."' ";
    $result  = mysqli_query($connect, $sql);
    $fdb = mysqli_fetch_array($result);

      if(file_exists($fdb['Filename'])){
			unlink($fdb['Filename']);
      }
   }
   $sql  = "update template set ";
   $sql .= "Judul = '".$_POST['txt1']."', ";

    $tmpfiles = $_FILES["myfiles"]["tmp_name"];
    $path = "fileupload/";
    $target_file = $path . basename($fname);
    if (!file_exists($target_file)){
            move_uploaded_file($tmpfiles, $target_file);

    $sql .= "Filename = '".$target_file."', ";
   }
   $sql .= " TglReg = '".date('Y-m-d H:i:s')."', ";
   $sql .= " PeopleId = '".$_SESSION['PeopleId']."' ";
   $sql .= "where IdTemp = '".$id."' ";
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
    $sql = "select Filename From template Where IdTemp = '".$id."' ";
    $result  = mysqli_query($connect, $sql);
    $fdb = mysqli_fetch_array($result);

      if(file_exists($fdb['Filename'])){
			unlink($fdb['Filename']);


    $sql = "DELETE FROM template WHERE IdTemp ='".$id."'";
    mysqli_query($connect, $sql)or die ("error");
    loguser($sql);
    die("sukses");
   } 
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=='load'){
   $sql = "SELECT IdTemp, Judul, Filename from template where IdTemp = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr).'}';

 }

 //close connection
 mysqli_close($connect);
?>