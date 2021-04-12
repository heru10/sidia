<?php
 include "../../conf.php";

 $sql = "select * from v_dokumen where DokumenId = '".$_GET['id']."' ";
 $result = mysqli_query($connect, $sql);
 $rows = mysqli_fetch_array($result);
 $html = '<div class="col-md-12">
            <div class="box box-success">
             <div class="box-header with-border">
                 <h4 class="box-title">Detail Metadata</h4>
             </div>
             <div class="box-body">
                <small><table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px; width= 80%">';
 $html .= '<tr><td>Jenis Dokumen</td><td>:</td><td>'.$rows['JenisNaskah'].'</td></tr>';
 $html .= '<tr><td>Jumlah Dokumen</td><td>:</td><td>'.$rows['Jumlah'].'&nbsp;'.$rows['SatuanArsip'].'</td></tr>';
 $html .= '<tr><td>Tingkat Perkembangan</td><td>:</td><td>'.$rows['TPName'].'</td></tr>';
 $html .= '<tr><td>Media Dokumen</td><td>:</td><td>'.$rows['MediaName'].'</td></tr>';
 $html .= '<tr><td>Kondisi Fisik</td><td>:</td><td>'.$rows['KondisiName'].'</td></tr>';

 $html .= '<tr><td>File Dokumen</td><td>:</td><td>';

 $sql = "select FilesId, Filename from filesdigital where DokumenId = '".$rows['DokumenId']."' ";
 $result = mysqli_query($connect, $sql);
 $filex = "";
 while($ofile = mysqli_fetch_array($result)){
   $dfile = explode("/",$ofile['Filename']);
   $filex .= '<i class="fa fa fa-file text-blue"></i>&nbsp;&nbsp<a href=# onclick=view_file('.$ofile['FilesId'].')>'.$dfile[5].'</a>,&nbsp;&nbsp;';
 }

 if(mysqli_num_rows($result)==0)
  $html .= " No File Upload ..";

 $html .= $filex;
 $html .= '</td></tr></table></small>';
 $html .= '</div></div></div>';
 echo $html;
?>