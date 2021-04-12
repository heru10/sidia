<script src="bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

  <?php
  session_start();
    include_once "daftararsip.js";
    include_once "../../conf.php";
    $codreg = code("OSDM-",15);
    $select_uk = "";
    $idx="";
    if(isset($_GET['id']))
     $id = $_GET['id'];
    if(isset($_GET['idx']))
     $idx = $_GET['idx'];
     if(isset($_GET['idr']))
     $idr = $_GET['idr'];

    if($_SESSION['RoleId']!="UK" and $_SESSION['RoleId']!="Root"){
      $select_uk = 'disabled';
    }

    $sql = "select Path from berkas_v1 where BerkasId = '".$id."' ";
    $result = mysqli_query($connect, $sql);
    $path = mysqli_fetch_array($result);

    $sql = "SELECT concat(klasifikasi.ClCode,'/',berkas_v1.Nomor) as Nomor, berkas_v1.Uraian
           FROM berkas_v1 INNER JOIN klasifikasi ON klasifikasi.ClId = berkas_v1.ClId
           WHERE berkas_v1.BerkasId = '".$id."' ";
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
        Daftar Isi Detail Dokumen Vital
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Daftar Isi Detail Dokumen Vital  </li>
      </ol>
  </section>


  <div id="formtable">
  <section class="content" >
      <div class="row">
        <!--<div class="col-md-9">-->
          <div class="box">
            <div class="box-header with-border">
              <h4 class="box-title"><b>Daftar Isi Detail Dokumen Vital</b> >> <?php echo $_SESSION['headberkas']." >> ".$xBerkas['Uraian'] ?></h4>
            </div>
            <div class="box-body">
            <button type="button" onclick="backpage();" title="Add Document" class="btn btn-default"><i class="fa fa-mail-reply-all"></i>&nbsp;&nbsp;Kembali</button>
            <hr/>
            <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-red">
                  <th width="2%"><div align="center">Detail</div></th>
                  <th width="2%"><div align="center">No.</div></th>
                  <th width="10%"><div align="center">Kode Klasifikasi</div></th>
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

            </div>
          </div>
      </div>
  </section>
  </div>
  <input type="hidden" name="idx" id="idx" value="<?php echo $idx; ?>"  />
  <input type="hidden" name="id" id="id" value="<?php echo $id; ?>"  />
  <input type="hidden" name="idr" id="idr"  />
