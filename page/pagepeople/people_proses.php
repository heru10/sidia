<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_POST['task']))
    $task = $_POST['task'];
  if(isset($_POST['id']))
    $id = $_POST['id'];

  for($i=1;$i<=10;$i++){
   if(empty($_POST['txt'.$i]))
    $_POST['txt'.$i] = "";
    $sRow[$i] = $_POST['txt'.$i];
  }

   if(isset($_POST['txt5']))
     $aktif = 1;
   else
     $aktif = 0;

 if($task=='new'){
  $sql = "select * from people where NP = '".$_POST['txt2A']."' and  Pengguna = '".$sRow[7]."' ";
  $result = mysqli_query($connect, $sql);
  $found = mysqli_num_rows($result);

 if($found == 0){

 $aksesmenu='';
 if(isset($_POST['akses'])){
  foreach($_POST['akses'] as $menu){
   $aksesmenu .= $menu."#";
  }
  $aksesmenu = substr($aksesmenu,0,-1);

 }

  if($sRow[8]!=$sRow[9]){
    die("noteque");
    return false;
  }

  $sql = "select max(PeopleId) as Pid from people";
  $result = mysqli_query($connect, $sql);
  $row = mysqli_fetch_array($result);
  $TId = $row['Pid']+1;

  $sql  =  "insert into people ";
  $sql .= "(PeopleId, RoleId, NP , PeopleName, email, PeopleTipe, PeopleStatus, Pengguna, Key1, Key2, People, TglReg) values ";
  $sql .= "('".$TId."' ,'".$sRow[1]."','".$_POST['txt2A']."','".$sRow[2]."','".$sRow[3]."','".$sRow[4]."','".$aktif."','".$sRow[7]."', '".$sRow['8']."', '".md5($sRow[8])."','".$_SESSION['PeopleId']."','".date('Y-m-d H:i:s')."' )";
  mysqli_query($connect, $sql) or die ("error1");
  loguser($sql);
  $sql  =  "insert into peopleakses ";
  $sql .=  "(PeopleId, RoleId, Menu, Approve) values ";
  $sql .=  "('".$TId."','".$sRow[1]."', '".$aksesmenu."', '".$_POST['txt10a']."')";
  mysqli_query($connect, $sql) or die ("error2");
  loguser($sql);
     die("sukses");
  } else {
    die("found");
  }
 } else if($task=='edit'){

   $aksesmenu='';
   if(isset($_POST['akses'])){
     foreach($_POST['akses'] as $menu){
     $aksesmenu .= $menu."#";
   }
   $aksesmenu = substr($aksesmenu,0,-1);
  }
 if($_POST['tempnp'] != $_POST['txt2A']){
  $sql = "select * from people where NP = '".$_POST['txt2A']."' and  Pengguna = '".$sRow[7]."' ";
  $result = mysqli_query($connect, $sql);
  $found = mysqli_num_rows($result);
 } else $found = 0;

  //$noteque = true;
  if($sRow[8]!=$sRow[9]){
    die("noteque");
    return false;
  }

  if($found==0){
   $sql  = "update people set ";
   $sql .= "RoleId = '".$sRow[1]."', ";
   $sql .= "NP = '".$_POST['txt2A']."', ";
   $sql .= "PeopleName = '".$sRow[2]."', ";
   $sql .= "Email = '".$sRow[3]."', ";
   $sql .= "PeopleTipe = '".$sRow[4]."', ";
   $sql .= "PeopleStatus = '".$sRow[5]."', ";
   $sql .= "Pengguna = '".$sRow[7]."', ";
   $sql .= "Key1 = '".$sRow[8]."', ";
   $sql .= "Key2 = '".md5($sRow[8])."' ";
   $sql .= "where PeopleId = '".$id."' ";
   mysqli_query($connect, $sql)or die ("error");
   loguser($sql);
   $sql  = "update peopleakses set ";
   $sql  .= "Approve = '".$_POST['txt10a']."', ";
   $sql  .= "RoleId =  '".$sRow[1]."', ";
   $sql  .= "Menu =  '".$aksesmenu."' ";
   $sql .= "where PeopleId = '".$id."' ";
   mysqli_query($connect, $sql) or die ("error");
   loguser($sql);
   die("sukses");
  }
    else {die("found");}

 }else if($task=='del'){

    $checkuser = '';
    $sql = "select * from berkas where Operator = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    if(mysqli_num_rows($result)!=0){
        die('founds');
    }
    $sql = "select * from berkas_v1 where Operator = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    if(mysqli_num_rows($result)!=0){
        die('founds');
    }
    $sql = "select * from berkas_v2 where Operator = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    if(mysqli_num_rows($result)!=0){
        die('founds');
    }
    $sql = "select * from regarsipvital where Operator = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    if(mysqli_num_rows($result)!=0){
        die('founds');
    }

    $sql = "DELETE FROM people WHERE PeopleId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error");
    loguser($sql);
    $sql = "DELETE FROM peopleakses WHERE PeopleId ='".$id."'";
    mysqli_query($connect, $sql)or die ("error");
    loguser($sql);
    die("sukses");

 }else if($task=='load') {
   $sql = "SELECT people.*, peopleakses.Approve, peopleakses.Menu FROM people
           INNER JOIN peopleakses ON peopleakses.PeopleId = people.PeopleId where people.PeopleId='".$id."' ";
   $result = mysqli_query($connect, $sql);
   $arr = mysqli_fetch_object($result);
   echo '{"items":'. json_encode($arr).'}';
 } else{
   $sql = "select Nama from master_pegawai where NP = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   $dPeg = mysqli_fetch_array($result);
   if(mysqli_num_rows($result)>0){
     $kata =  ucwords(strtolower($dPeg['Nama']));
     die($kata);
   }
 }

 mysqli_close($connect);

?>