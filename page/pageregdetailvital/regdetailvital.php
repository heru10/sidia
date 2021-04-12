  <?php
  session_start();
    include_once "regdetailvital.js";
    include_once "../../conf.php";
    if(isset($_REQUEST['ids'])){
    $sql = "SELECT role.CodeRole, regarsipvital.KodeReg FROM regarsipvital
            INNER JOIN role ON role.RoleId = regarsipvital.RoleId where RegVitalId = '".$_REQUEST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $Mcodreg = mysqli_fetch_array($result);
    $codreg = $Mcodreg[1];
    $_SESSION['CodeRole'] = $Mcodreg[0];
    }
    $sql = "select CONCAT(KatProdukName,' >> ',JProdukName,' >> ',DetailProdukName) as labeldok from v_naskah_vital where RegVitalId = '".$_REQUEST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $labeldok = mysqli_fetch_array($result);

    $lokSP= "Lokasi Simpan = - ";
    $lokST= "Lokasi Simpan = - ";
    $lokUT= "Lokasi Simpan = - ";
    $lokPL= "Lokasi Simpan = - ";
    $Keterangan = "Keterangan : -";
    $sql = "select * from detailvital where RegVitalId = '".$_REQUEST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $actmeta = mysqli_num_rows($result);
    while($lok =  mysqli_fetch_array($result)){
     if($lok['Ket']=="SP")
      $lokSP = "Lokasi Simpan : ".$lok['Gedung'].".".$lok['Lemari'].".".$lok['Baris'].".".$lok['Boks'];
     elseif($lok['Ket']=="UT")
      $lokUT = "Lokasi Simpan : ".$lok['Gedung'].".".$lok['Lemari'].".".$lok['Baris'].".".$lok['Boks'];
     elseif($lok['Ket']=="ST")
      $lokST = "Lokasi Simpan : ".$lok['Gedung'].".".$lok['Lemari'].".".$lok['Baris'].".".$lok['Boks'];
     elseif($lok['Ket']=="PL"){
        $lokPL = "Lokasi Simpan : ".$lok['Gedung'].".".$lok['Lemari'].".".$lok['Baris'].".".$lok['Boks'];
        $Keterangan = "Keterangan : ".$lok['Keterangan'];
      }
    }

    $sql = "select Filename from detailvitalfile where RegVitalId = '".$_REQUEST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $actfile = mysqli_num_rows($result);

  ?>
  <section class="content-header">
      <h3>
        Detail Dokumen Vital Departemen Pengendalian Kualitas
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Detail Dokumen Vital</li>
      </ol>
  </section>


<div id="formtable">
  <section class="content" >
      <div class="row">
        <!--<div class="col-md-9">-->
          <div class="box">
            <div class="box-header with-border">
              <h4 class="box-title">Detail Info Dokumen >> <?php echo $labeldok[0]; ?></h4>
            </div>
            <div class="box-body">
            <button type="button" onclick="pageurl('page/pageregarsipvital/regarsipvital.php');" title="Delete Document" class="btn btn-info" id="btnbackpage"><i class="fa fa fa-arrow-circle-left"></i>&nbsp;&nbsp;Kembali</button>
            <button type="button" onclick="getdata();" title="Add Document" class="btn btn-success" id="btnadd"><i class="fa fa-database" ></i>&nbsp;&nbsp;Tambah</button>
            <button type="button" onclick="getload();" title="Edit Document" class="btn btn-warning" id="btnedit"><i class="fa fa-edit"></i>&nbsp;&nbsp;Ubah</button>
            <button type="button" onclick="deldata();" title="Delete Document" class="btn btn-danger" id="btndelete"><i class="fa fa-bitbucket"></i>&nbsp;&nbsp;Hapus</button>
            <br/>
            <br/>
             <center><h3 class="text-red" id="ErrAll"><i class="fa fa-eye-slash"></i> Ups... Data masih kosong</h3></center>
              <div class="row" id='pk'>
                <div class="col-md-12">
                  <!-- Custom Tabs -->
                  <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                      <li class="active"><a href="#tab_1A" data-toggle="tab" onclick="openfileSP()">Spesimen</a></li>
                      <li><a href="#tab_2A" data-toggle="tab">Uraian Teknis</a></li>
                      <li><a href="#tab_3A" data-toggle="tab">Spesifikasi Teknis</a></li>
                      <li><a href="#tab_4A" data-toggle="tab">Dokumen Lainnya</a></li>
                    </ul>
                    <div class="tab-content">
                    <div class="tab-pane active" id="tab_1A">
                        <div class="box box-info">
                            <div class="box-header with-border"><br />
                                <h4 class="box-title"><span style=" padding: 10px" class='bg-info'><?php echo $lokSP; ?></span></h4><br />
                            </div>
                            <div id="nofileSP"><center><br /><span class="alert alert-danger"><i class="fa fa-eye-slash"></i>Dokumen Upload Spesimen masih kosong</span><br /></center><br /><br /></div>
                              <center><br />
                               <?php
                                 $sql = "select Filename from detailvitalfile where RegVitalId = '".$_REQUEST['ids']."' and Ket = 'SP' ";
                                 $result = mysqli_query($connect, $sql);
                                 $test = mysqli_num_rows($result);
                                 if ($test!=0){
                                   echo '<ul class="bxslider" id="vsp">';
                                        while($file=mysqli_fetch_array($result)){
                                          echo '<li><img src="'.$file[0].'" onclick=view_img("'.$file[0].'"); title="Klik gambar untuk zoom" style="cursor:pointer;width: 660px;height: 340px;" /></li>';

                                        }
                                       echo "</ul>";
                                     }
                                     ?>

                                  </center><br /><br />
                           </div>

                      </div>
                      <!-- /.tab-pane -->
                      <div class="tab-pane" id="tab_2A">
                            <div class="box box-info">
                                <div class="box-header with-border"><br />
                                    <h4 class="box-title"><span id='txtlokasiUT' style=" padding: 10px" class='bg-info'><?php echo $lokUT; ?></span></h4><br />
                                 </div>
                                 <div id="nofileUT"><center><br /><span class="alert alert-danger"><i class="fa fa-eye-slash"></i>Dokumen Uraian Teknis masih kosong</span><br /></center><br /><br /></div>
                                <div class="box-body">
                                 <object id="viewUT" type = "application/pdf"  width="100%" height="400">
                                  </object>
                                </div>
                              </div>

                      </div>
                      <!-- /.tab-pane -->
                      <div class="tab-pane" id="tab_3A">
                           <div class="box box-info">
                                <div class="box-header with-border"><br />
                                    <h4 class="box-title"><span id='txtlokasiST' style=" padding: 10px" class='bg-info'><?php echo $lokST; ?></span></h4><br />
                                 </div>
                                 <div id="nofileST"><center><br /><span class="alert alert-danger"><i class="fa fa-eye-slash"></i>Dokumen Spesifikasi Teknik masih kosong</span><br /></center><br /><br /></div>
                                <div class="box-body">
                                  <object id="viewST" type = "application/pdf"  width="100%" height="400">
                                  </object>
                                </div>
                           </div>
                      </div>
                       <div class="tab-pane" id="tab_4A">
                          <div class="box-header with-border"><br />
                              <h4 class="box-title"><span id='txtlokasiPL' style=" padding: 10px" class='bg-info'><?php echo $lokPL; ?></span></h4><br />
                           </div>

                           <div class="box-header with-border">
                               <h3 class="box-title"><?php echo $Keterangan; ?></h3>
                           <br />
                           <br />
                           <?php
                                 $sql = "select Filename from detailvitalfile where RegVitalId = '".$_REQUEST['ids']."' and Ket = 'PL' ";
                                 $result = mysqli_query($connect, $sql);
                                 $tfile = array();
                                 $nofile = 1;
                                 if(mysqli_num_rows($result)>0){
                                 while($file=mysqli_fetch_array($result)){
                                  $tfile[] = $file['Filename'];
                                  $xfile = explode("/", $file['Filename']);
                                   echo "<span onclick=loadfilePL('".$file[0]."') class='btn btn-info'>".$nofile++."</span>&nbsp;";
                                  }
                                 } else
                                   echo '<div id="nofilePL"><center><br /><span class="alert alert-danger"><i class="fa fa-eye-slash"></i> Tidak ada file </span><br /></center><br /><br /></div>';
                           ?>
                             <hr/>
                             <object style="padding-top: 20px" id="viewPL" data="<?php echo $tfile[0]; ?>"  width="100%" height="400">
                             </object>
                         </div>
                      </div>
                      <!-- /.tab-pane -->
                    </div>
                    <!-- /.tab-content -->
                  </div>
                  </div>
          <!-- nav-tabs-custom -->
        </div>

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
              <h4 class="box-title">Form Registrasi Detail Dokumen</h4><hr />
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
              <div class="box-body pull-left">
                    <input type="hidden" name="task" id="task" value="new"  />
                    <input type="hidden" name="id" id="id" value="0"  />
                    <input type="hidden" name="ids" id="ids" value="<?php echo $_GET['ids']; ?>"  />
                    <input type="hidden" name="count" value="17"  />
                    <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i><br />Simpan</button>
                    <button type="button"  onclick="closed();" class="btn btn-default"><i class="fa fa-remove"></i><br />Close</button>
              </div>

           <div class="box-body">
               <div class="row">
                  <div class="col-md-12">
                     <!-- Custom Tabs -->
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab_1" data-toggle="tab"><b>Spesimen</b></a></li>
                            <li><a href="#tab_2" data-toggle="tab"><b>Uraian Teknis</b></a></li>
                            <li><a href="#tab_3" data-toggle="tab"><b>Spesifikasi Teknis</b></a></li>
                            <li><a href="#tab_4" data-toggle="tab"><b>Dokumen Lainnya</b></a></li>
                        </ul>

                          <div class="tab-content">
                              <div class="tab-pane active" id="tab_1">
                                 <table class="table" border="0">
                                     <tr>
                                        <td colspan="2"><b><u>Dokumen Spesimen</u></b></td>
                                     </tr>
                                     <tr id="MFile">
                                        <td width="18%">Upload File Dokumen <br /><small class='text-red'>* Format image (.jpg, .gif, .bmp)</small></td>
                                        <td>
                                          <input type="file" style="padding: 5px" onclick="clear_uploadSP();" onchange="getuploadSP();" id="myfiles" name="myfiles[]" multiple="" />
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
                                                              <td width="10%"><b>Ket</b></td>
                                                          </tr>
                                                      </thead>
                                                  <tbody id="olfiles"></tbody>
                                                  <tbody id="olf"></tbody>
                                                  </table>
                                              </div>
                                          </div>
                                        </td>
                                     </tr>
                                     <tr>
                                        <td colspan="2"><h3>Lokasi Simpan</h3></td>
                                     </tr>
                                     <tr>
                                        <td width="20%">Gedung</td>
                                        <td><input type="text" id='txt1' name='txt1' class='form-control' style=" width: 30%" /></td>
                                     </tr>
                                     <tr>
                                        <td>Lemari</td>
                                        <td><input type="text" id='txt2' name='txt2' class='form-control' style=" width: 30%" /></td>
                                     </tr>
                                     <tr>
                                        <td>Baris</td>
                                        <td><input type="text" id='txt3' name='txt3' class='form-control' style=" width: 30%" /></td>
                                     </tr>
                                     <tr>
                                        <td>Sarana Penyimpanan</td>
                                        <td><input type="text" id='txt4' name='txt4' class='form-control' style=" width: 30%" />
                                            <small>* File, Folder, Boks, Album, dll</small>
                                        </td>
                                     </tr>
                                 </table>
                              </div>

                              <div class="tab-pane" id="tab_2">
                                 <table class="table" border="0">
                                     <tr>
                                        <td colspan="2"><b><u>Dokumen Uraian Teknis</u></b></td>
                                     </tr>
                                     <tr>
                                        <td width="18%">Upload File Dokumen <br /><small class="text-red">* Format PDF (.pdf)</small></td>
                                        <td>
                                          <input type="file" onchange="getuploadUT();" onclick="clear_uploadUT();" style="padding: 5px" id="myfilesA" name="myfilesA" />
                                        </td>
                                     </tr>
                                     <tr>
                                       <td colspan="2">
                                           <div class="box-body" id='fileboxUT' style="display: none">
                                              <div class="box-body no-padding">
                                                  <table class="table table-striped" style="width: 70%">
                                                      <thead class="btn-light">
                                                          <tr>
                                                              <td width="2%"><b>No.</b></td>
                                                              <td width="20%"><b>Filename</b></td>
                                                              <td width="10%"><b>Size</b></td>
                                                              <td width="10%"><b>Ket</b></td>
                                                          </tr>
                                                      </thead>
                                                  <tbody id="olfilesUT"></tbody>
                                                  </table>
                                              </div>
                                          </div>
                                        </td>
                                     </tr>
                                     <tr>
                                        <td colspan="2"><h3>Lokasi Simpan</h3></td>
                                     </tr>
                                     <tr>
                                        <td>Gedung</td>
                                        <td><input type="text" id='txt5' name='txt5' class='form-control' style=" width: 30%" /></td>
                                     </tr>
                                     <tr>
                                        <td>Lemari</td>
                                        <td><input type="text" id='txt6' name='txt6' class='form-control' style=" width: 30%" /></td>
                                     </tr>
                                     <tr>
                                        <td>Baris</td>
                                        <td><input type="text" id='txt7' name='txt7' class='form-control' style=" width: 30%" /></td>
                                     </tr>
                                     <tr>
                                        <td>Sarana Penyimpanan</td>
                                        <td><input type="text" id='txt8' name='txt8' class='form-control' style=" width: 30%" />
                                            <small>* File, Folder, Boks, Album, dll</small>
                                        </td>
                                     </tr>
                                 </table>
                              </div>

                              <div class="tab-pane" id="tab_3">
                                 <table class="table" border="0">
                                     <tr>
                                        <td colspan="2"><b><u>Dokumen Spesifikasi Teknis</u></b></td>
                                     </tr>
                                     <tr>
                                        <td width="18%">Upload File Dokumen <br /><small class="text-red">* Format PDF (.pdf)</small></td>
                                        <td>
                                          <input type="file" onchange="getuploadST();" onclick="clear_uploadST();" style="padding: 5px" id="myfilesB" name="myfilesB" />
                                        </td>
                                     </tr>
                                     <tr>
                                       <td colspan="2">
                                           <div class="box-body" id='fileboxST' style="display: none">
                                              <div class="box-body no-padding">
                                                  <table class="table table-striped" style="width: 70%">
                                                      <thead class="btn-light">
                                                          <tr>
                                                              <td width="2%"><b>No.</b></td>
                                                              <td width="20%"><b>Filename</b></td>
                                                              <td width="10%"><b>Size</b></td>
                                                              <td width="10%"><b>Ket</b></td>
                                                          </tr>
                                                      </thead>
                                                  <tbody id="olfilesST"></tbody>
                                                  </table>
                                              </div>
                                          </div>
                                        </td>
                                     </tr>
                                     <tr>
                                        <td colspan="2"><h3>Lokasi Simpan</h3></td>
                                     </tr>
                                     <tr>
                                        <td>Gedung</td>
                                        <td><input type="text" id='txt9' name='txt9' class='form-control' style=" width: 30%" /></td>
                                     </tr>
                                     <tr>
                                        <td>Lemari</td>
                                        <td><input type="text" id='txt10' name='txt10' class='form-control' style=" width: 30%" /></td>
                                     </tr>
                                     <tr>
                                        <td>Baris</td>
                                        <td><input type="text" id='txt11' name='txt11' class='form-control' style=" width: 30%" /></td>
                                     </tr>
                                     <tr>
                                        <td>Sarana Penyimpanan</td>
                                        <td><input type="text" id='txt12' name='txt12' class='form-control' style=" width: 30%" />
                                            <small>* File, Folder, Boks, Album, dll</small>
                                        </td>
                                     </tr>
                                 </table>
                              </div>

                              <div class="tab-pane" id="tab_4">
                                 <table class="table" border="0">
                                     <tr>
                                        <td colspan="2"><b><u>Dokumen Pendukung Lainnya</u></b></td>
                                     </tr>
                                     <tr>
                                        <td width="18%">Upload File Dokumen</td>
                                        <td>
                                          <input type="file" onclick="clear_uploadPL();" onchange="getuploadPL();" style="padding: 5px" id="myfilesC" name="myfilesC[]" multiple="" />
                                        </td>
                                     </tr>
                                     <tr>
                                       <td colspan="2">
                                           <div class="box-body" id='fileboxPL' style="display: none">
                                              <div class="box-body no-padding">
                                                  <table class="table table-striped" style="width: 70%">
                                                      <thead class="btn-light">
                                                          <tr>
                                                              <td width="2%"><b>No.</b></td>
                                                              <td width="20%"><b>Filename</b></td>
                                                              <td width="10%"><b>Size</b></td>
                                                              <td width="10%"><b>Ket</b></td>
                                                          </tr>
                                                      </thead>
                                                  <tbody id="olfilesPL"></tbody>
                                                  <tbody id="olfPL"></tbody>
                                                  </table>
                                              </div>
                                          </div>
                                        </td>
                                     </tr>
                                     <tr>
                                        <td>Keterangan</td>
                                        <td><input type="text" id='txt13' name='txt13' class='form-control' style=" width: 70%" /></td>
                                     </tr>
                                     <tr>
                                        <td colspan="2"><h3>Lokasi Simpan</h3></td>
                                     </tr>
                                     <tr>
                                        <td>Gedung</td>
                                        <td><input type="text" id='txt14' name='txt14' class='form-control' style=" width: 30%" /></td>
                                     </tr>
                                     <tr>
                                        <td>Lemari</td>
                                        <td><input type="text" id='txt15' name='txt15' class='form-control' style=" width: 30%" /></td>
                                     </tr>
                                     <tr>
                                        <td>Baris</td>
                                        <td><input type="text" id='txt16' name='txt16' class='form-control' style=" width: 30%" /></td>
                                     </tr>
                                     <tr>
                                        <td>Sarana Penyimpanan</td>
                                        <td><input type="text" id='txt17' name='txt17' class='form-control' style=" width: 30%" />
                                            <small>* File, Folder, Boks, Album, dll</small>
                                        </td>
                                     </tr>
                                 </table>
                              </div>
                          </div>
                       </div>
                    </div>
                  </div>
                </div>
           </div>
        </div>
        </form>
       </div>
      </div>




  </section>

