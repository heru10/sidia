<script src="bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

  <?php
  session_start();
    include_once "regarsipvitalprof.js";
    include_once "../../conf.php";
    $codreg = code("sainprof-",5);

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
        Dokumen Vital
      </h3>
      <?php echo $_SESSION['RoleName']; ?>
      <!-- <h5>
        <?php echo $_SESSION['RoleName']; ?>
      </h5>   -->
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dokumen Vital</li>
      </ol>
  </section>


  <div id="formtable">
  <section class="content" >
      <div class="row">
        <!--<div class="col-md-9">-->
          <div class="box">
            <div class="box-header with-border">
             <!-- <h4 class="box-title">Daftar Dokumen <?php echo $_SESSION['RoleName']; ?></h4>     -->
            </div>
            <div class="box-body">
            <button type="button" onclick="getdata();" title="Add Document" class="btn btn-success"><i class="fa fa-database"></i>&nbsp;&nbsp;Tambah</button>
            <hr/>
            <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-red">
                  <th width="2%"><div align="center">No.</div></th>
                  <th width="15%"><div align="center">Kategori Produk</div></th>
                  <th width="15%"><div align="center">Produk</div></th>
                  <th width="15%"><div align="center">Detail Produk</div></th>
                  <th width="10%"><div align="center">Tahun</div></th>
                  <th width="10%"><div align="center">Kode Produk</div></th>
                  <th width="7%"><div align="center">Status</div></th> <!-- heru PDS menambahkan ini, 2020-12-10 -->
                  <th width="5%"><div align="center">Input Detail</div></th>
                  <th width="10%"><div align="center">Aksi</div></th>
                 </tr>
                </thead>
                <tfoot class="bg-info">
                    <tr >
                        <th>&nbsp;</th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <!--<th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>-->
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th>&nbsp;</th> <!-- heru PDS menambahkan ini, 2020-12-10 -->
                        <th>&nbsp;</th>
                        <th>&nbsp;</th>
                    </tr>
                </tfoot>

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
              <h4 class="box-title">Registrasi Dokumen Vital</h4><hr />
              <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus"></span></div>
            </div>
            <div class="box-body">
                  <span class="pull-left">
                     <label class='bg-info' id='noreg' style="padding: 10px">Nomor Reg. <?php echo $codreg;  ?></label>
                     <input type="hidden" id='codereg' name="codereg" value="<?php echo $codreg; ?>" />
                  </span>
              <span class="pull-right">
                <label><?php echo date('d/m/Y')." - ".$_SESSION['PeopleName']; ?></label>
              </span><br />
              <hr/>
           <div class="box-body">
            <table class="table" border="0">
               <tr>
                 <td width="20%"><b class="text-red">Kategori Produk</b></td>
                 <td>
                      <select class="form-control select2" onchange="load_txt1();" id="txt1" name="txt1" style="width: 30%" required >
                        <option value="">- Pilih Kategori Produk -</option>
                         <?php
                          $sql = "select KatProdukId, KatProdukName from master_katproduk where StatusAct = '1' and RoleId like '".$_SESSION['RoleId']."%' ";
                          $result = mysqli_query($connect, $sql);
                             while($rows = mysqli_fetch_array($result)){
                               echo "<option value='".$rows['KatProdukId']."'>".$rows['KatProdukName']."</option>";
                             }
                          ?>
                      </select>
                 </td>
               </tr>
               <tr>
                 <td width="20%"><b class="text-red">Jenis Produk</b></td>
                 <td>
                      <select class="form-control select3" onchange="load_txt2();" id="txt2" name="txt2" style="width: 30%" required >
                      </select>
                 </td>
               </tr>
               <tr>
                 <td width="20%"><b class="text-red">Detail Produk</b></td>
                 <td>
                      <select class="form-control select4" id="txt3" name="txt3" style="width: 30%" required >
                      </select>
                 </td>
               </tr>
               <tr>
                 <td width="20%">Klasifikasi</td>
                 <td>
                      <select class="form-control select1" id="txt4" name="txt4" style="width: 50%">
                      <option value="0">- Klasifikasi Dokumen -</option>
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
                 </td>
               </tr>
               <tr>
                  <td><b class="text-red">Unit Kerja</b></td>
                  <td>
                    <input type="hidden" id="txt5a" name="txt5a" />
                    <select class="form-control select5" id="txt5" name="txt5" style="width: 50%" required >
                      <?php
                          $sql = "select RoleId, RoleName from role where RoleId != 'Root' and RoleId != 'UK'";
                          $result = mysqli_query($connect, $sql);
                             while($rows = mysqli_fetch_array($result)){
                               echo "<option value='".$rows['RoleId']."' >".$rows['RoleName']."</option>";
                             }
                          ?>
                      </select>
                  </td>
               </tr>
               <tr>
                  <td><b class="text-red">Keterangan</b></td>
                  <td>
                    <textarea id="txt6" name="txt6" class="form-control" style=" width: 50%"></textarea>
                  </td>
               </tr>
               <tr>
                  <td>Pekerjaan</td>
                  <td>
                    <select class="form-control select4" id="txt7" name="txt7" style="width: 50%" required>
                          <option>~ Pilih Pekerja ~</option>
                      </select>
                  </td>
               </tr>
               <tr>
                  <td><b class="text-red">Tahun</b></td>
                  <td>
                    <input type="text" id="txt8" name="txt8"  placeholder="Tahun" class="form-control" style=" width: 20%" required>
                  </td>
               </tr>
               <tr>
                  <td>Tingkat Perkembangan</td>
                  <td>
                    <select class="form-control" id="txt9" name="txt9" style="width: 20%" >
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
                     <select class="form-control" id="txt10" name="txt10" style="width: 20%" >
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
                  <td>Kondisi</td>
                  <td>
                     <select class="form-control" id="txt11" name="txt11" style="width: 20%" >
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
               <tr style="display: none">
                  <td><b>Jumlah</b></td>
                  <td>
                    <div class="input-group input-group-sm col-md-2">
                    <input type="text" class="form-control" id="txt12" name="txt12">
                    <div class="input-group-btn">
                      <select class="btn btn-warning dropdown-toggle" id="txt13" name="txt13" >
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
               <!--<tr>
                 <td colspan="2"><h4>Lokasi Simpan</h4></td>
               </tr>
               <tr>
                 <td>Gedung</td>
                 <td>
                   <input type="text" value="-" name="txt14" id="txt14" class="form-control" style="width: 50%" />
                 </td>
               </tr>
               <tr>
                 <td>Lemari</td>
                 <td>
                   <input type="text" value="-" name="txt15" id="txt15" class="form-control" style="width: 50%"/>
                 </td>
               </tr>
               <tr>
                 <td>Baris</td>
                 <td>
                   <input type="text" value="-" name="txt16" id="txt16" class="form-control" style="width: 50%"/>
                 </td>
               </tr>
               <tr>
                 <td>Sarana Penyimpanan</td>
                 <td>
                   <input type="text" value="-" name="txt17" id="txt17" class="form-control" style="width: 50%" />
                   <small><b>* (File, Folder, Boks, Album, dll)</b></small>
                 </td>
               </tr>-->
               <tr>
                 <td colspan="2">
                    <div class="box-body pull-left">
                        <input type="hidden" name="task" id="task" value="new"  />
                        <input type="hidden" name="id" id="id" value="0"  />
                        <input type="hidden" name="count" value="13"  />
                        <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i><br />Simpan</button>
                        <button type="button"  onclick="closed();" class="btn btn-default"><i class="fa fa-remove"></i><br />Close</button>
                    </div>
                 </td>
               </tr>
              </table>
            </div>
           </div>
        </div>
        </form>
       </div>
      </div>




  </section>

