<!DOCTYPE html>
<?php
 include "../../conf.php";
 if(isset($_REQUEST['ids']))
 $ids = $_REQUEST['ids'];

 if(isset($_REQUEST['idx']))
 $idx = $_REQUEST['idx'];

 if(isset($_REQUEST['pfile']))
    $Pfile = $_REQUEST['pfile'];

 if(isset($_REQUEST['ket']))
 $ket = $_REQUEST['ket'];

 $m0 = "none";
 $m1 = "none";
 if($ket=="m0"){
  $sql = "select * from detailvitalfile where DetVFileId = '".$Pfile."' ";
  $m0 = "inline";
 } else {
  $sql = "select * from detailvitalfile_proof where DetVFileId = '".$Pfile."' ";
  $m1 = "inline";
 }
  $result = mysqli_query($connect, $sql);
  $Pfile = mysqli_fetch_array($result);
  $Xfile = explode(".",$Pfile['Filename']);
  $filer = explode("/",$Pfile['Filename']);

  $sql = "select Akses from v_peminjaman where PeminjamanId = '".$idx."' ";
  $result = mysqli_query($connect, $sql);
  $rRows = mysqli_fetch_array($result);

  $akses = explode("|",$rRows['Akses']);
  $btndownload = "none";

  foreach($akses as $Iakses){
    if($Iakses=='d')
      $btndownload = "inline";
  }

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

<!-- <div class="col-md-3" style="padding: 20px">
  <button class='btn btn-default bg-red' type="button" onclick="pageurl('page/pageregdetailvital/regdetailvital.php?ids=<?php echo $ids; ?>');"><i class='fa fa-mail-reply-all'></i> Kembali</button>
 </div>-->
 <div class="row">
        <div class="col-md-12">
          <div class="box box-solid">
            <div class="box-header with-border">
             <span class="alert bg-green"><i class="fa fa-street-view fa-1x">&nbsp;<?php echo strtolower($filer[3]);  ?></i></span>

              <div class="box-tools">
                <button type="button" style="display: <?php echo $m0; ?>" onclick="pageurl('page/pagepeminjaman/viewdokumen1.php?id=<?php echo $ids; ?>&idx=<?php echo $idx; ?>');"  class="btn btn-info pull-right" data-widget="collapse"><i class="fa fa-mail-reply"></i>
                  &nbsp; Kembali&nbsp;
                </button>
                <button type="button" style="display: <?php echo $m1; ?>" onclick="pageurl('page/pagepeminjaman/viewdokumen2.php?id=<?php echo $ids; ?>&idx=<?php echo $idx; ?>');"  class="btn btn-info pull-right" data-widget="collapse"><i class="fa fa-mail-reply"></i>
                  &nbsp; Kembali&nbsp;
                </button>
              </div>
            </div>
            <div class="box-body">
            <span>
            <center>
                <form style="display: <?php echo $btndownload; ?>" action="tcpdf/print.php" method="post">
                   <input type="hidden" name="filename" value="<?php echo $Pfile['Filename']; ?>" >;
                   <input type="hidden" name="code" value="<?php echo $Pfile['KodeReg']; ?>" >;
                   <button type="submit" class="btn btn-warning pull-right"><i class='fa fa-download'></i></button>
                </form><br /><br />
            </center>
            <?php if($Xfile[1]=='jpg') { ?>

              <center><i>mouse scroll zooming</i></center>
              <div class="container">
                  <img id="image" src="<?php echo $Pfile['Filename']; ?>" width=100%  alt="Picture">
              </div>
            <?php } else { ?>
                <!--<input id="zoomslider" class="zoomslider" type="range" min="0" max="100.00" step="1" ng-model="selectedRange">-->
                  <object id="viewST" data="viewerJS/#../<?php echo $Pfile['Filename']; ?>" type = "application/pdf"  width="100%" height="700" >
                  </object>
               <?php } ?>
             </span>

            </div>

          </div>
        </div>
  </div>


  <script src="bower_components/cropper/dist/cropper.js"></script>
  <script>
      var image = document.querySelector('#image');
      var cropper = new Cropper(image, {
        viewMode: 3,
        dragMode: 'move',
        autoCropArea: 1,
        restore: false,
        modal: false,
        guides: false,
        highlight: false,
        cropBoxMovable: false,
        cropBoxResizable: false,
        toggleDragModeOnDblclick: false,

    });

      $('#zoomOut').click(function(){
          image.cropper('zoom', 0.2);
      });
//
      $('#zoomIn').click(function(){
          image.cropper('zoom', -0.2);
      });
  document.addEventListener("contextmenu", function(e){
    e.preventDefault();
  }, false);
  </script>

</body>
</html>
<?php mysqli_close($connect);


?>