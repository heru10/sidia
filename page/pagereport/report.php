  <?php
    session_start();
	include "../../conf.php";

    $m0 = 'none';
    $m1 = 'none';
    $m2 = 'none';
    $m3 = 'none';

	$label_kategori = "";
	
	//echo $_SESSION['Menu'];
	$hak_menu = explode("#",$_SESSION['Menu']);
	
	
    switch ($_SESSION['Menu']){
      case 'm0' : $m0 = 'inline';
                  break;
      case 'm1' : $m1 = 'inline';
                  break;
      case 'm2' : $m2 = 'inline';
                  break;
      case 'm3' : $m3 = 'inline';
                  break;
    }


  ?>
  <section class="content-header">
      <h3>
        Cetak Daftar Dokumen
      </h3>
        <?php echo $_SESSION['RoleName']; ?>
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Cetak Daftar Dokumen</li>
      </ol>
  </section>

  <div id="forminput">
  <section class="content">
      <div class="row">
      <form role="form" name="myfrmprint" id="myfrmprint" target="_blank" action="tcpdf/examples/cetak.php" method="post" enctype="multipart/form-data">
          <div class="box">
            <div class="box-header with-border">
              <h4 class="box-title">Cetak Daftar Dokumen / Periode</h4><hr />
            </div>
           <div class="box-body">
            <table class="table" border="0"  >
               <tr>
                  <td width="15%"><b class="text-red">Tipe Dokumen</b></td>
                  <td>
                     <div class="col-lg-12">
                     <select class="form-control select3" name="txtm" id="txtm" style="width: 30%;" required>
                      <option value="">~ Pilih Dokumen ~</option>
                      <option value="m4">Dokumen Aktif</option>
                      <option value="m5">Dokumen Inaktif</option>
                      <option value="m0" style="display: <?php echo $m0; ?>">Dokumen Vital Dalitas</option>
                      <option value="m1" style="display: <?php echo $m1; ?>">Dokumen Vital Sainproof</option>
                      <option value="m2" style="display: <?php echo $m2; ?>">Dokumen Vital OSDM</option>
                      <option value="m3" style="display: <?php echo $m3; ?>">Dokumen Vital Setkol</option>
                    </select>
                    </div>
                  </td>
               </tr>
			   
			   <?php
				if (in_array("m0", $hak_menu)){ ?>
					 <tr>
                  <td width="15%"><b class="text-red">Kategori Produk</b></td>
                  <td>
                     <div class="col-lg-12">
                     <select class="form-control select3" name="kategori" id="kategori" style="display: <?php echo $m0; ?> width: 30%;" >
                      <option value="">~ Pilih Kategori ~</option>
					  <?php 
						$sQuery 		= "select KatProdukId, KatProdukName from master_katproduk Where RoleId = '".$_SESSION['RoleId']."' Order by KatProdukId Asc";
						$rResult 	= mysqli_query($connect, $sQuery) or fatal_error( 'MySQL Error: ' . mysql_errno() );
						while($row 	= mysqli_fetch_array($rResult)){
							?>
							<option value="<?php echo $row['KatProdukId']; ?>"><?php echo $row['KatProdukName']; ?></option>
							<?php
						}
						mysqli_close($connect);				
					  ?>
                    </select>
                    </div>
                  </td>
               </tr>
			<?php	}
			   ?>
			   
               <tr>
                  <td><b class="text-red">Periode Tahun</b></td>
                  <td>
                   <div class="col-lg-3">
                    <select class="form-control" name='thn1'>
                       <option value="">~ Pilih Tahun I ~</option>
                        <?php
                            for($i=1970;$i<=date('Y');$i++){
                             echo '<option value='.$i.'>'.$i.'</option>';
                            }
                        ?>
                    </select>
                    </div>
                    <div class="col-lg-3">
                    <select class="form-control" name='thn2'>
                       <option value="">~ Pilih Tahun II ~</option>
                        <?php
                            for($i=1970;$i <= date('Y');$i++){
                             echo '<option value='.$i.'>'.$i.'</option>';
                            }
                        ?>
                    </select>
                    </div>
                    <!--<div>
                      <div class="col-lg-3">
                        <div class="input-group">
                          <input type="text" class="form-control"  id="datepicker1" name="txtd1" value="<?php echo date('d/m/Y'); ?>" required>
                            <div class="input-group-addon">
                              <i class="fa fa-calendar"></i>
                            </div>
                        </div>
                      </div>
                      <div class="col-lg-3">
                        <div class="input-group">
                          <input type="text" class="form-control"  id="datepicker2" name="txtd2" value="<?php echo date('d/m/Y'); ?>" required>
                            <div class="input-group-addon">
                              <i class="fa fa-calendar"></i>
                            </div>
                        </div>
                      </div>
                    </div>-->
                  </td>
               </tr>
            </table>
            <div class="box-body pull-left" >
                <input type="hidden" name="task" id="task" value="new"  />
                <input type="hidden" name="menu" id="menu" value=""  />
                <button type="submit" class="btn btn-primary"><i class="fa fa-print"></i>&nbsp;Cetak</button>
            </div>
           </div>
        </div>
        </form>
       </div>
      </div>




  </section>

