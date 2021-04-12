  <?php
    include_once "people.js";
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
      <h1>
        Pengaturan Pengguna
        <small>Daftar Pengguna</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Pengaturan Umum</a></li>
        <li class="active">Pengguna</li>
      </ol>
    </section>
    <div class="col-md-12" id="forminput" style="display: none" >
    <section class="content">
    <!-- Form Input -->
       <div class="box box-primary">
            <div class="box-header with-border">
              <h4 class="box-title">Form Pengguna</h4><hr/>
              <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus"></span></div>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" name="myfrm" id="myfrm" method="post">
              <div class="box-body">
                <div class="form-group">
                  <label class="text-red">Pilih Unit Kerja *</label>&nbsp;&nbsp;
                       <select class="form-control select2" name="txt1" id="txt1" style="width: 100%;">
                          <!--<option>~ Pilih Atasan Unit Kerja ~</option>-->
                          <?php
                            $sql = "select RoleId, RoleName from role where RoleId != 'Root'";
                            $result = mysqli_query($connect, $sql);
                            while($rows = mysqli_fetch_array($result)){
                              echo "<option value=".$rows['RoleId'].">".$rows['RoleName']."</option>";
                            }
                          ?>
                       </select>
                </div>
                <div id="form-group">
                    <label class="text-red">NP *</label>
                    <input type="hidden" name="tempnp" id="tempnp" />
                    <input class="form-control" placeholder="Nomor Pokok" id="txt2A" name="txt2A" type="text" required>
                </div><br />
                <div id="form-group">
                    <label class="text-red">Nama Lengkap *</label>
                    <input type="hidden" name="tempname" id="tempname" />
                    <input class="form-control" placeholder="Nama Lengkap" id="txt2" name="txt2" type="text" required>
                </div><br />
                <div id="form-group">
                    <label>Email </label>
                    <input type="email" id="txt3" name="txt3" placeholder="Alamat Email" class="form-control" />
                </div><br />
                <div id="form-group">
                   <label>Tipe Pengguna </label>
                       <select id="txt4" name="txt4" class="form-control" style="width:50%">
                          <option value="1">Super Admin</option>
                          <option value="2">Admin</option>
                          <option value="3">User</option>
                       </select>
                </div>
                <br />
                <table class="table">
                  <tr>
                    <td width="15%"><b>Status Pengguna</b></td>
                    <td><input type="checkbox" id="txt5" name="txt5" value="1" checked="checked"> Aktif</td>
                  </tr>
                  <tr>
                    <td width="15%"><b>Proses Approve</b></td>
                    <td><input type="checkbox" id="txt10" name="txt10" > Approve <input type="hidden" id="txt10a" name="txt10a" value="0" ></td>
                  </tr>
                  <tr>
                    <td width="15%"><b>Akses Menu Reg. Dokumen Vital</b></td>
                    <td>
                        <input type="checkbox" id="m0" name="akses[]" value="m0"> Dokumen Dalitas &nbsp;&nbsp;
                        <input type="checkbox" id="m1" name="akses[]" value="m1"> Dokumen Sainprof &nbsp;&nbsp;
                        <input type="checkbox" id="m2" name="akses[]" value="m2"> Dokumen OSDM    &nbsp;&nbsp;
                        <input type="checkbox" id="m3" name="akses[]" value="m3"> Dokumen Vital Umum &nbsp;&nbsp;
                        <input type="checkbox" id="m4" name="akses[]" value="m4"> <span class='text-red'><b>Pengaturan Umum</b></span> &nbsp;&nbsp;
                    </td>
                  </tr>
                </table>
                <hr/>
                <div id="form-group">
                    <label class="text-red">Nama Pengguna *</label>
                    <input class="form-control" placeholder="Nama Pengguna" id="txt7" name="txt7" type="text" required>
                </div><br />
                <div id="form-group">
                    <label class="text-red">Kata Kunci *</label>
                    <input class="form-control" placeholder="Kata Kunci" id="txt8" name="txt8" type="password" required>
                </div><br />
                <div id="form-group">
                    <label class="text-red">Konfirmasi Kata Kunci *</label>
                    <input class="form-control" placeholder="Konfirmasi Kata Kunci" id="txt9" name="txt9" type="password" required>
                </div>
                <div class="modal-footer">
                   <div class="box-body pull-left">
                        <input type="hidden" class='text-black' name="task" id="task" value="new"  />
                        <input type="hidden" class='text-black' name="id" id="id" value="0"  />
                        <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i><br />Simpan</button>
                        <button type="button"  onclick="closed();" class="btn btn-default"><i class="fa fa-remove"></i><br />Close</button>
                    </div>
                </div>
            </div>
         </form>
      </div>
     </section>
    </div>
      <!-- COLOR PALETTE -->
  <div class="col-md-12" id="formtable" style="display: none">
    <section class="content" >
      <div class="box box-info color-palette-box" id="formtable">
       <div class="box-body"><br />
        <p>
        <button type="button" onclick="getdata();" title="Tambah Pengguna" class="btn btn-success"><i class="fa fa-database"></i>&nbsp;&nbsp;Tambah Pengguna</button>
        </p><hr/>
              <table id="mytbl" class="table table-bordered table-striped">

                <thead>
                 <tr class="bg-blue">
                  <th width="5%"><div align="center">No.</div></th>
                  <th width="30%"><div align="center">Nama Lengkap</div></th>
                  <th width="30%"><div align="center">Unit Kerja</div></th>
                  <th width="5%"><div align="center">Tipe Pengguna</div></th>
                  <th width="15%"><div align="center">Nama Pengguna</div></th>
                  <th width="5%"><div align="center">Status</div></th>
                  <th width="15%"><div align="center">Aksi</div></th>
                 </tr>
                </thead>
                <tfoot class="bg-info">
                    <tr >
                        <th>&nbsp;</th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th>&nbsp;</th>
                        <th>&nbsp;</th>
                    </tr>
                </tfoot>

              </table>
        </div>
      </div>
    </section>
  </div>

