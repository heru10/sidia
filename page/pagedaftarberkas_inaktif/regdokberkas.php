<script src="bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

  <?php
  session_start();
    include_once "regdokberkas.js";
    include_once "../../conf.php";
    $codreg = "Nomor Reg. ".code("B-",15);
    $select_uk = "";
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
        Daftar Dokumen Inaktif
      </h3>
      <?php echo $_SESSION['RoleName']; ?>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Daftar Dokumen Inaktif</li>
      </ol>
  </section>


  <div id="formtable">
  <section class="content" >
      <div class="row">
        <!--<div class="col-md-9">-->
          <div class="box">
            <div class="box-body"><br />
            <br />
            <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-red">
                  <th width="2%"><div align="center">Detail</div></th>
                  <th width="2%"><div align="center">No.</div></th>
                  <th width="15%"><div align="center">Kode Klasifikasi</div></th>
                  <th width="5%"><div align="center">Nomor Berkas</div></th>
                  <th width="22%"><div align="center">Uraian</div></th>
                  <th width="10%"><div align="center">Kurun Waktu</div></th>
                  <th width="10%"><div align="center">Lokasi Simpan</div></th>
                  <th width="5%"><div align="center">Lihat Isi Dokumen</div></th>
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
                        <th>&nbsp;</th>
                    </tr>
                </tfoot>
                <tbody>
                   <tr>
                     <td colspan="9"></td>
                   </tr>
                </tbody>
              </table>

            </div>
          </div>
      </div>
  </section>
</div>


