<script src="bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

  <?php
  session_start();
    include_once "daftardokberkas.js";
    include_once "../../conf.php";
    $codreg1 = "Nomor Reg. ".code("B-",15);
    $codreg2 = code("B-",15);
    $select_uk = "";
    if($_SESSION['RoleId']!="UK" and $_SESSION['RoleId']!="Root"){
      $select_uk = 'disabled';
    }

    if(isset($_GET['id'])){
    $sql = "select Ur, BerkasId, ParrentBerkasId from v_berkas_v1 where BerkasId = '".$_GET['id']."' ";
    $result = mysqli_query($connect, $sql);
    $berkas = mysqli_fetch_array($result);
    $primaryberkas = $berkas['Ur'];
    $_SESSION['headberkas']= $primaryberkas;
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
        Daftar Dokumen Vital
      </h3>
        <?php echo $_SESSION['RoleName']; ?>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Daftar Dokumen Vital</li>
      </ol>
  </section>


  <div id="formtable">
  <section class="content" >
      <div class="row">
        <!--<div class="col-md-9">-->
          <div class="box">
            <div class="box-header with-border">
              <h4 class="box-title">Daftar Sub Berkas >> <?php echo $_SESSION['headberkas']; ?></h4>
            </div>

            <div class="box-body">
            <button type="button" onclick="closed();" title="Add Document" class="btn btn-default"><i class="fa fa-mail-reply-all"></i>&nbsp;&nbsp;Kembali</button>
            <hr/>
            <table id="mytbl2" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-red">
                  <th width="2%"><div align="center">Detail</div></th>
                  <th width="2%"><div align="center">No.</div></th>
                  <th width="10%"><div align="center">Klasifikasi</div></th>
                  <th width="20%"><div align="center">Nama/Judul Berkas</div></th>
                  <th width="5%"><div align="center">Isi Berkas</div></th>
                 </tr>
                </thead>
                <tfoot class="bg-info">
                    <tr >
                        <th>&nbsp;</th>
                        <th>&nbsp;</th>
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
  <div class="box-body" id="formdetail" style="display: none">
      <div class="box-header with-border">
        <h4 class="box-title">Detail Informasi Dokumen Vital</h4>
      </div>
      <input type="hidden" name="id" id="id" value="<?php echo $_REQUEST['id']; ?>"  />
      <input type="hidden" name="idx" id="idx" value="<?php echo $_REQUEST['id']; ?>"  />
      <input type="hidden" name="req" id="req" value="<?php echo $_GET['req']; ?>"   />
  </div>

