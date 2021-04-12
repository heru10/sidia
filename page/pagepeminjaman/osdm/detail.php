<?php
 include "../../../conf.php";

 $sql = "select * from v_dokumen_v1 where DokumenId = '".$_GET['id']."' ";
 $result = mysqli_query($connect, $sql);
 $rows = mysqli_fetch_array($result);
?>
<div class="col-md-12">
   <div class="box box-success">
             <div class="box-header with-border">
                 <h4 class="box-title">Lihat Dokumen</h4>
             </div>
      <div class="box-body">';
        <center>
 <?php
 $sql = "select Filename, FilesId, KodeReg from filesdigital_v1 where DokumenId = '".$_GET['id']."' ";
 $result = mysqli_query($connect, $sql);
 $test = mysqli_fetch_array($result);
 $files = str_replace('../../','',$test['Filename']);

 $dotfiles = explode('.',$files);
 $sql = "select Akses from v_peminjaman where PeminjamanId = '".$_GET['idx']."' ";
 $result = mysqli_query($connect, $sql);
 $rRows = mysqli_fetch_array($result);
 $akses = explode('|',$rRows['Akses']);
 $btndownload = 'none';
 if($akses[0]=='d')
   $btndownload = 'inline';
 ?>
            <form style="display: <?php echo $btndownload; ?>" action="tcpdf/print.php" method="post">
                    <input type="hidden" name="filename" value="<?php echo $files; ?>" >
                    <input type="hidden" name="code" value="<?php echo $test['KodeReg']; ?>" >
                    <button type="submit" class="btn btn-warning pull-right"><i class="fa fa-download"></i></button>
            </form> <br /><br/>
 <?php if($dotfiles[2]=='pdf'){ ?>
         <object id="viewST" data="viewerJS/#../<?php echo $files; ?>" type = "application/pdf"  width="100%" height="700" >
         </object>
 <?php } else { ?>
         <object data="<?php echo $files; ?>" type = "application/jpg"  width="100%" ></object>
 <?php } ?>
      </center>
    </div>
   </div>
 </div>
 <?php
 mysqli_close($connect);
?>