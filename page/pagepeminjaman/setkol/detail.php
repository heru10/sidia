<?php
 include "../../../conf.php";

 $sql = "select * from v_dokumen_v2 where DokumenId = '".$_GET['id']."' ";
 $result = mysqli_query($connect, $sql);
 $rows = mysqli_fetch_array($result);
 $html = '<div class="col-md-12">
            <div class="box box-success">
             <div class="box-header with-border">
                 <h4 class="box-title">Lihat Dokumen</h4>
             </div>
             <div class="box-body">';
 $html .= '<center>';
 $sql = "select Filename, FilesId, KodeReg from filesdigital_v2 where DokumenId = '".$_GET['id']."' ";
 $result = mysqli_query($connect, $sql);
 $test = mysqli_fetch_array($result);
 $files = str_replace('../','',$test['Filename']);
 $dotfiles = explode('.',$files);

 $sql = "select Akses from v_peminjaman where PeminjamanId = '".$_REQUEST['idx']."' ";
 $result = mysqli_query($connect, $sql);
 $rRows = mysqli_fetch_array($result);
 $akses = explode('|',$rRows['Akses']);
 $btndownload = 'none';
 if($akses[0]=='d')
   $btndownload = 'inline';

// $stylefiles = 'application/jpg';
// if($dotfiles[1]=='pdf')
//   $stylefiles = 'application/pdf';
 $html .= '<form style="display:'.$btndownload.'" action="tcpdf/print.php" method="post">
                 <input type="hidden" name="filename" value="'.$files.'" >;
                 <input type="hidden" name="code" value="'.$test['KodeReg'].'" >;
                 <button type="submit" class="btn btn-warning pull-right"><i class="fa fa-download"></i></button>
             </form> <hr />';
 if($dotfiles[1]=='pdf')
   $html .= '<object data="viewerJS/#../'.$files.'" type = "application/pdf"  width="100%" height="700" ></object>';
  else
   $html .= '<object data="'.$files.'" type = "application/jpg"  width="100%" ></object>';
   
 $html .= '<center>';
 $html .= '</div></div></div>';
 echo $html;
 mysqli_close($connect);
?>