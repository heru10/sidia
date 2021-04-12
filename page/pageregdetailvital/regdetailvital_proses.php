<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['id']))
    $id = $_POST['id'];

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

    $sql = "SELECT role.CodeRole FROM regarsipvital INNER JOIN role ON role.RoleId = regarsipvital.RoleId
            WHERE regarsipvital.RegVitalId = '".$_POST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $subf = mysqli_fetch_array($result);
    $pathDB = "Upload_Files/".$subf[0]."/SP/";
    $path = "../../Upload_Files/".$subf[0]."/SP/";

    if (!is_dir($path))
      mkdir($path,0777);
   //Spesimen Dokumen

   $i=0;
    foreach($_FILES['myfiles']['name'] as $ofiles){
     if(!empty($ofiles)){
        $sql  = "insert into detailvitalfile ";
        $sql .= "(RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['myfiles']['name'][$i]."', ";
        $sql .= " '" . $_FILES['myfiles']['size'][$i]."', ";
        $sql .= " 'SP' ";
        $sql .= " ) ";
        mysqli_query($connect, $sql) or die ('error 1B');
    $target_file = $path . basename($ofiles);
    $tmpfiles = $_FILES["myfiles"]["tmp_name"][$i];
    if (!file_exists($target_file) and $_FILES['myfiles']['size']!=0)
     move_uploaded_file($tmpfiles, $target_file);
    }
    $i++;
  }

   //if(!empty($data[1]) or !empty($data[2]) or !empty($data[3]) or !empty($data[4]) or $i != 0){
    $sql  = "insert into detailvital ";
    $sql .= "(RegVitalId, Ket, Gedung, Lemari, Baris, Boks, Operator, TglReg)";
    $sql .= "values ( ";
    $sql .= " '" . $_POST['ids'] . "', ";
    $sql .= " 'SP', ";
    $sql .= " '" . $data[1] . "', ";
    $sql .= " '" . $data[2] . "', ";
    $sql .= " '" . $data[3] . "', ";
    $sql .= " '" . $data[4] . "', ";
    $sql .= " '".$_SESSION['PeopleId']."', ";
    $sql .= " '" . date('Y-m-d H:i:s') . "' ";
    $sql .= " ) ";
    mysqli_query($connect, $sql) or die ('error 1A');
   //}
  $i = 0;
  if(!empty($_FILES['myfilesA']['name'])){
    $pathDB = "Upload_Files/".$subf[0]."/UT/";
    $path = "../../Upload_Files/".$subf[0]."/UT/";
    if (!is_dir($path))
      mkdir($path,0777);

    $target_file = $path . basename($_FILES['myfilesA']['name']);
    $tmpfiles = $_FILES["myfilesA"]["tmp_name"];
    if (!file_exists($target_file) and $_FILES['myfilesA']['size']!=0 )
     move_uploaded_file($tmpfiles, $target_file);

    $sql  = "insert into detailvitalfile ";
    $sql .= "(RegVitalId, Filename, Size, Ket)";
    $sql .= "values ( ";
    $sql .= " '" . $_POST['ids'] . "', ";
    $sql .= " '" . $pathDB.$_FILES['myfilesA']['name']."', ";
    $sql .= " '" . $_FILES['myfilesA']['size']."', ";
    $sql .= " 'UT' ";
    $sql .= " ) ";
    mysqli_query($connect, $sql) or die ('error 2A');
    $i = 1;
  }

  //if(!empty($data[5]) or !empty($data[6]) or !empty($data[7]) or !empty($data[8]) or $i != 0){

        $sql  = "insert into detailvital ";
        $sql .= "(RegVitalId, Ket, Gedung, Lemari, Baris, Boks, Operator, TglReg)";
        $sql .= "values ( ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " 'UT', ";
        $sql .= " '" . $data[5] . "', ";
        $sql .= " '" . $data[6] . "', ";
        $sql .= " '" . $data[7] . "', ";
        $sql .= " '" . $data[8] . "', ";
        $sql .= " '".$_SESSION['PeopleId']."', ";
        $sql .= " '" . date('Y-m-d H:i:s') . "' ";
        $sql .= " ) ";
        mysqli_query($connect, $sql) or die ('error 2B');
    //}
    $i = 0;
    if(!empty($_FILES['myfilesB']['name'])){
        $sql  = "insert into detailvitalfile ";
        $sql .= "(RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['myfilesB']['name']."', ";
        $sql .= " '" . $_FILES['myfilesB']['size']."', ";
        $sql .= " 'ST' ";
        $sql .= " ) ";
        mysqli_query($connect, $sql) or die ('error 3A');
        $pathDB = "Upload_Files/".$subf[0]."/ST/";
        $path = "../../Upload_Files/".$subf[0]."/ST/";
        if (!is_dir($path))
        mkdir($path,0777);
        $target_file = $path . basename($_FILES['myfilesB']['name']);
        $tmpfiles = $_FILES["myfilesB"]["tmp_name"];
        if (!file_exists($target_file and $_FILES['myfilesB']['size']!=0))
          move_uploaded_file($tmpfiles, $target_file);
        $i = 1;
    }

    //if(!empty($data[9]) or !empty($data[10]) or !empty($data[11]) or !empty($data[12]) or  $i != 0 ){
        $sql  = "insert into detailvital ";
        $sql .= "(RegVitalId, Ket, Gedung, Lemari, Baris, Boks, Operator, TglReg)";
        $sql .= "values ( ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " 'ST', ";
        $sql .= " '" . $data[9] . "', ";
        $sql .= " '" . $data[10] . "', ";
        $sql .= " '" . $data[11] . "', ";
        $sql .= " '" . $data[12] . "', ";
        $sql .= " '".$_SESSION['PeopleId']."', ";
        $sql .= " '" . date('Y-m-d H:i:s') . "' ";
        $sql .= " ) ";
        mysqli_query($connect, $sql) or die ('error 3B');
    // }

//     if(!empty($_FILES['myfilesC']['name'])){
//        $sql  = "insert into detailvitalfile ";
//        $sql .= "(RegVitalId, Filename, Size, Ket)";
//        $sql .= "values ( ";
//        $sql .= " '" . $_POST['ids'] . "', ";
//        $sql .= " '" . $pathDB.$_FILES['myfilesC']['name']."', ";
//        $sql .= " '" . $_FILES['myfilesC']['size']."', ";
//        $sql .= " 'PL' ";
//        $sql .= " ) ";
//        mysqli_query($connect, $sql) or die ('error 4A');
//        $target_file = $path . basename($_FILES['myfilesC']['name']);
//        $tmpfiles = $_FILES["myfilesB"]["tmp_name"];
//        if (!file_exists($target_file and $_FILES['myfilesC']['size']!=0))
//          move_uploaded_file($tmpfiles, $target_file);
//        }
        //if(!empty($data[9]) or !empty($data[10]) or !empty($data[11]) or !empty($data[12])){

      $i=0;
      if($_FILES['myfilesC']['name'][0] != 0){
      foreach($_FILES['myfilesC']['name'] as $ofiles){
         $sql  = "insert into detailvitalfile ";
         $sql .= "(RegVitalId, Filename, Size, Ket)";
         $sql .= "values ( ";
         $sql .= " '" . $_POST['ids'] . "', ";
         $sql .= " '" . $pathDB.$_FILES['myfilesC']['name'][$i]."', ";
         $sql .= " '" . $_FILES['myfilesC']['size'][$i]."', ";
         $sql .= " 'PL' ";
         $sql .= " ) ";
         mysqli_query($connect, $sql) or die ('error 4A');
          $pathDB = "Upload_Files/".$subf[0]."/PL/";
          $path = "../../Upload_Files/".$subf[0]."/PL/";
          if (!is_dir($path))
          mkdir($path,0777);

          $target_file = $path . basename($ofiles);
          $tmpfiles = $_FILES["myfilesC"]["tmp_name"][$i];
         if (!file_exists($target_file) and $_FILES['myfilesC']['size']!=0)
           move_uploaded_file($tmpfiles, $target_file);
         $i++;
       }
      }

     // if(!empty($data[13]) or !empty($data[14]) or !empty($data[15]) or !empty($data[16]) or !empty($data[17]) or $i != 0){
          $sql  = "insert into detailvital ";
          $sql .= "(RegVitalId, Ket, Keterangan, Gedung, Lemari, Baris, Boks,  Operator, TglReg)";
          $sql .= "values ( ";
          $sql .= " '" . $_POST['ids'] . "', ";
          $sql .= " 'PL', ";
          $sql .= " '" . $data[13] . "', ";
          $sql .= " '" . $data[14] . "', ";
          $sql .= " '" . $data[15] . "', ";
          $sql .= " '" . $data[16] . "', ";
          $sql .= " '" . $data[17] . "', ";
          $sql .= " '".$_SESSION['PeopleId']."', ";
          $sql .= " '" . date('Y-m-d H:i:s') . "' ";
          $sql .= " ) ";
          //die($sql);
          mysqli_query($connect, $sql) or die ('error 4B');
       // }

    die("sukses");

   } catch (Exception $e) {
       die('error');
       return false;
   }

 }

 if($task=='edit'){
  try{
    $sql = "SELECT role.CodeRole FROM regarsipvital INNER JOIN role ON role.RoleId = regarsipvital.RoleId
            WHERE regarsipvital.RegVitalId = '".$_POST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $subf = mysqli_fetch_array($result);
    $path = "../../Upload_Files/".$subf[0]."/PL/";
    $pathDB = "Upload_Files/".$subf[0]."/PL/";
    if (!is_dir($path))
      mkdir($path,0777);

  if(!empty($_FILES['myfiles']['name'][0])){
    $i=0;
    foreach($_FILES['myfiles']['name'] as $ofiles){
        $sql  = "insert into detailvitalfile ";
        $sql .= "(RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['myfiles']['name'][$i]."', ";
        $sql .= " '" . $_FILES['myfiles']['size'][$i]."', ";
        $sql .= " 'SP' ";
        $sql .= " ) ";
        mysqli_query($connect, $sql) or die ('error 1');
        $target_file = $path . basename($ofiles);
        $tmpfiles = $_FILES["myfiles"]["tmp_name"][$i];
        if (!file_exists($target_file) and $_FILES['myfiles']['size']!=0)
            move_uploaded_file($tmpfiles, $target_file);
        $i++;
    }
   }

   $sql  = "update detailvital set ";
   $sql .= "Gedung = '".$data[1]."', ";
   $sql .= "Lemari = '".$data[2]."', ";
   $sql .= "Baris = '".$data[3]."', ";
   $sql .= "Boks = '".$data[4]."' ";
   $sql .= "where RegVitalId = '".$_POST['ids']."' and Ket = 'SP' ";
   mysqli_query($connect, $sql)or die ("error 1A");

   if(!empty($_FILES['myfilesA']['name'])){
        $path = "../../Upload_Files/".$subf[0]."/UT/";
        $pathDB = "Upload_Files/".$subf[0]."/UT/";
        if (!is_dir($path))
         mkdir($path,0777);
        $sql  = "insert into detailvitalfile ";
        $sql .= "(RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['myfilesA']['name']."', ";
        $sql .= " '" . $_FILES['myfilesA']['size']."', ";
        $sql .= " 'UT' ";
        $sql .= " ) ";
        mysqli_query($connect, $sql) or die ('error 2');
        $target_file = $path . basename($_FILES['myfilesA']['name']);
        $tmpfiles = $_FILES["myfilesA"]["tmp_name"];
        if (!file_exists($target_file) and $_FILES['myfilesA']['size']!=0)
            move_uploaded_file($tmpfiles, $target_file);
   }

   $sql  = "update detailvital set ";
   $sql .= "Gedung = '".$data[5]."', ";
   $sql .= "Lemari = '".$data[6]."', ";
   $sql .= "Baris = '".$data[7]."', ";
   $sql .= "Boks = '".$data[8]."' ";
   $sql .= "where RegVitalId = '".$_POST['ids']."' and Ket = 'UT' ";
   mysqli_query($connect, $sql)or die ("error 2A");


   if(!empty($_FILES['myfilesB']['size'])){
        $path = "../../Upload_Files/".$subf[0]."/ST/";
        $pathDB = "Upload_Files/".$subf[0]."/ST/";
        if (!is_dir($path))
          mkdir($path,0777);
        $sql  = "insert into detailvitalfile ";
        $sql .= "(RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['myfilesB']['name']."', ";
        $sql .= " '" . $_FILES['myfilesB']['size']."', ";
        $sql .= " 'ST' ";
        $sql .= " ) ";
        mysqli_query($connect, $sql) or die ('error 3');
        $target_file = $path . basename($_FILES['myfilesB']['name']);
        $tmpfiles = $_FILES["myfilesB"]["tmp_name"];
        if (!file_exists($target_file) and $_FILES['myfilesB']['size']!=0)
            move_uploaded_file($tmpfiles, $target_file);
   }
   $sql  = "update detailvital set ";
   $sql .= "Gedung = '".$data[9]."', ";
   $sql .= "Lemari = '".$data[10]."', ";
   $sql .= "Baris = '".$data[11]."', ";
   $sql .= "Boks = '".$data[12]."' ";
   $sql .= "where RegVitalId = '".$_POST['ids']."' and Ket = 'ST' ";
   mysqli_query($connect, $sql)or die ("error 3A");


   if(!empty($_FILES['myfilesC']['name'][0])){
     $i=0;
     foreach($_FILES['myfilesC']['name'] as $ofilesy){
        $path = "../../Upload_Files/".$subf[0]."/PL/";
        $pathDB = "Upload_Files/".$subf[0]."/PL/";
         if (!is_dir($path))
         mkdir($path,0777);
        $sql  = "insert into detailvitalfile ";
        $sql .= "(RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['myfilesC']['name'][$i]."', ";
        $sql .= " '" . $_FILES['myfilesC']['size'][$i]."', ";
        $sql .= " 'PL' ";
        $sql .= " ) ";
        mysqli_query($connect, $sql) or die ('error 4');
        $target_file = $path . basename($_FILES['myfilesC']['name'][$i]);
        $tmpfiles = $_FILES["myfilesC"]["tmp_name"][$i];
        if (!file_exists($target_file) and $_FILES['myfilesC']['size'][$i]!=0)
            move_uploaded_file($tmpfiles, $target_file);
       $i++;
     }
   }

   $sql  = "update detailvital set ";
   $sql .= "Keterangan = '".$data[13]."', ";
   $sql .= "Gedung = '".$data[14]."', ";
   $sql .= "Lemari = '".$data[15]."', ";
   $sql .= "Baris = '".$data[16]."', ";
   $sql .= "Boks = '".$data[17]."' ";
   $sql .= "where RegVitalId = '".$_POST['ids']."' and Ket = 'PL' ";
   mysqli_query($connect, $sql)or die ("error 4A");

   die("sukses");
  } catch (Exception $e) {
       die('error');
       return false;
   }
}

 if($task=='del'){
  try{
    $sql = "Select Filename from detailvitalfile where RegVitalId ='".$id."' ";
    $result = mysqli_query($connect, $sql);
    while($data=mysqli_fetch_array($result)){
      $target_file = "../../".$data['Filename'];
      if (file_exists($target_file)){
         unlink($target_file);
         $sqlA = "DELETE FROM detailvitalfile WHERE RegVitalId ='".$id."'";
         mysqli_query($connect, $sqlA)or die ("error");
      }

    }
    $sql = "DELETE FROM detailvital WHERE RegVitalId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error");

    die("sukses#".$id);
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=='load'){
   $arr = array();

   $sql = "SELECT * from detailvital ";
   $sql .= "where detailvital.RegVitalId = '".$_REQUEST['idx']."' Order By detailvital.Ket asc ";
   $result = mysqli_query($connect, $sql);
    while($obj = mysqli_fetch_object($result)){
     $arr['meta'][] = $obj;
    }

   $sql = "SELECT * from detailvitalFile ";
   $sql .= "where RegVitalId = '".$_REQUEST['idx']."' Order By Ket asc ";
   $result = mysqli_query($connect, $sql);
   while($obj = mysqli_fetch_object($result)){
     $arr['img'][] = $obj;
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
    $path = "../../".$rowp['Filename'];
        if(file_exists($path)){
			unlink($path);
        }
            echo $sql = "DELETE FROM detailvitalfile where DetVFileId = '".$id."' ";
            mysqli_query($connect, $sql)or die ("error");

   } catch (Exception $e){
    die('error');
   }
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