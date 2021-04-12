<!DOCTYPE html>
<?php
 session_start();
 include "../../conf.php";

 if(isset($_REQUEST['ids']))
  $idr = $_REQUEST['ids'];
 if(isset($_REQUEST['idr']))
  $ids = $_REQUEST['idr'];
 if(isset($_REQUEST['pfile']))
    $Pfile = $_REQUEST['pfile'];

  $sql = "select Filename, KodeReg from filesdigital_v1 where FilesId = '".$Pfile."' ";
  $result = mysqli_query($connect, $sql);
  $Pfile = mysqli_fetch_array($result);
  $len = strlen($Pfile['Filename']) - 6;
  $zfile = substr($Pfile['Filename'],6,$len);
  $zfile1 = explode("/",$zfile);
  $Xfile = explode(".",$zfile1[3]);
  $filer = explode("/",$Pfile['Filename']);
  $Pfilex= $filer[0]."/".$filer[1].'/'.$filer[2].'/'.$filer[3];
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
              <button type="button" onclick="pageurl('page/pagedaftararsip_v1/daftararsip.php?id=<?php echo $ids; ?>&idx=<?php echo $idr; ?>');"  class="btn btn-info" data-widget="collapse"><i class="fa fa-mail-reply"></i>
                  &nbsp; Kembali&nbsp;
                </button>
            </div>
            <div class="box-body">

            <form action="tcpdf/print.php" method="post">
                    <input type="hidden" name="filename" value="<?php echo $Pfilex; ?>" >;
                    <input type="hidden" name="code" value="<?php echo $Pfile['KodeReg']; ?>" >;
                    <button type="submit" class="btn btn-success pull-right" onclick='<?php logdok($Pfile['Filename'], $Pfile['KodeReg']); ?>'><i class='fa fa-download'></i> Barcode File</button>
                    <a href='<?php echo $Pfilex; ?>' download onclick='<?php logdok($Pfile['Filename'], $Pfile['KodeReg']); ?>' class="btn btn-warning pull-right"><i class='fa fa-download'></i>&nbsp;Original File</a><br /><br />
            </form><br />
            <?php if($Xfile[1]=='jpg' or $Xfile[1]=='jpeg' or $Xfile[1]=='JPG' or $Xfile[1]=='JPEG') { ?>
              <center><i>mouse scroll zooming</i></center>
              <div class="container">
                  <img id="image" src="<?php echo $Pfilex; ?>" width=100%  alt="Picture">
              </div>
            <?php } else { ?>
                <!--<input id="zoomslider" class="zoomslider" type="range" min="0" max="100.00" step="1" ng-model="selectedRange">-->
                  <!--<object data="<?php echo $Pfilex; ?>" type = "application/pdf" width="100%" height="400"  ></object>-->
                  <object id="viewST" data="viewerJS/#../<?php echo $Pfilex; ?>" type = "application/pdf"  width="100%" height="700" >
                  </object>
               <?php } ?>

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

  </script>

</body>
</html>
<?php mysqli_close($connect); ?>