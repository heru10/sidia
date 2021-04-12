<?php
 include "../../conf.php";

 $sql = "select * from v_metaproof where DetailProfId = '".$_GET['id']."' ";
 $result = mysqli_query($connect, $sql);
 $rows = mysqli_fetch_array($result);
 $Role = explode("#",$rows['IdPelaksana']);
 $RolePelaksana = "";
 foreach($Role as $rolex){
 $sql = "select RoleName From role Where RoleId='".$rolex."' ";
 $result = mysqli_query($connect,$sql);
 $MRole = mysqli_fetch_array($result);
 $RolePelaksana .= $MRole['RoleName'].", ";
 }
 $RolePelaksana = substr($RolePelaksana,0,-2);
 $html = '
                <table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px; width= 80%">';
 $html .= '<tr><td style="width: 20%">Pelaksana Pekerjaan</td><td style="width: 1%">:</td><td style="width: 86%">'.$RolePelaksana.'</td></tr>';
 $html .= '<tr><td>Nomor SPK</td><td>:</td><td>'.$rows['Nomor_SPK'].'</td></tr>';
 $html .= '<tr><td valign="top">Nota Penyerahan</td><td valign="top">:</td><td>'.$rows['Nota_Penyerahan'].'</td></tr>';
 $html .= '<tr><td>Keterangan</td><td>:</td><td>'.$rows['Keterangan'].'</td></tr>';
 $html .= '</table><br />';
 $html .= '<table class="table table-striped"  style="width: 80%">';
 $html .= '<thead>';
 $html .= '<tr class="bg-blue"><th style="width: 2%">No.</th>';
 $html .= '<th style="width: 20%">Filename</th>';
 $html .= '<th style="width: 10%">Size</th>';
 $html .= '<th style="width: 10%">Keterangan</th></tr>';
 $html .= '</thead>';
 $html .= '<tbody>';
 $sql = "select * from detailvitalfile_proof where DetailProfId = '".$_GET['id']."' order by Ket Asc ";
 $result = mysqli_query($connect, $sql);
 $no = 1;
 while($rows = mysqli_fetch_array($result)){
   $html .= '<tr>';
   $html .= '<td>'.$no++.'</td>';
   $filep = explode("/",$rows['Filename']);
   $html .= '<td>'.$filep[3].'</td>';
   $html .= '<td align=right>'.filesize_formatted($rows['Size']).'</td>';
   $html .= '<td><button class="btn btn-danger btn-xs" onclick=getviewfile("'.$rows['DetVFileId'].'")><i class="fa fa-file"></i>&nbsp;&nbsp;'.strtoupper($rows['Ket']).'</button></td>';
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