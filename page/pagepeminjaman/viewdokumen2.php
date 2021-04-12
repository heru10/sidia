<?php
   session_start();
   include "../../conf.php";
   if(isset($_GET['id']))
    $id = $_GET['id'];
   if(isset($_GET['idx']))
    $idx = $_GET['idx'];

    $sql = "select ArsipPinjam, Keterangan, RoleId_To, StatusPinjam, Reservation1, Reservation2, Item, Akses, Kepada from v_peminjaman where PeminjamanId = '".$idx."' ";
    $result = mysqli_query($connect, $sql);
    $rows = mysqli_fetch_array($result);
    $bid = explode('|',$rows['ArsipPinjam']);

    $mAkses = explode('|',$rows['Akses']);
    $btndownload = 'none';
    if($mAkses[0]=='d')
      $btndownload = 'inline';

    $vsp = "none";
    $vut = "none";
    $vst = "none";
    $vpl = "none";
    $vmd = "none";
    $i=0;
    foreach($bid as $abg){

     $mItem = explode(',',$rows['Item']);
    if($abg==$id){
       $mItem = explode('|',$mItem[$i]);

    foreach($mItem as $oItems){
      switch($oItems){
        case 'sp' : $vsp = 'inline';
                    break;
        case 'ut' : $vut = 'inline';
                    break;
        case 'st' : $vst = 'inline';
                    break;
        case 'pl' : $vpl = 'inline';
                    break;
        case 'md' : $vmd = 'inline';
                    break;
      }
     }
    }
     $i++;
   }

   $sql = "select * from v_naskah_vital_proof where RegVitalId = '".$id."'  ";
   $result = mysqli_query($connect, $sql);
   $data = mysqli_fetch_array($result);
   //$ketrinci = rinci($rows['Item']);
   $status = '<span class="text-red">[Dokumen Vital]</span>';
   $uraian = $data['KatProdukName'].' >> '.$data['JProdukName'].' >> '.$data['DetailProdukName'];
?>

    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Lihat Dokumen Vital <?php echo $rows['Kepada']; ?></h3>
            </div>
              <div class="box-body">
                <input type="hidden" id="id" value="<?php echo $id; ?>" />
                <input type="hidden" id="idx" value="<?php echo $idx; ?>" />
                <div class="row">
                  <div class="col-md-12">
                    <div class="box box-solid">
                      <div class="box-header with-border">
                        <h3 class="box-title"><?php echo $uraian; ?></h3>
                      </div>
                      <!-- /.box-header -->
                      <div class="box-body">
                        <div class="box-group" id="accordion">
                          <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                          <?php if($vsp=='inline'){ ?>
                          <div class="panel box box-warning" style="display:<?php echo $vsp; ?>">
                            <div class="box-header with-border">
                              <h4 class="box-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                  <i class="fa fa-ellipsis-v"></i>
                                  <i class="fa fa-ellipsis-v"></i>
                                  Dokumen Spesimen
                                </a>
                              </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in">
                              <div class="box-body">
                                 <div class="col-md-6 center">
                                  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                       <?php
                                           $sql = "select DetVFileId, Filename from detailvitalfile_proof where RegVitalId = '".$id."' and Ket = 'sp' ";
                                           $result = mysqli_query($connect, $sql);
                                           $test = mysqli_num_rows($result);
                                           $it = 1;
										   
										//Tri Wibowo 7648, 19 11 2019, Check apakah ada data
										if(!$test)
										{
											echo 'Data masih kosong ...';
										}
										else
										{
										   
										   
										   
                                            while($row = mysqli_fetch_array($result)){
                                              $fit = explode("/",$row['Filename']);
                                            ?>
                                              <div class="item <?php if($it<=1){ echo 'active'; } ?>">
												  <!--Tri Wibowo 7648, 19 11 2019, Arahkan ke M0-->
                                                  <img style="cursor: pointer"  onclick="viewimg_m0(<?php echo $row['DetVFileId']; ?>);" src="<?php echo $row['Filename']; ?>" width=100% alt="First slide">
                                              <div class="carousel-caption">
                                                <?php echo "File Image ". $fit[3]; ?>
                                              </div>
                                            </div>
											
											 <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
											   <span class="fa fa-angle-left"></span>
											</a>
											<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
												<span class="fa fa-angle-right"></span>
											</a>
                                        <?php
                                          $it++;
                                          }
										}
                                        ?>
                                    </div>
                                   
                                 </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <?php }
                             if($vut=='inline'){
                           ?>

                          <div class="panel box box-primary" style="display:<?php echo $vut; ?>">
                            <div class="box-header with-border">
                              <h4 class="box-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                  <i class="fa fa-ellipsis-v"></i>
                                  <i class="fa fa-ellipsis-v"></i>
                                  Dokumen Uraian Teknis
                                </a>
                              </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse">
                              <div class="box-body">
                                <center>
                                    <?php
                                     $sql = "select Filename, KodeReg, DetVFileId from detailvitalfile_proof where RegVitalId = '".$id."' and Ket = 'ut' ";
                                     $result = mysqli_query($connect, $sql);
                                     $test = mysqli_fetch_array($result);
									
									//Tri Wibowo 7648, 19 11 2019, Check apakah ada data
									if(!$test)
									{
										echo 'Data masih kosong ...';
									}
									else
									{

                                     ?>
                                     <div style="display: <?php echo $btndownload; ?>">
                                        <form name="myfrm1" action="tcpdf/print.php" method="post">
                                           <input type="hidden" name="filename" value="<?php echo $test['Filename']; ?>" >;
                                           <input type="hidden" name="code" value="<?php echo $test['KodeReg']; ?>" >;
                                           <button type="submit" class="btn btn-warning pull-right"><i class='fa fa-download'></i></button>
                                        </form><br /><br />
                                      </div>
                                      <object id="viewUT" data="viewerJS/#../<?php echo $test['Filename']; ?>" type = "application/pdf"  width="100%" height="700" >
                                      </object>
									  <?php
										}
									  ?>
                                  </center>
                              </div>
                             </div>
                          </div>
                       <?php } if($vst=='inline'){ ?>
                          <div class="panel box box-danger" style="display:<?php echo $vst; ?>">
                            <div class="box-header with-border">
                              <h4 class="box-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTree">
                                  <i class="fa fa-ellipsis-v"></i>
                                  <i class="fa fa-ellipsis-v"></i>
                                  Dokumen Spesifikasi Teknis
                                </a>
                              </h4>
                            </div>

                            <div id="collapseTree" class="panel-collapse collapse">
                              <div class="box-body">
                                  <center>
                                    <?php
                                     $sql = "select Filename, KodeReg from detailvitalfile_proof where RegVitalId = '".$id."' and Ket = 'st' ";
                                     $result = mysqli_query($connect, $sql);
                                     $test = mysqli_fetch_array($result);
                                     
									//Tri Wibowo 7648, 19 11 2019, Check apakah ada data 
									if(!$test)
									{
										echo 'Data masih kosong ...';
									}
									else
									{
									 
									 ?>

                                      <div style="display: <?php echo $btndownload; ?> ">
                                         <form name="myfrm1" action="tcpdf/print.php" method="post">
                                           <input type="hidden" name="filename" value="<?php echo $test['Filename']; ?>" >;
                                           <input type="hidden" name="code" value="<?php echo $test['KodeReg']; ?>" >;
                                           <button type="submit" class="btn btn-warning pull-right"><i class='fa fa-download'></i></button>
                                        </form><br /><br />
                                      </div>
                                      <object id="viewST" data="viewerJS/#../<?php echo $test['Filename']; ?>" type = "application/pdf"  width="100%" height="700" >
                                      </object>
									<?php
									}
									?>
                                  </center>
                              </div>
                            </div>
                          </div>
                          <?php }
                            if($vpl=='inline'){
                          ?>
                          <div class="panel box box-success" style="display:<?php echo $vpl; ?>">
                            <div class="box-header with-border">
                              <h4 class="box-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                                   <i class="fa fa-ellipsis-v"></i>
                                   <i class="fa fa-ellipsis-v"></i>
                                   Dokumen Pendukung
                                </a>
                              </h4>
                            </div>
                            <div id="collapseFour" class="panel-collapse collapse">
                              <div class="box-body">
                                 <?php
                                 $sql = "select DetVFileId, Filename, Size from detailvitalfile_proof where RegVitalId = '".$id."' and Ket = 'pl' ";
                                 $result = mysqli_query($connect, $sql);
                                 $test = mysqli_num_rows($result);
								 
								//Tri Wibowo 7648, 19 11 2019, Check apakah ada data 
								if(!$test)
								{
									echo 'Data masih kosong ...';
								}
								else
								{
								 
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
                                       $true = false;
                                       foreach($dot as $item){
                                         if($item == $dotfile[count($dotfile)-1])
                                            $true = true;
                                       }


                                       echo "<td>".$fileo[3]."</td>";
                                       echo "<td align=right>".filesize_formatted($data['Size'])."</td>";
                                       if($true)
										 //Tri Wibowo 7648, 19 11 2019, Arahkan ke M0 
                                         echo "<td><center><button class='btn btn-primary btn-xs' onclick=viewimg_m0('".$data['DetVFileId']."'); ><i class='fa fa-floppy-o'></i></button></center></td>";
                                       else
                                         echo "<td><center><a href= '".$data['Filename']."' download class='btn btn-primary btn-xs'><i class='fa fa-cloud-download'></i></a></center></td>";


                                       echo "</tr>";
                                       $no++;
                                  }
                                  echo '</table>';
								
								}
                                 ?>
                            </div>
                          </div>
                        </div>
                        <?php }
							if($vmd=='inline'){
                         ?>
                          <div class="panel box box-success" style="display:<?php echo $vpl; ?>">
                            <div class="box-header with-border">
                              <h4 class="box-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                                   <i class="fa fa-ellipsis-v"></i>
                                   <i class="fa fa-ellipsis-v"></i>
                                   Metadata
                                </a>
                              </h4>
                            </div>
                            <div id="collapseFive" class="panel-collapse collapse">
                              <div class="box-body">
                                 <?php
                                 $sql = "select DetVFileId, Filename, Size from detailvitalmetafile_proof where RegVitalId = '".$id."'";
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
									   $true = false;
                                       foreach($dot as $item){
                                         if($item == $dotfile[count($dotfile)-1])
                                            $true = true;
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
                          </div>
                        </div>
                        <?php } 
						?>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="box-footer">
                <button onclick="closed();"  type="submit" class="btn btn-primary">Tutup</button>
              </div>
            </div>
          </div>
          <!-- /.box -->

          <!-- Form Element sizes -->
     </div>
     </div>

    <script>
	
      function viewimg(pfile){
       var ids = $("#id").val();
       var idx = $("#idx").val();
       pageurl('page/pagepeminjaman/test_img.php?ids='+ids+'&idx='+idx+'&pfile='+pfile+'&ket=m1');
      }
	  
	  //Tri Wibowo 7648, 19 11 2019, Arahkan ke M0 
	  function viewimg_m0(pfile){
       var ids = $("#id").val();
       var idx = $("#idx").val();
       pageurl('page/pagepeminjaman/test_img.php?ids='+ids+'&idx='+idx+'&pfile='+pfile+'&ket=m0');
      }
	 
	
      function closed(){
        pageurl('page/pagepeminjaman/regpeminjaman.php');
      }




    </script>

<?php
 mysqli_close($connect);

 function rinci($si){
 $gd = explode('|',$si);
 $gabname = "";
    foreach($gd as $idis){
      $name = "Semua Item Dokumen";
      switch($idis){
        case 'sp' : $name = 'Spesimen';
                    break;
        case 'ut' : $name = 'Uraian Teknis';
                    break;
        case 'st' : $name = 'Spesifikasi Teknis';
                    break;
        case 'pl' : $name = 'Dokumen Pendukung';
                    break;
      }
      $gabname .= $name.", ";
    }
    $gabname = ' >> <text class="text-blue">'.substr($gabname,0,-2).'.</text>';
    return $gabname;
 }

   function filesize_formatted($size)
    {
    //$size = $path;
    $units = array( 'B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
    $power = $size > 0 ? floor(log($size, 1024)) : 0;
    return number_format($size / pow(1024, $power), 2, '.', ',') . ' ' . $units[$power];
    }


 ?>