<link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.js"></script>
<script src="bower_components/select2/dist/js/select2.full.min.js"></script>

<script type="text/javascript">

$(function () {
    reTable();
    $("#forminput").hide();
    $("#formtable").show();
    $("#lblstatus").html("Status : Tambah Kode Pekerjaan");
    $('#txt4').select2({placeholder: 'Detail Produk'});
    $("#task").val("new");
    $("#id").val("0");
  });

function reTable(){
  var table = $('#mytbl').DataTable({
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
      "pageLength"  : 10,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pagekodekerja/bantai.php'
    });
}

$(function(e){
   $("#myfrm").on('submit',(function(e) {
        e.preventDefault();

       $.ajax({
        url: "page/pagekodekerja/kodekerja_proses.php", // Url to which the request is send
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
                            pageurl("page/pagekodekerja/kodekerja.php");
                            break;
            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                            break;
            case "found"  : toastr.warning("Ada kode/data pekerjaan dengan nama yang sama", "PERHATIAN");
                            return false;
                            break;
          }
          //$("#close").click();


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
    $("#txt3").val('');
    $("#txt3").focus();
   }

   function closed(){
    //$("#forminput").hide();
    //$("#formtable").show();
    //closeform();
    pageurl("page/pagekodekerja/kodekerja.php");
   }


   function deldata(id){
    var tanya = confirm("Apakah Data Pekerjaan ini mau dihapus ?");
    if(tanya){
     $.ajax({
        url: "page/pagekodekerja/kodekerja_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=del&id="+id,
        async: true,
        success: function(data){
        switch(data){
            case "sukses" : toastr.success("Data Berhasil dihapus", "BERHASIL");
                            break;
            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                            break;
            case "found"  : toastr.warning("Kode Pekerjaan tidak berhasil dihapus", "PERHATIAN");
                            break;
          }
        pageurl("page/pagekodekerja/kodekerja.php");
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }


   function getload(id){
    //var AmbilData;

    $.ajax({
        url: "page/pagekodekerja/kodekerja_proses.php", // Url to which the request is send
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
          $("#forminput").show(1000);
          $("#formtable").hide(1000);
          $("#lblstatus").html("Status : Ubah Detail Produk");
          $("#txt1").val(data.items.Kode);
          $("#txt2").val(data.items.Uraian);
          $("#txt4").val(data.items.DetailProdukId).change();

          $("#txt3").prop('checked',false);
          if(data.items.StatusAct == 1)
             $("#txt3").prop('checked',true);

          $("#task").val('edit');
          $("#id").val(data.items.KodeId);
          $("#txt1").focus();
        }
     });
   }

</script>