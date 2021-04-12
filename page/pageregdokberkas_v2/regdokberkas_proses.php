<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['idb']))
    $idb = $_POST['idb'];

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
   if($_POST['request']!="subberkas"){
    $sql = "select max(Nomor) as N ";
    $sql .= "from berkas_v2 where RoleId = '".$_SESSION['RoleId']."' ";

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
      $sql .= "from berkas_v2 where (ParrentBerkasId = '".$idb."' or BerkasId = '".$idb."') and RoleId = '".$_SESSION['RoleId']."' ";
      $result = mysqli_query($connect,$sql);
      $nosub = mysqli_fetch_array($result);
      $noberkas = $nosub['Nomor'].".".$nosub['subberkas'];
    //$noberkas = $_POST['nosubberkas'];

   }
    if($_SESSION['RoleId']!='UK')
        $RoleId = $_SESSION['RoleId'];
    else
        $RoleId = $data[2];

    $sql = "SELECT CodeRole FROM role Where RoleId = '".$RoleId."' ";
    $result = mysqli_query($connect, $sql);
    $subf = mysqli_fetch_array($result);
    $pathDB = "Upload_Files/".$subf[0]."/vsetkol_".$noberkas."/";
    $path = "../../Upload_Files/".$subf[0]."/vsetkol_".$noberkas."/";


    $sql = "Insert Into berkas_v2";
    $sql .= "(";

    if($_POST['request']=="subberkas")
      $sql .= "ParrentBerkasId, ";

    $sql .= " KodeReg, Nomor, ClId, RoleId, Uraian, KurunWaktu, Jumlah, TPId,
              MediaId, KondisId, Keterangan, Gedung, Lemari, Baris, Boks, StatusDok, SubBerkas, Path, TglReg, Operator) value ( ";

    $subberkas = "";
    if($_POST['request']=="subberkas"){
      $sql .= " '" .$_POST['idb']. "', ";
      $subberkas = 'sub';
    }

    $sql .= " '" . $_POST['codereg'] . "', ";
    $sql .= " '" . $noberkas . "', ";
    $sql .= " '" . $data[1] . "', ";
    $sql .= " '" . $RoleId . "', ";
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
    $sql .= " '". $subberkas ."', ";
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
   $sql  = "update berkas_v2 set ";
   $sql .= "ClId = '".$data[1]."', ";

   if($_SESSION['RoleId']!='UK')
        $sql .= " RoleId = '" . $_SESSION['RoleId'] . "', ";
    else
        $sql .= " RoleId = '" . $data[2] . "', ";

   $sql .= "Uraian = '".$data[3]."', ";
   $sql .= "KurunWaktu = '".$data[4]."', ";
   $sql .= "Jumlah = '".$data[5]."', ";
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
    $sql = "select Path from berkas_v2 where BerkasId = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    $row = mysqli_fetch_array($result);
    $pathdb = "../../".substr($row['Path'],0,-1);
    if (is_dir($pathdb)) {
      rmdir($pathdb);

    $sql = "DELETE FROM berkas_v2 WHERE BerkasId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error");
   }
    loguser($sql);
    die("sukses");
  } catch (Exception $e){
    die('error');
  }
 }


 if($task=='load'){
   $sql = "SELECT * from berkas_v2 where BerkasId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr). '}';
 }

  if($task=='loadberkas'){
   $nomor = "";
   $sql = "SELECT klasifikasi.ClCode, berkas_v2.Nomor, berkas_v2.Uraian
           FROM berkas_v2
           INNER JOIN klasifikasi ON klasifikasi.ClId = berkas_v2.ClId
           WHERE berkas_v2.BerkasId = '".$id."' ";
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