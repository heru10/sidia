<?php
  session_start();
  include_once "../../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['id']))
    $id = $_POST['id'];


 if($task=='new'){
   try {
    $sql  = "select * from pelaksana_teknis ";
	$sql .= "WHERE Nip = '".$_POST['txtnip']."' ";
	$result = mysqli_query($connect, $sql);
	if (mysqli_num_rows($result) > 0){
		die('found');
		return false;
	}

    $sql = "select (max(IdPT)+1) as id ";
    $sql .= "from pelaksana_teknis ";
    $result = mysqli_query($connect, $sql);
    $jm = mysqli_num_rows($result);
    $row = mysqli_fetch_array($result);

    if(!empty($row['id']))
      $metaid = $row['id'];
    else
      $metaid = '1';

    $sql = "insert into pelaksana_teknis ";
    $sql .= "(IdPT, Nip, Nama, TglReg) ";
    $sql .= "values ( ";
    $sql .= $metaid.", ";
    $sql .= " '" . $_POST['txtnip'] . "', ";
    $sql .= " '" . $_POST['txtnama'] . "', ";
    $sql .= " '" . date('Y-m-d H:i:s') . "' ";
    $sql .= " )";
    //die ($sql);
    mysqli_query($connect, $sql) or die ('error 1');

    die("sukses");
   } catch (Exception $e) {
       die('error');
       return false;
   }

 }

  if($task=='del'){
  try{
    $sql = "DELETE FROM pelaksana_teknis WHERE IdPT ='".$id."'";
    mysqli_query($connect, $sql)or die ("error2");
    die("sukses");
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=="delfile"){
   try{
    $sql = "SELECT Filename, FilesId FROM filesdigital
            WHERE FilesId = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    $rowp = mysqli_fetch_array($result);
    $regId = $rowp['FilesId'];
    $path = $rowp['Filename'];
        if(file_exists($path)){
			unlink($path);
        }
            echo $sql = "DELETE FROM filesdigital where FilesId = '".$id."' ";
            mysqli_query($connect, $sql)or die ("error");

   } catch (Exception $e){
    die('error');
   }
  }

 if($task=='load'){
   $sql = "SELECT * from dokumen where DokumenId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   while($obj = mysqli_fetch_object($result)){
     $arr['meta'][] = $obj;
    }

   $sql = "SELECT * from filesdigital ";
   $sql .= "where DokumenId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   if(mysqli_num_rows($result)!= 0){
   while($obj = mysqli_fetch_object($result)){
     $arr['img'][] = $obj;
   }
  }

   echo '{"items":'. json_encode($arr).'}';

 }

 if($task=='loadpl'){
     $sql = "select IdPT, Nip, Nama from pelaksana_teknis order by TglReg Asc ";
     $result = mysqli_query($connect, $sql);
     while($data=mysqli_fetch_array($result)){
       echo "<option value=".$data['IdPT'].">".$data['Nip'].' - '.$data['Nama']."</option>";
     }
 }


 //close connection
 mysqli_close($connect);
?>