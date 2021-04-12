<script src="bower_components/select2/dist/js/select2.full.min.js"></script>
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.js"></script>
<script type="text/javascript">

$(function () {
    reTable();
    closeform();
    $("#lblstatus").html("Status : Tambah Data Unit Kerja");
    $('.select2').select2({
      placeholder: 'Unit Kerja',
    });
  });


$("#txt2A").keyup(function(){
  var id = $('#txt2A').val();
  $.ajax({
        url: "page/pagepeople/people_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=loadpeg&id="+id,
        success: function(data){
           $('#txt2').val(data);
        }
  })
})

function reTable(){
  var table = $('#mytbl').DataTable({
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
      "pageLength"  : 10,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pagepeople/bantai.php',
      'oLanguage': {
				"sSearch": "Pencarian :",
		}
    });
        table.columns().every( function () {
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
}

$("#txt10").click(function(){
  if($('#txt10').is(':checked'))
     $("#txt10a").val("1");
  else
     $("#txt10a").val("0");
})

$(function(e){
   $("#myfrm").on('submit',(function(e) {
        e.preventDefault();
       $.ajax({
        url: "page/pagepeople/people_proses.php", // Url to which the request is send
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
          pageurl("page/pagepeople/people.php");

        }
       });
   }));
})

   function closeform(){
    $("#forminput").hide();
    $("#formtable").show();
   }
   function closetable(){
    $("#forminput").show();
    $("#formtable").hide();
   }

   function getdata(){
    closetable();
    $("#txt2").val('');
    $("#txt3").val('');
   }

   function closed(){
    pageurl("page/pagepeople/people.php");
   }


   function deldata(id){
    var tanya = confirm("Apakah Penguna ini mau dihapus ?");
    if(tanya){
     $.ajax({
        url: "page/pagepeople/people_proses.php", // Url to which the request is send
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
            case "found"  : toastr.warning("Pengguna ditemukan data yang sama !!", "PERHATIAN");
                            break;
            case "founds" : toastr.info("Pengguna tidak dapat dihapus, karena sudah digunakan dalam dokumen !!", "PERHATIAN");
                            break;
          }
         pageurl("page/pagepeople/people.php");
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }


   function getload(id){
    $.ajax({
        url: "page/pagepeople/people_proses.php", // Url to which the request is send
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
          $("#lblstatus").html("Status : Ubah Data Pengguna");
          $("#txt1").val(data.items.RoleId).change();
          $("#txt2A").val(data.items.NP);
          $("#tempnp").val(data.items.NP);
          $("#txt2").val(data.items.PeopleName);
          $("#tempname").val(data.items.PeopleName);
          $("#txt3").val(data.items.email);
          $('select2').val(data.items.RoleId_Atasan).trigger('change.select2');
          $("#txt4").val(data.items.PeopleTipe).change();

          $('#txt5').prop('checked', false);
          if(data.items.PeopleStatus==1)
          $('#txt5').prop('checked', true);

          $('#txt10').prop('checked', false);
          if(data.items.Approve==1){
            $('#txt10').prop('checked', true);
            $('#txt10a').val("1");
          }
          var arrs = data.items.Menu.split("#");
          for(i=0; i < arrs.length; i++){
             $("#"+arrs[i]).prop('checked', true);
          }
          $("#txt7").val(data.items.Pengguna);
          $("#txt8").val(data.items.Key1);
          $("#txt9").val(data.items.Key1);
          $("#task").val('edit');
          $("#id").val(data.items.PeopleId);
        }
     });

   }

   function akses(str){


   }
</script>