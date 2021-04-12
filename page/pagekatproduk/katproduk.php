  <?php
    include_once "katproduk.js";
    include_once "../../conf.php";
  ?>
  <section class="content-header">
      <h3>
        Kategori Produk
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Kategori Produk</li>
      </ol>
  </section>

  <div id="formtable">
  <section class="content" >
      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border"></div>
            <div class="box-body">
            <button type="button" onclick="getdata();" title="Tambah" class="btn btn-success"><i class="fa fa-database"></i>&nbsp;&nbsp;Tambah</button>
            <hr/>
            <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-blue">
                  <th width="5%"><div align="center">No.</div></th>
                  <th width="60%"><div align="center">Kategori Produk</div></th>
                  <th width="7%"><div align="center">Status</div></th>
                  <th width="15%"><div align="center">Aksi</div></th>
                 </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>
  </section>
  </div>
  </div>


  <div id="forminput" style="display: none">
  <section class="content">
      <div class="row">
          <div class="box">
            <div class="box-header with-border">
              <h4 class="box-title">Form Kategori Produk</h4><hr />
              <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus"></span></div>
            </div>
            <div class="box-body">
            <form role="form" name="myfrm" id="myfrm" method="post">
              <div class="form-group">
                <label class="text-red">Kategori Produk *</label>
                <input type="text" name="txt1" id="txt1" class="form-control" required />
              </div>
              <div class="form-group">
                <label class="text-red">Status</label>&nbsp;&nbsp;
                <input type="checkbox" name="txt2" id="txt2" checked="checked"  />&nbsp;&nbsp;Aktif
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