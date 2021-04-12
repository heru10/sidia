  <?php
    session_start();
    include_once "detailproduk.js";
    include_once "../../conf.php";
  ?>
 <style type="text/css">
  /*<![CDATA[*/
   tfoot {
    display: table-header-group;
   }
  /*]]>*/
  </style>
  <section class="content-header">
      <h3>
        Detail Produk
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Detail Dokumen Produk</li>
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
                  <th width="20%"><div align="center">Kategori Produk</div></th>
                  <th width="20%"><div align="center">Nama Produk</div></th>
                  <th width="20%"><div align="center">Detail Produk</div></th>
                  <th width="8%"><div align="center">Status</div></th>
                  <th width="10%"><div align="center">Aksi</div></th>
                 </tr>
                </thead>
                <tfoot class="bg-info">
                    <tr >
                        <th>&nbsp;</th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th>&nbsp;</th>
                        <th>&nbsp;</th>
                    </tr>
                </tfoot>
              </table>
            <div class="box-footer clearfix">
            </div>
            </div>
          </div>
          </div>
      </div>
  </section>
  </div>

  <div id="forminput" style="display: none">
  <section class="content">
      <div class="row">
        <!--<div class="col-md-9">-->
          <div class="box">
            <div class="box-header with-border">
              <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus"></span></div>
            </div>
            <div class="box-body">
            <form role="form" name="myfrm" id="myfrm" method="post">
              <div class="form-group">
                <label class="text-red">Kategori Produk *</label>
                <select class="form-control" id="txt1" name="txt1" required style="width:20%">
                    <option value="">~ Pilih Kategori Produk ~</option>
                     <?php
                          $sql = "select KatProdukId, KatProdukName from master_katproduk where StatusAct = '1' and RoleId = '".$_SESSION['RoleId']."' ";
                          $result = mysqli_query($connect, $sql);
                          while($row=mysqli_fetch_array($result))
                             echo "<option value='".$row['KatProdukId']."'>".$row['KatProdukName']."</option>";
                      ?>
                </select>
              </div>
              <div class="form-group">
                <label class="text-red">Nama Produk *</label>
                <select class="form-control" id="txt2" name="txt2" required style="width:20%" >
                </select>
              </div>
              <div class="form-group">
                <label class="text-red">Detail Produk *</label>
                <input type="text" name="txt3" id="txt3" class="form-control" required style="width:40%" />
              </div>
              <div class="form-group">
                <label class="text-red">Status</label>&nbsp;&nbsp;
                <input type="checkbox" name="txt4" id="txt4" checked="checked" />
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
       <!--</div>-->
      </div>
  </section>
  </div>