<script src="bower_components/select2/dist/js/select2.full.min.js"></script>
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.js"></script>
<script type="text/javascript">
var tables;

$(function () {
    //reTable();
    $("#lblstatus").html("Status : Tambah Data Unit Kerja");
    $('.select2').select2({
      placeholder: 'Unit Kerja Induk',
    });

  var tables = $('#mytbl').DataTable({
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
      "pageLength"  : 10,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pageunitkerja/bantai.php'
    } );
    tables.columns().every( function () {
        var that = this;
              //$( 'input', this.footer() ).on( 'keyup change', function () {
              $( 'input', this.footer()).on( 'keyup change', function () {

                  if ( that.search() !== this.value ) {
                      that
                          .search( this.value )
                          .draw();
                  }
              } );
    } );
  closeform();

});

$(function(e){
   $("#myfrm").on('submit',(function(e) {
        e.preventDefault();

       $.ajax({
        url: "page/pageunitkerja/unitkerja_proses.php", // Url to which the request is send
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
            case "errdir" : toastr.warning("Direktori Unit Kerja tidak dapat di buat", "PERHATIAN");
                            break;
          }
          //$("#close").click();
          pageurl("page/pageunitkerja/unitkerja.php");
        }
       });
   }));
})
   function getdata(){
    closetable();
    $("#txt1").val('');
    $("#txt2").val('');
    $("#txt3").val("");
    $("#txt4").val('');
   }

   function closed(){
    pageurl("page/pageunitkerja/unitkerja.php");
   }

   function closeform(){
    $("#forminput").hide(1000);
    $("#formtable").show(1000);
    $("#txt1").val('');
    $("#txt2").val('');
    $("#txt3").val('');
    $("#txt4").val('');
   }

   function closetable(){
    $("#forminput").show(1000);
    $("#formtable").hide(1000);
    $("#txt1").val('');
    $("#txt2").val('');
    $("#txt3").val('');
    $("#txt4").val('');
   }

   function deldata(id){
    var tanya = confirm("Apakah unit kerja ini mau dihapus ?");
    if(tanya){
     $.ajax({
        url: "page/pageunitkerja/unitkerja_proses.php", // Url to which the request is send
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
            case "found"  : toastr.warning("Data Unit Kerja tidak bisa dihapus, karena ada unit kerja dibawahnya !!", "PERHATIAN");
                            break;
          }
         pageurl("page/pageunitkerja/unitkerja.php");
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }


   function getload(id){
    var AmbilData;
    $.ajax({
        url: "page/pageunitkerja/unitkerja_proses.php", // Url to which the request is send
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
          $("#lblstatus").html("Status : Ubah Data Unit Kerja");
          $("#txt1A").val(data.items.KodeUnit);
          //$("#txt1A").attr('disabled','disabled');
          $("#txt2").val(data.items.RoleName);
          $("#txt3").val(data.items.GroupId);
          $("#txt4").val(data.items.Deskripsi);
          $('.select2').val(data.items.RoleParentId).trigger('change.select2');
          $("#task").val('edit');
          $("#id").val(data.items.RoleId);
        }
     });

   }
</script>