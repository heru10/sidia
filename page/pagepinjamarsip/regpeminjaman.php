  <?php
    session_start();
    include_once "regpeminjaman.js";
    include_once "../../conf.php";
    $codreg = code("M-",15);
    $select_uk = "";
    $idx="";
    if(isset($_GET['id']))
     $idx = $_GET['id'];


    if($_SESSION['RoleId']!="UK" and $_SESSION['RoleId']!="Root"){
      $select_uk = 'disabled';
    }

    $path = "Upload_Files/".$_SESSION['CodeRole']."/permohonan/";

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
        Registrasi Peminjaman Dokumen Fisik <br />
        <span class='text-sm'><?php echo $_SESSION['RoleName']; ?></span>
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Registrasi Peminjaman Dokumen Fisik</li>
      </ol>
  </section>


  <div id="formtable">
  <section class="content" >
      <div class="row">
        <!--<div class="col-md-9">-->
          <div class="box">
            <div class="box-header with-border">
              <h4 class="box-title">Daftar Peminjaman Dokumen Fisik</h4>
            </div>
            <div class="box-body">
            <button type="button" onclick="getdata();" title="Add Document" class="btn btn-success"><i class="fa fa-database"></i>&nbsp;&nbsp;Registrasi</button>

            <hr/>
            <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-red">
                  <th width="2%"><div align="center">No.</div></th>
                  <th width="10%"><div align="center">Tanggal</div></th>
                  <th width="15%"><div align="center">NP / Nama Pemohon</div></th>
                  <th width="15%"><div align="center">Unit Kerja</div></th>
                  <th width="10%"><div align="center">Catatan</div></th>
                  <th width="10%"><div align="center">File Naskah Dinas</div></th>
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
                        <th>&nbsp;</th>
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
        <h4 class="box-title">Detail Information Permohonan Fisik</h4>
      </div>

  </div>

  <div id="forminput" style="display: none">
  <section class="content">
      <div class="row">
      <form role="form" name="myfrm" id="myfrm" method="post" enctype="multipart/form-data">
          <div class="box">
            <div class="box-header with-border">
              <div class="external-event bg-success ui-draggable ui-draggable-handle" style="position: relative; width: auto"><span id="lblstatus"></span></div>
            </div>
            <div class="box-body">
           <div class="box-body">
            <table class="table" border="0">

               <tr>
                  <td width="20%"><b class="text-red">NP</b></td>
                  <td>
                     <input type="text" name="txt1" id="txt1" class="form-control" style="width: 40%"  required />
                  </td>
               </tr>
               <tr>
                  <td width="20%"><b class="text-red">Nama Lengkap</b></td>
                  <td>
                     <input type="text" name="txt2" id="txt2" class="form-control" style="width: 40%"  required />
                  </td>
               </tr>
               <tr>
                  <td width="20%"><b class="text-red">Unit Kerja</b></td>
                  <td>
                     <select class="form-control select4" id="txt3" name="txt3" style="width: 50%" required >
                      <?php
                          $sql = "select RoleId, RoleName from role where RoleId != 'Root' and RoleId != 'UK' and RoleId != '".$_SESSION['RoleId']."' ";
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
                  <?php
                    $tm0 = 'none';
                    $tm1 = 'none';
                    $tm2 = 'none';
                    $tm3 = 'none';
                    switch($_SESSION['Menu']){
                      case "m0" : $tm0 = 'inline';
                                  break;
                      case "m1" : $tm1 = 'inline';
                                  break;
                      case "m2" : $tm2 = 'inline';
                                  break;
                      case "m3" : $tm3 = 'inline';
                                  break;
                    }

                  ?>


                  <td width="20%"><b class="text-red">Kategori Dokumen</b></td>
                  <td>
                     <select class="form-control" id="txt4" name="txt4" style="width: 50%" required >
                         <option value=""> ~ Pilih Kategori Dokumen ~</option>
                         <option value="m4"> Dokumen Aktif</option>
                         <option value="m5"> Dokumen InAktif</option>
                         <option value="m0" id="m0" style="display: <?php echo $tm0; ?>"> Dokumen Vital Dalitas</option>
                         <option value="m1" id="m1" style="display: <?php echo $tm1; ?>"> Dokumen Vital Sainproof</option>
                         <option value="m2" id="m2" style="display: <?php echo $tm2; ?>"> Dokumen Vital OSDM</option>
                         <option value="m3" id="m3" style="display: <?php echo $tm3; ?>"> Dokumen Vital Setkol</option>
                     </select>
                  </td>
               </tr>
               <tr>
                  <td width="20%">Catatan</td>
                  <td>
                     <textarea class="form-control" id="txt5" name="txt5" style="width:50%"></textarea>
                  </td>
               </tr>
               <tr>
                  <td width="20%"><b class="text-red">Upload Surat Permohonan</b></td>
                  <td>
                     <input type="file" name="myfiles" id="myfiles" onchange="getupload();" /><br />
                     <b><span id="ofiles" class="text-blue" style="display: none"></span></b>
                     <input type="hidden" id="path" value="<?php echo $path; ?>" />
                  </td>
               </tr>
            </table>
            <hr/>
            <div id="tbldok" style="display: none">
            <table id="mytbldaftarvital" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-red">
                  <th width="2%"><div align="center">No.</div></th>
                  <th width="50%"><div align="center">Judul Dokumen/Berkas</div></th>
                  <th width="10%"><div align="center">Tahun</div></th>
                  <th width="5%"><div align="center">Pinjam Arsip</div></th>
                 </tr>
                </thead>
                <tfoot class="bg-info">
                    <tr >
                        <th>&nbsp;</th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th>&nbsp;</th>
                    </tr>
                </tfoot>
                <tbody>
                   <tr>
                     <td colspan="4">&nbsp;</td>
                   </tr>
                </tbody>

              </table>
              <br /><br />
             </div>
            <div class="box-body pull-left">
                    <input type="hidden" name="task" id="task" value="new"  />
                    <input type="hidden" name="idx" id="idx" value="<?php echo $idx; ?>"  />
                    <input type="hidden" name="idi" id="idi" value="<?php echo $idx; ?>"  />
                    <input type="hidden" name="id" id="id" value="0"  />
                    <input type="hidden" name="count" value="6"  />
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

       <div class="modal modal-info fade" id="modal-info">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">:: Registrasi Pengembalian Dokumen</h4>
              </div>
              <div class="modal-body">
              <form role="form" name="myfrmA" id="myfrmA" method="post">
                <p>
                  <label id="luk">&nbsp;</label>
                  <div class="form-group">
                    <label>NP</label>
                    <input type="text" class="form-control" id="txtnip" name="txtnip">
                  </div>
                  <div class="form-group">
                    <label>Nama</label>
                    <input type="text" class="form-control" id="txtnama" name="txtnama">
                  </div>
                  <div class="form-group">
                    <label>Catatan Pengembalian</label>
                      <textarea class="form-control" rows="3" id='komentar' name='komentar' placeholder="Isi Komentar ..."></textarea>
                  </div>
                </p>
               </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                <button type="button" id='btn_simpan' class="btn btn-outline" onclick='getregkembali();'>Simpan</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
