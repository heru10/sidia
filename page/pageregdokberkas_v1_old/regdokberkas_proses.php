<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['id']))
    $id = $_POST['id'];

  if(isset($_REQUEST['req']))
    $req = $_REQUEST['req'];

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
   if($req!="sub"){
    $sql = "select Max(Nomor) as N ";
    $sql .= "from berkas_v1 where RoleId = '".$_SESSION['RoleId']."' ";
    $result = mysqli_query($connect, $sql);
    $row = mysqli_fetch_array($result);
    if(!empty($row["N"])){
      $noberkas = intval($row["N"])+1;
      $lnoberkas = strlen($noberkas);
      if($lnoberkas==1)
         $noberkas = "00".$noberkas;
      if($lnoberkas==2)
         $noberkas = "0".$noberkas;
    }else
      $noberkas = '001';
   } else {
      $sql = "select count(Nomor) as subberkas, Nomor ";
      $sql .= "from berkas_v1 where (ParrentBerkasId = '".$id."' or BerkasId = '".$id."') and RoleId = '".$_SESSION['RoleId']."' ";
      $result = mysqli_query($connect,$sql);
      $nosub = mysqli_fetch_array($result);
      $noberkas = $nosub['Nomor'].".".$nosub['subberkas'];
   }

    if($_SESSION['RoleId']!='UK')
        $RoleId = $_SESSION['RoleId'];
    else
        $RoleId = $data[2];

    $sql = "SELECT CodeRole FROM role Where RoleId = '".$RoleId."' ";
    $result = mysqli_query($connect, $sql);
    $subf = mysqli_fetch_array($result);
    $pathDB = "Upload_Files/".$subf[0]."/vosdm_".$noberkas."/";
    $path = "../../Upload_Files/".$subf[0]."/vosdm_".$noberkas."/";


    $sql = "Insert Into berkas_v1";
    $sql .= "(";

    if($_POST['req']=="sub")
      $sql .= "ParrentBerkasId, ";

    $sql .= " KodeReg, Nomor, ClId, RoleId, Nip, Uraian, KurunWaktu, Jumlah, TPId,
              MediaId, KondisId, Keterangan, Gedung, Lemari, Baris, Boks, StatusDok, SubBerkas, Path, TglReg, Operator) value ( ";

    if($_POST['req']=="sub")
      $sql .= " '" .$_POST['id']. "', ";

    $sql .= " '" . $_POST['codereg'] . "', ";
    $sql .= " '" . $noberkas . "', ";
    $sql .= " '" . $data[1] . "', ";
    $sql .= " '" . $RoleId . "', ";
    if($_POST['req']!="sub")
      $sql .= " '" . $_POST['txtnip'] . "', ";
    else {
      $sql .= " '-', ";
      $data[3] = $_POST['txt3A'];
    }
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
    $sql .= " 'aktif', ";

    if($_POST['req']=="sub")
      $sql .= " 'sub', ";
    else
      $sql .= " '". $_POST['txtberkas'] ."', ";

    $sql .= " '" . $pathDB . "', ";
    $sql .= " '" . date('Y-m-d H:i:s') . "', ";
    $sql .= " '".$_SESSION['PeopleId']."' ";
    $sql .= " )";
    //die($sql);
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
   $sql  = "update berkas_v1 set ";
   $sql .= "ClId = '".$data[1]."', ";

   if($_SESSION['RoleId']!='UK')
        $sql .= " RoleId = '" . $_SESSION['RoleId'] . "', ";
    else
        $sql .= " RoleId = '" . $data[2] . "', ";

   if($req!='sub'){
   $sql .= "Nip = '".$_POST['txtnip']."', ";
   $sql .= "Uraian = '".$data[3]."', ";
   } else {
   $sql .= "Nip = '-', ";
   $sql .= "Uraian = '".$_POST['txt3A']."', ";
   }
//   $sql .= "KurunWaktu = '".$data[4]."', ";
//   $sql .= "Jumlah = '".$data[5]."', ";
   $sql .= "TPId = '".$data[6]."', ";
   $sql .= "MediaId = '".$data[7]."', ";
   $sql .= "KondisId = '".$data[8]."', ";
   $sql .= "Keterangan = '".$data[9]."', ";
   $sql .= "Gedung = '".$data[10]."', ";
   $sql .= "Lemari = '".$data[11]."', ";
   $sql .= "Baris = '".$data[12]."', ";
   $sql .= "Boks = '".$data[13]."', ";
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
    $sql = "select Path from berkas_v1 where BerkasId = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    $row = mysqli_fetch_array($result);
    $pathdb = "../../".substr($row['Path'],0,-1);
    if (is_dir($pathdb)) {
      rmdir($pathdb);

    $sql = "DELETE FROM berkas_v1 WHERE BerkasId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error");
   }
    loguser($sql);
    die("sukses");
  } catch (Exception $e){
    die('error');
  }
 }


 if($task=='load'){
   $sql = "SELECT * from berkas_v1 where BerkasId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr). '}';
 }

  if($task=='loadberkas'){
   $nomor = "";
   $sql = "SELECT klasifikasi.ClCode, berkas_v1.Nomor, berkas_v1.Uraian
           FROM berkas_v1
           INNER JOIN klasifikasi ON klasifikasi.ClId = berkas_v1.ClId
           WHERE berkas_v1.BerkasId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   $row=mysqli_fetch_array($result);
      $ceknomor = explode(".",$row['Nomor']);
      $count = count($ceknomor)-1;
      if(empty($ceknomor[$count]) or $count==0)
        $cp = 0;
      else
        $cp = $ceknomor[$count];
      echo $row['ClCode']."#".$row['Nomor']."#".$row['Uraian']."#".$cp;
   }


 //close connection
 mysqli_close($connect);
?>