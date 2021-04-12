<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['idx']))
    $idb = $_POST['idx'];

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
    $sql  = "select * from dokumen_v2 ";
	$sql .= "WHERE ClId = '".$_POST['txt1']."' and Nomor_Dok = '".$_POST['txt3']."' ";
	$result = mysqli_query($connect, $sql);
	if (mysqli_num_rows($result) > 0){
		die('found');
		return false;
	}

    $sql = "select (max(DokumenId)+1) as id ";
    $sql .= "from dokumen_v2 ";
    $result = mysqli_query($connect, $sql);
    $jm = mysqli_num_rows($result);
    $row = mysqli_fetch_array($result);

    if(!empty($row['id']))
      $metaid = $row['id'];
    else
      $metaid = '1';

    $sql = "insert into dokumen_v2 ";
    $sql .= "(DokumenId, BerkasId, KodeReg, ClId, JenisId, Tgl_Dok, Nomor_Dok, Uraian, Jumlah, SatuanId,
              TPId, MediaId, KondisiId, Keterangan, Operator, WaktuReg) ";
    $sql .= "values ( ";
    $sql .= $metaid.", ";
    $sql .= " '" . $_POST['idberkas'] . "', ";
    $sql .= " '" . $_POST['codereg'] . "', ";
    $sql .= " '" . $data[1] . "', ";
    $sql .= " '" . $data[2] . "', ";
    $sql .= " '" . mkdate($data[3]) . "', ";
    $sql .= " '" . $data[4] . "', ";
    $sql .= " '" . $data[5] . "', ";
    $sql .= " '" . $data[6] . "', ";
    $sql .= " '" . $data[7] . "', ";
    $sql .= " '" . $data[8] . "', ";
    $sql .= " '" . $data[9] . "', ";
    $sql .= " '" . $data[10] . "', ";
    $sql .= " '" . $data[11] . "', ";
    $sql .= " '".$_SESSION['PeopleId']."', ";
    $sql .= " '" . date('Y-m-d H:i:s') . "' ";
    $sql .= " )";
    //die ($sql);
    mysqli_query($connect, $sql) or die ('error 1');
    loguser($sql);
    //$sql = "select CodeRole from role where RoleId = '".$data[9]."' ";
//    $folderx = mysqli_fetch_array(mysqli_query($connect, $sql));
    $i=0;
    foreach($_FILES['myfiles']['name'] as $ofiles){

     if(!empty($ofiles)){
        $enskripf = explode(".", $ofiles);
        $filex = md5($enskripf[0]).'.'.$enskripf[1];
//        if($_SESSION['RoleId']=='UK'){
//           $sql = "select CodeRole from role where RoleId = '".$data[3]."' ";
//           $result = mysqli_query($connect, $sql);
//           $Cfolder = mysqli_fetch_array($result);
//           $target_dir = "../../Upload_Files/".$Cfolder['CodeRole']."/";
//
//        } else
//        $target_dir = "../../Upload_Files/".$_SESSION['CodeRole']."/";

        $sql = "select Path From berkas_v2 where BerkasId = '".$_POST['idberkas']."' ";
        $result = mysqli_query($connect, $sql);
        $path_dir = mysqli_fetch_array($result);

        $target_dir = "../../".$path_dir['Path'];
        $target_file = $target_dir . basename($ofiles);
        $tmpfiles = $_FILES["myfiles"]["tmp_name"][$i];

        if (!is_dir($target_dir))
            mkdir($target_dir,0777);

        if (!file_exists($target_file)){
          move_uploaded_file($tmpfiles, $target_file);

        $sql  = "insert into filesdigital_v2(DokumenId, KodeReg, Filename, FileSize, EnskripFile, FolderName, TglReg) values( ";
        $sql .= " '".$metaid."', ";
        $sql .= " '".$_POST['codereg']."', ";
        $sql .= " '".str_replace('../../','',$target_dir).$ofiles."', ";
        $sql .= " '".$_FILES["myfiles"]["size"][$i]."', ";
        $sql .= " '".$filex."', ";
        $sql .= " '".$data[10]."', ";
        $sql .= " '".date('Y-m-d H:i:s')."' )";
        //die($sql);
         mysqli_query($connect, $sql) or die ('error');
        }
        $i++;
     }
    }
    loguser($sql);
    die("sukses");
   } catch (Exception $e) {
       die('error');
       return false;
   }

 }

 if($task=='edit'){
  $id = $_POST['idx'];
  try{
   $sql  = "update dokumen_v2 set ";
   $sql .= "ClId = '".$data[1]."', ";
   $sql .= "JenisId = '".$data[2]."', ";
   $sql .= "BerkasId = '".$_POST['berkas']."', ";
   $sql .= "Tgl_Dok = '".mkdate($data[3])."', ";
   $sql .= "Nomor_Dok = '".$data[4]."', ";
   $sql .= "Uraian = '".$data[5]."', ";
   $sql .= "Jumlah = '".$data[6]."', ";
   $sql .= "SatuanId = '".$data[7]."', ";
   $sql .= "TPId = '".$data[8]."', ";
   $sql .= "MediaId = '".$data[9]."', ";
   $sql .= "KondisiId = '".$data[10]."', ";
   $sql .= "Keterangan = '".$data[11]."' ";
   $sql .= "where DokumenId = '".$id."' ";

   mysqli_query($connect, $sql)or die ("error");
   loguser($sql);

   $i=0;
    foreach($_FILES['myfiles']['name'] as $ofiles){

     if(!empty($ofiles)){
        $enskripf = explode(".", $ofiles);
        $filex = md5($enskripf[0]).'.'.$enskripf[1];

        $sql = "select Path From berkas_v2 where BerkasId = '".$_POST['berkas']."' ";
        $result = mysqli_query($connect, $sql);
        $path_dir = mysqli_fetch_array($result);

        $target_dir = "../../".$path_dir['Path'];
        $target_file = $target_dir . basename($ofiles);
        $tmpfiles = $_FILES["myfiles"]["tmp_name"][$i];

        if (!is_dir($target_dir))
            mkdir($target_dir,0777);

        if (!file_exists($target_file))
         move_uploaded_file($tmpfiles, $target_file);

        $sql  = "insert into filesdigital_v2(DokumenId, KodeReg, Filename, FileSize, EnskripFile, FolderName, TglReg) values( ";
        $sql .= " '".$id."', ";
        $sql .= " '".$_POST['codereg']."', ";
        $sql .= " '".str_replace('../../','',$target_dir).$ofiles."', ";
        $sql .= " '".$_FILES["myfiles"]["size"][$i]."', ";
        $sql .= " '".$filex."', ";
        $sql .= " '".$data[10]."', ";
        $sql .= " '".date('Y-m-d H:i:s')."' )";

        mysqli_query($connect, $sql) or die ('error');
        $i++;
     }
    }
   loguser($sql);
   die("sukses");
  } catch (Exception $e) {
       die('error');
       return false;
   }
}

 if($task=='del'){
  $id = $_POST['id'];
  try{
    $sql = "Select Filename from filesdigital_v2 where DokumenId ='".$id."' ";
    $result = mysqli_query($connect, $sql);
    while($data=mysqli_fetch_array($result)){
      $target_file = '../../'.$data['Filename'];
      if (file_exists($target_file)){
         unlink($target_file);
         $sqlA = "DELETE FROM filesdigital_v2 WHERE DokumenId ='".$id."'";
         mysqli_query($connect, $sqlA)or die ("error1");
      }

    }
    $sql = "DELETE FROM dokumen_v2 WHERE DokumenId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error2");
    loguser($sql);
    die("sukses");
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=="delfile"){
   $id = $_POST['id'];
   try{
    $sql = "SELECT Filename, FilesId FROM filesdigital_v2
            WHERE FilesId = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    $rowp = mysqli_fetch_array($result);
    $regId = $rowp['FilesId'];
    $path = "../../".$rowp['Filename'];
        if(file_exists($path)){
			unlink($path);
        }
   $sql = "DELETE FROM filesdigital_v2 where FilesId = '".$id."' ";
   mysqli_query($connect, $sql)or die ("error");
   loguser($sql);
   } catch (Exception $e){
    die('error');
   }
  }

 if($task=='load'){
   $arr = array();
   $id = $_POST['id'];
   $sql = "SELECT * from dokumen_v2 where DokumenId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   while($obj = mysqli_fetch_object($result)){
     $arr['meta'][] = $obj;
    }

   $sql = "SELECT * from filesdigital_v2 ";
   $sql .= "where DokumenId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   if(mysqli_num_rows($result)!= 0){
   while($obj = mysqli_fetch_object($result)){
     $arr['img'][] = $obj;
   }
  }

   echo '{"items":'. json_encode($arr).'}';

 }




 //close connection
 mysqli_close($connect);
?>