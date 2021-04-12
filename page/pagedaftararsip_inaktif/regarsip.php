<script src="bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

  <?php
  session_start();
    include_once "regarsip.js";
    include_once "../../conf.php";
    $codreg = code("M-",15);
    $idx="";
    if(isset($_GET['id']))
     $idx = $_GET['id'];


   $sql = "SELECT concat(klasifikasi.ClCode,'/',berkas.Nomor) as Nomor, berkas.Uraian
           FROM berkas INNER JOIN klasifikasi ON klasifikasi.ClId = berkas.ClId
           WHERE berkas.BerkasId = '".$idx."' and berkas.StatusDok = 'Inaktif'  ";
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
        Daftar Isi Detail Dokumen Inaktif
      </h3>
      <?php echo $_SESSION['RoleName']; ?>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Daftar Isi Detail Dokumen Inaktif</li>
      </ol>
  </section>


  <div id="formtable">
  <section class="content" >
      <div class="row">
        <!--<div class="col-md-9">-->
          <div class="box">
            <div class="box-header with-border">
              <h4 class="box-title">Daftar Isi Detail Dokumen Inaktif >> <?php echo $xBerkas['Nomor']; ?> - <?php echo $xBerkas['Uraian']; ?></h4>
            </div>
            <div class="box-body">
            <button type="button" onclick="backpage();" title="Add Document" class="btn btn-default"><i class="fa fa-mail-reply-all"></i>&nbsp;&nbsp;Kembali</button>
            <hr />
            <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-red">
                  <th width="2%"><div align="center">Detail</div></th>
                  <th width="2%"><div align="center">No.</div></th>
                  <th width="20%"><div align="center">Kode Klasifikasi</div></th>
                  <th width="10%"><div align="center">Nomor Naskah</div></th>
                  <th width="10%"><div align="center">Tanggal Naskah</div></th>
                  <th width="10%"><div align="center">Jenis Naskah</div></th>
                  <th width="30%"><div align="center">Uraian</div></th>
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
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                    </tr>
                </tfoot>
                <tbody>
                   <tr>
                     <td colspan="7"></td>
                   </tr>
                </tbody>
              </table>
              <input type="hidden" name="idx" id="idx" value="<?php echo $idx; ?>"  />
            </div>
          </div>
      </div>
  </section>
</div>


