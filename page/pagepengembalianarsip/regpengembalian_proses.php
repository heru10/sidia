<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_REQUEST['task']))
    $task = $_REQUEST['task'];

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

 $BerkasId = "";

if($task=='new'){
   try {

   if(isset($_POST['chk'])){
    foreach($_POST['chk'] as $item){
      $BerkasId .= $item.'|';
    }
      $BerkasId = substr($BerkasId,0,-1);
   } else {
     die("doknotfound");
   }
   $ItemId = "";
   if(isset($_POST['chks'])){
    foreach($_POST['chks'] as $item){
      $ItemId .= $item.'|';
    }
      $ItemId = substr($ItemId,0,-1);
   }

    $sql = "SELECT CodeRole FROM role Where RoleId = '".$_SESSION['RoleId']."' ";
    $result = mysqli_query($connect, $sql);
    $subf = mysqli_fetch_array($result);
    $pathDB = "Upload_Files/".$subf[0]."/permohonan/";
    $path = "../../Upload_Files/".$subf[0]."/permohonan/";

    if (!is_dir($path))
      mkdir($path,0777);

    $ofiles = $_FILES['myfiles']['name'];
    $target_file = $path . basename($ofiles);
    $tmpfiles = $_FILES["myfiles"]["tmp_name"];
    if (!file_exists($target_file))
      move_uploaded_file($tmpfiles, $target_file);

    $sql = "select (max(PeminjamanId)+1) as id ";
    $sql .= "from peminjaman_fisik ";
    $result = mysqli_query($connect, $sql);
    $jm = mysqli_num_rows($result);
    $row = mysqli_fetch_array($result);

    if(!empty($row['id']))
      $metaid = $row['id'];
    else
      $metaid = '1';

    $sql = "insert into peminjaman_fisik ";
    $sql .= "(PeminjamanId, TglPinjam, Nip, Nama, RoleId, RoleId_Reg,
              ArsipPinjam, Item, Keterangan, Filename, Catatan, Operator, StatusPinjam) ";
    $sql .= "values ( ";
    $sql .= $metaid.", ";
    $sql .= " '" . date('Y-m-d H:i:s') . "', ";
    $sql .= " '" . $data[1] . "', ";
    $sql .= " '" . $data[2] . "', ";
    $sql .= " '" . $data[3] . "', ";
    $sql .= " '" . $_SESSION['RoleId'] . "', ";
    $sql .= " '" . $BerkasId . "', ";
    $sql .= " '" . $ItemId . "', ";
    $sql .= " '" . $data[4] . "', ";
    $sql .= " '" . $pathDB.$ofiles . "', ";
    $sql .= " '" . $data[5] . "', ";
    $sql .= " '" . $_SESSION['PeopleId'] . "', '1' )";

    //die ($sql);
    mysqli_query($connect, $sql) or die ('error 1');
    loguser($sql);
    die("sukses");
   } catch (Exception $e) {
       die('error');
       return false;
   }

 }

 if($task=='menu'){
   $role = $_GET['roleid'];
   $sql = "select Menu from peopleakses where RoleId = '".$role." ' ";
   $result = mysqli_query($connect, $sql);
   $data = mysqli_fetch_array($result);
   echo $data['Menu'];
 }

//
 if($task=='edit'){
  try{

   if(isset($_POST['chk'])){
    foreach($_POST['chk'] as $item){
      $BerkasId .= $item.'|';
    }
      $BerkasId = substr($BerkasId,0,-1);
   } else {
     die("doknotfound");
   }

    $sql = "SELECT CodeRole FROM role Where RoleId = '".$_SESSION['RoleId']."' ";
    $result = mysqli_query($connect, $sql);
    $subf = mysqli_fetch_array($result);
    $pathDB = "Upload_Files/".$subf[0]."/permohonan/";
    $path = "../../Upload_Files/".$subf[0]."/permohonan/";

    $ofiles = $_FILES['myfiles']['name'];
    if(!empty($ofiles)){
    $target_file = $path . basename($ofiles);
    $tmpfiles = $_FILES["myfiles"]["tmp_name"];
    if (!file_exists($target_file))
      move_uploaded_file($tmpfiles, $target_file);
   }
   $ItemId = "";
   if(isset($_POST['chks'])){
    foreach($_POST['chks'] as $item){
      $ItemId .= $item.'|';
    }
      $ItemId = substr($ItemId,0,-1);
   }


   $sql  = "update peminjaman_fisik set ";
   $sql .= " Nip = '".$data[1]."', ";
   $sql .= " Nama = '".$data[2]."', ";
   $sql .= " RoleId = '".$data[3]."', ";
   $sql .= " Keterangan = '".$data[4]."', ";
   $sql .= " Catatan = '".$data[5]."', ";
   $sql .= " ArsipPinjam = '".$BerkasId."', ";
   $sql .= " Item = '".$ItemId."', ";

   if(!empty($ofiles))
     $sql .= "Filename = '".$pathDB.$ofiles."' ";

   $sql .= " Where PeminjamanId = '".$id."' ";
   //die($sql);
   mysqli_query($connect, $sql) or die ('error 2');
   loguser($sql);
   die("sukses");
  } catch (Exception $e) {
       die('error');
       return false;
   }
}
//
 if($task=='del'){
  try{
    $sql = "DELETE FROM peminjaman_fisik WHERE PeminjamanId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error2");
    loguser($sql);
    die("sukses");
  } catch (Exception $e){
    die('error');
  }
 }

  if($task=='back'){
  try{
    $sql = "update peminjaman_fisik set
           StatusPinjam = '0', Nip_B = '".$_POST['nip']."' ,Nama_B = '".$_POST['nama']."' ,
           Catatan_B = '".$_POST['catat']."', TglKembali = '".date('Y-m-d H:i:s')."'
           where PeminjamanId = '".$id."' ";

    mysqli_query($connect, $sql) or die ('error');
   die('sukses');
  }catch (Exception $e){
    die('error');
  }
 }


 if($task=='load'){
   $sql = "SELECT * from v_peminjaman_fisik where PeminjamanId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   while($obj = mysqli_fetch_object($result)){
     $arr['meta'] = $obj;
    }
   echo '{"items":'. json_encode($arr).'}';
 }

 mysqli_close($connect);
?>