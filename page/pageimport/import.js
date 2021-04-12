<link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.js"></script>

<script type="text/javascript">
//$(function(){
//  reTable();
//
//})


$("#myfile").change(function(){
  var files = document.getElementById("myfile").files;
  var ext = files[0].name.split('.');

  if(ext[1]!='xls'){
    toastr.error("Jenis extension file "+ files[0].name +" tidak ijinkan", "Kesalahan");
    $("#myfile").val("");
    return false; 
  }
})

$(function(e){
   $("#myfrm").on('submit',(function(e) {
        e.preventDefault();
       $.ajax({
        url: "page/pageimport/import_proses.php", // Url to which the request is send
        type: "POST",             // Type of request to be send, called as method
        data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
        contentType: false,       // The content type used when sending data to the server.
        cache: false,             // To unable request pages to be cached
        processData:false,        // To send DOMDocument or non processed data file it is set to false
        success: function(data)   // A function to be called if request succeeds
        {
          //alert(data);
          switch(data){
            case "sukses" : toastr.success("Data Berhasil di import", "BERHASIL");
                            break;
            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                            break;
            case "found"  : toastr.warning("Ada data dengan nama yang sama", "PERHATIAN");
                            break;
          }
          //$("#close").click();
          pageurl("page/pageimport/import.php");
        }
       });
   }));
})


//function reTable(){
//  var tables = $('#mytbltmp').DataTable({
//      'ordering'    : true,
//      'info'        : true,
//      'autoWidth'   : false,
//      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
//      "pageLength"  : 10,
//      'PaginationType': "full_numbers",
//      'ajax'        : 'page/pageimport/bantai2.php',
//      'order'       : [[1, 'asc']]
//    } );
//
//}
</script>