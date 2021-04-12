<link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.js"></script>
<script type="text/javascript">

$(function () {
    reTable();
    $("#forminput").hide();
    $("#formtable").show();
    $("#lblstatus").html("Status : Tambah Group Jabatan");
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
      'ajax'        : 'page/pagegroup/bantai.php'
    });
}

$(function(e){
   $("#myfrm").on('submit',(function(e) {
        e.preventDefault();

       $.ajax({
        url: "page/pagegroup/group_proses.php", // Url to which the request is send
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
          pageurl("page/pagegroup/group.php");

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
    pageurl("page/pagegroup/group.php");
   }


   function deldata(id){
    var tanya = confirm("Apakah Group Jabatan ini mau dihapus ?");
    if(tanya){
     $.ajax({
        url: "page/pagegroup/group_proses.php", // Url to which the request is send
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
            case "xfound" : toastr.warning("Group jabatan tidak bisa dihapus, karena data sedang digunakan !!", "PERHATIAN");
                            break;
          }
          pageurl("page/pagegroup/group.php");
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }


   function getload(id){
    //var AmbilData;
    $.ajax({
        url: "page/pagegroup/group_proses.php", // Url to which the request is send
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
          $("#lblstatus").html("Status : Ubah Data Media Arsip");
          $("#txt1").val(data.items.GroupName);
          $("#task").val('edit');
          $("#id").val(data.items.GroupId);
          $("#txt1").focus();
        }
     });

   }
</script>