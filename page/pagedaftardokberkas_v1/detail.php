<?php
 include "../../conf.php";

 $sql = "select * from v_berkas_v1 where BerkasId = '". $_GET['id'] ."' ";
 $result = mysqli_query($connect, $sql) or die ('Error');
 $rows = mysqli_fetch_array($result);
 if(!empty($rows['SubBerkas']))
   $label = "Detail Sub Berkas";
 else
   $label = "Detail Berkas";
 $html = '<div class="col-md-12">
            <div class="box box-success">
             <div class="box-header with-border">
                 <h4 class="box-title">'.$label.'</h4>
             </div>
             <div class="box-body">
                <small><table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px; width= 80%">';
 $html .= '<tr><td valign="top">Unit Kerja</td><td valign="top">:</td><td>'.$rows['RoleName'].'</td></tr>';
 $html .= '<tr><td>Kode Klasifikasi</td><td>:</td><td>'.$rows['KlasBerkas'].'</td></tr>';
//   if(!empty($rows['SubBerkas']))
//
//     $sqlr = "select "
//   $lokasi = "Dalam Berkas : ".$rows['SubBerkas'];
//   else
     $lokasi = $rows['LokasiSimpan'];

 $html .= '<tr><td>Lokasi Simpan</td><td>:</td><td>'.$lokasi.'</td></tr>';
 //$html .= '<tr><td>Jumlah Berkas</td><td>:</td><td>'.$rows['Jumlah'].'</td></tr>';
 $html .= '<tr><td>Tingkat Perkembangan</td><td>:</td><td>'.$rows['TPName'].'</td></tr>';
 $html .= '<tr><td>Media Dokumen</td><td>:</td><td>'.$rows['MediaName'].'</td></tr>';
 $html .= '</table></small>';
 $html .= '</div></div></div>';
 echo $html;
?>