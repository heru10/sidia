<script src="bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

  <?php
  session_start();
    include_once "regarsip.js";
    include_once "../../conf.php";
    $codreg = code("osdm-",5);
    $select_uk = "";
    $idx="";
    if(isset($_GET['idx']))
     $idx = $_GET['idx'];
    if(isset($_GET['id']))
     $id = $_GET['id'];

    if($_SESSION['RoleId']!="UK" and $_SESSION['RoleId']!="Root"){
      $select_uk = 'disabled';
    }

    $sql = "select Path from berkas_v1 where BerkasId = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    $path = mysqli_fetch_array($result);

    $sql = "SELECT concat(klasifikasi.ClCode,'/',berkas_v1.Nomor) as Nomor, berkas_v1.Uraian
           FROM berkas_v1 INNER JOIN klasifikasi ON klasifikasi.ClId = berkas_v1.ClId
           WHERE berkas_v1.BerkasId = '".$id."' ";
   $result = mysqli_query($connect, $sql);
   $xBerkas = mysqli_fetch_array($result);
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
        Registrasi Isi Detail Dokumen Vital
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Registrasi Isi Detail Dokumen Vital</li>
      </ol>
  </section>


  <div id="formtable">
  <section class="content" >
      <div class="row">
        <!--<div class="col-md-9">-->
          <div class="box">
            <div class="box-header with-border">
              <h4 class="box-title">Daftar Isi Detail Dokumen Vital >> <?php echo $_SESSION['headberkas']." >> ".$xBerkas['Uraian'] ?></h4>
            </div>
            <div class="box-body">
            <button type="button" onclick="getdata();" title="Add Document" class="btn btn-success"><i class="fa fa-database"></i>&nbsp;&nbsp;Tambah Isi Berkas</button>
            <button type="button" onclick="backpage();" title="Add Document" class="btn btn-default"><i class="fa fa-mail-reply-all"></i>&nbsp;&nbsp;Kembali</button>
            <hr/>
            <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-red">
                  <th width="2%"><div align="center">Detail</div></th>
                  <th width="2%"><div align="center">No.</div></th>
                  <!--<th width="10%"><div align="center">Kode Klasifikasi</div></th>-->
                  <th width="10%"><div align="center">Nomor Naskah</div></th>
                  <th width="10%"><div align="center">Tanggal Naskah</div></th>
                  <th width="30%"><div align="center">Uraian</div></th>
                  <th width="10%"><div align="center">Aksi</div></th>
                 </tr>
                </thead>
                <tfoot class="bg-info">
                    <tr >
                        <th>&nbsp;</th>
                        <th>&nbsp;</th>
                        <!--<th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>-->
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th>&nbsp;</th>
                    </tr>
                </tfoot>
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

  <div id="forminput" style="display: none">
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
              <hr/>
           <div class="box-body">
           <div id="tblberkas" style="display: none">
            <table class="table"  border="0">
               <tr>
                 <td width="20%"><b class="text-blue">Pindah Berkas</b></td>
                 <td>
                    <select class="form-control select4" name="berkas" id="berkas" style="width: 50%;">
                      <option value="">~ Pilih Pindah Berkas ~</option>
                       <?php
                           include_once "../../conf.php";
                           $sql = "SELECT klasifikasi.ClCode, berkas_v1.Uraian, berkas_v1.Nomor, berkas_v1.BerkasId, berkas_v1.SubBerkas  FROM berkas_v1
                                   INNER JOIN klasifikasi ON berkas_v1.ClId = klasifikasi.ClId where berkas_v1.RoleId = '".$_SESSION['RoleId']."'";
                           $result = mysqli_query($connect, $sql);
                           while($row=mysqli_fetch_array($result)){
                             if($row['SubBerkas']=='sub')
                               echo "<option value='".$row['BerkasId']."'>".$row['ClCode']."/".$row['Nomor']." - ".$row['Uraian']."</option>";
                             else
                               echo "<option value='".$row['BerkasId']."' disabled>".$row['ClCode']."/".$row['Nomor']." - ".$row['Uraian']."</option>";
                           }

                        ?>
                    </select>
                 </td>
               </tr>
            </table>
            <hr/>
            </div>
            <table class="table" border="0">
               <tr style="display: none">
                  <td width="20%"><b class="text-red">Klasifikasi</b></td>
                  <td>
                     <select class="form-control select2" name="txt1" id="txt1" style="width: 50%;" >
                      <option value="">~ Pilih Klasifikasi Dokumen ~</option>
                       <?php
                           include_once "../../conf.php";
                           $sql = "SELECT klasifikasi.ClId, concat(klasifikasi.ClCode,' - ',klasifikasi.ClName) as Klas, role_klasifikasi.RoleId
                               FROM klasifikasi RIGHT JOIN role_klasifikasi ON klasifikasi.ClId = role_klasifikasi.ClId
                               WHERE klasifikasi.CIStatus = '1' Group by klasifikasi.ClId ORDER BY klasifikasi.ClCode ASC";
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
                  <td width="20%"><b class="text-red">Jenis Dokumen</b></td>
                  <td>
                     <select class="form-control select3" name="txt2" id="txt2" style="width: 30%;" required>
                      <option value="">~ Pilih Jenis Dokumen ~</option>
                       <?php
                           include_once "../../conf.php";
                           $sql = "select JenisId, JenisNaskah from master_jnaskah";
                           $result = mysqli_query($connect, $sql);
                           while($row=mysqli_fetch_array($result)){
                             echo "<option value='".$row['JenisId']."'>".$row['JenisNaskah']."</option>";
                           }
                        ?>
                    </select>
                  </td>
               </tr>
               <tr>
                 <td width="18%"><b class="text-red">Tanggal Dokumen</b></td>
                 <td>
                    <div class="input-group date col-md-3">
                          <input type="text" class="form-control pull-right"  id="datepicker" name="txt3" value="<?php echo date('d/m/Y'); ?>" required>
                      <div class="input-group-addon">
                          <i class="fa fa-calendar"></i>
                      </div>
                    </div>
                 </td>
               </tr>
               <tr>
                  <td><b class="text-red">Nomor Dokumen</b></td>
                  <td>
                    <input type="text" name="txt4" id="txt4" class="form-control" style="width: 40%"  required />
                  </td>
               </tr>
               <tr>
                  <td><b class="text-red">Uraian Dokumen</b></td>
                  <td>
                     <textarea class="form-control" id="txt5" name="txt5" style="width:50%"></textarea>
                  </td>
               </tr>
               <tr>
                  <td><b class="text-red">Jumlah Dokumen</b></td>
                  <td>
                    <div class="input-group input-group-sm col-md-2">
                    <input type="text" class="form-control" id="txt6" name="txt6" required>
                    <div class="input-group-btn">
                      <select class="btn btn-warning dropdown-toggle" id="txt7" name="txt7" >
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
                  <td>Tingkat Perkembangan</td>
                  <td>
                    <select class="form-control" id="txt8" name="txt8" style="width: 20%" >
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
                  <td>Media Dokumen</td>
                  <td>
                     <select class="form-control" id="txt9" name="txt9" style="width: 20%" >
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
                  <td>Kondisi Fisik</td>
                  <td>
                     <select class="form-control" id="txt10" name="txt10" style="width: 20%" >
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
                   <input type="text" name="txt11" id="txt11" class="form-control" />
                 </td>
               </tr>
               <tr>
                  <td>Upload File Document</td>
                  <td>
                    <input type="file" style="padding: 5px" onchange="getupload();"  id="myfiles" name="myfiles[]" multiple="" />
                  </td>
               </tr>
               <tr>
                  <td colspan="2">
                     <input id="jmlfile" type="hidden" value="1" />
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
                            <tbody id="oxfiles"></tbody>
                            </table>
                        </div>
                    </div>
                  </td>
               </tr>
            </table>
            <div class="box-body pull-left">
                    <input type="hidden" name="task" id="task" value="new"  />
                    <input type="hidden" name="idx" id="idx" value="<?php echo $idx; ?>"  />
                    <input type="hidden" name="id" id="id" value="<?php echo $id; ?>"  />
                    <input type="hidden" name="idr" id="idr"  />
                    <input type="hidden" name="path" id="path" value="<?php echo $path['Path']; ?>"  />
                    <input type="hidden" name="count" value="11"  />
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

