  <?php
    include_once "klasifikasi.js";
    include_once "../../conf.php";
  ?>
  <section class="content-header">
      <h1>
        Pengaturan Klasifikasi
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Pengaturan Umum</a></li>
        <li class="active">Klasifikasi</li>
      </ol>
    </section>
    <section class="content">
    <!-- Form Input -->
    <div class="box box-info color-palette-box" id="forminput" style="display: none">
     <div class="box-header with-border">
          <h4 class="box-title">Form Klasifikasi</h4><hr/>
          <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus"></span></div>
       </div>
     <div class="box-body">
      <form role="form" name="myfrm" id="myfrm" method="post">
      <div class="row">
        <div class="box-body">
           <input type="hidden" class='text-black' name="task" id="task" value="new"  />
           <input type="hidden" class='text-black' name="id" id="id" value="0"  />
           <input type="hidden" class='text-black' name="count" value="14"  />
           <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i><br />Simpan</button>
           <button type="button"  onclick="closed();" class="btn btn-default"><i class="fa fa-remove"></i><br />Close</button>
         </div>
         <div class="box-body">
          <div id="form-group">
           <span class='pull-left'><b><label class='text-red' id='labelklas'></label></b></span>
         </div>
         </div>
        </div>
        <div class="nav-tabs-custom">
              <ul class="nav nav-tabs">
                <li class="active bg-info"><a href="#tab_1" data-toggle="tab"><i class="fa fa-clone"></i> Klasifikasi Arsip</a></li>
                <li class= "bg-success"><a href="#tab_2" data-toggle="tab"><i class="fa fa-bookmark-o"></i> Retensi Arsip</a></li>
                <li class= "bg-warning"><a href="#tab_3" data-toggle="tab"><i class="fa fa-legal"></i> Keamanan dan Akses</a></li>
              </ul>
        </div>
        <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
                 <div class="box-body">
                    <div id="form-group">
                       <label class="text-red">Pilih Klasifikasi Induk *</label>&nbsp;&nbsp;
                       <select class="form-control select2" name="txt1" id="txt1" style="width: 100%;"  required oninvalid="this.setCustomValidity('Kode Klasifikasi induk belum dipilih')" onchange="this.setCustomValidity('')" >
                          <option>~ Pilih Klasifikasi Induk ~</option>
                          <?php
                            $sql = "select ClId, ClName, ClCode from klasifikasi";
                            $result = mysqli_query($connect, $sql);
                            while($rows = mysqli_fetch_array($result)){
                              echo "<option value=".$rows['ClId'].">".$rows['ClCode'].' - '.$rows['ClName']."</option>";
                            }
                          ?>
                       </select>
                    </div>
                 </div>
                 <div class="box-body">
                    <div id="form-group">
                       <label class="text-red">Unit Kerja *</label>&nbsp;&nbsp;
                       <select class="form-control select3" name="txt1A[]" id="txt1A" multiple="multiple" style="width: 100%;"  required oninvalid="this.setCustomValidity('Unit Kerja belum di pilih !!')" onchange="this.setCustomValidity('')" >
                          <?php
                            $sql = "select RoleId, RoleName from role where RoleId != 'UK' and RoleId != 'Root' ";
                            $result = mysqli_query($connect, $sql);
                            while($rows = mysqli_fetch_array($result)){
                              echo "<option value=".$rows['RoleId'].">".$rows['RoleName']."</option>";
                            }
                          ?>
                       </select>
                    </div>
                 </div>
                 <div class="box-body col-md-2">
                    <div id="form-group">
                       <label class="text-red">Kode Klasifikasi *</label>
                       <input class="form-control" placeholder="Kode Klasifikasi" id="txt2" name="txt2" type="text" required required oninvalid="this.setCustomValidity('Kode Klasifikasi belum diisi')" oninput="setCustomValidity('')"  />
                    </div>
                 </div>
                 <div class="row box-body col-md-10">
                    <div id="form-group">
                       <label class="text-red">Nama Klasifikasi * </label>
                       <input class="form-control" onchange="labelklas();" placeholder="Nama Klasifikasi" id="txt3" name="txt3" type="text" required required oninvalid="this.setCustomValidity('Nama Klasifikasi induk belum dipilih')" oninput="setCustomValidity('')" />
                    </div>
                 </div>
                 <div class="box-body col-md-10">
                    <div id="form-group">
                       <label>Deskripsi </label>
                       <textarea id="txt4" name="txt4" class="form-control"></textarea>
                    </div>
                 </div>
                 <div class="box-body col-md-10">
                    <div id="form-group"><b>Status</b>&nbsp;&nbsp;
                       <label>
                         <input type="checkbox" id="txt5" name="txt5" checked="checked">&nbsp;&nbsp;Aktif
                       </label>
                    </div>
                 </div>
              </div>
               <div class="tab-pane" id="tab_2">
                 <div class="box-body col-md-2">
                    <div id="form-group">
                       <label>Retensi Aktif</label>
                       <input class="form-control" id="txt6" name="txt6" type="text" value="0">
                    </div>
                 </div>
                 <div class="row box-body col-md-10">
                    <div id="form-group">
                       <label>Keterangan</label>
                       <input class="form-control" id="txt7" name="txt7" value="-" type="text">
                    </div>
                 </div>
                 <div class="box-body col-md-2">
                    <div id="form-group">
                       <label>Retensi In-Aktif </label>
                       <input class="form-control" id="txt8" name="txt8" value="0" type="text">
                    </div>
                 </div>
                 <div class="row box-body col-md-10">
                    <div id="form-group">
                       <label>Keterangan</label>
                       <input class="form-control" id="txt9" name="txt9" value="-" type="text">
                    </div>
                 </div>
                 <div class="box-body col-md-10">
                    <div id="form-group" style="width: 30%">
                       <label>Penyusutan Akhir </label>
                       <select class="form-control" id="txt10" name="txt10"  >
                           <?php
                            $sql = "select SusutId, SusutName from master_susut";
                            $result = mysqli_query($connect, $sql);
                            while($rows = mysqli_fetch_array($result)){
                              echo "<option value=".$rows['SusutId'].">".$rows['SusutName']."</option>";
                            }
                          ?>
                       </select>
                    </div>
                 </div>
               </div>
               <div class="tab-pane" id="tab_3">
                   <div id="form-group">
                       <label>Klasfikasi Keamanan</label>
                       <select id='txt11' name='txt11' class="form-control" style="width: 40%" >
                           <?php
                             $sql = "Select ClKeamanan, KeamananName from master_klaskeamanan";
                             $result = mysqli_query($connect, $sql);
                             while($row=mysqli_fetch_array($result)){
                               echo "<option value=".$row['ClKeamanan'].">".$row['KeamananName']."</option>";
                             }
                           ?>
                       </select>
                    </div><br />
                    <div id="form-group">
                       <label>Hak Akses </label><br />
                       <select id="txt12" name="txt12[]" class="form-control select2" multiple="true" data-placeholder="Hak Akses" style="width: 100%;">
                          <?php
                             $sql = "select GroupId, GroupName from groupjabatan";
                             $result = mysqli_query($connect, $sql);
                             while($row=mysqli_fetch_array($result)){
                               echo "<option value='".$row['GroupId']."'>".$row['GroupName']."</option>";
                             }
                          ?>
                       </select>
                    </div><br />
                    <div id="form-group">
                       <label>Dasar Pertimbangan </label>
                       <textarea id="txt13" name="txt13" class="form-control" style="width: 50%" ></textarea>
                    </div><br />
                    <div style="display: none" id="form-group">
                       <label>Unit Pengolah </label><br />
                       <select id="txt14" name="txt14" placeholder="Unit Pengolah" class="form-control select2" style="width: 50%">
                       <?php
                             $sql = "select RoleId, RoleName from role where RoleId != 'Root'";
                             $result = mysqli_query($connect, $sql);
                             while($row=mysqli_fetch_array($result)){
                               echo "<option value='".$row['RoleId']."'>".$row['RoleName']."</option>";
                             }
                       ?>
                       </select>
                    </div><br /><br />
               </div>
             </div>
          </form>
        </div>
        </div>

        <!-- /.modal -->

      <!-- COLOR PALETTE -->
      <div class="box box-info color-palette-box" id="formtable">
       <div class="box-body"><br />
        <p>
        <button type="button" onclick="getdata();" title="Tambah Klasifikasi" class="btn btn-success"><i class="fa fa-database"></i>&nbsp;&nbsp;Tambah Klasifikasi</button>
        </p><hr/>
              <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-blue">
                  <th width="5%"><div align="center">Detail</div></th>
                  <th width="5%"><div align="center">No.</div></th>
                  <th width="40%"><div align="center">Kode / Nama Klasifikasi</div></th>
                  <th width="10%"><div align="center">Retensi Aktif</div></th>
                  <th width="10%"><div align="center">Retensi In-Aktif</div></th>
                  <th width="5%"><div align="center">Status</div></th>
                  <th width="15%"><div align="center">Aksi</div></th>
                 </tr>
                </thead>
              </table>
        </div>
      </div>
