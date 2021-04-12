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
    $sql = "select (max(RegVitalId)+1) as id ";
    $sql .= "from regarsipvital";
    $result = mysqli_query($connect, $sql);
    $jm = mysqli_num_rows($result);
    $row = mysqli_fetch_array($result);

    if(!empty($row['id']))
     $bvitalid = $row['id'];
    else
      $bvitalid = '1';

    $sql = "Insert Into regarsipvital ";
    $sql .= "(RegVitalId, KodeReg, KatProdukId, JProdukId,  DetailProdukId,
              ClId, RoleId, Uraian, KodeId, Tahun, TPId, MediaId, KondisiId, Dept,
              Tgl_Reg, Operator) ";
    $sql .= "values( ";
    $sql .= " '". $bvitalid ."', ";
    $sql .= " '" . $_POST['codereg'] . "', ";
    $sql .= " '" . $data[1] . "', ";
    $sql .= " '" . $data[2] . "', ";
    $sql .= " '" . $data[3] . "', ";
    $sql .= " '" . $data[4] . "', ";

    if($_SESSION['RoleId']!='UK')
        $sql .= " '" . $_SESSION['RoleId'] . "', ";
    else
        $sql .= " '" . $data[5] . "', ";

    $sql .= " '" . $data[6] . "', ";
    $sql .= " '" . $data[7] . "', ";
    $sql .= " '" . $data[8] . "', ";
    $sql .= " '" . $data[9] . "', ";
    $sql .= " '" . $data[10] . "', ";
    $sql .= " '" . $data[11] . "', ";
    $sql .= " 'dalitas', ";
//    $sql .= " '" . $data[12] . "', ";
//    $sql .= " '" . $data[13] . "', ";
    $sql .= " '" . date('Y-m-d H:i:s') . "', ";
    $sql .= " '".$_SESSION['PeopleId']."' ";
    $sql .= " )";
    //die ($sql);
    mysqli_query($connect, $sql) or die ('error 1');
    loguser($sql);
     die("sukses");
   } catch (Exception $e) {
       die('error');
       return false;
   }

 }

 if($task=='edit'){
  try{
   $sql  = "update regarsipvital set ";
   $sql .= "KatProdukId = '".$data[1]."', ";
   $sql .= "JProdukId = '".$data[2]."', ";
   $sql .= "DetailProdukId = '".$data[3]."', ";
   $sql .= "ClId = '".$data[4]."', ";

   //if($_SESSION['PeopleTipe']!=3)
   //$sql .= "RoleId = '".$data[5]."', ";

   if($_SESSION['RoleId']!='UK')
      $sql .= " RoleId = '" . $_SESSION['RoleId'] . "', ";
   else
      $sql .= " RoleId = '" . $data[5] . "', ";

   $sql .= "Uraian = '".$data[6]."', ";
   $sql .= "KodeId = '".$data[7]."', ";
   $sql .= "Tahun = '".$data[8]."', ";
   $sql .= "TPId = '".$data[9]."', ";
   $sql .= "MediaId = '".$data[10]."', ";
   $sql .= "KondisiId = '".$data[11]."', ";
   $sql .= "Jumlah = '".$data[12]."', ";
   $sql .= "SatuanId = '".$data[13]."', ";
   $sql .= "Operator = '".$_SESSION['PeopleId']."', ";
   $sql .= "Tgl_Reg = '".date('Y-m-d H:i:s')."' ";
   $sql .= "where RegVitalId = '".$id."' ";
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
    $sql = "DELETE FROM regarsipvital WHERE RegVitalId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error");
    loguser($sql);
    die("sukses");
  } catch (Exception $e){
    die('error');
  }
 }

 if($task=='load'){
   $sql = "SELECT * from regarsipvital where RegVitalId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr). '}';
 }

 if($task=='loadjp'){
    $sql = "select JProdukId, JProdukName from master_jproduk where StatusAct = '1' and KatProdukId = '".$id."' ";
    $result = mysqli_query($connect, $sql);
       echo '<option value=""> - Pilih Jenis Produk - </option>';
       while($rows = mysqli_fetch_array($result)){
         if($_REQUEST['idjp']==$rows['JProdukId'])
           echo "<option value='".$rows['JProdukId']."' selected>".$rows['JProdukName']."</option>";
         else
          echo "<option value='".$rows['JProdukId']."'>".$rows['JProdukName']."</option>";
    }
  }

    if($task=='loaddp'){
    $idjp = $_POST['idjp'];
    $idkp = $_POST['idkp'];
    $sql = "select DetailProdukId, DetailProdukName from master_detailproduk where StatusAct = '1' and JProdukId = '".$idjp."' and KatProdukId = '".$idkp."' ";
    $result = mysqli_query($connect, $sql);
       echo '<option value=""> - Pilih Detail Produk - </option>';
       while($rows = mysqli_fetch_array($result)){
        if($_REQUEST['iddp']==$rows['DetailProdukId'])
         echo "<option value='".$rows['DetailProdukId']."' selected>".$rows['DetailProdukName']."</option>";
        else
         echo "<option value='".$rows['DetailProdukId']."'>".$rows['DetailProdukName']."</option>";
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