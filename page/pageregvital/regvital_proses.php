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
    $sql  = "select * from metadata_dok ";
	$sql .= "WHERE Nomor = '".$_POST['txt1']."' ";
	$result = mysqli_query($connect, $sql);
	if (mysqli_num_rows($result) > 0){
		die('found');
		return false;
	}

    $sql = "select (max(MetaId)+1) as id ";
    $sql .= "from metadata_dok";
    $result = mysqli_query($connect, $sql);
    $jm = mysqli_num_rows($result);
    $row = mysqli_fetch_array($result);

    if(!empty($row['id']))
     $metaid = $row['id'];
    else
      $metaid = '1';


    $sql = "Insert Into metadata_dok";
    $sql .= "(MetaId, KodeReg, Tgl, Nomor, RoleId, JProdukId, KatProdukId, Tahun, Uraian, Jumlah, SatuanId,
              BerkasId, TpId, AksesPublik, MediaId, Tesaurus, Ket, Operator, WaktuReg)";
    $sql .= "values( ";
    $sql .= " '".$metaid."', ";
    $sql .= " '" . $_POST['codereg'] . "', ";
    $sql .= " '" . mkdate($data[1]) . "', ";
    $sql .= " '" . $data[2] . "', ";

    if($_SESSION['RoleId']!='UK')
        $sql .= " '" . $_SESSION['RoleId'] . "', ";
    else
        $sql .= " '" . $data[3] . "', ";

    $sql .= " '" . $data[4] . "', ";
    $sql .= " '" . $data[5] . "', ";
    $sql .= " '" . $data[6] . "', ";
    $sql .= " '" . $data[7] . "', ";
    $sql .= " '" . $data[8] . "', ";
    $sql .= " '" . $data[9] . "', ";
    $sql .= " '" . $data[10] . "', ";
    $sql .= " '" . $data[11] . "', ";
    $sql .= " '" . $data[12] . "', ";
    $sql .= " '" . $data[13] . "', ";
    $sql .= " '" . $data[14] . "', ";
    $sql .= " '" . $data[15] . "', ";
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
        if($_SESSION['RoleId']=='UK'){
           $sql = "select CodeRole from role where RoleId = '".$data[3]."' ";
           $result = mysqli_query($connect, $sql);
           $Cfolder = mysqli_fetch_array($result);
           $target_dir = "../../Upload_Files/".$Cfolder['CodeRole']."/";

        } else
        $target_dir = "../../Upload_Files/".$_SESSION['CodeRole']."/";

        $target_file = $target_dir . basename($ofiles);
        $tmpfiles = $_FILES["myfiles"]["tmp_name"][$i];
        $sizefiles = $_FILES["myfiles"]["size"][$i];
         move_uploaded_file($tmpfiles, $target_file);

        $sql  = "insert into filesdigital(MetaId, KodeReg, Filename, EnskripFile, FolderName, TglReg, FileSize) values( ";
        $sql .= " '".$metaid."', ";
        $sql .= " '".$_POST['codereg']."', ";
        $sql .= " '".$ofiles."', ";
        $sql .= " '".$filex."', ";
        $sql .= " '".$data[10]."', ";
        $sql .= " '".date('Y-m-d H:i:s')."', ";
        $sql .= " '".$sizefiles."' )";
        //die($sql);
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

 if($task=='edit'){
  try{
   $sql  = "update metadata_dok set ";
   $sql .= "Tgl = '".mkdate($data[1])."', ";
   $sql .= "Nomor = '".$data[2]."', ";
   $sql .= "JProdukId = '".$data[4]."', ";
   $sql .= "KatProdukId = '".$data[5]."', ";
   $sql .= "Tahun = '".$data[6]."', ";
   $sql .= "Uraian = '".$data[7]."', ";
   $sql .= "Jumlah = '".$data[8]."', ";
   $sql .= "SatuanId = '".$data[9]."', ";
   $sql .= "BerkasId = '".$data[10]."', ";
   $sql .= "TpId = '".$data[11]."', ";
   $sql .= "AksesPublik = '".$data[12]."', ";
   $sql .= "MediaId = '".$data[13]."', ";
   $sql .= "Tesaurus = '".$data[14]."', ";
   $sql .= "Ket = '".$data[15]."', ";
   $sql .= "Operator = '".$_SESSION['PeopleId']."', ";
   $sql .= "WaktuReg = '".date('Y-m-d H:i:s')."' ";
   $sql .= "where MetaId = '".$id."' ";

   mysqli_query($connect, $sql)or die ("error");
   loguser($sql);
   $i=0;

   if(isset($_FILES['myfiles']['name'])){
    foreach($_FILES['myfiles']['name'] as $ofiles){

     if(!empty($ofiles)){
        $enskripf = explode(".", $ofiles);
        $filex = md5($enskripf[0]).'.'.$enskripf[1];

           $sql = "select CodeRole from role where RoleId = '".$_POST['txt3a']."' ";
           $result = mysqli_query($connect, $sql);
           $Cfolder = mysqli_fetch_array($result);
           $target_dir = "../../Upload_Files/".$Cfolder['CodeRole']."/";
           //die($target_dir);
        $target_file = $target_dir . basename($ofiles);
        $tmpfiles = $_FILES["myfiles"]["tmp_name"][$i];
        $sizefiles = $_FILES["myfiles"]["size"][$i];
         move_uploaded_file($tmpfiles, $target_file);

        $sql  = "insert into filesdigital(MetaId, KodeReg, Filename, EnskripFile, FolderName, TglReg, FileSize) values( ";
        $sql .= " '".$id."', ";
        $sql .= " '".$_POST['codereg']."', ";
        $sql .= " '".$ofiles."', ";
        $sql .= " '".$filex."', ";
        $sql .= " '".$data[10]."', ";
        $sql .= " '".date('Y-m-d H:i:s')."', ";
        $sql .= " '".$sizefiles."' )";
        //die($sql);
        mysqli_query($connect, $sql) or die ('error');
        $i++;
     }
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
  try{
    $sql = "SELECT role.CodeRole, filesdigital.Filename, filesdigital.FilesId FROM metadata_dok
            INNER JOIN filesdigital ON filesdigital.MetaId = metadata_dok.MetaId
            INNER JOIN role ON role.RoleId = metadata_dok.RoleId
            WHERE filesdigital.MetaId = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    while($rowp=mysqli_fetch_array($result)){
        $path = "../../Upload_Files/".$rowp['CodeRole']."/".$rowp['Filename'];
        if(file_exists($path)){
			unlink($path);
            $sql = "delete from filesdigital where FilesId = '".$rowp['FilesId']."' ";
            mysqli_query($connect, $sql)or die ("error");
        }
    }
    $sql = "DELETE FROM metadata_dok WHERE MetaId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error");
    loguser($sql);
    die("sukses");
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=='load'){
   $sql = "SELECT * from v_naskah_vital where MetaId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr). '}';
 }

  if($task=='loadfile'){
   $sql  = " SELECT role.CodeRole, filesdigital.Filename, filesdigital.FilesId, filesdigital.FileSize
             FROM metadata_dok
             INNER JOIN filesdigital ON filesdigital.MetaId = metadata_dok.MetaId
             INNER JOIN role ON role.RoleId = metadata_dok.RoleId ";
   $sql .= " where metadata_dok.MetaId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   $n = 1;
   $html = "";
   $total = 0;
   while($arrf = mysqli_fetch_array($result)){
     $html .= '<tr class="bg-warning">';
     $html .= '<td align="right">'.$n++.'.</td>';
     $html .= '<td>'.$arrf['Filename'].'</td>';
     $html .= '<td>'.filesize_formatted($arrf['FileSize']).'<button type="button" onclick="delfile('.$arrf['FilesId'].')" class="btn btn-danger btn-xs pull-right"><i class="fa fa-bitbucket"></i></button></td>';
     $html .= '</tr>';
     $total = $total + $arrf['FileSize'];
   }
   if($total != 0)
     $html .= "<tr class='bg-info'><td colspan=2 align='right'><b>Total File :</b> </td><td><strong>".filesize_formatted($total)."</strong></td></tr>";

   echo $html;
 }

  if($task=="delfile"){
   try{
    $sql = "SELECT role.CodeRole, filesdigital.Filename FROM metadata_dok
            INNER JOIN filesdigital ON filesdigital.MetaId = metadata_dok.MetaId
            INNER JOIN role ON role.RoleId = metadata_dok.RoleId
            WHERE filesdigital.FilesId = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    $rowp = mysqli_fetch_array($result);
    $path = "../../Upload_Files/".$rowp['CodeRole']."/".$rowp['Filename'];
        if(file_exists($path)){
			unlink($path);
            $sql = "delete from filesdigital where FilesId = '".$id."' ";
            mysqli_query($connect, $sql)or die ("error");
            loguser($sql);
            die("sukses");
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