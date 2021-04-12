  <?php
  session_start();
    include_once "regdetailvitaldalitas.js";
    include_once "../../conf.php";
    if(isset($_REQUEST['ids'])){
    $sql = "select regarsipvital.KodeReg
            from regarsipvital
            where RegVitalId = '".$_REQUEST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $Mcodreg = mysqli_fetch_array($result);
    $codreg = $Mcodreg['KodeReg'];
    }
    $sql = "select CONCAT(KatProdukName,' >> ',JProdukName,' >> ',DetailProdukName,' >> ' ,uraian,' >> ',tahun) as labeldok from v_naskah_vital where RegVitalId = '".$_REQUEST['ids']."' ";
    $result = mysqli_query($connect, $sql);
    $labeldok = mysqli_fetch_array($result);

    $btnaddm="inline";
    $btneditm="none";
    $btndelm="none";

//    $sql = "SELECT * ";
//    $sql .= " FROM detailvital
//              LEFT JOIN master_kodekerja ON master_kodekerja.KodeId = detailvitalmeta_proof.PekerjaanId ";
//    $sql .= " where RegVitalId = '".$_REQUEST['ids']."'";
//    $result = mysqli_query($connect, $sql);
//    $jdata = mysqli_num_rows($result);
//    $data = mysqli_fetch_array($result);
//
//    if($jdata!=0){
//     $btnaddm="none";
//     $btneditm="inline";
//     $btndelm="inline";
//    }


  ?>
  <style type="text/css">
  /*<![CDATA[*/
  #outerContainer #mainContainer div.toolbar {
  display: none !important; /* hide PDF viewer toolbar */
}
#outerContainer #mainContainer #viewerContainer {
  top: 0 !important; /* move doc up into empty bar space */
}
  /*]]>*/
  </style>
  <section class="content-header">
      <h3>
        Detail Dokumen Vital <?php echo $_SESSION['RoleName']; ?>
      </h3>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Detail Dokumen Vital</li>
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
                      <li class="active"><a href="#tab_1" data-toggle="tab">Spesimen</a></li>
                      <!--<li><a href="#tab_1a" data-toggle="tab">Test</a></li> -->
                      <li><a href="#tab_2" data-toggle="tab">Uraian Teknis</a></li>
                      <li><a href="#tab_3" data-toggle="tab">Spesifikasi Teknis</a></li>
                      <li><a href="#tab_4" data-toggle="tab">Data Pendukung</a></li>
                    </ul>
                  <div class="tab-content">
                  <button type="button" onclick="closed();" class="btn pull-right"><b><i class="fa fa-remove"></i>&nbsp;Tutup</b></button>
                   <div class="tab-pane active" id="tab_1">
                       <br />
                         <?php
                           //$sql = "select concat(Gedung,'.',Lemari,'.',Baris,'.',Boks) as Lokasi from detailvital_proof where RegVitalId = '".$_REQUEST['ids']."' ";

                           $sql = "SELECT detailvital.DetailVitalId, detailvital.Ket,
                                   CONCAT (detailvital.Gedung,'.',detailvital.Lemari,'.', detailvital.Baris,'.',detailvital.Boks) as Lokasi,
                                   detailvitalfile.Filename, detailvitalfile.Size
                                   FROM detailvital LEFT JOIN detailvitalfile ON detailvitalfile.RegVitalId = detailvital.RegVitalId
                                   where detailvital.RegVitalId = '".$_REQUEST['ids']."' and detailvital.Ket = 'sp' ";

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
                            <button class="btn btn-primary" style="display: <?php echo $btnadd; ?>" onclick="getSpesimen('<?php echo $_REQUEST['ids'];?>');" ><b><i class="fa fa-floppy-o"></i>&nbsp;Tambah</b></button>
                            <button type="button"  style="display: <?php echo $btnedit; ?>" onclick="loadspesimen();" class="btn btn-warning"><b><i class="fa fa-edit"></i>&nbsp;Ubah</b></button>
                            <button type="button"  style="display: <?php echo $btndel; ?>" onclick="deldata_sp();" class="btn btn-danger"><b><i class="fa fa-bitbucket"></i>&nbsp;Hapus</b></button>
                            <div class="row" style="display: <?php echo $dbody; ?>" ><br />
                            <div class="box-header with-border">
                                <h4 class="box-title"><span style=" padding: 10px" class='bg-info'><?php echo "Lokasi simpan : ".$lokSP['Lokasi']; ?></span></h4><br />
                            </div>
                            <br />
                            <div class="body">
                            <div class="col-md-12">
                               Silahkan klik gambar untuk melihat proses selanjutnya...
                               <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">

                                   <?php
                                       $sql = "select DetVFileId, Filename from detailvitalfile where RegVitalId = '".$_REQUEST['ids']."' and Ket = 'sp' ";
                                       $result = mysqli_query($connect, $sql);
                                       $test = mysqli_num_rows($result);
                                       $it = 1;
                                        while($row = mysqli_fetch_array($result)){
                                          $fit = explode("/",$row['Filename']);
                                    ?>
                                          <div class="item <?php if($it<=1){ echo 'active'; } ?>">
                                              <img style="cursor: pointer" onclick="viewimg(<?php echo $row['DetVFileId']; ?>);" src="<?php echo $row['Filename']; ?>" width=100% alt="First slide">
                                          <div class="carousel-caption">
                                            <?php echo "File Image ". $fit[3]; ?>
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

                           $sql = "SELECT detailvital.DetailVitalId, detailvital.Ket,
                                   CONCAT (detailvital.Gedung,'.',detailvital.Lemari,'.', detailvital.Baris,'.',detailvital.Boks) as Lokasi,
                                   detailvitalfile.Filename, detailvitalfile.Size
                                   FROM detailvital LEFT JOIN detailvitalfile ON detailvitalfile.RegVitalId = detailvital.RegVitalId
                                   where detailvital.RegVitalId = '".$_REQUEST['ids']."' and detailvital.Ket = 'ut' ";

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
                           $sql = "select Filename from detailvitalfile where RegVitalId = '".$_REQUEST['ids']."' and Ket = 'ut' ";
                           $result = mysqli_query($connect, $sql);
                           $test = mysqli_fetch_array($result);
                         ?>

                            <button class="btn btn-primary" style="display: <?php echo $btnadd_ut; ?>" onclick="getUT('<?php echo $_REQUEST['ids'];?>');" ><b><i class="fa fa-floppy-o"></i>&nbsp;Tambah</b></button>
                            <button type="button"  style="display: <?php echo $btnedit_ut; ?>" onclick="loadUT();" class="btn btn-warning"><b><i class="fa fa-edit"></i>&nbsp;Ubah</b></button>
                            <button type="button"  style="display: <?php echo $btndel_ut; ?>" onclick="deldata_ut();" class="btn btn-danger"><b><i class="fa fa-bitbucket"></i>&nbsp;Hapus</b></button>
                            <div class="row" style="display: <?php echo $dbody_ut; ?>" >
                            <div class="box-header with-border">
                              <br />
                                <h4 class="box-title"><span style=" padding: 10px" class='bg-info'><?php echo "Lokasi simpan : ".$lokUT['Lokasi']; ?></span></h4>
                            </div><br /><br />
                               <center>
                                <?php

                                 if(mysqli_num_rows($result) != 0){
                                 ?>
								<!-- Tri Wibowo, 7648 pake viewer JS ada yg ke rotate halaman pertamanya
                                   <object  id="viewUT" data="viewerJS/#../<?php echo $test['Filename']; ?>" type = "application/pdf"  width="100%" height="700" ></object>
                                   </center>
								-->
								<?php 
									$pisah = explode('/',$_SERVER['PHP_SELF']);
									$nama_aplikasi = $pisah[1];									
								?>
								
								   <object data="http://<?php echo $_SERVER['HTTP_HOST']."/".$nama_aplikasi."/";?><?php echo $test['Filename']; ?>" type="application/pdf" width="100%" height="700">								  
									</object>
									
                                 <?php } ?>
                               </div>
                                 <center><h5><?php echo $msg_ut; ?></h5></center>
                      </div>
                      <div class="tab-pane" id="tab_3">
                          <br />
                         <?php
                           //$sql = "select concat(Gedung,'.',Lemari,'.',Baris,'.',Boks) as Lokasi from detailvital where RegVitalId = '".$_REQUEST['ids']."' ";

                           $sql = "SELECT detailvital.DetailVitalId, detailvital.Ket,
                                   CONCAT (detailvital.Gedung,'.',detailvital.Lemari,'.', detailvital.Baris,'.',detailvital.Boks) as Lokasi,
                                   detailvitalfile.Filename, detailvitalfile.Size
                                   FROM detailvital LEFT JOIN detailvitalfile ON detailvitalfile.RegVitalId = detailvital.RegVitalId
                                   where detailvital.RegVitalId = '".$_REQUEST['ids']."' and detailvital.Ket = 'st' ";

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
                           $sql = "select Filename from detailvitalfile where RegVitalId = '".$_REQUEST['ids']."' and Ket = 'st' ";
                           $result = mysqli_query($connect, $sql);
                           $test = mysqli_fetch_array($result);
                         ?>

                            <button class="btn btn-primary" style="display: <?php echo $btnadd_st; ?>" onclick="getST('<?php echo $_REQUEST['ids'];?>');" ><b><i class="fa fa-floppy-o"></i>&nbsp;Tambah</b></button>
                            <button type="button"  style="display: <?php echo $btnedit_st; ?>" onclick="loadST();" class="btn btn-warning"><b><i class="fa fa-edit"></i>&nbsp;Ubah</b></button>
                            <button type="button"  style="display: <?php echo $btndel_st; ?>" onclick="deldata_st();" class="btn btn-danger"><b><i class="fa fa-bitbucket"></i>&nbsp;Hapus</b></button>
                            <div class="row" style="display: <?php echo $dbody_st; ?>" >
                            <div class="box-header with-border">
                              <br />
                                <h4 class="box-title"><span style="padding: 10px" class='bg-info'><?php echo "Lokasi simpan : ".$lokST['Lokasi']; ?></span></h4>
                            </div><br /><br />
                               <center>
                                <?php

                                 if(mysqli_num_rows($result) != 0){
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
                           $sql = "SELECT detailvital.DetailVitalId, detailvital.Ket,
                                   CONCAT (detailvital.Gedung,'.',detailvital.Lemari,'.', detailvital.Baris,'.',detailvital.Boks) as Lokasi,
                                   detailvitalfile.Filename, detailvitalfile.Size, detailvital.Keterangan
                                   FROM detailvital LEFT JOIN detailvitalfile ON detailvitalfile.RegVitalId = detailvital.RegVitalId
                                   where detailvital.RegVitalId = '".$_REQUEST['ids']."' and detailvital.Ket = 'pl' ";

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

                            <button class="btn btn-primary" style="display: <?php echo $btnadd_pl; ?>" onclick="getPL('<?php echo $_REQUEST['ids'];?>');" ><b><i class="fa fa-floppy-o"></i>&nbsp;Tambah</b></button>
                            <button type="button"  style="display: <?php echo $btnedit_pl; ?>" onclick="loadPL();" class="btn btn-warning"><b><i class="fa fa-edit"></i>&nbsp;Ubah</b></button>
                            <button type="button"  style="display: <?php echo $btndel_pl; ?>" onclick="deldata_pl();" class="btn btn-danger"><b><i class="fa fa-bitbucket"></i>&nbsp;Hapus</b></button>
                            <div class="row" style="display: <?php echo $dbody_pl; ?>" >
                            <div class="box-header with-border">
                              <br />
                                <h4 class="box-title"><span style=" padding: 10px" class='bg-info'><?php echo "Lokasi simpan : ".$lokPL['Lokasi']; ?></span></h4><br />
                            </div><br />
                               <h5>Keterangan : <?php echo $lokPL['Keterangan']; ?></h5>
                                <?php
                                 $sql = "select DetVFileId, Filename, Size from detailvitalfile where RegVitalId = '".$_REQUEST['ids']."' and Ket = 'pl' ";
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
                                  $dot = array('jpg','bmp','gif','pdf');
                                  while($data=mysqli_fetch_array($result)){
                                       echo "<tr>";
                                       echo "<td>".$no.".</td>";
                                       $fileo = explode("/",$data['Filename']);
                                       $dotfile = explode(".",$fileo[3]);
                                       $true = 0;
                                       foreach($dot as $item){
                                         if($item==$dotfile[1])
                                            $true = "1";
                                       }


                                       echo "<td>".$fileo[3]."</td>";
                                       echo "<td align=right>".filesize_formatted($data['Size'])."</td>";
                                       //if($true)
                                        // echo "<td><center><button class='btn btn-primary btn-xs' onclick=viewimg('".$data['DetVFileId']."'); ><i class='fa fa-floppy-o'></i></button></center></td>";
                                      // else
                                       //  echo "<td><center><a href= '".$data['Filename']."' download class='btn btn-primary btn-xs'><i class='fa fa-cloud-download'></i></a></center></td>";


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

