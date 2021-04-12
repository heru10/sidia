<link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.js"></script>
<script type="text/javascript">

$(function () {
    reTable();
    $("#forminput").hide();
    $("#formtable").show();
    $("#lblstatus").html("Status : Tambah Tingkat Perkembangan");
    $("#task").val("new");
    $("#id").val("0");
  });

function reTable(){
  var table = $('#mytbl').DataTable({
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      "aLengthMenu" : [[5,  50, 100], [5, 50, 100]],
      "pageLength"  : 5,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pagetperkembangan/bantai.php'
    });
}

$(function(e){
   $("#myfrm").on('submit',(function(e) {
        e.preventDefault();

       $.ajax({
        url: "page/pagetperkembangan/tperkembangan_proses.php", // Url to which the request is send
        type: "POST",             // Type of request to be send, called as method
        data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
        contentType: false,       // The content type used when sending data to the server.
        cache: false,             // To unable request pages to be cached
        processData:false,        // To send DOMDocument or non processed data file it is set to false
        success: function(data)   // A function to be called if request succeeds
        {
          //alert(data);
          switch(data){
            case "sukses" : toastr.success("Data Berhasil disimpan", "BERHASIL");
                            break;
            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                            break;
            case "found"  : toastr.warning("Ada data dengan nama yang sama", "PERHATIAN");
                            break;
          }
          //$("#close").click();
          pageurl("page/pagetperkembangan/tperkembangan.php");

        }
       });
   }));
})

   function closeform(){
    $("#forminput").hide(1000);
    $("#formtable").show(1000);
   }

   function closetable(){
    $("#forminput").show(1000);
    $("#formtable").hide(1000);
   }


   function getdata(){
    closetable();
    $("#txt1").val('');
    $("#txt1").focus();

   }

   function closed(){
    pageurl("page/pagetperkembangan/tperkembangan.php");
   }


   function deldata(id){
    var tanya = confirm("Apakah Tingkat Perkembangan ini mau dihapus ?");
    if(tanya){
     $.ajax({
        url: "page/pagetperkembangan/tperkembangan_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=del&id="+id,
        async: true,
        success: function(data){
        switch(data){
            case "sukses" : toastr.success("Data Berhasil dihapus", "BERHASIL");
                            break;
            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                            break;
            case "found"  : toastr.warning("Ada Unit Kerja dibawahnya", "PERHATIAN");
                            break;
          }
        pageurl("page/pagetperkembangan/tperkembangan.php");
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }


   function getload(id){
    //var AmbilData;
    $.ajax({
        url: "page/pagetperkembangan/tperkembangan_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=load&id="+id,
        async: true,
				beforeSend: function(x) {
					if(x && x.overrideMimeType) {
      					 x.overrideMimeType("application/j-son;charset=UTF-8");
      				}
				},
		dataType : 'json',
        success: function(data){
          closetable();
          $("#lblstatus").html("Status : Ubah Tingkat Perkembangan");
          $("#txt1").val(data.items.TPName);
          $("#task").val('edit');
          $("#id").val(data.items.TPId);
          $("#txt1").focus();
        }
     });

   }
</script>