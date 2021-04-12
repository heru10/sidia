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

    if(!empty($_REQUEST['ids'])){
    $sql = "select Filename from detailvitalmetafile_proof where RegVitalId = '".$_REQUEST['ids']."' limit 1 ";
    $result = mysqli_query($connect, $sql);


     if(mysqli_num_rows($result)!=0){
      $path = mysqli_fetch_array($result);
      $pathx = explode("/",$path['Filename']);
      $path = $pathx[0]."/".$pathx[1]."/".$pathx[2];
     }
    }
  ?>

  <style>
    .example-modal .modal {
      position: relative;
      top: auto;
      bottom: auto;
      right: auto;
      left: auto;
      display: block;
      z-index: 1;
    }

    .example-modal .modal {
      background: transparent !important;
    }
  </style>
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
                       <td width="15%">Tanggal</td>
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
                           <input type="file" onchange="getupload('dasar');"  id="txtfdasar" name="txtfdasar[]" multiple>
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
                           <input type="file" onchange="getupload('lampiran');"  id="txtflampiran" name="txtflampiran[]" multiple>
                           <input type="hidden" id="jmlfile_lampiran" value="1" />
                           <table class="table table-striped" style="width: 70%">
                             <tbody id="flampiran"></tbody>
                             <tbody id="xlampiran"></tbody>
                           </table>
                      </td>
                    </tr>
                    <tr>
                       <td width="15%">Pelaksana Teknis</td>
                       <td>
                          <select id="txt4" name="txt4[]" multiple="multiple" class="form-control" style="width: 80%" required>
                             <?php
                                $sql = "select * from pelaksana_teknis";
                                $result = mysqli_query($connect, $sql);
                                while($row=mysqli_fetch_array($result)){
                                  echo "<option value='".$row['IdPT']."'>".$row['Nip']." - ".$row['Nama']."</option>";
                                }
                             ?>

                          </select>
                       <button type="button" id="btnpt" class='btn btn-md btn-info' data-toggle="modal" onclick='loadmodal();'><i class='fa fa-plus'></i></button>
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
                          <input type="checkbox" id='nulldesain' name="nulldesain" /> Tidak ada target desain
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
                          <input type="checkbox" id='nullproof' name="nullproof" /> Tidak ada target proof
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
                           <input type="file" onchange="getupload('spk');"  id="txtfspk" name="txtfspk[]" multiple>
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
						<!-- Permintaan Dian Sainproof, 7648 | Tri Wibowo, 25/02/2019
                            <span class="input-group-addon"><b>Kode : <?php echo $labeldok['Kode']; ?></b></span>
						-->
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
                           <input type="file" onchange="getupload('nota');"  id="txtfnota" name="txtfnota[]" multiple>
                           <input type="hidden" id="jmlfile_nota" value="1" />
                           <table class="table table-striped" style="width: 70%">
                             <tbody id="fnota"></tbody>
                             <tbody id="xnota"></tbody>
                           </table>
                      </td>
                    </tr>
                    <tr>
                       <td width="15%">Upload File Preview</td>
                       <td>
                           <input type="file" onchange="getupload('preview');"  id="txtfpreview" name="txtfpreview[]" multiple>
                           <input type="hidden" id="jmlfile_preview" value="1" />
                           <table class="table table-striped" style="width: 70%">
                             <tbody id="fpreview"></tbody>
                             <tbody id="xpreview"></tbody>
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
                       <button type="submit" id="btnsave" class="btn btn-primary"><b><i class="fa fa-floppy-o"></i>&nbsp;Simpan</b></button>
                       <button type="button" onclick="closed();" class="btn"><b><i class="fa fa-remove"></i>&nbsp;Tutup</b></button></td>
                    </tr>
                   </table>
                  </form>
                 </div>
               </div>
           </div>
       </section>
    </div>

    <div class="modal fade" id="modal-default">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Tambah Pelaksana Teknis</h4>
              </div>
              <div class="modal-body">
                <p>
                <div id="formPT" style="display:none">
                 <form role="form" name="myPT" id="myPT" method="post" >
                  <table class="table">
                     <tr>
                       <td width="25%">NP</td>
                       <td><input name='txtnip' id='txtnip' class='form-control' required /></td>
                     </tr>
                     <tr>
                       <td width="25%">Nama Lengkap</td>
                       <td><input name='txtnama' id='txtnama' class='form-control' required /></td>
                     </tr>
                     <tr>
                       <td colspan="2">
                          <input type="hidden" id="task" name="task" value="new" />
                          <button onclick="getPT();" type="submit" class="btn btn-primary pull-right">Simpan</button></td>
                     </tr>
                  </table>
                  </form>
                  </div>

                  <div id="tblPT">
                  <button type="button" class='btn btn-md btn-info' onclick="addPT();"><i class='fa fa-plus'></i> Tambah</button>
                  <br /><br />
                  <table id="mytblPT" class="table table-bordered table-striped" >
                            <thead>
                             <tr class="bg-yellow">
                              <th width="2%"><div align="center">No.</div></th>
                              <th width="10%"><div align="center">NP</div></th>
                              <th width="30%"><div align="center">Nama Lengkap</div></th>
                              <th width="5%"><div align="center">Aksi</div></th>
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
                  </table>
                  </div>
                </p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" onclick='loadselected();' data-dismiss="modal">Close</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <link rel="stylesheet" href="bower_components/datatables/jquery.dataTables.css">
        <script src="bower_components/datatables/jquery.dataTables.min.js"></script>
        <style type="text/css">
         tfoot {
          display: table-header-group;
         }
        </style>
        <script>
          $(function () {
              reTables();
              //loadselected();
          })

          function closer(){

          }

          function loadmodal(){
             $("#formPT").hide();
             $("#tblPT").show();
             $("#txtnp").focus();
             $("#btnpt").attr('data-target',"#modal-default");
          }

          function loadselected(){
            var urls = "<?php echo 'page/pageregdetailvitalproof/metadata/pt_proses.php'; ?>";
            $.ajax({
                url: urls, // Url to which the request is send
                type: "POST",
                data: 'task=loadpl',
                success: function(data){
                  //alert(data);
                  $("#txt4").html(data);
                }
            });
          }

           function addPT(){
             $("#formPT").show();
             $("#tblPT").hide();
             $("#txtnp").focus();

           }

           function reTables(){
            var table = $('#mytblPT').DataTable({
                'ordering'    : true,
                'autoWidth'   : false,
                'destroy'     : true,
                "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
                "pageLength"  : 10,
                'PaginationType': "full_numbers",
                'ajax'          : 'page/pageregdetailvitalproof/metadata/bantai.php?id='+id,
                'oLanguage': {
          				"sSearch": "Pencarian :",
          		}

              } );

              table.columns().every( function () {
                  var that = this;

                  //$( 'input', this.footer() ).on( 'keyup change', function () {
                  $( 'input', this.footer()).on( 'keyup change', function () {

                      if ( that.search() !== this.value ) {
                          that
                              .search( this.value )
                              .draw();
                      }
                  } );
              } );

         }

        $(function(e){
           $("#myPT").on('submit',(function(e) {
                e.preventDefault();
               var urls = "<?php echo 'page/pageregdetailvitalproof/metadata/pt_proses.php'; ?>";

               $.ajax({
                url: urls, // Url to which the request is send
                type: "POST",             // Type of request to be send, called as method
                data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
                contentType: false,       // The content type used when sending data to the server.
                cache: false,             // To unable request pages to be cached
                processData:false,        // To send DOMDocument or non processed data file it is set to false
                success: function(data)   // A function to be called if request succeeds
                {
                  //alert(data);
                  switch(data){
                    case "sukses" : toastr.success("Data Berhasil disimpan", "BERHASIL");
                                    break;
                    case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                                    break;
                    case "found"  : toastr.warning("Ada data dengan nama yang sama", "PERHATIAN");
                                    return false;
                                    break;
                  }
                  var ids = $("#ids").val();
                  reTables();

                  //loadselected();
                  $("#formPT").hide();
                  $("#tblPT").show();
                  $("#txtnip").val('');
                  $("#txtnama").val('');
                }
               });
           }));
        });

        function deldata(id){
          var tanya = confirm("Apakah data ini mau dihapus ?");
          if(tanya){
           var urls = "<?php echo 'page/pageregdetailvitalproof/metadata/pt_proses.php'; ?>";
           $.ajax({
              url: urls, // Url to which the request is send
              type: "POST",
              data: "task=del&id="+id,
              async: true,
              success: function(data){
              switch(data){
                  case "sukses" : toastr.success("Data Berhasil dihapus", "BERHASIL");
                                  break;
                  case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                                  break;
                  case "found"  : toastr.warning("Ada Unit Kerja dibawahnya", "PERHATIAN");
                                  break;
                }
                  reTables();
                  $("#formPT").hide();
                  $("#tblPT").show();
              }
           })
          } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
         }

        </script>
