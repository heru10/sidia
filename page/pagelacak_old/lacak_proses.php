<?php
session_start();
include_once "../../conf.php";

$idcode = "";
if(isset($_REQUEST['id']))
$idcode = $_REQUEST['id'];

$arr = array();

$sql_aktif = "SELECT filesdigital.Filename, filesdigital.FileSize,  filesdigital.KodeReg, berkas.KurunWaktu, berkas.RoleId, dokumen.Uraian, berkas.StatusDok, Role.RoleName
              FROM berkas
              INNER JOIN dokumen ON dokumen.BerkasId = berkas.BerkasId
              INNER JOIN role ON role.RoleId = Berkas.RoleId
              INNER JOIN filesdigital ON filesdigital.DokumenId = dokumen.DokumenId Where berkas.StatusDok= 'aktif'
              and filesdigital.KodeReg = '".$idcode."' and Berkas.RoleId = '".$_SESSION['RoleId']."'  ";

$res_aktif = mysqli_query($connect, $sql_aktif);
if(mysqli_num_rows($res_aktif)!=0){
$obj = mysqli_fetch_array($res_aktif);
$arr[] = $obj['KurunWaktu'];
$arr[] = $obj['Uraian'];
$arr[] = $obj['RoleName'];
$arr[] = 'Dokumen Aktif';
$arr[] = str_replace("../../","",$obj['Filename']);
$arr[] = $obj['FileSize'];
echo '{"items":'. json_encode($arr).'}';
die();
}
$sql_inaktif = "SELECT filesdigital.Filename, filesdigital.FileSize,  filesdigital.KodeReg, berkas.KurunWaktu, berkas.RoleId, dokumen.Uraian, berkas.StatusDok, Role.RoleName
              FROM berkas
              INNER JOIN dokumen ON dokumen.BerkasId = berkas.BerkasId
              INNER JOIN role ON role.RoleId = Berkas.RoleId
              INNER JOIN filesdigital ON filesdigital.DokumenId = dokumen.DokumenId Where berkas.StatusDok= 'inaktif'
              and filesdigital.KodeReg = '".$idcode."' and Berkas.RoleId = '".$_SESSION['RoleId']."'  ";

$res_inaktif = mysqli_query($connect, $sql_inaktif);
if(mysqli_num_rows($res_inaktif)!=0){
$obj = mysqli_fetch_array($res_inaktif);
$arr[] = $obj['KurunWaktu'];
$arr[] = $obj['Uraian'];
$arr[] = $obj['RoleName'];
$arr[] = 'Dokumen In-Aktif';
$arr[] = str_replace("../../","",$obj['Filename']);
$arr[] = $obj['FileSize'];
echo '{"items":'. json_encode($arr).'}';
die();
}

$sql_setkol = "SELECT filesdigital_v2.Filename, filesdigital_v2.FileSize,  filesdigital_v2.KodeReg, berkas_v2.KurunWaktu, berkas_v2.RoleId, dokumen_v2.Uraian, berkas_v2.StatusDok, Role.RoleName
              FROM berkas_v2
              INNER JOIN dokumen_v2 ON dokumen_v2.BerkasId = berkas_v2.BerkasId
              INNER JOIN role ON role.RoleId = Berkas_v2.RoleId
              INNER JOIN filesdigital_v2 ON filesdigital_v2.DokumenId = dokumen_v2.DokumenId Where
              filesdigital_v2.KodeReg = '".$idcode."' and Berkas_v2.RoleId = '".$_SESSION['RoleId']."'  ";

$res_setkol = mysqli_query($connect, $sql_setkol);
if(mysqli_num_rows($res_setkol)!=0){
$obj = mysqli_fetch_array($res_setkol);
$arr[] = $obj['KurunWaktu'];
$arr[] = $obj['Uraian'];
$arr[] = $obj['RoleName'];
$arr[] = 'Dokumen Vital';
$arr[] = str_replace("../../","",$obj['Filename']);
$arr[] = $obj['FileSize'];
echo '{"items":'. json_encode($arr).'}';
die();
}

$sql_osdm = "SELECT filesdigital_v1.Filename, filesdigital_v1.FileSize,  filesdigital_v1.KodeReg, berkas_v1.KurunWaktu, berkas_v1.RoleId, dokumen_v1.Uraian, berkas_v1.StatusDok, Role.RoleName
              FROM berkas_v1
              INNER JOIN dokumen_v1 ON dokumen_v1.BerkasId = berkas_v1.BerkasId
              INNER JOIN role ON role.RoleId = Berkas_v1.RoleId
              INNER JOIN filesdigital_v1 ON filesdigital_v1.DokumenId = dokumen_v1.DokumenId Where
              filesdigital_v1.KodeReg = '".$idcode."' and Berkas_v1.RoleId = '".$_SESSION['RoleId']."'  ";

$res_osdm = mysqli_query($connect, $sql_osdm);
if(mysqli_num_rows($res_osdm)!=0){
$obj = mysqli_fetch_array($res_osdm);
$arr[] = $obj['KurunWaktu'];
$arr[] = $obj['Uraian'];
$arr[] = $obj['RoleName'];
$arr[] = 'Dokumen Vital';
$arr[] = str_replace("../../","",$obj['Filename']);
$arr[] = $obj['FileSize'];
echo '{"items":'. json_encode($arr).'}';
die();
}


$sql_dalitas = "SELECT
detailvitalfile.Filename,
detailvitalfile.Size,
detailvitalfile.KodeReg,
v_naskah_vital.Tahun,
v_naskah_vital.Roleid,
detailvitalfile.Ket,
Concat(v_naskah_vital.KatProdukName,'>>',v_naskah_vital.JProdukName,'>>',v_naskah_vital.DetailProdukName) as Ur,
role.RoleName
FROM
detailvitalfile
INNER JOIN v_naskah_vital ON detailvitalfile.RegVitalId = v_naskah_vital.RegVitalId
INNER JOIN role ON role.RoleId = v_naskah_vital.RoleId
where v_naskah_vital.Roleid = '".$_SESSION['RoleId']."' and  detailvitalfile.KodeReg = '".$idcode."' ";

$res_dalitas = mysqli_query($connect, $sql_dalitas);
if(mysqli_num_rows($res_dalitas)!=0){
$obj = mysqli_fetch_array($res_dalitas);
$arr[] = $obj['Tahun'];
$arr[] = $obj['Ur'];
$arr[] = $obj['RoleName'];
$arr[] = $obj['Ket'];
$arr[] = $obj['Filename'];
$arr[] = $obj['Size'];
echo '{"items":'. json_encode($arr).'}';
die();
}

$sql_sainprof = "SELECT
detailvitalfile_proof.Filename,
detailvitalfile_proof.Size,
detailvitalfile_proof.KodeReg,
v_naskah_vital_proof.Tahun,
v_naskah_vital_proof.Roleid,
detailvitalfile_proof.Ket,
Concat(v_naskah_vital_proof.KatProdukName,'>>',v_naskah_vital_proof.JProdukName,'>>',v_naskah_vital_proof.DetailProdukName) as Ur,
role.RoleName
FROM
detailvitalfile_proof
INNER JOIN v_naskah_vital_proof ON v_naskah_vital_proof.RegVitalId = v_naskah_vital_proof.RegVitalId
INNER JOIN role ON role.RoleId = v_naskah_vital_proof.RoleId
where v_naskah_vital_proof.Roleid = '".$_SESSION['RoleId']."' and  detailvitalfile_proof.KodeReg = '".$idcode."' ";

$res_sainprof = mysqli_query($connect, $sql_sainprof);
if(mysqli_num_rows($res_sainprof)!=0){
$obj = mysqli_fetch_array($res_sainprof);
$arr[] = $obj['Tahun'];
$arr[] = $obj['Ur'];
$arr[] = $obj['RoleName'];
$arr[] = $obj['Ket'];
$arr[] = $obj['Filename'];
$arr[] = $obj['Size'];
echo '{"items":'. json_encode($arr).'}';
die();
}



$arr[]='';
echo '{"items":'. json_encode($arr).'}';
?>