  <?php
  session_start();
    include_once "daftardetailvitalproof.js";
    include_once "../../conf.php";
    if(isset($_REQUEST['ids'])){
    $sql = "select master_kodekerja.Kode, master_kodekerja.Uraian, regarsipvital.KodeReg
            from regarsipvital INNER JOIN master_kodekerja ON master_kodekerja.KodeId = regarsipvital.KodeId
            where RegVitalId = '".$_REQUEST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $Mcodreg = mysqli_fetch_array($result);
    $codreg = $Mcodreg['KodeReg'];
    }
    $sql = "select CONCAT(KatProdukName,' >> ',JProdukName,' >> ',DetailProdukName) as labeldok from v_naskah_vital_Proof where RegVitalId = '".$_REQUEST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $labeldok = mysqli_fetch_array($result);

    $btnaddm="inline";
    $btneditm="none";
    $btndelm="none";

//    $sql = "SELECT *, concat(master_kodekerja.Kode,' - ',master_kodekerja.Uraian) as Pekerjaan ";
//    $sql .= " FROM detailvitalmeta_proof
//              LEFT JOIN master_kodekerja ON master_kodekerja.KodeId = detailvitalmeta_proof.PekerjaanId ";
//    $sql .= " where RegVitalId = '".$_REQUEST['ids']."'";
//    $result = mysqli_query($connect, $sql);
//    $jdata = mysqli_num_rows($result);
//    $data = mysqli_fetch_array($result);

//    if($jdata!=0){
//     $btnaddm="none";
//     $btneditm="inline";
//     $btndelm="inline";
//    }
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
        Daftar Detail Dokumen Vital
      </h3>
      <?php echo $_SESSION['RoleName']; ?>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Daftar Detail Dokumen Vital</li>
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
               <input type="hidden" name="task" id="task" value="new"  />
               <input type="hidden" name="id" id="id" value="0"  />
               <input type="hidden" name="ids" id="ids" value="<?php echo $_GET['ids']; ?>"  />
               <input type="hidden" name="count" value="14"  />
              <div class="row">
                <div class="col-md-12">
                  <!-- Custom Tabs -->
                  <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                      <li class="active"><a href="#tab_5" data-toggle="tab">Metadata</a></li>
                      <li><a href="#tab_1" data-toggle="tab">Approval Customer</a></li>
                      <!--<li><a href="#tab_1a" data-toggle="tab">Test</a></li> -->
                      <li><a href="#tab_2" data-toggle="tab">Uraian Teknis</a></li>
                      <li><a href="#tab_3" data-toggle="tab">Spesifikasi Teknis</a></li>
                      <li><a href="#tab_4" data-toggle="tab">Data Pendukung</a></li>
                    </ul>

                    <div class="tab-content">
                      <!-- /.tab-pane -->
                  <button type="button" onclick="closed();" class="btn pull-right"><b><i class="fa fa-remove"></i>&nbsp;Tutup</b></button>
                  <div class="tab-pane active" id="tab_5">
                          <!--<button class="btn btn-primary" onclick="getmetadata('<?php echo $_REQUEST['ids'];?>');" ><b><i class="fa fa-floppy-o"></i>&nbsp;Tambah</b></button>
                          <button type="button" onclick="cetak();" class="btn bg-green"><b><i class="fa fa-print"></i>&nbsp;Cetak</b></button>-->
                          <br /><br />
                          <table class="table" border="0">
                            <tr>
                              <td width="15%">Kode Pekerjaan</td>
                              <td width="2%">:</td>
                              <td width="80%"><?php echo $Mcodreg['Kode'];?></td>
                            </tr>
							<!-- Permintaan Dian Sainproof, 7648 | Tri Wibowo, 25/02/2019
                            <tr>
                              <td>Uraian</td>
                              <td>:</td>
                              <td><?php echo $Mcodreg['Uraian']; ?></td>
                            </tr>
							-->
                          </table>
                          <table id="mytbl" class="table table-bordered table-striped">
                            <thead>
                             <tr class="bg-red">
                              <th width="2%"><div align="center">#</div></th>
                              <th width="2%"><div align="center">No.</div></th>
                              <th width="10%"><div align="center">Tanggal</div></th>
                              <th width="10%"><div align="center">Dasar</div></th>
                              <th width="20%"><div align="center">Perihal</div></th>
							  <!-- Request Dian Sainproof, 7648 | Tri Wibowo, 25/02/2019  
                              <th width="10%"><div align="center">Kode Pekerjaan</div></th>
							  -->
							  <th width="10%"><div align="center">Kode Produk</div></th>
                              <th width="10%"><div align="center">Target</div></th>
                              <th width="10%"><div align="center">Lokasi Simpan</div></th>
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
                                    <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                                </tr>
                            </tfoot>
                          </table>
                      </div>
<!--                   <div class="tab-pane" id="tab_1a">
                     <div class="col-md-6">
                      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                          <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                          </ol>
                          <div class="carousel-inner">
                        <?php
                          print '<div class="item active">
                                       <img src="http://placehold.it/900x500/39CCCC/ffffff&text=I+Love+Bootstrap">
                                    <div class="carousel-caption">
                                       First Slide
                                    </div>
                                   </div>
                                  </div>';

                        ?>

                          <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="fa fa-angle-left"></span>
                          </a>
                          <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="fa fa-angle-right"></span>
                          </a>
                        </div>
                      </div>
                   </div>-->
                   <div class="tab-pane" id="tab_1">
                       <br />
                         <?php
                           //$sql = "select concat(Gedung,'.',Lemari,'.',Baris,'.',Boks) as Lokasi from detailvital_proof where RegVitalId = '".$_REQUEST['ids']."' ";

                           $sql = "SELECT detailvital_proof.DetailVitalId, detailvital_proof.Ket,
                                   CONCAT (detailvital_proof.Gedung,'.',detailvital_proof.Lemari,'.', detailvital_proof.Baris,'.',detailvital_proof.Boks) as Lokasi,
                                   detailvitalfile_proof.Filename, detailvitalfile_proof.Size
                                   FROM detailvital_proof LEFT JOIN detailvitalfile_proof ON detailvitalfile_proof.RegVitalId = detailvital_proof.RegVitalId
                                   where detailvital_proof.RegVitalId = '".$_REQUEST['ids']."' and detailvital_proof.Ket = 'sp' ";

                           $result = mysqli_query($connect, $sql);
                           $lokSP = mysqli_fetch_array($result);
                           $btnadd='inline';
                           $btnedit='none';
                           $btndel='none';
                           $dbody = 'none';
                           $msg_sp = "Data masih kosong ...";
                           if(mysqli_num_rows($result)>0){
                             $btnadd='none';
                             $btnedit='inline';
                             $btndel='inline';
                             $dbody = 'inline';
                             $msg_sp = "";
                           }
                         ?>
                            <div class="row" style="display: <?php echo $dbody; ?>" ><br />
                            <div class="box-header with-border">
                                <h4 class="box-title"><span style=" padding: 10px" class='bg-info'><?php echo "Lokasi simpan : ".$lokSP['Lokasi']; ?></span></h4><br />
                            </div>
                            <br />
                            <div class="body">
                            <div class="col-md-12">
                               <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                   <?php
                                       $sql = "select DetVFileId, Filename from detailvitalfile_proof where RegVitalId = '".$_REQUEST['ids']."' and Ket = 'sp' ";
                                       $result = mysqli_query($connect, $sql);
                                       $test = mysqli_num_rows($result);
                                       $it = 1;
                                        while($row = mysqli_fetch_array($result)){
                                    ?>
                                          <div class="item <?php if($it<=1){ echo 'active'; } ?>">
                                              <img style="cursor: pointer" onclick="getviewfile(<?php echo $row['DetVFileId']; ?>);" src="<?php echo $row['Filename']; ?>" width=100% alt="First slide">
                                          <div class="carousel-caption">
                                            <?php echo "File Image ". $it; ?>
                                          </div>
                                        </div>
                                    <?php
                                      $it++;
                                      }
                                    ?>
                                </div>
                                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                       <span class="fa fa-angle-left"></span>
                                    </a>
                                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                        <span class="fa fa-angle-right"></span>
                                    </a>
                            </div>
                         </div>
                       </div>
                         </div>
                          <center><h5><?php echo $msg_sp; ?></h5></center>
                      </div>
                      <!-- /.tab-pane -->

                      <div class="tab-pane" id="tab_2">
                          <br />
                         <?php
                           //$sql = "select concat(Gedung,'.',Lemari,'.',Baris,'.',Boks) as Lokasi from detailvital_proof where RegVitalId = '".$_REQUEST['ids']."' ";

                           $sql = "SELECT detailvital_proof.DetailVitalId, detailvital_proof.Ket,
                                   CONCAT (detailvital_proof.Gedung,'.',detailvital_proof.Lemari,'.', detailvital_proof.Baris,'.',detailvital_proof.Boks) as Lokasi,
                                   detailvitalfile_proof.Filename, detailvitalfile_proof.Size
                                   FROM detailvital_proof LEFT JOIN detailvitalfile_proof ON detailvitalfile_proof.RegVitalId = detailvital_proof.RegVitalId
                                   where detailvital_proof.RegVitalId = '".$_REQUEST['ids']."' and detailvital_proof.Ket = 'ut' ";

                           $result = mysqli_query($connect, $sql);
                           $lokUT = mysqli_fetch_array($result);
                           $btnadd_ut='inline';
                           $btnedit_ut='none';
                           $btndel_ut='none';
                           $dbody_ut = 'none';
                           $msg_ut = "Data masih kosong ...";
                           if(mysqli_num_rows($result)> 0){
                             $btnadd_ut='none';
                             $btnedit_ut='inline';
                             $btndel_ut='inline';
                             $dbody_ut = 'inline';
                             $msg_ut = "";
                           }
                           $sql = "select Filename, KodeReg from detailvitalfile_proof where RegVitalId = '".$_REQUEST['ids']."' and Ket = 'ut' ";
                           $result = mysqli_query($connect, $sql);
                           $test = mysqli_fetch_array($result);
                         ?>
                            <div class="row" style="display: <?php echo $dbody_ut; ?>" >
                            <div class="box-header with-border">
                              <br />
                                <h4 class="box-title"><span style=" padding: 10px" class='bg-info'><?php echo "Lokasi simpan : ".$lokUT['Lokasi']; ?></span></h4><br />
                                <form action="tcpdf/print.php" method="post">
                                    <input type="hidden" name="filename" value="<?php echo $test['Filename']; ?>" >;
                                    <input type="hidden" name="code" value="<?php echo $test['KodeReg']; ?>" >;
                                    <button type="submit" class="btn btn-success pull-right" onclick='logdok("<?php echo '../'.$test['Filename'];?>","<?php echo $test['KodeReg'];?>")' ><i class='fa fa-download'></i>&nbsp;Barcode File</button>
                                    <a href="<?php echo $test['Filename']; ?>" download><button type="button" class="btn btn-warning pull-right" onclick='logdok("<?php echo '../'.$test['Filename'];?>","<?php echo $Pfile['KodeReg'];?>")'><i class='fa fa-download'></i>&nbsp;Original File</button></a>
                                </form>
                            </div><br /><br />
                               <center>
                                <?php

                                 if (mysqli_num_rows($result)!=0){
                                 ?>
                                  <object id="viewST" data="viewerJS/#../<?php echo $test['Filename']; ?>" type = "application/pdf"  width="100%" height="700" >
                                  </object>
                                 <?php } ?>
                                  </center>
                               </div>
                                 <center><h5><?php echo $msg_ut; ?></h5></center>
                      </div>
                      <div class="tab-pane" id="tab_3">
                          <br />
                         <?php
                           //$sql = "select concat(Gedung,'.',Lemari,'.',Baris,'.',Boks) as Lokasi from detailvital_proof where RegVitalId = '".$_REQUEST['ids']."' ";

                           $sql = "SELECT detailvital_proof.DetailVitalId, detailvital_proof.Ket,
                                   CONCAT (detailvital_proof.Gedung,'.',detailvital_proof.Lemari,'.', detailvital_proof.Baris,'.',detailvital_proof.Boks) as Lokasi,
                                   detailvitalfile_proof.Filename, detailvitalfile_proof.Size
                                   FROM detailvital_proof LEFT JOIN detailvitalfile_proof ON detailvitalfile_proof.RegVitalId = detailvital_proof.RegVitalId
                                   where detailvital_proof.RegVitalId = '".$_REQUEST['ids']."' and detailvital_proof.Ket = 'st' ";

                           $result = mysqli_query($connect, $sql);
                           $lokST = mysqli_fetch_array($result);
                           $btnadd_st='inline';
                           $btnedit_st='none';
                           $btndel_st='none';
                           $dbody_st = 'none';
                           $msg_st = "Data masih kosong ...";
                           if(mysqli_num_rows($result)> 0){
                             $btnadd_st='none';
                             $btnedit_st='inline';
                             $btndel_st='inline';
                             $dbody_st = 'inline';
                             $msg_st = "";
                           }
                           $sql = "select Filename, KodeReg from detailvitalfile_proof where RegVitalId = '".$_REQUEST['ids']."' and Ket = 'st' ";
                           $result = mysqli_query($connect, $sql);
                           $test = mysqli_fetch_array($result);
                         ?>
                            <div class="row" style="display: <?php echo $dbody_st; ?>" >
                            <div class="box-header with-border">
                              <br />
                                <h4 class="box-title"><span style=" padding: 10px" class='bg-info'><?php echo "Lokasi simpan : ".$lokST['Lokasi']; ?></span></h4><br />
                                <form action="tcpdf/print.php" method="post">
                                    <input type="hidden" name="filename" value="<?php echo $test['Filename']; ?>" >;
                                    <input type="hidden" name="code" value="<?php echo $test['KodeReg']; ?>" >;
                                    <button type="submit" class="btn btn-success pull-right" onclick='logdok("<?php echo '../'.$test['Filename'];?>","<?php echo $test['KodeReg'];?>")' ><i class='fa fa-download'></i>&nbsp;Barcode File</button>
                                    <a href="<?php echo $test['Filename']; ?>" download><button type="button" class="btn btn-warning pull-right" onclick='logdok("<?php echo '../'.$test['Filename'];?>","<?php echo $Pfile['KodeReg'];?>")'><i class='fa fa-download'></i>&nbsp;Original File</button></a>
                                </form>
                            </div><br /><br />
                               <center>
                                <?php

                                 if (mysqli_num_rows($result)!=0){
                                 ?>
                                  <object id="viewST" data="viewerJS/#../<?php echo $test['Filename']; ?>" type = "application/pdf"  width="100%" height="700" >
                                  </object>
                                 <?php } ?>
                                  </center>
                               </div>
                                 <center><h5><?php echo $msg_st; ?></h5></center>
                      </div>
                      <div class="tab-pane" id="tab_4">
                          <br />
                         <?php
                           //$sql = "select concat(Gedung,'.',Lemari,'.',Baris,'.',Boks) as Lokasi from detailvital_proof where RegVitalId = '".$_REQUEST['ids']."' ";

                           $sql = "SELECT detailvital_proof.DetailVitalId, detailvital_proof.Ket,
                                   CONCAT (detailvital_proof.Gedung,'.',detailvital_proof.Lemari,'.', detailvital_proof.Baris,'.',detailvital_proof.Boks) as Lokasi,
                                   detailvitalfile_proof.Filename, detailvitalfile_proof.Size, detailvital_proof.Keterangan
                                   FROM detailvital_proof LEFT JOIN detailvitalfile_proof ON detailvitalfile_proof.RegVitalId = detailvital_proof.RegVitalId
                                   where detailvital_proof.RegVitalId = '".$_REQUEST['ids']."' and detailvital_proof.Ket = 'pl' ";

                           $result = mysqli_query($connect, $sql);
                           $lokPL = mysqli_fetch_array($result);
                           $btnadd_pl='inline';
                           $btnedit_pl='none';
                           $btndel_pl='none';
                           $dbody_pl = 'none';
                           $msg_pl = "Data masih kosong ...";
                           if(mysqli_num_rows($result)> 0){
                             $btnadd_pl='none';
                             $btnedit_pl='inline';
                             $btndel_pl='inline';
                             $dbody_pl = 'inline';
                             $msg_pl = "";
                           }
                         ?>
                            <div class="row" style="display: <?php echo $dbody_pl; ?>" >
                            <div class="box-header with-border">
                              <br />
                                <h4 class="box-title"><span style=" padding: 10px" class='bg-info'><?php echo "Lokasi simpan : ".$lokPL['Lokasi']; ?></span></h4><br />
                            </div><br />
                               <h4>Keterangan : <?php echo $lokPL['Keterangan']; ?></h4>
                                <?php
                                 $sql = "select DetVFileId, Filename, Size from detailvitalfile_proof where RegVitalId = '".$_REQUEST['ids']."' and Ket = 'pl' ";
                                 $result = mysqli_query($connect, $sql);
                                 $test = mysqli_num_rows($result);
                                  echo '<table class="table table-bordered" style="width: 60%">
                                        <tr>
                                           <th style="width: 10px"><center>No.</center></th>
                                           <th style="width: 50%"><center>Filename</center></th>
                                           <th style="width: 20%"><center>Size</center></th>
                                           <th><center>...</center></th>
                                         </tr>';
                                  $no = 1;
                                  while($data=mysqli_fetch_array($result)){
                                       echo "<tr>";
                                       echo "<td>".$no.".</td>";
                                       $fileo = explode("/",$data['Filename']);
                                       //echo "<td>".$fileo[3]."</td>";
                                       $dotfile = explode(".",$fileo[3]);
                                       $true = 0;
                                       foreach($dotfile as $item){
                                         if($item==$dotfile[1])
                                            $true = "1";
                                       }
                                       echo "<td>".$fileo[3]."</td>";
                                       echo "<td align=right>".filesize_formatted($data['Size'])."</td>";
                                       if($true)
                                         echo "<td><center><button class='btn btn-primary btn-xs' onclick=viewimg('".$data['DetVFileId']."'); ><i class='fa fa-floppy-o'></i></button></center></td>";
                                       else
                                         echo "<td><center><a href= '".$data['Filename']."' download class='btn btn-primary btn-xs'><i class='fa fa-cloud-download'></i></a></center></td>";

                                       echo "</tr>";
                                       $no++;
                                  }
                                  echo '</table>';

                                 ?>
                               </div>
                                 <center><h5><?php echo $msg_pl; ?></h5></center>
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
   <?php
   function filesize_formatted($size)
    {
    //$size = $path;
    $units = array( 'B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
    $power = $size > 0 ? floor(log($size, 1024)) : 0;
    return number_format($size / pow(1024, $power), 2, '.', ',') . ' ' . $units[$power];
    }

   ?>

