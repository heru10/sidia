<script src="bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

  <?php
  session_start();
    include_once "regvital.js";
    include_once "../../conf.php";
    $codreg = code("MV-",15);
    $select_uk = "";
    if($_SESSION['RoleId']!="UK" and $_SESSION['RoleId']!="Root"){
      $select_uk = 'disabled';
    }
  ?>
  <section class="content-header">
      <h3>
        Registrasi Metadata Dokumen Vital
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Registrasi Metadata Dokumen Vital</li>
      </ol>
  </section>


  <div id="formtable">
  <section class="content" >
      <div class="row">
        <!--<div class="col-md-9">-->
          <div class="box">
            <div class="box-header with-border">
              <h4 class="box-title">Daftar Dokumen Vital</h4>
            </div>
            <div class="box-body">
            <button type="button" onclick="getdata();" title="Add Document" class="btn btn-success"><i class="fa fa-database"></i>&nbsp;&nbsp;Tambah</button>
            <hr/>
            <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-red">
                  <th width="2%"><div align="center">Detail</div></th>
                  <th width="2%"><div align="center">No.</div></th>
                  <th width="15%"><div align="center">Kategori Dok. Produk</div></th>
                  <th width="12%"><div align="center">Jenis Dok. Produk</div></th>
                  <th width="22%"><div align="center">Deskripsi Dokumen</div></th>
                  <th width="10%"><div align="center">Tahun</div></th>
                  <th width="20%"><div align="center">Unit Pengolah</div></th>
                  <th width="10%"><div align="center">Aksi</div></th>
                 </tr>
                </thead>
                <tbody>
                   <tr>
                     <td colspan="7"></td>
                   </tr>
                </tbody>
              </table>

            </div>
          </div>
      </div>
  </section>
  </div>
  <div class="box-body" id="formdetail" style="display: none">
      <div class="box-header with-border">
        <h4 class="box-title">Detail Information Dokumen</h4>
      </div>

  </div>

  <div id="forminput">
  <section class="content">
      <div class="row">
      <form role="form" name="myfrm" id="myfrm" method="post" enctype="multipart/form-data">
          <div class="box">
            <div class="box-header with-border">
              <h4 class="box-title">Form Registrasi Dokumen</h4><hr />
              <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus"></span></div>
            </div>
            <div class="box-body">
                  <span class="pull-left">
                     <label class='bg-info' style="padding: 10px">Nomor Reg. <?php echo $codreg;  ?></label>
                     <input type="hidden" name="codereg" value="<?php echo $codreg; ?>" />
                  </span>
              <span class="pull-right">
                <label>19/09/2019 - Agus Haryono</label>
              </span><br />
              <hr/>
           <div class="box-body">
            <table class="table" border="0">
               <tr>
                 <td width="20%"><b class="text-red">Tanggal Penciptaan</b></td>
                 <td>
                      <div class="input-group date col-md-3">
                            <input type="text" class="form-control pull-right"  id="datepicker" name="txt1" value="<?php echo date('d/m/Y'); ?>" required>
                        <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </div>
                      </div>
                 </td>
               </tr>
               <tr>
                  <td><b class="text-red">Nomor Dokumen</b></td>
                  <td>
                    <input type="text" name="txt2" id="txt2" class="form-control" style="width: 40%"  required />
                  </td>
               </tr>
               <tr>
                  <td><b class="text-red">Unit Kerja Pemilik Dokumen</b></td>
                  <td>
                    <input type="hidden" id="txt3a" name="txt3a" />
                    <select class="form-control select4" <?php echo $select_uk;  ?> id="txt3" name="txt3" style="width: 50%" required >
                      <?php
                          $sql = "select RoleId, RoleName from role where RoleId != 'Root' and RoleId != 'UK'";
                          $result = mysqli_query($connect, $sql);
                             while($rows = mysqli_fetch_array($result)){
                              if($_SESSION['RoleId'] == $rows['RoleId'])
                               echo "<option value='".$rows['RoleId']."' selected>".$rows['RoleName']."</option>";
                              else
                               echo "<option value='".$rows['RoleId']."'>".$rows['RoleName']."</option>";
                             }
                          ?>
                      </select>
                  </td>
               </tr>
               <tr>
                  <td><b class="text-red">Jenis Dokumen Produk</b></td>
                  <td>
                    <select class="form-control select5" name="txt4" id="txt4" style="width: 30%;" required>
                      <option value="">~ Pilih Jenis Dokumen ~</option>
                      <?php
                         include_once "../../conf.php";
                         $sql = "select JProdukId, ProdukName from master_jproduk";
                         $result = mysqli_query($connect, $sql);
                         while($row=mysqli_fetch_array($result)){
                           echo "<option value='".$row['JProdukId']."'>".$row['ProdukName']."</option>";
                         }
                      ?>
                    </select>
                  </td>
               </tr>
               <tr>
                  <td><b class="text-red">Kategori Dokumen Produk</b></td>
                  <td>
                    <select class="form-control" name="txt5" id="txt5" style="width: 30%;" required>
                      <option value="">~ Pilih Kategori Dokumen ~</option>
                      <?php
                         include_once "../../conf.php";
                         $sql = "select KatProdukId, KatProdukName from master_katproduk";
                         $result = mysqli_query($connect, $sql);
                         while($row=mysqli_fetch_array($result)){
                           echo "<option value='".$row['KatProdukId']."'>".$row['KatProdukName']."</option>";
                         }
                      ?>
                    </select>
                  </td>
               </tr>
               <tr>
                  <td><b class="text-red">Tahun Penciptaan</b></td>
                  <td>
                     <input type="text" name="txt6" id="txt6" class="form-control" style="width: 30%"/>
                  </td>
               </tr>
               <tr>
                  <td><b class="text-red">Uraian Dokumen</b></td>
                  <td>
                     <textarea class="form-control" id="txt7" name="txt7" style="width:50%"></textarea>
                  </td>
               </tr>
               <tr>
                  <td><b class="text-red">Jumlah Dokumen</b></td>
                  <td>
                    <div class="input-group input-group-sm col-md-3">
                    <input type="text" class="form-control" id="txt8" name="txt8" required>
                    <div class="input-group-btn">
                      <select class="btn btn-warning dropdown-toggle" id="txt9" name="txt9" >
                      <?php
                          $sql = "select SatuanId, SatuanArsip  from master_satuanarsip";
                             $result = mysqli_query($connect, $sql);
                             while($row=mysqli_fetch_array($result)){
                               echo "<option value='".$row['SatuanId']."'>".$row['SatuanArsip']."</option>";
                             }
                          ?>
                      </select>
                    </div>
                    </div>
                  </td>
               </tr>
               <tr>
                  <td>Nomor/Nama Folder</td>
                  <td>
                    <select class="form-control select3" id="txt10" name="txt10" style="width: 50%" >
                      <?php
                          $sql = "select BerkasId, concat(NomorBerkas,'-', BerkasName  from berkas ";
                          $result = mysqli_query($connect, $sql);
                          if(mysqli_num_rows($result)>1){
                             while($row=mysqli_fetch_array($result)){
                               echo "<option value='".$row['SatuanId']."'>".$row['SatuanArsip']."</option>";
                             }
                          }
                          ?>
                      </select>
                  </td>
               </tr>
               <tr>
                  <td>Tingkat Perkembangan</td>
                  <td>
                    <select class="form-control" id="txt11" name="txt11" style="width: 20%" >
                      <?php
                          $sql = "select TPId, TPName from master_tperkembangan";
                          $result = mysqli_query($connect, $sql);
                          if(mysqli_num_rows($result)>1){
                             while($row=mysqli_fetch_array($result)){
                               echo "<option value='".$row['TPId']."'>".$row['TPName']."</option>";
                             }
                          }
                          ?>
                      </select>
                  </td>
               </tr>
               <tr>
                  <td>Tingkat Akses Publik</td>
                  <td>
                     <select class="form-control" id="txt12" name="txt12" style="width: 20%" >
                       <option value="buka">Terbuka</option>
                       <option value="tutup">Tertutup</option>
                     </select>
                  </td>
               </tr>
               <tr>
                  <td>Media Dokumen</td>
                  <td>
                     <select class="form-control" id="txt13" name="txt13" style="width: 20%" >
                      <?php
                          $sql = "select MediaId, MediaName from master_media";
                          $result = mysqli_query($connect, $sql);
                          if(mysqli_num_rows($result)>1){
                             while($row=mysqli_fetch_array($result)){
                               echo "<option value='".$row['MediaId']."'>".$row['MediaName']."</option>";
                             }
                          }
                          ?>
                      </select>
                  </td>
               </tr>
               <tr>
                 <td>Tesaurus</td>
                 <td>
                   <input type="text" name="txt14" id="txt14" class="form-control" />
                   <small>*) Gunakan tanda pemisah (;)</small>
                 </td>
               </tr>
               <tr>
                 <td>Catatan / Kondisi Dokumen</td>
                 <td>
                   <input type="text" name="txt15" id="txt15" class="form-control" />
                 </td>
               </tr>
               <tr id='tdbrowser'>
                  <td>Upload File Document</td>
                  <td>
                    <input type="file" style="padding: 5px" onchange="getupload();" onclick="moveupload();" id="myfiles" name="myfiles[]" multiple="" />
                    <small class="text-red">*) file max. upload 2 Mb</small>
                    <input type="hidden" id="sizefile" />
                  </td>
               </tr>
               <tr>
                  <td colspan="2">
                     <div class="box-body" id='filebox' style="display: none">
                        <div class="box-body no-padding">

                            <table class="table table-striped" style="width: 70%">
                                <thead class="btn-light">
                                    <tr>
                                        <td width="2%"><b>No.</b></td>
                                        <td width="20%"><b>Filename</b></td>
                                        <td width="10%"><b>Size</b></td>
                                    </tr>
                                </thead>
                            <tbody id="olfiles"></tbody>
                            </table>
                        </div>
                    </div>
                  </td>
               </tr>
            </table>
            <div class="box-body pull-left">
                    <input type="hidden" name="task" id="task" value="new"  />
                    <input type="hidden" name="id" id="id" value="0"  />
                    <input type="hidden" name="count" value="15"  />
                    <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i><br />Simpan</button>
                    <button type="button"  onclick="closed();" class="btn btn-default"><i class="fa fa-remove"></i><br />Close</button>
              </div>
            </div>
           </div>
        </div>
        </form>
       </div>
      </div>




  </section>

