  <?php
    include_once "group.js";
    include_once "../../conf.php";
  ?>
  <section class="content-header">
      <h1>
        Pengaturan Group Jabatan
        <small>Daftar Group Jabatan</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li>Pengaturan Umum</li>
        <li class="active">Group Jabatan</li>
      </ol>
  </section>

<section class="content">
  <div class="box box-info color-palette-box" id="formtable">
     <div class="box-body">
      <p>
         <button type="button" onclick="getdata();" title="Tambah Tingkat Perkembangan" class="btn btn-success"><i class="fa fa-database"></i>&nbsp;&nbsp;Tambah Group Jabatan</button>
      </p><hr/>
            <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-blue">
                  <th width="5%"><div align="center">No.</div></th>
                  <th width="80%"><div align="center">Group Jabatan</div></th>
                  <th width="15%"><div align="center">Aksi</div></th>
                 </tr>
                </thead>
              </table>
     </div>
   </div>

  <section class="content">
  <div class="box box-primary" id="forminput" style="display: none">
     <div class="box-header with-border">
         <h4 class="box-title">Form Group Jabatan</h4><hr/>
          <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus"></span></div>
     </div>
     <form role="form" name="myfrm" id="myfrm" method="post">
            <div class="box-body">
              <div class="form-group">
                <label class="text-red">Nama Group Jabatan *</label>
                <input type="text" name="txt1" id="txt1" class="form-control" required />
              </div>
              <div class="box-body pull-left">
                <input type="hidden" class='text-black' name="task" id="task" value="new"  />
                <input type="hidden" class='text-black' name="id" id="id" value="0"  />
                <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i><br />Simpan</button>
                <button type="button"  onclick="closed();" class="btn btn-default"><i class="fa fa-remove"></i><br />Close</button>
              </div>
           </div>
          </form>
        </div>

