<!DOCTYPE html>
<?php
 include "../../conf.php";

 if(isset($_REQUEST['ids']))
  echo $idr = $_REQUEST['ids'];
 if(isset($_REQUEST['idr']))
  echo $ids = $_REQUEST['idr'];
 if(isset($_REQUEST['pfile']))
    $Pfile = $_REQUEST['pfile'];

  $sql = "select Filename from filesdigital_v1 where FilesId = '".$Pfile."' ";
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
             <span class="alert bg-green"><i class="fa fa-street-view fa-1x">&nbsp;<?php echo strtolower($filer[3]);  ?></i></span>
              <div class="box-tools">

                <button type="button" onclick="pageurl('page/pageregarsip_v1/regarsip.php?id=<?php echo $ids; ?>&idx=<?php echo $idr; ?>');"  class="btn btn-info pull-right" data-widget="collapse"><i class="fa fa-mail-reply"></i>
                  &nbsp; Kembali&nbsp;
                </button>
              </div>
            </div>
            <div class="box-body">
            <?php if($Xfile[1]=='jpg' or $Xfile[1]=='png' or $Xfile[1]=='bmp') { ?>
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