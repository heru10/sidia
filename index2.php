<?php
  session_start();
  if(empty($_SESSION['PeopleId']) or empty($_SESSION['RoleId'])){
     echo "<script>location.href='index.php'</script>";

  }

  date_default_timezone_set("Asia/Bangkok");

  $mpu = "none";
  $muk = "none";
  $mpeople = "none";
  if($_SESSION['PeopleTipe'] == 1){
    $mpu = "inline";
    $mpeople = "inline";
    $muk = "inline";
  }
  if($_SESSION['PeopleTipe'] == 2){
    $mpu = "inline";
  }

  $m0 = "none";
  $m1 = "none";
  $m2 = "none";
  $m3 = "none";
  $m4 = "none";
  $md0 = "none";
  $md1 = "none";
  $md2 = "none";
  $md3 = "none";
  $mproduk = "none";
  $mkodper = "none";
  


  $menu = explode("#",$_SESSION['Menu']);
  $m = 'none';
  foreach($menu as $list){
    switch ($list){
      case "m0" : $m0="inline";
                  $md0="inline";
                  $mpu = "none";
                  $mproduk = "inline";
                  $m = 'inline';
                  break;
      case "m1" : $m1="inline";
                  $md1="inline";
                  $mproduk = "inline";
                  $mkodper = "inline";
                  $mpu = "none";
                  $m = 'inline';
                  break;
      case "m2" : $m2="inline";
                  $md2="inline";
                  $mpu = "none";
                  $m = 'inline';
                  break;
      case "m3" : $m3="inline";
                  $md3="inline";
                  $mpu = "inline";
                  $m = 'inline';
                  break;
      case "m4" : $m4="inline";
                  break;
    }
  }
  $persetujuan = 'none';
  if($_SESSION['Approve']==1)
     $persetujuan = 'inline';
   $history = 'inline';
   if($_SESSION['PeopleTipe']==3)
   {
      $m0 = 'none';
      $m1 = 'none';
      $m2 = 'none';
      $m3 = 'none';
      $m4 = 'none';
      $regaktif = 'none';
      $reginaktif = 'none';
      $mproduk = 'none';
	  $importaktif = 'none';
	  $importinaktif = 'none';
	  $lacak = 'none';
   }

   if($_SESSION['PeopleTipe']==1){
     $m4 = 'inline';
   }


?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Sistem Informasi Digital Arsip </title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link href="dist/img/peruri2_8js_icon.ico" rel="shortcut icon">
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
  <link rel="stylesheet" href="bower_components/select2/dist/css/select2.min.css">
  <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="bower_components/toastr/toastr.min.css">
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
 </head>
<!--<script src="bower_components/jquery/dist/jquery.js"></script>-->
  <style type="text/css">
  /*<![CDATA[*/
      .loader {
        position: fixed;
        left: 0px;
        top: 0px;
        width: 100%;
        height: 100%;
        z-index: 9999;
        background:  url(images/status.gif) 50% 50% no-repeat rgb(249,249,249);
        opacity: .8;
}
  /*]]>*/
  </style>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>Si</b>dia</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><i class="fa fa-th-large"></i>&nbsp;<b>SI</b>DIA </span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="images/logo/people.png" class="user-image" alt="User Image">
              <span class="hidden-xs"><?php echo $_SESSION['PeopleName']; ?></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="images/logo/people.png" class="img-circle" alt="User Image">

                <p>
                  <?php echo $_SESSION['PeopleName']." - ".$_SESSION['RoleName']; ?>
                  <!--<small>Member since Nov. 2012</small>-->
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#"><?php echo $_SESSION['CodeRole']; ?></a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat bg-red" data-toggle="modal" data-target="#frmpasswd">Ubah Kunci</a>
                </div>
                <div class="pull-right">
                  <a href="#" onclick="location.href='page/pagelogin/logout.php'" class="btn btn-default btn-flat">Keluar</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>

    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div align='center' class="box-body color-palette-box">
           <img src="dist/img/Logo-peruri.png" width="80%" style="background: #FFFFFF; padding: 5px" />
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li class="treeview menu-open">
          <a href="#" onclick="pageurl('page/pagedashboard/dashboard.php');"><i class="fa fa-dashboard"></i> <span>Home</span></a>
        </li>
        <li class="treeview" style="display: <?php echo $lacak;  ?>">
          <a href="#" onclick="pageurl('page/pagelacak/lacak.php');">
            <i class="fa fa-barcode text-orange" ></i>
            <span>Lacak Dokumen</span>
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-file text-white" ></i>
            <span>Manajemen Dok. Aktif </span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#" style="display:<?php echo $regaktif; ?>" onclick="pageurl('page/pageregdokberkas/regdokberkas.php');" ><i class="fa fa-circle-o"></i> Registrasi Dokumen</a></li>
            <li><a href="#" style="display:<?php echo $daftaraktif; ?>"onclick="pageurl('page/pagedaftarberkas_aktif/regdokberkas.php');"><i class="fa fa-circle-o"></i> Daftar Dokumen</a></li>
            <li><a href="#" style="display:<?php echo $importaktif; ?>"onclick="pageurl('page/pageimport/import.php?req=aktif');"><i class="fa fa-circle-o"></i> Import Dokumen</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-file text-red" ></i>
            <span>Manajemen Dok. InAktif </span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#" style="display:<?php echo $reginaktif; ?>" onclick="pageurl('page/pageregdokberkas_inaktif/regdokberkas.php');" ><i class="fa fa-circle-o"></i> Registrasi Dokumen</a></li>
            <li><a href="#" style="display:<?php echo $daftarinaktif; ?>" onclick="pageurl('page/pagedaftarberkas_inaktif/regdokberkas.php');"><i class="fa fa-circle-o"></i> Daftar Dokumen</a></li>
            <li><a href="#" style="display:<?php echo $importinaktif; ?>"onclick="pageurl('page/pageimport_inaktif/import.php?req=inaktif');"><i class="fa fa-circle-o"></i> Import Dokumen</a></li>
          </ul>
        </li>
        <li class="treeview" style="display: <?php echo $m; ?>">
          <a href="#">
            <i class="fa fa-file text-yellow" ></i>
            <span>Manajemen Dok. Vital </span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li style="display: <?php echo $m0; ?>"><a href="#" onclick="pageurl('page/pageregarsipvitaldalitas/regarsipvitaldalitas.php');"><i class="fa fa-circle-o"></i> Registrasi Dokumen</a></li>
            <li style="display: <?php echo $m1; ?>"><a href="#" onclick="pageurl('page/pageregarsipvitalprof/regarsipvitalprof.php');"><i class="fa fa-circle-o"></i> Registrasi Dokumen</a></li>
            <li style="display: <?php echo $m2; ?>"><a href="#" onclick="pageurl('page/pageregdokberkas_v1/regdokberkas.php');"><i class="fa fa-circle-o"></i> Registrasi Dokumen</a></li>
            <li style="display: <?php echo $m3; ?>"><a href="#" onclick="pageurl('page/pageregdokberkas_v2/regdokberkas.php');"><i class="fa fa-circle-o"></i> Registrasi Dokumen</a></li>
            <li style="display: <?php echo $md0; ?>"><a href="#" onclick="pageurl('page/pagedaftararsipvitaldalitas/daftararsipvitaldalitas.php');"><i class="fa fa-circle-o"></i> Daftar Dokumen</a></li>
            <li style="display: <?php echo $md1; ?>"><a href="#" onclick="pageurl('page/pagedaftararsipvitalprof/daftararsipvitalprof.php');"><i class="fa fa-circle-o"></i> Daftar Dokumen</a></li>
            <li style="display: <?php echo $md2; ?>"><a href="#" onclick="pageurl('page/pagedaftardokberkas_v1/daftardokberkas.php');"><i class="fa fa-circle-o"></i> Daftar Dokumen</a></li>
            <li style="display: <?php echo $md3; ?>"><a href="#" onclick="pageurl('page/pagedaftardokberkas_v2/daftardokberkas.php');"><i class="fa fa-circle-o"></i> Daftar Dokumen</a></li>
          </ul>
        </li>
        <li class="treeview" style="display: <?php echo $mproduk; ?>">
          <a href="#">
            <i class="fa fa-file text-info" ></i>
            <span>Pengaturan Produk </span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
              <li style="display: <?php echo $mproduksi; ?>"><a href="#" onclick="pageurl('page/pagekatproduk/katproduk.php');"><i class="fa fa-bullseye"></i> Kategori Produk</a></li>
                 <li style="display: <?php echo $mproduksi; ?>"><a href="#" onclick="pageurl('page/pagejenisproduk/jenisproduk.php');"><i class="fa fa-bullseye"></i> Jenis Produk</a></li>
                 <li style="display: <?php echo $mproduksi; ?>"><a href="#" onclick="pageurl('page/pagedetailproduk/detailproduk.php');"><i class="fa fa-bullseye"></i> Detail Produk</a></li>
                 <li style="display: <?php echo $mkodper; ?>" ><a href="#" onclick="pageurl('page/pagekodekerja/kodekerja.php');"><i class="fa fa-bullseye"></i> Kode Pekerjaan</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-share-alt-square text-info" ></i>
            <span>Peminjaman Dokumen </span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="treeview"><a href="#"><i class="fa fa-circle-o"></i>Dokumen Digital
                    <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
            </a>
            <ul class="treeview-menu">
                    <li><a href="#"  onclick="pageurl('page/pagepeminjaman/regpeminjaman.php');"><i class="fa fa-circle-o"></i> Reg. Permohonan</a></li>
                    <li><a href="#" style="display:<?php echo $persetujuan; ?>" onclick="pageurl('page/pagepersetujuan/regpersetujuan.php');"><i class="fa fa-circle-o"></i> Persetujuan</a></li>
                    <!--<li><a href="#" onclick="pageurl('page/pagepeminjaman/daftar.php');"><i class="fa fa-circle-o"></i> Daftar Dokumen</a></li>-->
                  </ul>
            </li>
            <li class="treeview" style="display:<?php $regpinjamfisik; ?>"><a href="#"><i class="fa fa-circle-o"></i>Dokumen Fisik
                    <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
            </a>
            <ul class="treeview-menu">
                    <li><a href="#"  onclick="pageurl('page/pagepinjamarsip/regpeminjaman.php');"><i class="fa fa-circle-o"></i> Reg. Peminjaman</a></li>
                    <li><a href="#"  onclick="pageurl('page/pagepengembalianarsip/regpengembalian.php');"><i class="fa fa-circle-o"></i> Reg. Pengembalian</a></li>
                    <!--<li><a href="#" onclick="pageurl('page/pagepeminjaman/daftar.php');"><i class="fa fa-circle-o"></i> Daftar Dokumen</a></li>-->
                  </ul>
            </li>
            <!--<li><a href="#"><i class="fa fa-circle-o"></i>Daftar Dokumen Dipinjam</a></li>-->
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-print text-info" ></i>
            <span>Cetak Daftar</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#" onclick="pageurl('page/pagereport/report.php');" ><i class="fa fa-circle-o"></i> Cetak Daftar Dokumen</a></li>
          </ul>
        </li>
       <?php if($m4=='inline'){ ?>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-gear text-red"></i>
            <span>Konfigurasi Umum</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li style="display: <?php echo $muk; ?>"><a href="#" onclick="pageurl('page/pageunitkerja/unitkerja.php');"><i class="fa fa-bullseye"></i> Unit Kerja</a></li>
            <li style="display: <?php echo $mpeople; ?>"><a href="#" onclick="pageurl('page/pagepeople/people.php');"><i class="fa fa-bullseye"></i> Pengguna</a></li>
            <li class="treeview">
              <a href="#"><i class="fa fa-bullseye"></i>
               <span>Pengaturan Umum</span>
               <span class="pull-right-container">
                 <i class="fa fa-angle-left pull-right"></i>
               </span>
              </a>
              <ul class="treeview-menu">
                 <li><a href="#" onclick="pageurl('page/pageklasifikasi/klasifikasi.php');"><i class="fa fa-bullseye"></i> Klasifikasi</a></li>
                 <?php if($_SESSION['PeopleTipe']==1) { ?>
                 <li><a href="#" onclick="pageurl('page/pagegroup/group.php');"><i class="fa fa-bullseye"></i> Group Jabatan</a></li>
                 <?php } ?>
                 <li><a href="#" onclick="pageurl('page/pagetperkembangan/tperkembangan.php');"><i class="fa fa-bullseye"></i> Tingkat Perkembangan</a></li>
                 <li><a href="#" onclick="pageurl('page/pagemedia/media.php');" ><i class="fa fa-bullseye"></i> Media Dokumen</a></li>
                 <li><a href="#" onclick="pageurl('page/pagejenis/jenis.php');"><i class="fa fa-bullseye"></i> Jenis Dokumen</a></li>
                 <li><a href="#" onclick="pageurl('page/pagesatuan/satuan.php');"><i class="fa fa-bullseye"></i> Satuan Dokumen</a></li>
                 <li><a href="#" onclick="pageurl('page/pagekondisi/kondisi.php');"><i class="fa fa-bullseye"></i> Kondisi Dokumen</a></li>
                <?php if($_SESSION['PeopleTipe']==1) { ?>
                 <li><a href="#" onclick="pageurl('page/pagelogakses/logakses.php?m=2');"><i class="fa fa-bullseye"></i> Log Akses Pengguna</a></li>
                 <li><a href="#" onclick="pageurl('page/pagebackup&restore/backup_restore.php');"><i class="fa fa-bullseye"></i> Backup & Restore</a></li>
                <?php } ?>
              </ul>
            </li>
          </ul>
        </li>
       <?php } ?>
        <li class="treeview">
          <a href="#" onclick="pageurl('page/pagetemplate/template.php');">
            <i class="fa fa-columns text-info" ></i>
            <span>Template Dokumen</span>
          </a>
        </li>
        <li class="treeview">
          <a href="#" onclick="pageurl('page/pagehistory/history.php');">
            <i class="fa fa-history text-info" ></i>
            <span>History Dokumen</span>
          </a>
        </li>
        <li class="treeview">
          <a href="#" onclick="pageurl('page/pagelogakses/logakses.php?m=1');">
            <i class="fa fa-history text-info" ></i>
            <span>Log User</span>
          </a>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
     <div id="loadery" class="loader"></div>
     <div id="content"></div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 1.0
    </div>
    <strong>Copyright &copy; 2018 <a href="https://peruri.go.id">Perusahan Percetakan Uang RI</a>.</strong> All rights
    reserved.
  </footer>

</div>



<div class="modal fade modal-danger" id="frmpasswd">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Ubah Kata Kunci Pengguna</h4>
      </div>
      <div class="modal-body">
      <form name='chgpass' id='chgpass' method="post">
        <table class='table'>
            <tr>
               <td style="width: 25%">Kata Kunci Lama</td>
               <td><input type='password' class='form-control' id='passwd_old' name='passwd_old' required /></td>
            </tr>
            <tr>
               <td>Kata Kunci Baru</td>
               <td><input type='password' class='form-control' id='passwd_new' name='passwd_new' required /></td>
            </tr>
        </table>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button"  class="btn btn-default pull-left" data-dismiss="modal">Batal</button>
        <button type="button" id="btnsimpan" onclick=getpassword(); class="btn btn-primary">Simpan</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<script src="dist/js/adminlte.min.js"></script>
<script src="dist/js/pages/dashboard2.js"></script>
<script src="build/toastr/toastr.min.js"></script>
<script src="build/toastr/toastr.init.js"></script>
<script src="bower_components/jquery/jquery.min.js"></script>
<script>

   function getpassword(){
     var Pold = $("#passwd_old").val();
     var Pnew = $("#passwd_new").val();

     $.ajax({
        type: "POST",
        url: "page/pagelogin/ubahpasswd.php",
        data: "old="+Pold+"&news="+Pnew,
        success: function(display){
          switch(display){
            case "sukses" : toastr.success("Kata Kunci Berhasil disimpan", "BERHASIL");
                            break;
            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                            break;
            case "found"  : toastr.warning("Kesalahan mengubah kata kunci !!", "PERHATIAN");
                            break;
          }
          $("#passwd_old").val('');
          $("#passwd_new").val('');
          location.href = "index.php";
        }
     });

   }

   function logdok(files,kode){
     //alert(files);
    $.ajax({
        url: "page/pagehistory/proses.php", // Url to which the request is send
        type: "POST",             // Type of request to be send, called as method
        data: "task="+files+"&kode="+kode,
        success: function(data){return false;}
    })
  }

   $(this).load(function() {
         $("#loadery").fadeOut("slow");
   });

   if(localStorage.getItem("urlk")==null){
        pageurl("page/pagedashboard/dashboard.php");
   }

   if(location.reload){
     if(localStorage.getItem("urlk")==""){
        //pageurl("page/pagedashboard/dashboard.php");
     }
     else
        pageurl(localStorage.getItem("urlk"));

     //pageurl("page/pagedashboard/dashboard.php");
   }

   function pageurl(url){

    //if(url=='null')
//      pageurl("page/pagedashboard/dashboard.php");

    if(url=="")
      url = localStorage.getItem("urlk");

     $("#content").load(url);
     //$("#urlk").val(url);
     localStorage.setItem("urlk", url);
     window.reload();
   }

  document.addEventListener("contextmenu", function(e){
    e.preventDefault();
  }, false);
     $(document).bind("contextmenu",function(e){
        return false;
     });

</script>
</body>
</html>