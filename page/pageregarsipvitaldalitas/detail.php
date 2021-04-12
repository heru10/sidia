<?php
 include "../../conf.php";

 $sql = "select * from v_naskah_vital where MetaId = '". $_GET['id'] ."' ";
 $result = mysqli_query($connect, $sql) or die ('Error');
 $rows = mysqli_fetch_array($result);
 $html = '<div class="col-md-12">
            <div class="box box-success">
             <div class="box-header with-border">
                 <h4 class="box-title">Detail Metadata Dokumen Vital</h4>
             </div>
             <div class="box-body">
                <small><table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px; width= 80%">';
 $html .= '<tr><td valign="top">No. Dokumen</td><td valign="top">:</td><td>'.$rows['Nomor'].'</td></tr>';
 $html .= '<tr><td valign="top">Tanggal Dokumen</td><td valign="top">:</td><td>'.$rows['Tgl'].'</td></tr>';
 $html .= '<tr><td>Jumlah Dokumen</td><td>:</td><td>'.$rows['Jumlah'].'&nbsp;'.$rows['SatuanArsip'].'</td></tr>';
 $html .= '<tr><td>Tingkat Perkembangan</td><td>:</td><td>'.$rows['TPName'].'</td></tr>';
 $html .= '<tr><td>Media Dokumen</td><td>:</td><td>'.$rows['MediaName'].'</td></tr>';

 if($rows['AksesPublik']=='buka')
   $AksesP = "Terbuka";
 else
   $AksesP = "Tertutup";

 $html .= '<tr><td>Akses Publik</td><td>:</td><td>'.$AksesP.'</td></tr>';
            $sql    = "select FilesId, Filename from filesdigital where MetaId = '".$rows['MetaId']."' ";
            $result = mysqli_query($connect, $sql);
            $JFile = mysqli_num_rows($result);
            $folder = "Upload_Files/".$rows['CodeRole'];
            $i = 1;
            if($JFile == 0){
              $Fview = "none" ;
              $ketview = "<label>Tidak ada file digital</label>";
              $fileload = "";
            }else{
              $Fview = "inline";
              $ketview = "";
            }
 $html .= '<tr><td>File Dokumen</td><td>:</td><td>';

 $html .= '<select id="fileselect" style="width: 80%; display:'.$Fview.'" class="form-control input-sm" onchange=loadfile("'.$rows['CodeRole'].'");>';
           if($JFile != 0){
             while($aRow = mysqli_fetch_array($result)){
              $html .= '<option value='.$aRow['Filename'].'>'.$aRow['Filename'].'</option>';
              if($i==1)
                 $fileload = $folder."/".$aRow['Filename'];
              $i++;
            }
           }
 $html .= '</select>'.$ketview.'</td></tr>' ;
 $html .= '</table></small>';
 $html .= '</div></div></div>';
 $html .= '<div class="col-md-12" style="display:'.$Fview.'">
            <div class="box box-info">
             <div class="box-header with-border">
                 <h4 class="box-title">Viewer File Document</h4>
             </div>
             <div class="box-body"> ';
 $html .= '  <object id="viewerpdf" data="'.$fileload.'" type = "application/jpg"  width="100%" height="400">
             </object>
           </div>
         </div>';
 echo $html;
?>