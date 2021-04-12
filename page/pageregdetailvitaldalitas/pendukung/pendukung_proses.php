<?php
  session_start();
  include_once "../../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['id']))
    $id = $_POST['id'];

  if(isset($_POST['ids']))
    $ids = $_POST['ids'];

  if(isset($_POST['count'])){
    $count = $_POST['count'];

  $data = array();
  for($i=1;$i<=$count;$i++){
   if(isset($_POST['txt'.$i]))
    $data[$i] = $_POST['txt'.$i];
   else
    $data[$i] = "";
  }
 } else
    $_POST['count'] = "";


 if($task=='new'){
   try {

    $sql = "SELECT role.CodeRole, KodeReg FROM regarsipvital INNER JOIN role ON role.RoleId = regarsipvital.RoleId
            WHERE regarsipvital.RegVitalId = '".$_POST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $subf = mysqli_fetch_array($result);
    $pathDB = "Upload_Files/".$subf[0]."/pl_".$subf[1]."/";
    $path = "../../../Upload_Files/".$subf[0]."/pl_".$subf[1]."/";

    if (!is_dir($path))
      mkdir($path,0777);


   //Metadata

    $sql  = "insert into detailvital ";
    $sql .= "(RegVitalId, Ket, Gedung, Lemari, Baris, Boks, Keterangan, Operator, TglReg )";
    $sql .= "values ( ";
    $sql .= " '" . $_POST['ids'] . "', ";
    $sql .= " 'pl', ";
    $sql .= " '" . $data[1] . "', ";
    $sql .= " '" . $data[2] . "', ";
    $sql .= " '" . $data[3] . "', ";
    $sql .= " '" . $data[4] . "', ";
    $sql .= " '". $data[5] ."', ";
    $sql .= " '".$_SESSION['PeopleId']."', ";
    $sql .= " '" . date('Y-m-d H:i:s') . "' ";
    $sql .= " ) ";
    mysqli_query($connect, $sql) or die ('error 1A');

    $i = 0 ;
    foreach($_FILES['txtfpl']['name'] as $ofiles){
    if(!empty($ofiles)){

        $target_file = $path . basename($ofiles);
        $tmpfiles = $_FILES["txtfpl"]["tmp_name"][$i];
        if (!file_exists($target_file)){
            move_uploaded_file($tmpfiles, $target_file);
        $mcode = 'dalitas_'.date('dmyhis');
        $sql  = "insert into detailvitalfile ";
        $sql .= "(RegVitalId, Filename, Size, KodeReg, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['txtfpl']['name'][$i]."', ";
        $sql .= " '" . $_FILES['txtfpl']['size'][$i]."', ";
        $sql .= " '" . $mcode ."', ";
        $sql .= " 'pl' ";
        $sql .= " ) ";

        mysqli_query($connect, $sql) or die ('error 1B');
        $i++;
        }
       }
     }

    die("sukses");

   } catch (Exception $e) {
       die('error');
       return false;
   }

 }

 if($task=='edit'){
  try{
    $sql = "SELECT role.CodeRole, KodeReg FROM regarsipvital INNER JOIN role ON role.RoleId = regarsipvital.RoleId
            WHERE regarsipvital.RegVitalId = '".$_POST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $subf = mysqli_fetch_array($result);
    $pathDB = "Upload_Files/".$subf[0]."/pl_".$subf[1]."/";
    $path = "../../../Upload_Files/".$subf[0]."/pl_".$subf[1]."/";
    if (!is_dir($path))
      mkdir($path,0777);
    $sql  = "UPDATE detailvital SET ";
    $sql .= "Gedung = '" . $data[1] . "', ";
    $sql .= "Lemari = '" . $data[2] . "', ";
    $sql .= "Baris = '" . $data[3] . "', ";
    $sql .= "Boks = '" . $data[4] . "', ";
    $sql .= "Keterangan = '" . $data[5] . "' ";
    $sql .= " WHERE RegVitalId = '".$ids."' and Ket = 'pl' ";
    mysqli_query($connect, $sql) or die ('error 1A');

    $i = 0 ;
    foreach($_FILES['txtfpl']['name'] as $ofiles){
    if(!empty($ofiles)){
         $target_file = $path . basename($ofiles);
        $tmpfiles = $_FILES["txtfpl"]["tmp_name"][$i];
        if (!file_exists($target_file)){
            move_uploaded_file($tmpfiles, $target_file);
        $mcode = 'dalitas_'.date('dmyhis');
        $sql  = "insert into detailvitalfile ";
        $sql .= "(RegVitalId, Filename, Size, KodeReg, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['txtfpl']['name'][$i]."', ";
        $sql .= " '" . $_FILES['txtfpl']['size'][$i]."', ";
        $sql .= " '" . $mcode ."', ";
        $sql .= " 'pl' ";
        $sql .= " ) ";

        mysqli_query($connect, $sql) or die ('error 1B');
        $i++;
        }
       }
     }

   die("sukses");
  } catch (Exception $e) {
       die('error');
       return false;
   }
}



 if($task=='loadmeta'){
   $arr = array();

   $sql = "SELECT * from detailvital ";
   $sql .= "where RegVitalId = '".$_REQUEST['ids']."' and Ket='pl' ";
   $result = mysqli_query($connect, $sql);
    while($obj = mysqli_fetch_object($result)){
     $arr[] = $obj;
    }
   echo '{"items":'. json_encode($arr).'}';
 }

 if($task=='loadfile'){
   $arr = array();
   $sql = "SELECT * from detailvitalfile ";
   $sql .= "where RegVitalId = '".$_REQUEST['ids']."' and Ket='pl' ";
   $result = mysqli_query($connect, $sql);
   while($obj = mysqli_fetch_object($result)){
     $arr[] = $obj;
   }

   echo '{"items":'. json_encode($arr).'}';
 }

if($task=="delfile"){
   try{
    $sql = "SELECT Filename, RegVitalId, Ket FROM detailvitalfile
            WHERE DetVFileId = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    $rowp = mysqli_fetch_array($result);
    $regId = $rowp['RegVitalId'];
    $kety = $rowp['Ket'];
    $path = "../../../".$rowp['Filename'];
        if(unlink($path)){
            $sql = "DELETE FROM detailvitalfile where DetVFileId = '".$id."' ";
            mysqli_query($connect, $sql)or die ("error");
        }

   } catch (Exception $e){
    die('error');
   }
  }

 function date_ing($d){
   $df = explode('/',$d);
   return $df[2]."-".$df[1]."-".$df[0];
 }

 function filesize_formatted($size)
  {
    //$size = $path;
    $units = array( 'B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
    $power = $size > 0 ? floor(log($size, 1024)) : 0;
    return number_format($size / pow(1024, $power), 2, '.', ',') . ' ' . $units[$power];
  }

 //close connection
 mysqli_close($connect);
?>