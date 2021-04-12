  <?php
    include_once "tperkembangan.js";
    include_once "../../conf.php";
  ?>
  <section class="content-header">
      <h3>
        Tingkat Perkembangan
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Tingkat Perkembangan</li>
      </ol>
  </section>

 <div id="formtable">
  <section class="content">
      <div class="row">
          <div class="box">
            <div class="box-body">
            <button type="button" onclick="getdata();" title="Tambah Tingkat Perkembangan" class="btn btn-success"><i class="fa fa-database"></i>&nbsp;&nbsp;Tambah Tingkat Perkembangan</button>
            <hr/>
            <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-blue">
                  <th width="5%"><div align="center">No.</div></th>
                  <th width="80%"><div align="center">Tingkat Perkembangan</div></th>
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
              <h4 class="box-title">Form Tingkat Perkembangan</h4><hr/>
              <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus"></span></div>
            </div>
            <div class="box-body">
            <form role="form" name="myfrm" id="myfrm" method="post">
              <div class="form-group">
                <label class="text-red">Tingkat Perkembangan *</label>
                <input type="text" name="txt1" id="txt1" class="form-control" required />
              </div>
              <div class="box-body pull-left">
                <input type="hidden" class='text-black' name="task" id="task" value="new"  />
                <input type="hidden" class='text-black' name="id" id="id" value="0"  />
                <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i><br />Simpan</button>
                <button type="button"  onclick="closed();" class="btn btn-default"><i class="fa fa-remove"></i><br />Close</button>
              </div>
            </form>
           </div>
        </div>
       </div>
  </section>
 </div>