<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['id']))
    $id = $_POST['id'];

  if(isset($_REQUEST['id']))
    $id = $_REQUEST['id'];

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

   if($_SESSION['RoleId']!='UK')
        $RoleId = $_SESSION['RoleId'];
    else
        $RoleId = $data[4];


    $noberkas = $_POST['txtnomor'];

    $sql = "SELECT CodeRole FROM role Where RoleId = '".$_SESSION['RoleId']."' ";
    $result = mysqli_query($connect, $sql);
    $subf = mysqli_fetch_array($result);
    $pathDB = "Upload_Files/".$subf[0]."/xdok_".$noberkas."/";
    $path = "../../Upload_Files/".$subf[0]."/xdok_".$noberkas."/";


    $sql = "select (max(BerkasId)+1) as id ";
    $sql .= "from berkas";
    $result = mysqli_query($connect, $sql);
    $jm = mysqli_num_rows($result);
    $row = mysqli_fetch_array($result);

    if(!empty($row['id']))
     $metaid = $row['id'];
    else
      $metaid = '1';

    $sql = "Insert Into berkas";
    $sql .= "(BerkasId, KodeReg, Nomor, ClId, RetensiInAktif, RoleId, Uraian, KurunWaktu, Jumlah, TPId,
MediaId, KondisId, Keterangan, Gedung, Lemari, Baris, Boks, StatusDok, Path, TglReg, Operator) ";
    $sql .= "values( ";
    $sql .= " '" . $metaid . "', ";
    $sql .= " '" . $_POST['codereg'] . "', ";
    $sql .= " '" . $noberkas . "', ";
    $sql .= " '" . $data[1] . "', ";
    $sql .= " '" . mkdate($data[3]) . "', ";

    if($_SESSION['RoleId']!='UK')
        $sql .= " '" . $_SESSION['RoleId'] . "', ";
    else
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
    $sql .= " 'inaktif', ";
    $sql .= " '" . $pathDB . "', ";
    $sql .= " '" . date('Y-m-d H:i:s') . "', ";
    $sql .= " '".$_SESSION['PeopleId']."' ";
    $sql .= " )";
    mysqli_query($connect, $sql) or die ('error 1');

    if (!is_dir($path))
      mkdir($path,0777);

    loguser($sql);
    die("sukses");
   } catch (Exception $e) {
       die('error');
       return false;
   }

 }

 if($task=='edit'){
//   BerkasId, KodeReg, ClId, RetensiInAktif, RoleId, Uraian, KurunWaktu, Jumlah, TPId,
//   MediaId, KondisId, Keterangan, , , Baris, Boks, StatusDok
  try{
   $sql  = "update berkas set ";
   $sql .= "RetensiInAktif = '".mkdate($data[3])."', ";
   $sql .= "ClId = '".$data[1]."', ";

   if($_SESSION['RoleId']!='UK')
        $sql .= " RoleId = '" . $_SESSION['RoleId'] . "', ";
    else
        $sql .= " RoleId = '" . $data[4] . "', ";

   $sql .= "Uraian = '".$data[5]."', ";
   $sql .= "KurunWaktu = '".$data[6]."', ";
   $sql .= "Jumlah = '".$data[7]."', ";
   $sql .= "TPId = '".$data[8]."', ";
   $sql .= "MediaId = '".$data[9]."', ";
   $sql .= "KondisId = '".$data[10]."', ";
   $sql .= "Keterangan = '".$data[11]."', ";
   $sql .= "Gedung = '".$data[12]."', ";
   $sql .= "Lemari = '".$data[13]."', ";
   $sql .= "Baris = '".$data[14]."', ";
   $sql .= "Boks = '".$data[15]."', ";
   $sql .= "Operator = '".$_SESSION['PeopleId']."', ";
   $sql .= "TglReg = '".date('Y-m-d H:i:s')."' ";
   $sql .= "where BerkasId = '".$id."' ";
   //die($sql);
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
  $sql = "select Path from berkas where BerkasId = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    $row = mysqli_fetch_array($result);
    $pathdb = "../../".substr($row['Path'],0,-1);
    if (is_dir($pathdb)) {
      rmdir($pathdb);
   }
    $sql = "DELETE FROM berkas WHERE BerkasId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error");
    loguser($sql);
    die("sukses");
  } catch (Exception $e){
    die('error');
  }
 }

// if($task="loadretensi"){
//   $sql = "select RetensiThn_Active from klasifikasi where ClId = '".$_REQUEST['idx']."' ";
//   $result = mysqli_query($connect, $sql) or die ("error");
//   $ThnRetensi = mysqli_fetch_array($result);
//   echo $datenow = date('d/m/Y',strtotime('+'.$ThnRetensi[0].' year'));
//
// }


 if($task=='load'){
   $sql = "SELECT * from berkas where BerkasId = '".$id."' ";
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