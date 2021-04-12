<link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.js"></script>
<script type="text/javascript">

$(function () {
    reTable();
    $("#forminput").hide();
    $("#formtable").show();
    $("#lblstatus").html("Status : Tambah Kategori Produk");
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
      'ajax'        : 'page/pagekatproduk/bantai.php'
    });
}

$(function(e){
   $("#myfrm").on('submit',(function(e) {
        e.preventDefault();

       $.ajax({
        url: "page/pagekatproduk/katproduk_proses.php", // Url to which the request is send
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
          pageurl("page/pagekatproduk/katproduk.php");

        }
       });
   }));
})

//   $("#txt1").ready(function(){
//      $.ajax({
//        url      : 'page/pageklasifikasi/listklasifikasi.php',
//        type     : 'post',
//        dataType : 'json',
//        success  : function(data){
//            $.each(data.items,function(ClId, ClCode, ClParentId, ClName)
//            {
//               $("#txt1").append('<option value=' + ClId + '>' + ClCode + '</option>');
//            });
//        }
//      })
//   })




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
    pageurl("page/pagekatproduk/katproduk.php");
   }


   function deldata(id){
    var tanya = confirm("Apakah Kategori Produk ini mau dihapus ?");
    if(tanya){
     $.ajax({
        url: "page/pagekatproduk/katproduk_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=del&id="+id,
        async: true,
        success: function(data){
        //alert(data);
        switch(data){
            case "sukses" : toastr.success("Data Berhasil dihapus", "BERHASIL");
                            break;
            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                            break;
            case "nodel"  : toastr.warning("Kategori Produk tidak bisa dihapus, karena kategori produk sudah di gunakan unit kerja !!", "PERHATIAN");
                            break;
          }
        pageurl("page/pagekatproduk/katproduk.php");
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }


   function getload(id){
    //var AmbilData;
    $.ajax({
        url: "page/pagekatproduk/katproduk_proses.php", // Url to which the request is send
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

          $("#forminput").show();
          $("#formtable").hide();
          $("#lblstatus").html("Status : Ubah Kategori Dokumen Produk");
          $("#txt1").val(data.items.KatProdukName);
          //alert(data.items.StatusAct);
          if(data.items.StatusAct==1)
            $("#txt2").prop('checked',true);
          else
            $("#txt2").prop('checked',false);

          $("#task").val('edit');
          $("#id").val(data.items.KatProdukId);
          $("#txt1").focus();
        }
     });

   }
</script>