<?php
  session_start();
  session_destroy();
  include_once('browser.php');

  $up = browser();
  if($up != 'Mozilla Firefox'){
    die('<script>alert("Aplikasi ini hanya support browser Mozilla Firefox")</script>');
  }
  
  error_reporting(E_ALL ^ (E_NOTICE | E_WARNING)); 
?>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Sistem Informasi Digital Arsip</title>
  <link href="dist/img/peruri2_8js_icon.ico" rel="shortcut icon">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">
  <link rel="stylesheet" href="bower_components/toastr/toastr.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<script>
  localStorage.removeItem('urlk');
</script>
<body class="hold-transition" background="dist/img/bg.jpg" style="height: 100%;background-position: center;background-size: cover;">
<div class="login-box">
 <div class="box box-primary">
  <div class="login-logo"><br />
    <img src="images/logo/logo.png" width="25%" />
    <h4>Sistem Informasi Digital Arsip<br />(SIDIA)</h4>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <form role="form" name="myfrm" id="myfrm" method="post" enctype="multipart/form-data">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Nama Pengguna" name="username" id="username" required>
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Kata Kunci" id = "password" name="password" required>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Masuk</button>
        </div>
        <!-- /.col -->
      </div>

    </form>
    <!-- /.social-auth-links -->
  </div>
  <!-- /.login-box-body -->
  <div class="box-footer bg-yellow">
   <!-- 7648 | Tri Wibowo, 01 04 2019, ganti alamat permintaan sesper
    <center><small><b>Perum. Percetakan Uang RI</b><br />
      Parung Mulya, Parungmulya, Ciampel, Parungmulya, Ciampel, Kabupaten Karawang, Jawa Barat 41361
    </small>
    </center><br />
	-->
	<center><small><b>Kantor Pusat: </b><br />
		Jl. Palatehan No. 4, Blok K-V, 
		Kebayoran Baru, Jakarta 12160
	 </small>
	</center><br />
		
	<center><small><b>Kawasan Produksi: </b><br />
		Desa Parung Mulya, Kecamatan Ciampel, Karawang, Jawa Barat 41361
		Support Browser : Mozilla Firefox
		</small>
	</center><br />
    Support Browser : Mozilla Firefox
  </div>
</div>
</div>

<!-- /.login-box -->

<!-- jQuery 3 -->

<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="bower_components/jquery/dist/jquery.js"></script>
<script src="build/toastr/toastr.min.js"></script>
<script src="build/toastr/toastr.init.js"></script>
<script>
 $(function(e){

   $("#myfrm").on('submit',(function(e) {
    e.preventDefault();
       $.ajax({
        url: "page/pagelogin/login_proses.php", // Url to which the request is send
        type: "POST",             // Type of request to be send, called as method
        data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
        contentType: false,       // The content type used when sending data to the server.
        cache: false,             // To unable request pages to be cached
        processData:false,        // To send DOMDocument or non processed data file it is set to false
        success: function(data)   // A function to be called if request succeeds
        {
          //alert(data);
          switch(data){
            case "sukses"  : toastr.success("Login Berhasil", "BERHASIL");
                             location.href = 'index2.php';
                             break;
            case "error"   : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                             break;
            case "noakses" : toastr.error("Login gagal, Nama Pengguna dan Kata Kunci tidak ditemukan", "PERHATIAN");
                             $("#username").val('');
                             $("#password").val('');
                             return false;
                             break;
          }

        }
       });
   }));
})
</script>
<!-- iCheck -->
</body>
</html>
