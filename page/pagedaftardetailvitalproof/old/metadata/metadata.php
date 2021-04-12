  <?php
  session_start();
    include_once "metadata.js";
    include_once "../../../conf.php";
    if(isset($_REQUEST['ids'])){
    $sql = "select KodeReg from regarsipvital where RegVitalId = '".$_REQUEST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $Mcodreg = mysqli_fetch_array($result);
    $codreg = $Mcodreg[0];
    }
    $sql = "select CONCAT(KatProdukName,' >> ',JProdukName,' >> ',DetailProdukName) as labeldok, Kode from v_naskah_vital_Proof where RegVitalId = '".$_REQUEST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $labeldok = mysqli_fetch_array($result);

    if(isset($_REQUEST['id'])){
    $sql = "select Filename from detailvitalfile_proof where DetailProfId = '".$_REQUEST['id']."' limit 1 ";
    $result = mysqli_query($connect, $sql);
    $path = mysqli_fetch_array($result);
    $pathx = explode("/",$path['Filename']);
    $path = $pathx[0]."/".$pathx[1]."/".$pathx[2];
    }
  ?>

  <section class="content-header">
      <h4>
        Detail Metadata Dokumen Vital <?php echo $_SESSION['RoleName']; ?>
      </h4>
      <h6 class="box-title">Registrasi Metadata Detail Info Dokumen >> <?php echo $labeldok[0]; ?></h6>
  </section>


<div id="formtable">
  <section class="content" >
      <div class="row">
        <!--<div class="col-md-9">-->
          <div class="box">
            <div class="box-body">

              <form role="form" name="mymetadata" id="mymetadata" method="post" enctype="multipart/form-data" >
                 <input type="hidden" name="path" id="path" value="<?php echo $path; ?>"  />
                 <input type="hidden" name="task" id="task" value="<?php echo $_GET['task']; ?>"  />
                 <input type="hidden" name="id" id="id" value="<?php echo $_GET['id']; ?>"  />
                 <input type="hidden" name="ids" id="ids" value="<?php echo $_GET['ids']; ?>"  />
                 <input type="hidden" name="count" value="14"  />

                 <table class="table" border="0">
                    <tr>
                       <td width="15%">Perihal</td>
                       <td><input type="text" id="txt1" name="txt1" class="form-control" style="width: 70%" required  /></td>
                    </tr>
                    <tr>
                       <td width="15%">Tanggal Nota Dinas</td>
                       <td>
                          <div class="input-group date col-md-3">
                             <input type="text" class="form-control pull-right"  id="txt2" name="txt2" readonly value="<?php echo date('d/m/Y'); ?>">
                            <div class="input-group-addon">
                              <i class="fa fa-calendar"></i>
                             </div>
                          </div>
                      </td>
                    </tr>
                    <tr>
                       <td width="15%">Dasar Permintaan</td>
                       <td>
                           <input type="text" class="form-control"  id="txt3" name="txt3" style="width: 70%">
                      </td>
                    </tr>
                    <tr>
                       <td width="15%">Upload File Dasar Permintaan</td>
                       <td>
                           <input type="file" onchange="getupload('a');"  id="txtfdasar" name="txtfdasar[]" multiple>
                           <input type="hidden" id="jmlfile_dasar" value="1" />
                           <table class="table table-striped" style="width: 70%">
                             <tbody id="fdasar"></tbody>
                             <tbody id="xdasar"></tbody>
                           </table>
                      </td>
                    </tr>
                    <tr>
                       <td width="15%">Upload File Lampiran</td>
                       <td>
                           <input type="file" onchange="getupload('b');"  id="txtfdasar" name="txtfdasar[]" multiple>
                           <input type="hidden" id="jmlfile_dasar" value="1" />
                           <table class="table table-striped" style="width: 70%">
                             <tbody id="fdasar"></tbody>
                             <tbody id="xdasar"></tbody>
                           </table>
                      </td>
                    </tr>
                    <tr>
                       <td width="15%">Pelaksana</td>
                       <td>
                           <select id="txt4" name="txt4[]" multiple="multiple" class="form-control" style="width: 100%" required>
                             <?php
                               $sql = "select RoleId, RoleName from role where RoleId != 'Root' ";
                               $result = mysqli_query($connect, $sql);
                               while($data=mysqli_fetch_array($result)){
                                 echo "<option value=".$data['RoleId'].">".$data['RoleName']."</option>";
                               }
                             ?>
                           </select>
                      </td>
                    </tr>
                    <tr>
                       <td width="15%">Target Desain</td>
                       <td>
                          <div class="input-group date col-md-3">
                             <input type="text" class="form-control pull-right" readonly  id="txt5" name="txt5" value="<?php echo date('d/m/Y'); ?>" required>
                            <div class="input-group-addon">
                              <i class="fa fa-calendar"></i>
                             </div>
                          </div>
                      </td>
                    </tr>
                    <tr>
                       <td width="15%">Target Proof</td>
                       <td>
                          <div class="input-group date col-md-3">
                             <input type="text" class="form-control pull-right" readonly  id="txt6" name="txt6" value="<?php echo date('d/m/Y'); ?>" required>
                            <div class="input-group-addon">
                              <i class="fa fa-calendar"></i>
                             </div>
                          </div>
                      </td>
                    </tr>
                    <tr>
                       <td width="15%">Nomor SPK</td>
                       <td>
                          <input type="text" class="form-control"  id="txt7" name="txt7" style=" width: 30% ">
                      </td>
                    </tr>
                    <tr>
                       <td width="15%">Upload File SPK</td>
                       <td>
                           <input type="file" onchange="getupload('c');"  id="txtfspk" name="txtfspk[]" multiple>
                           <input type="hidden" id="jmlfile_spk" value="1" />
                           <table  class="table table-striped" style="width: 70%">
                             <tbody id="fspk"></tbody>
                             <tbody id="xspk"></tbody>
                           </table>
                       </td>
                    </tr>
                    <tr>
                       <td width="15%">Nomor Kode</td>
                       <td>
                         <div class="input-group">
                            <span class="input-group-addon"><b>Kode : <?php echo $labeldok['Kode']; ?></b></span>
                            <input type="text" class="form-control" style="width: 90%" id="txt8" name="txt8" />
                         </div>
                    </td>
                    </tr>
                    <tr>
                       <td width="15%">Nota / Surat Penyerahan</td>
                       <td>
                          <input type="text" class="form-control"  id="txt9" name="txt9" style=" width: 80% ">
                      </td>
                    </tr>
                    <tr>
                       <td width="15%">Upload File Nota</td>
                       <td>
                           <input type="file" onchange="getupload('d');"  id="txtfnota" name="txtfnota[]" multiple>
                           <input type="hidden" id="jmlfile_nota" value="1" />
                           <table class="table table-striped" style="width: 70%">
                             <tbody id="fnota"></tbody>
                             <tbody id="xnota"></tbody>
                           </table>
                      </td>
                    </tr>
                    <tr>
                       <td width="15%">Upload Data</td>
                       <td>
                           <input type="file" onchange="getupload('e');"  id="txtfdata" name="txtfdata">
                           <input type="hidden" id="jmlfile_data" value="1" />
                           <table class="table table-striped" style="width: 70%">
                             <tbody id="fdata"></tbody>
                             <tbody id="xdata"></tbody>
                           </table>
                      </td>
                    </tr>
                    <tr>
                       <td width="15%">Keterangan</td>
                       <td>
                          <input type="text" class="form-control"  id="txt10" name="txt10" style=" width: 30% ">
                      </td>
                    </tr>
                    <tr>
                          <td colspan="2"><h4>Lokasi Simpan</h4></td>
                       </tr>
                       <tr>
                          <td width="20%">Gedung</td>
                          <td><input type="text" id='txt11' name='txt11' class='form-control' style=" width: 30%" /></td>
                       </tr>
                       <tr>
                          <td>Lemari</td>
                          <td><input type="text" id='txt12' name='txt12' class='form-control' style=" width: 30%" /></td>
                       </tr>
                       <tr>
                          <td>Baris</td>
                          <td><input type="text" id='txt13' name='txt13' class='form-control' style=" width: 30%" /></td>
                       </tr>
                       <tr>
                          <td>Sarana Penyimpanan</td>
                          <td><input type="text" id='txt14' name='txt14' class='form-control' style=" width: 30%" />
                              <small>* File, Folder, Boks, Album, dll</small>
                          </td>
                       </tr>
                    <tr>
                       <td colspan="2">
                       <button type="submit" class="btn btn-primary"><b><i class="fa fa-floppy-o"></i>&nbsp;Simpan</b></button>
                       <button type="button" onclick="closed();" class="btn"><b><i class="fa fa-remove"></i>&nbsp;Tutup</b></button></td>
                    </tr>
                   </table>
                  </form>
                 </div>
               </div>
           </div>
       </section>
    </div>


