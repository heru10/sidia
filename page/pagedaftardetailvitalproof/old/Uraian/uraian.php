  <?php
  session_start();
    include_once "uraian.js";
    include_once "../../../conf.php";
    if(isset($_REQUEST['ids'])){
    $sql = "select KodeReg from regarsipvital where RegVitalId = '".$_REQUEST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $Mcodreg = mysqli_fetch_array($result);
    $codreg = $Mcodreg[0];
    }
    $sql = "select CONCAT(KatProdukName,' >> ',JProdukName,' >> ',DetailProdukName) as labeldok from v_naskah_vital_Proof where RegVitalId = '".$_REQUEST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $labeldok = mysqli_fetch_array($result);
    $id="";
    $path="";
    if(isset($_REQUEST['id']))
    {
     $id = $_REQUEST['id'];
     $sql = "select Filename from detailvitalfile_proof where DetailProfId = '".$_REQUEST['id']."' limit 1 ";
     $result = mysqli_query($connect, $sql);
     $path = mysqli_fetch_array($result);
     $pathx = explode("/",$path['Filename']);
     $path = $pathx[0]."/".$pathx[1]."/".$pathx[2];
    }

//    if($_REQUEST['task']=="edit"){
//      $sql = "SELECT Gedung, Lemari, Baris, Boks from detailvital_proof ";
//      $sql .= "where RegVitalId = '".$_REQUEST['ids']."' and Ket='ut' ";
//      $result = mysqli_query($connect, $sql);
//      $dmeta = mysqli_fetch_array($result);
//    }



  ?>
  <section class="content-header">
      <h4>
        Detail <b class="text-blue">Uraian Teknis</b> Dokumen Vital
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
                 <input type="hidden" name="id" id="id" value="<?php echo $id; ?>"  />
                 <input type="hidden" name="ids" id="ids" value="<?php echo $_GET['ids']; ?>"  />
                 <input type="hidden" name="count" value="4"  />

                 <table class="table" border="0">
                    <tr>
                       <td width="15%">Upload File <br /><small class="text-red">* Format *.pdf</small></td>
                       <td>
                           <input type="file" onchange="getupload('ut');"  id="txtfut" name="txtfut">
                           <input type="hidden" id="jmlfile_ut" value="0" /><br />
                           <table class="table table-striped" style="width: 50%">
                             <tbody id="fut"></tbody>
                             <tbody id="xut"></tbody>
                           </table>
                      </td>
                    </tr>
                       <tr>
                          <td colspan="2"><h4>Lokasi Simpan</h4></td>
                       </tr>
                       <tr>
                          <td width="20%">Gedung</td>
                          <td><input type="text" id='txt1' name='txt1' class='form-control' style=" width: 30%"  /></td>
                       </tr>
                       <tr>
                          <td>Lemari</td>
                          <td><input type="text" id='txt2' name='txt2' class='form-control' style=" width: 30%"  /></td>
                       </tr>
                       <tr>
                          <td>Baris</td>
                          <td><input type="text" id='txt3' name='txt3' class='form-control' style=" width: 30%"  /></td>
                       </tr>
                       <tr>
                          <td>Sarana Penyimpanan</td>
                          <td><input type="text" id='txt4' name='txt4' class='form-control' style=" width: 30%"  />
                              <br /><small>* File, Folder, Boks, Album, dll</small>
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


