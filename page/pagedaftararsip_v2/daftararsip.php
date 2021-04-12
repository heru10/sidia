<script src="bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

  <?php
  session_start();
    include_once "daftararsip.js";
    include_once "../../conf.php";
    $codreg = code("um-",5);
    $select_uk = "";
    $idx = '';
    $idb = '';
    $idsb = '';
    $req = '';

    if(isset($_GET['idsb']))
      $idsb = $_GET['idsb'];
    if(isset($_GET['idb']))
      $idb = $_GET['idb'];

    if(isset($_GET['req']))
     $req = $_GET['req'];

    if($req=='subberkas')
      $idberkas = $idsb;
    else
      $idberkas = $idb;




    if($_SESSION['RoleId']!="UK" and $_SESSION['RoleId']!="Root"){
      $select_uk = 'disabled';
    }

    $sql = "select Path from berkas_v2 where BerkasId = '".$idx."' ";
    $result = mysqli_query($connect, $sql);
    $path = mysqli_fetch_array($result);

    $sql = "select Ur from v_berkas_v2 where BerkasId = '".$idsb."' ";
    $result = mysqli_query($connect, $sql);
    $xBerkas = mysqli_fetch_array($result);
    $sql = "select Ur from v_berkas_v2 where BerkasId = '".$idb."' ";
    $result = mysqli_query($connect, $sql);
    $yBerkas = mysqli_fetch_array($result);
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
        Daftar Isi Berkas Arsip
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Daftar Isi Berkas Arsip Vital</li>
      </ol>
  </section>


  <div id="formtable">
  <section class="content" >
      <div class="row">
        <!--<div class="col-md-9">-->
          <div class="box">
            <div class="box-header with-border">
              <h4 class="box-title">Daftar Isi Berkas Arsip Vital >> <?php echo $yBerkas['Ur']; if(!empty($xBerkas['Ur'])) echo " >> ".$xBerkas['Ur'] ?></h4>
            </div>
            <div class="box-body">
            <input type="hidden" name="idb" id="idb" value="<?php echo $idb; ?>"  />
            <input type="hidden" name="idsb" id="idsb" value="<?php echo $idsb; ?>"  />
            <input type="hidden" name="request" id="request" value="<?php echo $req; ?>"  />
            <button type="button" onclick="backpage();" title="Kembali" class="btn btn-default"><i class="fa fa-mail-reply-all"></i>&nbsp;&nbsp;Kembali</button>
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

