<?php
 include "../../conf.php";

 $sql = "select * from v_metaproof where DetailProfId = '".$_GET['id']."' ";
 $result = mysqli_query($connect, $sql);
 $rows = mysqli_fetch_array($result);
 $pelaksana = explode("#",$rows['IdPelaksana']);
 $Rpelaksana = "";
 foreach($pelaksana as $rolex){
 $sql = "select concat(Nip,' - ',Nama) as pl From pelaksana_teknis Where IdPT='".$rolex."' ";
 $result = mysqli_query($connect,$sql);
 $MRole = mysqli_fetch_array($result);
 $Rpelaksana .= $MRole['pl'].", ";
 }
 $RolePelaksana = substr($Rpelaksana,0,-2);
 $html = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px; width= 80%">';
 $html .= '<tr><td style="width: 20%">Pelaksana Pekerjaan</td><td style="width: 1%">:</td><td style="width: 86%">'.$RolePelaksana.'</td></tr>';
 $html .= '<tr><td>Nomor SPK</td><td>:</td><td>'.$rows['Nomor_SPK'].'</td></tr>';
 $html .= '<tr><td valign="top">Nota Penyerahan</td><td valign="top">:</td><td>'.$rows['Nota_Penyerahan'].'</td></tr>';
 $html .= '<tr><td>Keterangan</td><td>:</td><td>'.$rows['Keterangan'].'</td></tr>';
 $html .= '</table><br />';
 $html .= '<table class="table table-striped"  style="width: 80%">';
 $html .= '<thead>';
 $html .= '<tr class="bg-blue"><th style="width: 2%">No.</th>';
 $html .= '<th style="width: 20%">Filename</th>';
 $html .= '<th style="width: 5%">Size</th>';
 $html .= '<th style="width: 10%">Keterangan</th>';
 $html .= '<th align="center" style="width: 10%">Aksi</th></tr>';
 $html .= '</thead>';
 $html .= '<tbody>';
 $sql = "select * from detailvitalmetafile_proof where DetailProfId = '".$_GET['id']."' order by Ket Asc ";
 $result = mysqli_query($connect, $sql);
 $no = 1;
 while($rows = mysqli_fetch_array($result)){
 $filepath = "../../".$rows['Filename'];

 if(file_exists($filepath)){
   $html .= '<tr>';
   $html .= '<td>'.$no++.'</td>';
   $filep = explode("/",$rows['Filename']);
   $html .= '<td>'.$filep[3].'</td>';
   $html .= '<td align=right>'.filesize_formatted($rows['Size']).'</td>';

   switch($rows['Ket']){
     case 'a-dasar'     : $ket = 'Dasar Permintaan';
                          break;
     case 'b-lampiran'  : $ket = 'Lampiran Dasar Permintaan';
                          break;
     case 'c-spk'      :  $ket = 'Surat Perintah Pekerjaan ';
                          break;
     case 'd-nota'      : $ket = 'Nota Penyerahan';
                          break;
     case 'e-preview'   : $ket = 'Preview';
                          break;
   }

   $html .= '<td>'.$ket.'</td>';

   $html .= '<td align="center"><button title="Lihat Dokumen" class="btn btn-danger btn-xs" onclick=getviewfile_meta("'.$rows['DetVFileId'].'")><i class="fa fa-file"></i></button></td>';

 }
 }
 $html .= '</tbody>';
 $html .= '</table>';
 echo $html;

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