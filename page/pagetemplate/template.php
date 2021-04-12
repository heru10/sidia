  <?php
    include_once "template.js";
    include_once "../../conf.php";
  ?>
  <section class="content-header">
      <h3>
           Template Dokumen
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Template Dokumen</li>
      </ol>
  </section>

<div id="formtable">
  <section class="content">
      <div class="row">
          <div class="box">
            <div class="box-body">
            <button type="button" onclick="getdata();" title="Tambah Template Dokumen" class="btn btn-success"><i class="fa fa-database"></i>&nbsp;&nbsp;Tambah Template</button>
            <hr/>
            <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-blue">
                  <th width="5%"><div align="center">No.</div></th>
                  <th width="80%"><div align="center">Template Dokumen</div></th>
                  <th width="15%"><div align="center">Aksi</div></th>
                 </tr>
                </thead>
              </table>
            <div class="box-footer clearfix">
            </div>
            </div>
          </div>
        </div>
  </section>
  </div>


  <div id="forminput">
  <section class="content">
      <div class="row">
          <div class="box">
            <div class="box-header with-border">
              
              <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus"></span></div>
            </div>
            <div class="box-body">
            <form role="form" name="myfrm" id="myfrm" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label class="text-red">Template Dokumen *</label>
                <input type="text" name="txt1" id="txt1" class="form-control" required />
              </div>
              <div class="form-group">
                <label>Upload Dokumen </label>
                <input type="file" name="myfiles" id="myfiles"  /><br />
                <p class="text-info" id='fileview'></p>
              </div>
              <div class="box-body pull-left">
                <input type="hidden" class='text-black' name="task" id="task" />
                <input type="hidden" class='text-black' name="id" id="id"  />
                <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i><br />Simpan</button>
                <button type="button"  onclick="closed();" class="btn btn-default"><i class="fa fa-remove"></i><br />Close</button>
              </div>
            </form>
           </div>
        </div>
       </div>
  </section>
  </div>