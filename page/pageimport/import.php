  <?php
    include_once "import.js";
  ?>
  <section class="content-header">
      <h3>
        Import Dokumen Aktif
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Import Excel</li>
      </ol>
  </section>

  <div id="forminput" style="padding-left: 20px; padding-right: 20px">
  <section class="content">
      <div class="row">
          <div class="box">
            <div class="box-header with-border">
              <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto">Import Dokumen Excel</div>
            </div>
            <div class="box-body">
             <a href="page/pageimport/form_aktif.xls" download><button class='btn btn-info'>Unduh Table Template (.xls)</button></a>
            <hr/>
            <form role="form" name="myfrm" id="myfrm" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label class="text-red">Upload Dokumen Aktif <small>(.xls)</small></label>
                <input type="file" name="myfile" id="myfile" required />
              </div>
              <div class="box-body pull-left">
                <input type="hidden" class='text-black' name="task" id="task" value="new"  />
                <input type="hidden" class='text-black' name="id" id="id" value="0"  />
                <input type="hidden" class='text-black' name="req" id="req"  />
                <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i>&nbsp;Upload</button>
              </div>
            </form>
           </div>
        </div>
       </div>
  </section>
  </div>