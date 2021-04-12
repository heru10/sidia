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
    $sql = "SELECT role.CodeRole, regarsipvital.KodeReg FROM regarsipvital INNER JOIN role ON role.RoleId = regarsipvital.RoleId
            WHERE regarsipvital.RegVitalId = '".$_POST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $subf = mysqli_fetch_array($result);
    $pathDB = "Upload_Files/".$subf[0]."/st_".$subf[1]."/";
    $path = "../../../Upload_Files/".$subf[0]."/st_".$subf[1]."/";

    if (!is_dir($path))
      mkdir($path,0777);


   //Metadata
    $sql = "select (max(DetailVitalId)+1) as id ";
    $sql .= "from detailvital_proof ";
    $result = mysqli_query($connect, $sql);
    if (mysqli_num_rows($result) > 0){
        while($row = mysqli_fetch_array($result)){
          $autoid = $row[0];
        }
    }

    $sql  = "insert into detailvital_proof ";
    $sql .= "(RegVitalId, Ket, Gedung, Lemari, Baris, Boks, Operator, TglReg )";
    $sql .= "values ( ";
    $sql .= " '" . $_POST['ids'] . "', ";
    $sql .= " 'st', ";
    $sql .= " '" . $data[1] . "', ";
    $sql .= " '" . $data[2] . "', ";
    $sql .= " '" . $data[3] . "', ";
    $sql .= " '" . $data[4] . "', ";
    $sql .= " '".$_SESSION['PeopleId']."', ";
    $sql .= " '" . date('Y-m-d H:i:s') . "' ";
    $sql .= " ) ";
    mysqli_query($connect, $sql) or die ('error 1A');

    $i = 0 ;

    if(!empty($_FILES['txtfst']['name'])){
        $sql  = "insert into detailvitalfile_proof ";
        $sql .= "(RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['txtfst']['name']."', ";
        $sql .= " '" . $_FILES['txtfst']['size']."', ";
        $sql .= " 'st' ";
        $sql .= " ) ";

        mysqli_query($connect, $sql) or die ('error 1B');

        $target_file = $path . basename($_FILES['txtfst']['name']);
        $tmpfiles = $_FILES["txtfst"]["tmp_name"];
        if (!file_exists($target_file))
            move_uploaded_file($tmpfiles, $target_file);
        $i++;
    }


    die("sukses");

   } catch (Exception $e) {
       die('error');
       return false;
   }

 }

 if($task=='edit'){
  try{
    $sql = "SELECT role.CodeRole, regarsipvital.KodeReg FROM regarsipvital INNER JOIN role ON role.RoleId = regarsipvital.RoleId
            WHERE regarsipvital.RegVitalId = '".$_POST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $subf = mysqli_fetch_array($result);
    $pathDB = "Upload_Files/".$subf[0]."/st_".$subf[1]."/";
    $path = "../../../Upload_Files/".$subf[0]."/st_".$subf[1]."/";

    $sql  = "UPDATE detailvital_proof SET ";
    $sql .= "Gedung = '" . $data[1] . "', ";
    $sql .= "Lemari = '" . $data[2] . "', ";
    $sql .= "Baris = '" . $data[3] . "', ";
    $sql .= "Boks = '" . $data[4] . "' ";
    $sql .= " WHERE RegVitalId = '".$ids."' and Ket = 'st' ";
    mysqli_query($connect, $sql) or die ('error 1A');


    if(!empty($_FILES['txtfst']['name'])){

    $sql = "Select DetVFileId, Filename from detailvitalfile_proof where RegVitalId ='".$ids."' and Ket = 'st' ";
    $result = mysqli_query($connect, $sql);
    $data=mysqli_fetch_array($result);
      $target_file = "../../../".$data['Filename'];
      if (unlink($target_file)){
            $sql = "DELETE FROM detailvitalfile_proof WHERE RegVitalId= '".$_REQUEST['ids']."' and Ket = 'st' ";
            mysqli_query($connect, $sql);
        }

        $sql  = "insert into detailvitalfile_proof ";
        $sql .= "(RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['txtfst']['name']."', ";
        $sql .= " '" . $_FILES['txtfst']['size']."', ";
        $sql .= " 'st' ";
        $sql .= " ) ";

        mysqli_query($connect, $sql) or die ('error 1B');

        $target_file = $path . basename($_FILES['txtfst']['name']);
        $tmpfiles = $_FILES["txtfst"]["tmp_name"];
        if (!file_exists($target_file))
            move_uploaded_file($tmpfiles, $target_file);
        $i++;
        }

   die("sukses");
  } catch (Exception $e) {
       die('error');
       return false;
   }
}

 if($task=='del'){
  try{
    $sql = "Select DetVFileId, Filename from detailvitalfile_proof where RegVitalId ='".$id."' and Ket = 'st' ";
    $result = mysqli_query($connect, $sql);
    while($data=mysqli_fetch_array($result)){
      $target_file = "../../../".$data['Filename'];
      if (file_exists($target_file)){
         unlink($target_file);
         $sqlA = "DELETE FROM detailvitalfile_proof WHERE DetVFileId = '".$data['DetVFileId']."' and Ket = 'st' ";
         mysqli_query($connect, $sqlA)or die ("error 1");
      }
    }
    $sqlA = "DELETE FROM detailvital_proof WHERE RegVitalId ='".$id."' and Ket = 'st'";
    mysqli_query($connect, $sqlA)or die ("error 2");

    die("sukses#".$id);
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=='load'){
   $arr = array();
   $sql = "SELECT * from detailvitalfile_proof ";
   $sql .= "where RegVitalId = '".$_REQUEST['ids']."' and Ket='st' ";
   $result = mysqli_query($connect, $sql);
   while($obj = mysqli_fetch_object($result)){
     $arr[] = $obj;
   }
   echo '{"items":'. json_encode($arr).'}';
 }

 if($task=='loadmeta'){
   $arr = array();
   $sql = "SELECT * from detailvital_proof ";
   $sql .= "where RegVitalId = '".$_REQUEST['ids']."' and Ket='st' ";
   $result = mysqli_query($connect, $sql);
   while($obj = mysqli_fetch_object($result)){
     $arr[] = $obj;
   }
   echo '{"items":'. json_encode($arr).'}';
 }

if($task=="delfile"){
   try{
    $sql = "SELECT Filename, RegVitalId, Ket FROM detailvitalfile_proof
            WHERE DetVFileId = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    $rowp = mysqli_fetch_array($result);
    $regId = $rowp['RegVitalId'];
    $kety = $rowp['Ket'];
    $path = "../../../".$rowp['Filename'];
        if(unlink($path)){
            $sql = "DELETE FROM detailvitalfile_proof where DetVFileId = '".$id."' ";
            mysqli_query($connect, $sql)or die ("error");
        }

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