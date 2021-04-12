<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];

  if(isset($_POST['id']))
    $id = $_POST['id'];

  if(isset($_POST['count'])){
  $count_input = $_POST['count'];
  for($i=1;$i<=$count_input;$i++){
     if(!isset($_POST['txt'.$i]))
          $_POST['txt'.$i]="";
  }
 }

 if($task=='new'){
   try {
    $sql  = "select * from klasifikasi ";
	$sql .= "WHERE ClParentId='".$_POST['txt1']."' ";
	$sql .= " AND lower(ClCode) = lower('".$_POST['txt2']."') ";
	$result = mysqli_query($connect, $sql);
	if (mysqli_num_rows($result) > 0){
		die('found');
		return false;
	}

    $role_olah = '';

    $sql = "select (max(ClId)+1) as id ";
    $sql .= "from klasifikasi ";
    $result = mysqli_query($connect, $sql);
    if (mysqli_num_rows($result) > 0){
        while($row = mysqli_fetch_array($result)){
          $ClIds = $row[0];
        }
    }

    foreach($_POST['txt1A'] as $role){
      $sql = "insert into role_klasifikasi (ClId,RoleId)
              values('".$ClIds."', '".$role."' )";
      mysqli_query($connect, $sql);
    }


    $sql = "insert into klasifikasi (ClId, ClParentId, ClCode, ClName, ClDesc, CIStatus, ClStatusParent,
            RetensiThn_Active, Ket_Active, RetensiThn_InActive, Ket_InActive, SusutId,
            ClKeamanan, HakAkses, DasarPertimbang, UnitPengolah) values ( ";
    $sql .= $ClIds.", ";
    $sql .= " '" . $_POST['txt1'] . "', ";
    $sql .= " '" . $_POST['txt2'] . "', ";
    $sql .= " '" . $_POST['txt3'] . "', ";
    $sql .= " '" . $_POST['txt4'] . "', ";

    $status = isset($_POST['txt5']) ? 1 : 0;

    $sql .= " '".$status."', ";
    $sql .= " '".$status."', ";
    $sql .= " '" . $_POST['txt6'] . "', ";
    $sql .= " '" . $_POST['txt7'] . "', ";
    $sql .= " '" . $_POST['txt8'] . "', ";
    $sql .= " '" . $_POST['txt9'] . "', ";
    $sql .= " '" . $_POST['txt10'] . "', ";

    $sql .= " '" . $_POST['txt11'] . "', ";

   if(!empty($_POST['txt12'])){
    $strHak="";
    foreach($_POST['txt12'] as $hakAkses){
      $strHak .= $hakAkses."#";
    }
    $strHak = substr($strHak,0,-1);
    $sql .= " '" . $strHak . "', ";
   }else
      $sql .= "''," ;


    $sql .= " '" . $_POST['txt13'] . "', ";
    $sql .= " '" . $_POST['txt14'] . "' ";
    $sql .= " )";
    //die($sql);
    mysqli_query($connect, $sql);
    loguser($sql);
    die("sukses");
   } catch (Exception $e) {
       die('error');
       return false;
   }

 }

 if($task=='edit'){
  try{

  if(!empty($_POST['txt5']))
    $status = '1';
  else
    $status = '0';
  $role_olah="";
//  foreach($_POST['txt1A'] as $rolex){
//      $role_olah .= $rolex.'#';
//    }

   $role_olah = '';
   $sql = "DELETE FROM role_klasifikasi WHERE ClId ='".$id."' ";
   mysqli_query($connect, $sql);
   foreach($_POST['txt1A'] as $role){
      $sql = "insert into role_klasifikasi (ClId,RoleId)
              values('".$id."', '".$role."' )";
      mysqli_query($connect, $sql);
    }

   $sql  = "update klasifikasi set ";
   $sql .= "ClParentId = '".$_POST['txt1']."', ";
   $sql .= "ClCode = '".$_POST['txt2']."', ";
   $sql .= "ClName = '".$_POST['txt3']."', ";
   $sql .= "ClDesc = '".$_POST['txt4']."', ";
   $sql .= "CIStatus = '".$status."', ";
   $sql .= "ClStatusParent = '".$status."', ";
   $sql .= "RetensiThn_Active = '".$_POST['txt6']."', ";
   $sql .= "Ket_Active = '".$_POST['txt7']."', ";
   $sql .= "RetensiThn_InActive = '".$_POST['txt8']."', ";
   $sql .= "Ket_InActive = '".$_POST['txt9']."', ";
   $sql .= "SusutId = '".$_POST['txt10']."', ";
   $sql .= "ClKeamanan = '".$_POST['txt11']."', ";

   if(!empty($_POST['txt12'])){
   $strHak="";
    foreach($_POST['txt12'] as $hakAkses){
      $strHak .= $hakAkses."#";
    }
    $strHak = substr($strHak,0,-1);
    $sql .= "HakAkses = '".$strHak."', ";
   } else {
      $sql .= "HakAkses = ''," ;
   }

   $sql .= "DasarPertimbang = '".$_POST['txt13']."', ";
   $sql .= "UnitPengolah = '" . $_POST['txt14'] . "' ";
   $sql .= " where ClId = '".$id."' ";
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

    $sql = "SELECT * FROM c_klas where ";
    $sql .= "a = '".$id."' or ";
    $sql .= "b = '".$id."' or ";
    $sql .= "c = '".$id."' or ";
    $sql .= "d = '".$id."' or ";
    $sql .= "e = '".$id."' or ";
    $sql .= "f = '".$id."' or ClParentId = '".$id."' ";

    $res = mysqli_query($connect, $sql);
    if(mysqli_num_rows($res)>0){
      die('found');
    }

    $sql = "SELECT ClId FROM klasifikasi where ClParentId = '".$id."' ";
    $res = mysqli_query($connect, $sql);
    if(mysqli_num_rows($res)>0){
      die('fparent');
    }
	
	$sql = "DELETE FROM role_klasifikasi WHERE ClId ='".$id."'";
    mysqli_query($connect, $sql) or die ("error");

    $sql = "DELETE FROM klasifikasi WHERE ClId ='".$id."'";
    mysqli_query($connect, $sql) or die ("error");
    loguser($sql);
    die("sukses");
}

     //close connection
 mysqli_close($connect);
?>