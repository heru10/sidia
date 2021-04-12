  <?php
    session_start();
    include_once "regpersetujuan.js";
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
        Persetujuan Peminjaman Dokumen
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Persetujuan Peminjaman Dokumen</li>
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
              <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-red">
                  <th width="2%"><div align="center">Detail</div></th>
                  <th width="2%"><div align="center">No.</div></th>
                  <th width="10%"><div align="center">Tanggal</div></th>
                  <th width="15%"><div align="center">NIP / Nama Pemohon</div></th>
                  <th width="15%"><div align="center">Unit Kerja Pemohon</div></th>
                  <th width="25%"><div align="center">Tujuan Peminjaman Dokumen</div></th>
                  <th width="10%"><div align="center">Status</div></th>
                  <th width="10%"><div align="center">Approve</div></th>
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
  <div class="modal modal-success fade" id="modal-primary">
          <div class="modal-dialog">
            <div class="modal-content">
             <form role="form" name="myfrm" id="myfrm" method="post">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Persetujuan Peminjaman Dokumen</h4>
              </div>
              <div class="modal-body">
                <p>
                 <div class="form-group">
                  <label>Catatan / Komentar</label>
                    <textarea class="form-control" rows="3" id='komentar' name='komentar' placeholder="Isi Komentar ..."></textarea>
                 </div>
                  <label>Limit Peminjaman</label><br />
                     <div class="form-group">
                        <div class="input-group">
                           <input type="text" class="form-control pull-right" id="reservation" name="reservation" required>
                           <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                        </div>
                    </div>
                 <input type="checkbox" name="download" id="download" value="d" />&nbsp;Pemohon di ijinkan Unduh File<br />
                 <input type="checkbox" name="metadata" id="metadata" value="m" />&nbsp;Pemohon di ijinkan Melihat Metadata
                </p>
              </div>
              <div class="modal-footer">
                <input type="hidden" id="idx" name="idx"  />
                <input type="hidden" id='task' name='task' />
                <input type="hidden" id='req' name='req' />
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                <button type="button" data-dismiss="modal" onclick="approve('1')" class="btn btn-outline bg-green">Setuju</button>
                <button type="button" data-dismiss="modal" onclick="approve('2')" class="btn btn-outline bg-red">Tolak</button>
              </div>
             </form>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
