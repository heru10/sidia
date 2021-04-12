<!DOCTYPE html>
<?php
 include "../../conf.php";
 if(isset($_GET['ids']))
    $ids = $_GET['ids'];
 if(isset($_GET['pfile']))
  $Pfile = $_GET['pfile'];

  $sql = "select * from detailvitalfile_proof where DetVFileId = '".$Pfile."' and RegVitalId = '".$ids."'  ";
  $result = mysqli_query($connect, $sql);
  $Pfile = mysqli_fetch_array($result);
  $Xfile = explode(".",$Pfile['Filename']);
  $filer = explode("/",$Pfile['Filename']);

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
             <br /><br />
              <div class="box-tools">

                <button type="button" onclick="pageurl('page/pageregdetailvitalproof/regdetailvitalproof.php?ids=<?php echo $ids; ?>');"  class="btn btn-info pull-right" data-widget="collapse"><i class="fa fa-mail-reply"></i>
                  &nbsp; Kembali&nbsp;
                </button>
              </div>
            </div>
            <div class="box-body">
            <!--<form action="tcpdf/print.php" method="post">
                    <input type="hidden" name="filename" value="<?php echo $Pfile['Filename']; ?>" >;
                    <input type="hidden" name="code" value="<?php echo $Pfile['KodeReg']; ?>" >;
                    <button type="submit" class="btn btn-warning pull-right"><i class='fa fa-download'></i></button>
            </form><br />-->
            <?php if($Xfile[1]=='jpg' or $Xfile[1]=='jpeg' or $Xfile[1]=='JPG' or $Xfile[1]=='JPEG') { ?>
              <center><i>mouse scroll zooming</i></center>
              <div class="container">
                  <img id="image" src="<?php echo $Pfile['Filename']; ?>" width=100%  alt="Picture">
              </div>
            <?php } else { ?>
                <!--<input id="zoomslider" class="zoomslider" type="range" min="0" max="100.00" step="1" ng-model="selectedRange">-->
                  <!--<object data="<?php echo $Pfile['Filename']; ?>" type = "application/pdf" width="100%" height="400"  ></object>-->
                  <object id="viewST" data="viewerJS/#../<?php echo $Pfile['Filename']; ?>" type = "application/pdf"  width="100%" height="700" >
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