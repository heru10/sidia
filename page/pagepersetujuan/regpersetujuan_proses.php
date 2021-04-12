<?php
  session_start();
  include_once "../../conf.php";

  if(isset($_REQUEST['task']))
    $task = $_REQUEST['task'];

  if(isset($_POST['idx']))
    $id = $_POST['idx'];

  if(isset($_POST['req']))
    $req = $_POST['req'];

  $akses = "";
  if(isset($_POST['download']))
    $akses = $_POST['download']."|";

  if(isset($_POST['metadata']))
    $akses .= $_POST['metadata'];



  if($task=="approve"){
   try{
    $reservation = explode("-",$_POST['reservation']); 
    $sql  = " Update peminjaman set ";
    $sql .= " StatusPinjam = '".$req."', ";
    $sql .= " ApproveDate = '".date('Y-m-d')."', ";
    $sql .= " DateRange1 = '".str_replace(' ','',mkdate($reservation[0]))."', ";
    $sql .= " DateRange2 = '".str_replace(' ','',mkdate($reservation[1]))."', ";
    $sql .= " Catatan = '".$_POST['komentar']."', ";
    $sql .= " Akses = '".$akses."' ";
    $sql .= " Where PeminjamanId= '".$id."' ";

    mysqli_query($connect,$sql) or die ('error');
    loguser($sql);
    die('sukses');
   } catch (Exception $e) {
       die('error');
       return false;
   }
  }

  if($task=="load"){
    try{
       $id = $_REQUEST['idx'];
       $sql = "select Reservation1, Reservation2 from V_peminjaman Where PeminjamanId= '".$id."' ";
       $result = mysqli_query($connect, $sql);
       $rows = mysqli_fetch_array($result);
       echo $rows['Reservation1'].'|'.$rows['Reservation2'];
     } catch (Exception $e) {
       die('error');
       return false;
   }
  }

 //close connection
 mysqli_close($connect);
?>