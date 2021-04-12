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
        Registrasi Peminjaman Dokumen
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Registrasi Peminjaman Dokumen</li>
      </ol>
  </section>


  <div id="formtable">
  <section class="content" >
      <div class="row">
        <!--<div class="col-md-9">-->
          <div class="box">
            <div class="box-header with-border">

            </div>
            <div class="box-body">
            <button type="button" onclick="getdata();" title="Add Document" class="btn btn-success"><i class="fa fa-database"></i>&nbsp;&nbsp;Registrasi</button>

            <hr/>
            <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-red">
                  <th width="2%"><div align="center">Detail</div></th>
                  <th width="2%"><div align="center">No.</div></th>
                  <th width="10%"><div align="center">Tanggal</div></th>
                  <th width="15%"><div align="center">NP / Nama Pemohon</div></th>
                  <th width="15%"><div align="center">Kepada Unit Kerja</div></th>
                  <th width="25%"><div align="center">Tujuan Peminjaman</div></th>
                  <th width="10%"><div align="center">Status</div></th>
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
        <h4 class="box-title">Detail Information Permohonan</h4>
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
                  <td width="20%"><b class="text-red">Tujuan Unit Kerja</b></td>
                  <td>
                     <select class="form-control select4" id="txt4" name="txt4" style="width: 50%" required >
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
                  <td width="20%"><b class="text-red">Kategori Dokumen</b></td>
                  <td>
                     <select class="form-control" id="txt5" name="txt5" style="width: 50%" required >
                         <option value=""> ~ Pilih Kategori Dokumen ~</option>
                         <option value="m4"> Dokumen Aktif</option>
                         <option value="m5"> Dokumen InAktif</option>
                         <option value="m0" id="m0" style="display: none"> Dokumen Vital Dalitas</option>
                         <option value="m1" id="m1" style="display: none"> Dokumen Vital Sainproof</option>
                         <option value="m2" id="m2" style="display: none"> Dokumen Vital OSDM</option>
                         <option value="m3" id="m3" style="display: none"> Dokumen Vital Umum</option>
                     </select>
                  </td>
               </tr>
               <tr>
                 <td><b class="text-red">Limit Peminjaman</b></td>
                 <td>
                    <div class="form-group col-md-6">
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                                <input type="text" class="form-control pull-right" id="reservation" name="reservation" required>
                        </div>
                    </div>
                 </td>
               </tr>
               <tr>
                  <td width="20%"><b class="text-red">Tujuan Peminjaman</b></td>
                  <td>
                     <textarea class="form-control" id="txt3" name="txt3" style="width:50%" required></textarea>
                  </td>
               </tr>
               <tr id='tmptbl'>
                  <td colspan="2"><button type="button" onclick="tampiltable();" class="btn btn-primary"><i class="fa"></i> Tampilkan Daftar</button></td>
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
<!--             <div id="tblbiasa" style="display: none">
              <table id="mytbldaftarbiasa" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-red">
                  <th width="2%"><div align="center">No.</div></th>
                  <th width="10%"><div align="center">Klasifikasi Arsip</div></th>
                  <th width="5%"><div align="center">Nomor Berkas</div></th>
                  <th width="30%"><div align="center">Uraian</div></th>
                  <th width="2%"><div align="center">Pinjam Arsip</div></th>
                 </tr>
                </thead>
                <tbody>
                   <tr>
                     <td colspan="5">&nbsp;</td>
                   </tr>
                </tbody>
              </table>
              <br /><br />
             </div>-->
            <div class="box-body pull-left">
                    <input type="hidden" name="task" id="task" value="new"  />
                    <input type="hidden" name="idx" id="idx" value="<?php echo $idx; ?>"  />
                    <input type="hidden" name="idi" id="idi" value="<?php echo $idx; ?>"  />
                    <input type="hidden" name="id" id="id" value="0"  />
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

