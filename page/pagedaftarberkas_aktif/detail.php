<?php
 include "../../conf.php";

 $sql = "select * from v_berkas_aktif where BerkasId = '". $_GET['id'] ."' ";
 $result = mysqli_query($connect, $sql) or die ('Error');
 $rows = mysqli_fetch_array($result);
 $html = '<div class="col-md-12">
            <div class="box box-success">
             <div class="box-header with-border">
                 <h4 class="box-title">Detail Berkas</h4>
             </div>
             <div class="box-body">
                <small><table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px; width= 80%">';
 $html .= '<tr><td valign="top">Tanggal Akhir Aktif</td><td valign="top">:</td><td>'.date('d/m/Y',strtotime($rows['RetensiInAktif'])).'</td></tr>';
 $html .= '<tr><td valign="top">Unit Kerja</td><td valign="top">:</td><td>'.$rows['RoleName'].'</td></tr>';
 $html .= '<tr><td>Jumlah Berkas</td><td>:</td><td>'.$rows['Jumlah'].'</td></tr>';
 $html .= '<tr><td>Tingkat Perkembangan</td><td>:</td><td>'.$rows['TPName'].'</td></tr>';
 $html .= '<tr><td>Media Dokumen</td><td>:</td><td>'.$rows['MediaName'].'</td></tr>';
 $html .= '</table></small>';
 $html .= '</div></div></div>';
 echo $html;
?>