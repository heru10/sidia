<script src="bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

  <?php
  session_start();
    include_once "regdokberkas.js";
    include_once "../../conf.php";
    $codreg1 = "Nomor Reg. ".code("B-",15);
    $codreg2 = code("B-",15);
    $select_uk = "";
    if($_SESSION['RoleId']!="UK" and $_SESSION['RoleId']!="Root"){
      $select_uk = 'disabled';
    }
    unset($_SESSION['headberkas']);

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
        Manajemen Dokumen Vital
      </h3>
        <?php echo $_SESSION['RoleName']; ?>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Manajemen Dokumen Vital</li>
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
            <button type="button" onclick="getdata();" title="Add Document" class="btn btn-success"><i class="fa fa-database"></i>&nbsp;&nbsp;Tambah Berkas</button>
            <button type="button" onclick="getdata_masal();" title="Add Document" class="btn btn-warning"><i class="fa fa-database"></i>&nbsp;&nbsp;Tambah Berkas & Sub Berkas</button>
            <hr/>
            <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-red">
                  <th width="2%"><div align="center">Detail</div></th>
                  <th width="2%"><div align="center">No.</div></th>
                  <th width="5%"><div align="center">Klasifikasi/Nomor Berkas</div></th>
                  <th width="10%"><div align="center">NP</div></th>
                  <th width="25%"><div align="center">Nama Karyawan</div></th>
                  <th width="5%"><div align="center">Sub Berkas</div></th>
                  <th width="10%"><div align="center">Aksi</div></th>
                 </tr>
                </thead>
                <tfoot class="bg-info">
                    <tr >
                        <th>&nbsp;</th>
                        <th>&nbsp;</th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th>&nbsp;</th>
                        <th>&nbsp;</th>
                    </tr>
                </tfoot>
                <tbody>
                   <tr>
                     <td colspan="9"></td>
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
        <h4 class="box-title">Detail Informasi Dokumen Vital</h4>
      </div>

  </div>

  <!-- form input berkas masal================================================================================================================= -->
  <div id="forminput_masal" style="display: none ">
  <section class="content">
      <div class="row">
      <form role="form" name="myfrm_masal" id="myfrm_masal" method="post" enctype="multipart/form-data">
          <div class="box">
            <div class="box-header with-border">
              <h4 class="box-title">Input Registrasi <span id="sub"></span> Berkas Masal</h4><hr />
              <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus_masal"></span></div>
            </div>
            <div class="box-body">
                  <span class="pull-left">
                     <label class='bg-info' id='lblcodreg_masal' style="padding: 10px"><?php echo $codreg1;  ?></label>
                     <input type="hidden" id= "codereg_masal" name="codereg_masal" value="<?php echo $codreg2; ?>" />
                  </span>
              <br />
              <hr/>
           <div class="box-body">
            <table class="table" border="0">
               <tr id="vberkas_masal" style="display: none">
                  <td width="20%"><b>Berkas Utama</b></td>
                  <td><b><span id='berkas_masal'></span></b>
                      <input type="hidden" id="txtberkas_masal" name="txtberkas_masal" />
                      <input type="hidden" id="nosubberkas_masal" name="nosubberkas_masal" />
                  </td>
               </tr>
               <tr>
                  <td width="20%"><b class="text-red">Klasifikasi</b></td>
                  <td>
                     <select class="form-control select2" name="txt_masal1" id="txt_masal1" style="width: 50%;" required>
                      <option value="">~ Pilih Klasifikasi Dokumen ~</option>
                       <?php
                           include_once "../../conf.php";
                           $sql = "SELECT klasifikasi.ClId, concat(klasifikasi.ClCode,' - ',klasifikasi.ClName) as Klas, role_klasifikasi.RoleId
                               FROM klasifikasi RIGHT JOIN role_klasifikasi ON klasifikasi.ClId = role_klasifikasi.ClId
                               WHERE klasifikasi.CIStatus = '1' Group by klasifikasi.ClId  ORDER BY klasifikasi.ClCode ASC";
                           $result = mysqli_query($connect, $sql);
                           while($row=mysqli_fetch_array($result)){
                              $r = strlen($row['RoleId']);
                              $t = substr($_SESSION['RoleId'],0,$r);
                              if($row['RoleId']==$t){
                                echo "<option value='".$row['ClId']."'>".$row['Klas']."</option>";
                              }
                           }
                        ?>
                    </select>

                    <input type="hidden" id='retensi_masal' value="<?php echo $ClR; ?>" />
                  </td>
               </tr>
                 <tr>
                  <td><b class="text-red">Unit Kerja Pemilik Berkas</b></td>
                  <td>
                    <select class="form-control select4" <?php echo $select_uk;  ?> id="txt_masal2" name="txt_masal2" style="width: 50%" required >
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

               <tr id='tr_nip_masal'>
                  <td><b class="text-red">Nomor Pokok</b></td>
                  <td>
                     <input type="text" name="txtnip_masal" id="txtnip_masal" class="form-control" style="width:100%" required  />
                  </td>
               </tr>
               <tr id='tr_nama_masal'>
                  <td><b class="text-red">Nama Karyawan</b></td>
                  <td>
                     <input type="text" name="txt_masal3" id="txt_masal3" class="form-control" style="width:100%" required />
                  </td>
               </tr>
               <tr style="display: none">
                  <td><b class="text-red">Kurun Waktu</b></td>
                  <td>
                     <input type="text" name="txt_masal4" value="<?php echo date('Y'); ?>" id="txt_masal4" class="form-control" style="width:30%" />
                  </td>
               </tr>
               <tr style="display: none">
                  <td><b class="text-red">Jumlah Berkas</b></td>
                  <td>
                    <div class="input-group input-group-sm col-md-2">
                    <input type="text" class="form-control" value="0" id="txt_masal5" name="txt_masal5">
                    </div>
                  </td>
               </tr>

               <tr>
                  <td>Tingkat Perkembangan</td>
                  <td>
                    <select class="form-control" id="txt_masal6" name="txt_masal6" style="width: 20%" >
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
                  <td>Media</td>
                  <td>
                     <select class="form-control" id="txt_masal7" name="txt_masal7" style="width: 20%" >
                      <?php
                          $sql = "select MediaId, MediaName from master_media";
                          $result = mysqli_query($connect, $sql);
                          if(mysqli_num_rows($result)>=1){
                             while($row=mysqli_fetch_array($result)){
                               echo "<option value='".$row['MediaId']."'>".$row['MediaName']."</option>";
                             }
                          }
                          ?>
                      </select>
                  </td>
               </tr>
               <tr>
                  <td>Kondisi Fisik</td>
                  <td>
                     <select class="form-control" id="txt_masal8" name="txt_masal8" style="width: 20%" >
                      <?php
                          $sql = "select KondisiId, KondisiName from master_kondisi";
                          $result = mysqli_query($connect, $sql);
                          if(mysqli_num_rows($result)>1){
                             while($row=mysqli_fetch_array($result)){
                               echo "<option value='".$row['KondisiId']."'>".$row['KondisiName']."</option>";
                             }
                          }
                          ?>
                      </select>
                  </td>
               </tr>
               <tr>
                 <td>Catatan / Kondisi Dokumen</td>
                 <td>
                   <input type="text" name="txt_masal9" id="txt_masal9" class="form-control" />
                 </td>
               </tr>

               <tr id="lok_masal">
                 <td colspan="2"><h4>Lokasi Simpan</h4></td>
               </tr>
               <tr id="gedung_masal">
                 <td>Gedung</td>
                 <td><input type="text" class="form-control" name="txt_masal10" id="txt_masal10" style="width: 30%"  /></td>
               </tr>
               <tr id="lemari_masal">
                 <td>Lemari</td>
                 <td><input type="text" class="form-control" name="txt_masal11" id="txt_masal11" style="width: 30%"  /></td>
               </tr>
               <tr id="baris_masal">
                 <td>Baris</td>
                 <td><input type="text" class="form-control" name="txt_masal12" id="txt_masal12" style="width: 30%"  /></td>
               </tr>
               <tr id="sarana_masal">
                 <td>Sarana Penyimpanan</td>
                 <td><input type="text" class="form-control" name="txt_masal13" id="txt_masal13" style="width: 30%"  /></td>
               </tr>

            </table>
            <div class="box-body pull-left">
                    <input type="hidden" name="task_masal" id="task_masal" value="new"  />
                    <input type="hidden" name="id_masal" id="id_masal" value="0"  />
                    <input type="hidden" name="request_masal" id="request_masal"   />
                    <input type="hidden" name="count" value="13"  />
                    <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i><br />Simpan data</button>
                    <button type="button"  onclick="closed();" class="btn btn-default"><i class="fa fa-remove"></i><br />Close</button>
              </div>
            </div>
           </div>
        </div>
        </form>
       </div>
  </section>
      </div>
  <!-- form input berkas masal================================================================================================================= -->
  
  
    <!-- form input berkas biasa================================================================================================================= -->
  <div id="forminput" style="display: none ">
  <section class="content">
      <div class="row">
      <form role="form" name="myfrm" id="myfrm" method="post" enctype="multipart/form-data">
          <div class="box">
            <div class="box-header with-border">
              <h4 class="box-title">Input Registrasi <span id="sub"></span> Berkas</h4><hr />
              <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus"></span></div>
            </div>
            <div class="box-body">
                  <span class="pull-left">
                     <label class='bg-info' id='lblcodreg' style="padding: 10px"><?php echo $codreg1;  ?></label>
                     <input type="hidden" id= "codereg" name="codereg" value="<?php echo $codreg2; ?>" />
                  </span>
              <br />
              <hr/>
           <div class="box-body">
            <table class="table" border="0">
               <tr id="vberkas" style="display: none">
                  <td width="20%"><b>Berkas Utama</b></td>
                  <td><b><span id='berkas'></span></b>
                      <input type="hidden" id="txtberkas" name="txtberkas" />
                      <input type="hidden" id="nosubberkas" name="nosubberkas" />
                  </td>
               </tr>
               <tr>
                  <td width="20%"><b class="text-red">Klasifikasi</b></td>
                  <td>
                     <select class="form-control select2" name="txt1" id="txt1" style="width: 50%;" required>
                      <option value="">~ Pilih Klasifikasi Dokumen ~</option>
                       <?php
                           include_once "../../conf.php";
                           $sql = "SELECT klasifikasi.ClId, concat(klasifikasi.ClCode,' - ',klasifikasi.ClName) as Klas, role_klasifikasi.RoleId
                               FROM klasifikasi RIGHT JOIN role_klasifikasi ON klasifikasi.ClId = role_klasifikasi.ClId
                               WHERE klasifikasi.CIStatus = '1' Group by klasifikasi.ClId  ORDER BY klasifikasi.ClCode ASC";
                           $result = mysqli_query($connect, $sql);
                           while($row=mysqli_fetch_array($result)){
                              $r = strlen($row['RoleId']);
                              $t = substr($_SESSION['RoleId'],0,$r);
                              if($row['RoleId']==$t){
                                echo "<option value='".$row['ClId']."'>".$row['Klas']."</option>";
                              }
                           }
                        ?>
                    </select>

                    <input type="hidden" id='retensi' value="<?php echo $ClR; ?>" />
                  </td>
               </tr>
                 <tr>
                  <td><b class="text-red">Unit Kerja Pemilik Berkas</b></td>
                  <td>
                    <select class="form-control select4" <?php echo $select_uk;  ?> id="txt2" name="txt2" style="width: 50%" required >
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

               <tr id='tr_nip'>
                  <td><b class="text-red">Nomor Pokok</b></td>
                  <td>
                     <input type="text" name="txtnip" id="txtnip" class="form-control" style="width:100%" required  />
                  </td>
               </tr>
               <tr id='tr_nama'>
                  <td><b class="text-red">Nama Karyawan</b></td>
                  <td>
                     <input type="text" name="txt3" id="txt3" class="form-control" style="width:100%" required />
                  </td>
               </tr>
               <tr style="display: none">
                  <td><b class="text-red">Kurun Waktu</b></td>
                  <td>
                     <input type="text" name="txt4" value="<?php echo date('Y'); ?>" id="txt4" class="form-control" style="width:30%" />
                  </td>
               </tr>
               <tr style="display: none">
                  <td><b class="text-red">Jumlah Berkas</b></td>
                  <td>
                    <div class="input-group input-group-sm col-md-2">
                    <input type="text" class="form-control" value="0" id="txt5" name="txt5">
                    </div>
                  </td>
               </tr>

               <tr>
                  <td>Tingkat Perkembangan</td>
                  <td>
                    <select class="form-control" id="txt6" name="txt6" style="width: 20%" >
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
                  <td>Media</td>
                  <td>
                     <select class="form-control" id="txt7" name="txt7" style="width: 20%" >
                      <?php
                          $sql = "select MediaId, MediaName from master_media";
                          $result = mysqli_query($connect, $sql);
                          if(mysqli_num_rows($result)>=1){
                             while($row=mysqli_fetch_array($result)){
                               echo "<option value='".$row['MediaId']."'>".$row['MediaName']."</option>";
                             }
                          }
                          ?>
                      </select>
                  </td>
               </tr>
               <tr>
                  <td>Kondisi Fisik</td>
                  <td>
                     <select class="form-control" id="txt8" name="txt8" style="width: 20%" >
                      <?php
                          $sql = "select KondisiId, KondisiName from master_kondisi";
                          $result = mysqli_query($connect, $sql);
                          if(mysqli_num_rows($result)>1){
                             while($row=mysqli_fetch_array($result)){
                               echo "<option value='".$row['KondisiId']."'>".$row['KondisiName']."</option>";
                             }
                          }
                          ?>
                      </select>
                  </td>
               </tr>
               <tr>
                 <td>Catatan / Kondisi Dokumen</td>
                 <td>
                   <input type="text" name="txt9" id="txt9" class="form-control" />
                 </td>
               </tr>

               <tr id="lok">
                 <td colspan="2"><h4>Lokasi Simpan</h4></td>
               </tr>
               <tr id="gedung">
                 <td>Gedung</td>
                 <td><input type="text" class="form-control" name="txt10" id="txt10" style="width: 30%"  /></td>
               </tr>
               <tr id="lemari">
                 <td>Lemari</td>
                 <td><input type="text" class="form-control" name="txt11" id="txt11" style="width: 30%"  /></td>
               </tr>
               <tr id="baris">
                 <td>Baris</td>
                 <td><input type="text" class="form-control" name="txt12" id="txt12" style="width: 30%"  /></td>
               </tr>
               <tr id="sarana">
                 <td>Sarana Penyimpanan</td>
                 <td><input type="text" class="form-control" name="txt13" id="txt13" style="width: 30%"  /></td>
               </tr>

            </table>
            <div class="box-body pull-left">
                    <input type="hidden" name="task" id="task" value="new"  />
                    <input type="hidden" name="id" id="id" value="0"  />
                    <input type="hidden" name="request" id="request"   />
                    <input type="hidden" name="count" value="13"  />
                    <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i><br />Simpan</button>
                    <button type="button"  onclick="closed();" class="btn btn-default"><i class="fa fa-remove"></i><br />Close</button>
              </div>
            </div>
           </div>
        </div>
        </form>
       </div>
  </section>
      </div>
  <!-- end form input berkas masal================================================================================================================= -->

