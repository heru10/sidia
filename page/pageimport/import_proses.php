<?php
session_start();
ini_set("display_errors",0);
error_reporting(E_ALL);
require_once 'excel_reader2.php';
include "../../conf.php";

$files = $_FILES['myfile']['name'];
$tmpfiles = $_FILES["myfile"]["tmp_name"];

$xls = new Spreadsheet_Excel_Reader($tmpfiles);


$sql = "SELECT CodeRole FROM role Where RoleId = '".$_SESSION['RoleId']."' ";
$result = mysqli_query($connect, $sql);
$subf = mysqli_fetch_array($result);



for ($row=5;$row<=$xls->rowcount();$row++) {
       $klas = $xls->val($row,2);
       $noberkas = $xls->val($row,3);
       $uraian = $xls->val($row,4);
       $periode = $xls->val($row,5);
       $tp = $xls->val($row,6);
       $media = $xls->val($row,7);
       $kondisi = $xls->val($row,8);
       $jumlah = $xls->val($row,9);
       $gd = $xls->val($row,10);
       $rak = $xls->val($row,11);
       $baris = $xls->val($row,12);
       $boks = $xls->val($row,13);
       $sql = "select ClId from klasifikasi where lower(ClCode) = '".strtolower($klas)."' ";
       $Idklas = mysqli_fetch_array(mysqli_query($connect, $sql));
       $sql = "select TPId from master_tperkembangan where lower(TPName) = '".strtolower($tp)."' ";
       $TPId = mysqli_fetch_array(mysqli_query($connect,$sql));
       $sql = "select MediaId from master_media where lower(MediaName) = '".strtolower($media)."' ";
       $MediaId = mysqli_fetch_array(mysqli_query($connect,$sql));
       $sql = "select KondisiId from master_kondisi where lower(KondisiName) = '".strtolower($kondisi)."' ";
       $KondisiId = mysqli_fetch_array(mysqli_query($connect,$sql));
       $KodeReg = code('Nomor Reg. B-',5);
       $nob = strlen($noberkas);

       if($nob==1)
           $nober = '00'.$noberkas;
       if($nob==2)
           $nober = '0'.$noberkas;

       $pathDB = "Upload_Files/".$subf[0]."/dok_".$nober."/";

       $sqlt = "insert into berkas (KodeReg, IntNomor, Nomor, ClId, RoleId, Uraian, KurunWaktu, Jumlah,
                TPId, MediaId, KondisId, Gedung, Lemari, Baris, Boks, StatusDok, Path, TglReg, Operator) values ( ";
       $sqlt .= "'".$KodeReg."', ";
       $sqlt .= "'".$noberkas."', ";
       $sqlt .= "'".$nober."', ";
       $sqlt .= "'".$Idklas['ClId']."', ";
       $sqlt .= "'".$_SESSION['RoleId']."', ";
       $sqlt .= "'".$uraian."', ";
       $sqlt .= "'".$periode."', ";
       $sqlt .= "'".$jumlah."', ";
       
       if(empty($TPId['TPId']))
         $TPId['TPId'] = 1;
       $sqlt .= "'".$TPId['TPId']."', ";

       if(empty($MediaId['MediaId']))
         $MediaId['MediaId'] = 1;
       $sqlt .= "'".$MediaId['MediaId']."', ";

       if(empty($KondisiId['KondisiId']))
         $KondisiId['KondisiId'] = 1;
       $sqlt .= "'".$KondisiId['KondisiId']."', ";


       $sqlt .= "'".$gd."', ";
       $sqlt .= "'".$rak."', ";
       $sqlt .= "'".$baris."', ";
       $sqlt .= "'".$boks."', ";
       $sqlt .= "'aktif', ";
       $sqlt .= "'".$pathDB."', ";
       $sqlt .= "'" . date('Y-m-d H:i:s') . "', ";
       $sqlt .= "'" . $_SESSION['PeopleId'] . "' ) ";
       //die($sqlt);
       mysqli_query($connect, $sqlt) or die ('error');
      }
      loguser($sqlt);
      die('sukses');

?>
