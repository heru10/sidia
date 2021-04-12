<?php
  session_start();
  include_once 'dashboard.js';
?>
<style type="text/css">
/*<![CDATA[*/
  .blink {
  animation: blink-animation 1s steps(5, start) infinite;
  -webkit-animation: blink-animation 1s steps(5, start) infinite;
}
@keyframes blink-animation {
  to {
    visibility: hidden;
  }
}
@-webkit-keyframes blink-animation {
  to {
    visibility: hidden;
  }
}
/*]]>*/
</style>
<section class="content">
  <div class="row">
      <section class="content-header">
      <h1>
        <?php echo $_SESSION['RoleName']; ?></h1>
        <small>Nama Pengguna : <?php echo $_SESSION['PeopleName']; ?> </small>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Widgets</li>
      </ol>
    </section>
    <br />
    <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><span id='laktif'></span></h3>

              <p>Dokumen Aktif</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <!--<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>-->
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><span id='linaktif'></span></h3>

              <p>Dokumen Inaktif</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <!--<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>-->
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3><span id='lvital'></span></h3>

              <p>Dokumen Vital</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <!--<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>-->
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><span id='lpinjam'></span></h3>

              <p>Peminjaman Dokumen Fisik</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <!--<a href="#" class="small-box-footer">Dokumen dipinjam dan permohonan</a>-->
          </div>
        </div>
  </div>
  <div class="col-lg-6 col-xs-6">
    <div class="box box-primary">
     <div class="box-header">
       <i class="ion ion-clipboard"></i>
       <h3 class="box-title">Grafik Berkas Dokumen</h3>
     </div>
     <div class="box-body">
        <div class="box-body chart-responsive">
           <div class="chart" id="bar-chart" style="height: 280px;"></div>
        </div>
     </div>
    </div>
  </div>
  <div class="col-lg-6 col-xs-6">
    <div class="box box-primary">
     <div class="box-header">
       <i class="ion ion-clipboard"></i>
       <h3 class="box-title">Permohonan Peminjaman Dokumen Digital</h3>
     </div>
     <div class="box-body" style="height: 300px;" >
     <table id="mytbl" class='table table-bordered table-hover'>
       <thead>
         <tr class="bg-red">
          <th width="2%"><center>No.</center></th>
          <th width="30%"><center>Dari Unit Kerja</center></th>
          <th width="5%"><center>Permohonan</center></th>
         </tr>
       </thead>
       <tbody id='bodyr'>
       </tbody>
     </table>
     </div>
    </div>
  </div>
</section>