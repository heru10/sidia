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
   $ItemId = "";
   if(isset($_POST['chk'])){
    foreach($_POST['chk'] as $item){
      $BerkasId .= $item.'|';
      $it = "";
      $a=1;
      if(isset($_POST['chks'][$item])){
        foreach($_POST['chks'][$item] as $items){
          $it .= $items.'|';
        }
          $it = substr($it,0,-1);
      }
      $ItemId .= $it.",";
    }
      $ItemId = substr($ItemId,0,-1);

      $BerkasId = substr($BerkasId,0,-1);
   } else {
     die("doknotfound");
   }


    $sql = "select (max(PeminjamanId)+1) as id ";
    $sql .= "from peminjaman ";
    $result = mysqli_query($connect, $sql);
    $jm = mysqli_num_rows($result);
    $row = mysqli_fetch_array($result);

    if(!empty($row['id']))
      $metaid = $row['id'];
    else
      $metaid = '1';

    $reservation = explode("-",$_POST['reservation']);

    $sql = "insert into peminjaman ";
    $sql .= "(PeminjamanId, TglPinjam, Nip, Nama, Uraian, RoleId_From, RoleId_To, StatusPinjam, ApproveDate,
              ArsipPinjam, Item, Keterangan, DateRange1, DateRange2) ";
    $sql .= "values ( ";
    $sql .= $metaid.", ";
    $sql .= " '" . date('Y-m-d H:i:s') . "', ";
    $sql .= " '" . $data[1] . "', ";
    $sql .= " '" . $data[2] . "', ";
    $sql .= " '" . $data[3] . "', ";
    $sql .= " '" . $_SESSION['RoleId'] . "', ";
    $sql .= " '" . $data[4] . "', ";
    $sql .= " '0', ";
    $sql .= " '', ";
    $sql .= " '" . $BerkasId . "', ";
    $sql .= " '" . $ItemId . "', ";
    $sql .= " '" . $data[5] . "', ";
    $sql .= " '".str_replace(' ','',mkdate($reservation[0]))."', '".str_replace(' ','',mkdate($reservation[1]))."')";
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
   $ItemId = "";
   if(isset($_POST['chk'])){
    foreach($_POST['chk'] as $item){
      $BerkasId .= $item.'|';
      $it = "";
      $a=1;
      if(isset($_POST['chks'][$item])){
        foreach($_POST['chks'][$item] as $items){
          $it .= $items.'|';
        }
          $it = substr($it,0,-1);
      }
      $ItemId .= $it.",";
    }
      $ItemId = substr($ItemId,0,-1);

      $BerkasId = substr($BerkasId,0,-1);
   } else {
     die("doknotfound");
   }

   $reservation = explode("-",$_POST['reservation']);

   $sql  = "update peminjaman set ";
   $sql .= " Nip = '".$data[1]."', ";
   $sql .= " Nama = '".$data[2]."', ";
   $sql .= " Uraian = '".$data[3]."', ";
   $sql .= " RoleId_To = '".$data[4]."', ";
   $sql .= " ArsipPinjam = '".$BerkasId."', ";
   $sql .= " Keterangan = '".$data[5]."', ";
   $sql .= " Item = '".$ItemId."', ";
   $sql .= " DateRange1 = '".str_replace(' ','',mkdate($reservation[0]))."', ";
   $sql .= " DateRange2 = '".str_replace(' ','',mkdate($reservation[1]))."' ";
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
    $sql = "DELETE FROM peminjaman WHERE PeminjamanId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error2");
    loguser($sql);
    die("sukses");
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=='load'){
   $sql = "SELECT * from v_peminjaman where PeminjamanId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   while($obj = mysqli_fetch_object($result)){
     $arr['meta'] = $obj;
    }
   echo '{"items":'. json_encode($arr).'}';
 }

mysqli_close($connect);
?>