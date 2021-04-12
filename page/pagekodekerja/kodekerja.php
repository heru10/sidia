  <?php
    session_start();
    include_once "kodekerja.js";
    include_once "../../conf.php";
  ?>
  <section class="content-header">
      <h3>
        Kode Pekerjaan
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Kode Pekerjaan</li>
      </ol>
  </section>


  <div id="formtable">
  <section class="content" >
      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-body">
            <button type="button" onclick="getdata();" title="Tambah" class="btn btn-success"><i class="fa fa-database"></i>&nbsp;&nbsp;Tambah</button>
            <hr/>
            <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-blue">
                  <th width="2%"><div align="center">No.</div></th>
                  <th width="10%"><div align="center">Kode Pekerjaan</div></th>
				  <!-- Request Dian Sainproof, 7648 | Tri Wibowo, 25/02/2019  
                  <th width="20%"><div align="center">Uraian</div></th>
				  -->
                  <th width="8%"><div align="center">Status</div></th>
                  <th width="10%"><div align="center">Aksi</div></th>
                 </tr>
                </thead>
              </table>
            <div class="box-footer clearfix">
            </div>
            </div>
          </div>
          </div>
      </div>
  </section>
  </div>

  <div id="forminput">
  <section class="content">
      <div class="row">
        <div class="col-md-9">
          <div class="box">
            <div class="box-header with-border">
              <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus"></span></div>
            </div>
            <div class="box-body">
            <form role="form" name="myfrm" id="myfrm" method="post">
             <div class="form-group">
                <label class="text-red">Detail Produk *</label><br />
                <select class="form-control select2" id="txt4" name="txt4" style="width: 30%" required >
                        <option value="">- Pilih Detail Produk -</option>
                         <?php
                          $sql = "select DetailProdukId, DetailProdukName from master_detailproduk where StatusAct = '1' and RoleId like '".$_SESSION['RoleId']."%' ";
                          $result = mysqli_query($connect, $sql);
                             while($rows = mysqli_fetch_array($result)){
                               echo "<option value='".$rows['DetailProdukId']."'>".$rows['DetailProdukName']."</option>";
                             }
                          ?>
                </select>
              </div>
              <div class="form-group">
                <label class="text-red">Kode Pekerjaan *</label>
                <input type="text" name="txt1" id="txt1" class="form-control" required style="width:20%" />
              </div>
			<!-- Request Dian Sainproof, 7648 | Tri Wibowo, 25/02/2019  
              <div class="form-group">
                <label class="text-red">Uraian *</label>
                <textarea id='txt2' name='txt2' class="form-control" style="width: 50%"></textarea>
              </div>
			-->
              <div class="form-group">
                <label class="text-red">Status</label>&nbsp;&nbsp;
                <input type="checkbox" name="txt3" id="txt3" checked="checked" />
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
      </div>
  </section>
  </div>