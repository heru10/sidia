<?php
 include "../../../conf.php";

 $sql = "select * from v_dokumen where DokumenId = '".$_GET['id']."' ";
 $result = mysqli_query($connect, $sql);
 $rows = mysqli_fetch_array($result);
 $html = '<div class="col-md-12">
            <div class="box box-success">
             <div class="box-header with-border">
                 <h4 class="box-title">Lihat Dokumen</h4>
             </div>
             <div class="box-body">';
 $html .= '<center>';
 $sql = "select Filename, FilesId from filesdigital where DokumenId = '".$_GET['id']."' ";
 $result = mysqli_query($connect, $sql);
 $test = mysqli_fetch_array($result);
 $files = str_replace('../','',$test['Filename']);

 $dotfiles = explode('.',$files);
 $stylefiles = 'application/jpg';
 if($dotfiles[1]=='pdf')
   $stylefiles = 'application/pdf';

 $sql = "select Akses from v_peminjaman where PeminjamanId = '".$_REQUEST['idx']."' ";
 $result = mysqli_query($connect, $sql);
 $rRows = mysqli_fetch_array($result);
 $akses = explode('|',$rRows['Akses']);
 $btndownload = 'none';
 if($akses[0]=='d')
   $btndownload = 'inline';

 ?>
 <html lang="en">
 <head>
  <link rel="stylesheet" href="bower_components/cropper/dist/cropper.css">
    <style>
    .container {
      max-width: 640px;
      margin: 20px auto;
    }

    img {
      max-width: 100%;
    }
  </style>
</head>
<body>
 <div class="col-md-12">
      <div class="box box-success">
       <div class="box-header with-border">
           <h4 class="box-title">Lihat Dokumen</h4>
       </div>
       <div class="box-body">

       <?php if($btndownload != 'none'){ ?>
          <form action="fpdf/print.php" method="post">
              <input type="hidden" name="filename" value="<?php echo $Pfilex; ?>" >;
              <input type="hidden" name="code" value="<?php echo $Pfile['KodeReg']; ?>" >;
              <button type="submit" class="btn btn-warning pull-right"><i class='fa fa-download'></i></button>
         </form> <hr />
         <?php } ?>

 <center>
 <?php if($dotfiles[1]=='pdf') ?>
   <object data="viewerJS/#../<?php echo $Pfilex; ?>" type = "application/pdf"  width="100%" height="700"></object>
 <?php else ?>
   <object data="'.$files.'" type = "application/jpg"  width="100%" ></object>

 </center>
 </div></div></div>
 </body>
 </html>
<?php
 mysqli_close($connect);
?>