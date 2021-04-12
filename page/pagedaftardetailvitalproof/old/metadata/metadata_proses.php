<?php
  session_start();
  include_once "../../../conf.php";

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

    $sql = "SELECT role.CodeRole, regarsipvital.KodeReg FROM regarsipvital INNER JOIN role ON role.RoleId = regarsipvital.RoleId
            WHERE regarsipvital.RegVitalId = '".$_POST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $subf = mysqli_fetch_array($result);
    $pathDB = "Upload_Files/".$subf[0]."/meta_".$subf[1]."/";
    $path = "../../../Upload_Files/".$subf[0]."/meta_".$subf[1]."/";

    if (!is_dir($path))
      mkdir($path,0777);


    $sql = "select (max(DetailProfId)+1) as id ";
    $sql .= "from detailvitalmeta_proof ";
    $result = mysqli_query($connect, $sql);
    $jmllist = mysqli_num_rows($result);
    if ($jmllist > 0){
        while($row = mysqli_fetch_array($result)){
         if($row['id']=="")
          $autoid = '1';
         else
          $autoid = $row['id'];
        }
    }
    //die($autoid);
   //Metadata

    $sql  = "insert into detailvitalmeta_proof ";
    $sql .= "(DetailProfId, RegVitalId, Perihal, Tgl_Nodin, Dasar, IdPelaksana, Tgl_Desain, Tgl_Proof, Nomor_SPK,
              KetPekerjaan, Nota_Penyerahan, Keterangan, Gedung, Lemari, Baris, Boks, Operator, TglReg )";
    $sql .= "values ( ";
    $sql .= " '" . $autoid . "', ";
    $sql .= " '" . $_POST['ids'] . "', ";
    $sql .= " '" . $data[1] . "', ";
    $sql .= " '" . date_ing($data[2]) . "', ";
    $sql .= " '" . $data[3] . "', ";

    $other = "";

    foreach($_POST['txt4'] as $RoleId){
      $other .= $RoleId."#";
    }
      $other = substr($other,0,-1);

    $sql .= " '" . $other . "', ";
    $sql .= " '" . date_ing($data[5]) . "', ";
    $sql .= " '" . date_ing($data[6]) . "', ";
    $sql .= " '" . $data[7] . "', ";
    $sql .= " '" . $data[8] . "', ";
    $sql .= " '" . $data[9] . "', ";
    $sql .= " '" . $data[10] . "', ";
    $sql .= " '" . $data[11] . "', ";
    $sql .= " '" . $data[12] . "', ";
    $sql .= " '" . $data[13] . "', ";
    $sql .= " '" . $data[14] . "', ";
    $sql .= " '".$_SESSION['PeopleId']."', ";
    $sql .= " '" . date('Y-m-d H:i:s') . "' ";
    $sql .= " ) ";
    mysqli_query($connect, $sql) or die ('error 1A');

    $i = 0 ;
    foreach($_FILES['txtfdasar']['name'] as $ofiles){
    if(!empty($ofiles)){
        $sql  = "insert into detailvitalfile_proof ";
        $sql .= "(DetailProfId, RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $autoid . "', ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['txtfdasar']['name'][$i]."', ";
        $sql .= " '" . $_FILES['txtfdasar']['size'][$i]."', ";
        $sql .= " 'dasar' ";
        $sql .= " ) ";

        mysqli_query($connect, $sql) or die ('error 1B');

        $target_file = $path . basename($ofiles);
        $tmpfiles = $_FILES["txtfdasar"]["tmp_name"][$i];
        if (!file_exists($target_file))
            move_uploaded_file($tmpfiles, $target_file);
        $i++;
        }
     }

    $i = 0 ;
    foreach($_FILES['txtfspk']['name'] as $ofiles){
    if(!empty($ofiles)){
        $sql  = "insert into detailvitalfile_proof ";
        $sql .= "(DetailProfId, RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $autoid . "', ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['txtfspk']['name'][$i]."', ";
        $sql .= " '" . $_FILES['txtfspk']['size'][$i]."', ";
        $sql .= " 'spk' ";
        $sql .= " ) ";
        mysqli_query($connect, $sql) or die ('error 1C');
        $target_file = $path . basename($ofiles);
        $tmpfiles = $_FILES["txtfspk"]["tmp_name"][$i];
        if (!file_exists($target_file))
            move_uploaded_file($tmpfiles, $target_file);
        $i++;
        }
     }

    $i=0;
    foreach($_FILES['txtfnota']['name'] as $ofiles){
    if(!empty($ofiles)){
        $sql  = "insert into detailvitalfile_proof ";
        $sql .= "(DetailProfId, RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $autoid . "', ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['txtfnota']['name'][$i]."', ";
        $sql .= " '" . $_FILES['txtfnota']['size'][$i]."', ";
        $sql .= " 'nota' ";
        $sql .= " ) ";
        mysqli_query($connect, $sql) or die ('error 1D');
        $target_file = $path . basename($ofiles);
        $tmpfiles = $_FILES["txtfnota"]["tmp_name"][$i];
        if (!file_exists($target_file))
            move_uploaded_file($tmpfiles, $target_file);
        $i++;
        }
     }

    if(!empty($_FILES['txtfdata']['name'])){
        $sql  = "insert into detailvitalfile_proof ";
        $sql .= "(DetailProfId, RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $autoid . "', ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['txtfdata']['name']."', ";
        $sql .= " '" . $_FILES['txtfdata']['size']."', ";
        $sql .= " 'data' ";
        $sql .= " ) ";
        mysqli_query($connect, $sql) or die ('error 1E');
        $target_file = $path . basename($_FILES['txtfdata']['name']);
        $tmpfiles = $_FILES["txtfdata"]["tmp_name"];
        if (!file_exists($target_file))
            move_uploaded_file($tmpfiles, $target_file);
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
    $pathDB = "Upload_Files/".$subf[0]."/meta_".$subf[1]."/";
    $path = "../../../Upload_Files/".$subf[0]."/meta_".$subf[1]."/";

    $sql  = "UPDATE detailvitalmeta_proof SET ";
    $sql .= "Perihal = '" . $data[1] . "', ";
    $sql .= "Tgl_Nodin =  '" . date_ing($data[2]) . "', ";
    $sql .= "Dasar = '" . $data[3] . "', ";

    $other = "";

    foreach($_POST['txt4'] as $RoleId){
      $other .= $RoleId."#";
    }
      $other = substr($other,0,-1);

    $sql .= "IdPelaksana = '" . $other . "', ";
    $sql .= "Tgl_Desain = '" . date_ing($data[5]) . "', ";
    $sql .= "Tgl_Proof = '" . date_ing($data[6]) . "', ";
    $sql .= "Nomor_SPK = '" . $data[7] . "', ";
    $sql .= "KetPekerjaan = '" . $data[8] . "', ";
    $sql .= "Nota_Penyerahan = '" . $data[9] . "', ";
    $sql .= "Keterangan = '" . $data[10] . "', ";
    $sql .= "Gedung = '" . $data[11] . "', ";
    $sql .= "Lemari = '" . $data[12] . "', ";
    $sql .= "Baris = '" . $data[13] . "', ";
    $sql .= "Boks = '" . $data[14] . "' ";
    $sql .= " WHERE DetailProfId = '".$id."' ";
    mysqli_query($connect, $sql) or die ('error 1A');

    $i = 0 ;
    foreach($_FILES['txtfdasar']['name'] as $ofiles){
    if(!empty($ofiles)){
        $sql  = "insert into detailvitalfile_proof ";
        $sql .= "(DetailProfId, RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $id . "', ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['txtfdasar']['name'][$i]."', ";
        $sql .= " '" . $_FILES['txtfdasar']['size'][$i]."', ";
        $sql .= " 'dasar' ";
        $sql .= " ) ";

        mysqli_query($connect, $sql) or die ('error 1B');

        $target_file = $path . basename($ofiles);
        $tmpfiles = $_FILES["txtfdasar"]["tmp_name"][$i];
        if (!file_exists($target_file))
            move_uploaded_file($tmpfiles, $target_file);
        $i++;
        }
     }

    $i = 0 ;
    foreach($_FILES['txtfspk']['name'] as $ofiles){
    if(!empty($ofiles)){
        $sql  = "insert into detailvitalfile_proof ";
        $sql .= "(DetailProfId, RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $id . "', ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['txtfspk']['name'][$i]."', ";
        $sql .= " '" . $_FILES['txtfspk']['size'][$i]."', ";
        $sql .= " 'spk' ";
        $sql .= " ) ";
        mysqli_query($connect, $sql) or die ('error 1C');
        $target_file = $path . basename($ofiles);
        $tmpfiles = $_FILES["txtfspk"]["tmp_name"][$i];
        if (!file_exists($target_file))
            move_uploaded_file($tmpfiles, $target_file);
        $i++;
        }
     }

    $i=0;
    foreach($_FILES['txtfnota']['name'] as $ofiles){
    if(!empty($ofiles)){
        $sql  = "insert into detailvitalfile_proof ";
        $sql .= "(DetailProfId, RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $id . "', ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['txtfnota']['name'][$i]."', ";
        $sql .= " '" . $_FILES['txtfnota']['size'][$i]."', ";
        $sql .= " 'nota' ";
        $sql .= " ) ";
        mysqli_query($connect, $sql) or die ('error 1D');
        $target_file = $path . basename($ofiles);
        $tmpfiles = $_FILES["txtfnota"]["tmp_name"][$i];
        if (!file_exists($target_file))
            move_uploaded_file($tmpfiles, $target_file);
        $i++;
        }
     }

    if(!empty($_FILES['txtfdata']['name'])){
        $sql  = "insert into detailvitalfile_proof ";
        $sql .= "(DetailProfId, RegVitalId, Filename, Size, Ket)";
        $sql .= "values ( ";
        $sql .= " '" . $id . "', ";
        $sql .= " '" . $_POST['ids'] . "', ";
        $sql .= " '" . $pathDB.$_FILES['txtfdata']['name']."', ";
        $sql .= " '" . $_FILES['txtfdata']['size']."', ";
        $sql .= " 'data' ";
        $sql .= " ) ";
        mysqli_query($connect, $sql) or die ('error 1E');
        $target_file = $path . basename($_FILES['txtfdata']['name']);
        $tmpfiles = $_FILES["txtfdata"]["tmp_name"];
        if (!file_exists($target_file))
            move_uploaded_file($tmpfiles, $target_file);
     }


   die("sukses");
  } catch (Exception $e) {
       die('error');
       return false;
   }
}

 if($task=='del'){
  try{
    $sql = "Select DetVFileId, Filename from detailvitalfile_proof where DetailProfId ='".$id."' ";
    $result = mysqli_query($connect, $sql);
    while($data=mysqli_fetch_array($result)){
      $target_file = "../../".$data['Filename'];
      if (file_exists($target_file)){
         unlink($target_file);
         $sqlA = "DELETE FROM detailvitalfile_proof WHERE DetVFileId = '".$data['DetVFileId']."' ";
         mysqli_query($connect, $sqlA)or die ("error");
      }
      $sqlA = "DELETE FROM detailvitalmeta_proof WHERE DetailProfId ='".$id."'";
      mysqli_query($connect, $sqlA)or die ("error");
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

   $sql = "SELECT * from v_metaproof ";
   $sql .= "where DetailProfId = '".$_REQUEST['id']."' ";
   $result = mysqli_query($connect, $sql);
    while($obj = mysqli_fetch_object($result)){
     $arr['meta'][] = $obj;
    }

   $sql = "SELECT * from detailvitalfile_proof ";
   $sql .= "where DetailProfId = '".$_REQUEST['id']."' Order By Ket asc ";
   $result = mysqli_query($connect, $sql);
   while($obj = mysqli_fetch_object($result)){
     $arr['img'][] = $obj;
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
    $path = "../../".$rowp['Filename'];
        if(file_exists($path)){
			unlink($path);
        }
            $sql = "DELETE FROM detailvitalfile_proof where DetVFileId = '".$id."' ";
            mysqli_query($connect, $sql)or die ("error");

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