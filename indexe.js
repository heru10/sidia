

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
          switch(data){
            case "sukses"  : toastr.success("Login Berhasil", "BERHASIL");
                             location.href = 'index2.php';
                             break;
            case "error"   : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                             break;
            case "noakses" : toastr.warning("Login gagal, Nama Pengguha dan Kata Kunci Salah", "PERHATIAN");
                             location.href = 'index.php';
                             break;
          }
          //$("#close").click();

        }
       });
   }));
})

     $(document).bind("contextmenu",function(e){
        return false;
     });


//$("#mylogin").submit(function(e) {
//    alert(data);
//    e.preventDefault();
//       var urls = "<?php echo 'page/pagelogin/login_proses.php'; ?>";
//       $.ajax({
//        url: urls, // Url to which the request is send
//        type: "POST",             // Type of request to be send, called as method
//        data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
//        contentType: false,       // The content type used when sending data to the server.
//        cache: false,             // To unable request pages to be cached
//        processData:false,        // To send DOMDocument or non processed data file it is set to false
//        success: function(data)   // A function to be called if request succeeds
//        {
//
//          switch(data){
//            case "sukses" : toastr.success("Login berhasil", "BERHASIL");
//                            break;
//            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
//                            break;
//            case "noakses"  : toastr.warning("Pengguna dan Kata kunci tidak ditemukan", "PERHATIAN");
//                            break;
//          }
//          //$("#close").click();
//          //pageurl("page/pageregarsip_v2/regarsip.php?id="+id);
//
//        }
//       });
//  })

//function ubah_passwd(){
//  var old = $("#passwd_old").val();
//  var news = $("#passwd_new").val();
//
//   $.ajax({
//        url: "page/pagelogin/ubahpasswd.php?old="+old+"&news="+news, // Url to which the request is send
//        type: "POST",
//        success: function(msg){
//          //alert(msg);
//          switch(msg){
//            case "sukses"   : toastr.success("Ubah Kata Kunci Berhasil", "BERHASIL");
//                              location.href = "index2.php";
//                              break;
//            case "error"    : toastr.error("Terjadi kesalahan koneksi database", "KESALAHAN");
//                              break;
//            case "nosukses"  : toastr.warning("Ubah Kata Kunci Gagal", "PERINGATAN");
//                              break;
//          }
//           $("#passwd_old").val("");
//           $("#passwd_new").val("");
//           return false;
//          //location.href = "index2.php";
//        }
//   })
//}