  <?php
    include_once "unitkerja.js";
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
        Pengaturan Unit Kerja
        <small>Daftar unit kerja</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Pengaturan Umum</a></li>
        <li class="active">Unit Kerja</li>
      </ol>
    </section>

    <section class="content">
    <!-- COLOR PALETTE -->
      <div class="box box-info color-palette-box" id="formtable">
       <div class="box-body"><br />
        <p>
        <button type="button" onclick="getdata();" title="Tambah Unit Kerja" class="btn btn-success"><i class="fa fa-database"></i>&nbsp;&nbsp;Tambah Unit Kerja</button>
        </p><hr/>
              <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-blue">
                  <th width="5%"><div align="center">No.</div></th>
                  <th width="10%"><div align="center">Kode Unit Kerja</div></th>
                  <th width="40%"><div align="center">Nama Unit Kerja</div></th>
                  <th width="15%"><div align="center">Group</div></th>
                  <th width="15%"><div align="center">Aksi</div></th>
                 </tr>
                </thead>
                <tfoot class="bg-info">
                    <tr >
                        <th>&nbsp;</th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th>&nbsp;</th>
                    </tr>
                </tfoot>
              </table>
        </div>
      </div>

    <!-- Form Input -->
    <div class="box box-primary" id="forminput" style="display: none">
       <div class="box-header with-border">
          <h4 class="box-title">Form Unit Kerja</h4><hr/>
             <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus"></span></div>
       </div>
            <form role="form" name="myfrm" id="myfrm" method="post">
                 <div class="box-body">
                    <div id="form-group">
                       <label class="text-red">Pilih Unit Kerja Induk *</label>&nbsp;&nbsp;
                       <select class="form-control select2" name="txt1" id="txt1" style="width: 100%;" required>
                          <option value="0">~ Pilih Atasan Unit Kerja ~</option>
                          <?php
                            $sql = "select RoleId, RoleName from role where RoleId != 'Root'";
                            $result = mysqli_query($connect, $sql);
                            while($rows = mysqli_fetch_array($result)){
                              echo "<option value=".$rows['RoleId'].">".$rows['RoleName']."</option>";
                            }
                          ?>
                       </select>
                    </div>
                 </div>
                <div class="box-body">
                 <div id="form-group">
                       <label class="text-red">Kode Unit Kerja *</label>
                       <input  class="form-control" placeholder="Kode Unit Kerja" id="txt1A" name="txt1A" type="text" style="width: 30%" required>
                 </div>
                 </div>
                 <div class="box-body">
                    <div id="form-group">
                       <label class="text-red">Nama Unit Kerja *</label>
                       <input class="form-control" placeholder="Nama Unit Kerja" id="txt2" name="txt2" type="text" required>
                    </div>
                 </div>
                 <div class="box-body">
                    <div id="form-group">
                       <label class="text-red">Group Jabatan *</label>&nbsp;&nbsp;
                       <select class="form-control" name="txt3" id="txt3" style="width: 100%;" required>
                          <option selected="selected">~ Pilih Group Jabatan ~</option>
                          <?php
                            $sql = "select GroupId, GroupName from groupjabatan";
                            $result = mysqli_query($connect, $sql);
                            while($rows = mysqli_fetch_array($result)){
                              echo "<option value=".$rows['GroupId'].">".$rows['GroupName']."</option>";
                            }
                          ?>
                       </select>
                    </div>
                 </div>
                 <div class="box-body">
                    <div id="form-group">
                       <label>Deskripsi Unit Kerja </label>
                       <textarea class="form-control" placeholder="Nama Unit Kerja" id="txt4" name="txt4" type="text"></textarea>
                    </div>
                 </div>
              <div class="modal-footer">
               <div class="box-body pull-left">
                <input type="hidden" class='text-black' name="task" id="task" value="new"  />
                <input type="hidden" class='text-black' name="id" id="id" value="0"  />
                <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i><br />Simpan</button>
                <button type="button"  onclick="closed();" class="btn btn-default"><i class="fa fa-remove"></i><br />Close</button>
              </div>
            </div>
          </form>
        </div>
        <!-- /.modal -->



