<link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="bower_components/datatables/jquery.dataTables.css">
<link rel="stylesheet" href="bower_components/multiupload/css/uploadfile.css">
<script src="bower_components/datatables/jquery.dataTables.min.js"></script>
<script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="bower_components/select2/dist/js/select2.full.min.js"></script>
<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="bower_components/multiupload/js/jquery.uploadfile.min.js"></script>

<script type="text/javascript">
   $(this).load(function() {
     $("#loadery").fadeOut("slow");
   });

$(function () {
    reTable();
    $('#datepicker').datepicker({
      autoclose: true,
      format: 'dd/mm/yyyy'
    });
    $('.select2').select2({
      placeholder: 'Klasifikasi Naskah',
    });
    $('.select3').select2({
      placeholder: 'Folder Unit Kerja',
    });
    $('.select4').select2({
      placeholder: 'Unit Kerja',
    });
    $('.select5').select2({
      placeholder: 'Jenis Produk',
    });

    $("#forminput").hide();
    $("#formtable").show();
    $("#lblstatus").html("Status : Tambah Registrasi Metadata Dokumen Vital");
    $("#task").val("new");
    $("#id").val("0");
  });

function getsatuan(f){
  var satuan = f.split("#");
  var jumlah = $("#txt5").val();
  if(jumlah!="")
    $("#txt5").val("");

  $("#txt5").val(jumlah+" "+satuan[1]);
  $("#txt6").val(satuan[0]);
}

function format ( d ) {
    // `d` is the original data object for the row

    var shtml = $.ajax({
    type: "POST",
    url: "page/pageregvital/detail.php?id="+d,
    data: "request_type=generator",
    async: false
    }).responseText;

    return shtml;
}

function loadfile(r){
  var file = $("#fileselect").val();
  var ext = file.split(".");

  if(ext[1] == "pdf" )
     types = "application/pdf";
  if(ext[1]== "jpg")
     types = "application/jpg";
  var location = "Upload_Files/"+r+"/"+file;
  $( "#viewerpdf").attr('data',  location);
  $( "#viewerpdf").attr('type',  types);
}

function reTable(){
  var table = $('#mytbl').DataTable({
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      "aLengthMenu" : [[5,  50, 100], [5, 50, 100]],
      "pageLength"  : 5,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pageregdok/bantai.php',
      "columns": [
            {
                "className":      'details-control',
                "orderable":      true,
                "data":           null,
                "defaultContent": ''
            },
            { "aaData": "0" },
            { "aaData": "1" },
            { "aaData": "2" },
            { "aaData": "3" },
            { "aaData": "4" },
            { "aaData": "5" },
            { "aaData": "6" }
        ],
        "order": [[1, 'asc']]
    } );

   $('#mytbl tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row( tr );

        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( format(row.data()[0])).show();
            tr.addClass('shown');
        }
    } );
}


function getinfo(){
  $('#formdetail').show(1000);
}

$(function(e){
   $("#myfrm").on('submit',(function(e) {
        e.preventDefault();
       var urls = "<?php echo 'page/pageregdok/regdok_proses.php'; ?>";
       $.ajax({
        url: urls, // Url to which the request is send
        type: "POST",             // Type of request to be send, called as method
        data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
        contentType: false,       // The content type used when sending data to the server.
        cache: false,             // To unable request pages to be cached
        processData:false,        // To send DOMDocument or non processed data file it is set to false
        success: function(data)   // A function to be called if request succeeds
        {
          alert(data);
          switch(data){
            case "sukses" : toastr.success("Data Berhasil disimpan", "BERHASIL");
                            break;
            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                            break;
            case "found"  : toastr.warning("Ada data dengan nama yang sama", "PERHATIAN");
                            break;
          }
          //$("#close").click();
          //pageurl("page/pageregregdok/regdok.php");

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
    //$("#forminput").hide();
    //$("#formtable").show();
    //closeform();
    pageurl("page/pageregregdok/regdok.php");
   }


   function deldata(id){
    var tanya = confirm("Apakah metadata dokumen ini mau dihapus ?");
    if(tanya){
     var urls = "<?php echo 'page/pageregdok/regdok_proses.php'; ?>";
     $.ajax({
        url: urls, // Url to which the request is send
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
        pageurl("page/pageregdok/regdok.php");
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }


   function getload(id){
    //var AmbilData;

    $.ajax({
        url: "page/pageregdok/regdok_proses.php", // Url to which the request is send
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
          //alert(data);
          $("#forminput").show(1000);
          $("#formtable").hide(1000);
          $("#lblstatus").html("Status : Ubah Metadata Dokumen Vital");
          $("#txt1").val(data.items.Tgl);
          $("#txt2").val(data.items.Nomor);
          $("#txt3").val(data.items.RoleId).change();
          $("#txt3a").val(data.items.RoleId).change();
          $("#txt3").prop('disabled', true);
          $("#txt4").val(data.items.JProdukId).change();
          $("#txt5").val(data.items.KatProdukId).change();
          $("#txt6").val(data.items.Tahun).change();
          $("#txt7").val(data.items.Uraian).change();
          $("#txt8").val(data.items.Jumlah).change();
          $("#txt9").val(data.items.SatuanId).change();
          $("#txt10").val(data.items.BerkasId).change();
          $("#txt11").val(data.items.TpId).change();
          $("#txt12").val(data.items.AksesPublik).change();
          $("#txt13").val(data.items.MediaId).change();
          $("#txt14").val(data.items.Tesaurus).change();
          $("#txt15").val(data.items.Ket).change();
          $("#id").val(data.items.MetaId);
          $("#task").val('edit');
          //$("#myfiles").val('edit');

          loadfiles();
          $("#txt1").focus();

        }
     });
   }

function delfile(id){
  $.ajax({
        url: "page/pageregdok/regdok_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=delfile&id="+id,
        success: function(msg){

           if(msg=="sukses")
             loadfiles();
           else
             return false;

        }
  });
}

function loadfiles(){
  var id = $("#id").val();
  $("#myfiles").val("");
      $.ajax({
        url: "page/pageregdok/regdok_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=loadfile&id="+id,
        success: function(msg){
         if(msg==""){
           $("#sizefile").val('');
           $("#filebox").hide();
         }else {
           $("#filebox").show();
           $('#olfiles').html(msg);
           $("#sizefile").val(msg);
         }
        }
      });
}



function getupload(){
   var files = document.getElementById("myfiles").files;
   var extfile = ['jpg','jpeg','pdf','bmp','gif','png','txt','cdr'];
   var no = 1;
   var totsize = 0;
    for (var i = 0; i < files.length; i++)
    {
       var g = 0;
       ext = files[i].name.split('.');
       for(f=0;f < extfile.length;f++){
         if(ext[1] == extfile[f])
           g++;
       }

       if(g==0){
           toastr.error("Jenis extension file "+ files[i].name +" tidak ijinkan", "Kesalahan");
           moveupload();
           return false;
       }

       totsize = totsize + (files[i].size);

       $("#filebox").show();
       $("#olfiles").append("<tr class='bg-warning'><td align='right'>"+no+".</td><td>"+files[i].name+"</td><td>"+humanFileSize(files[i].size,true)+"</td></tr>");
       no++;
    }

    $("#olfiles").append("<tr class='bg-info'><td colspan=2 align='right'><b>Total File :</b> </td><td><strong>"+humanFileSize(totsize,true)+"</strong><button type='button' id='btn_cancel' onclick='loadfiles();' style='display: none' class='btn btn-xs btn-info pull-right'>Batal</button></td></tr>");

    if(totsize > 2048000) {
        toastr.error('Total Ukuran File melebihi 2 MB!','KESALAHAN');
        moveupload();
        return false;
    }
    $("#btn_cancel").show();

}

function humanFileSize(bytes, si) {
    var thresh = si ? 1000 : 1024;
    if(Math.abs(bytes) < thresh) {
        return bytes + ' B';
    }
    var units = si
        ? ['KB','MB','GB','TB','PB','EB','ZB','YB']
        : ['KiB','MiB','GiB','TiB','PiB','EiB','ZiB','YiB'];
    var u = -1;
    do {
        bytes /= thresh;
        ++u;
    } while(Math.abs(bytes) >= thresh && u < units.length - 1);
    return bytes.toFixed(1)+' '+units[u];
}




function moveupload(){
 var task = $("#task").val();
 var cekfile = $("#sizefile").val();
 if(task=='edit' && cekfile !=0){
    var tanya = confirm("Apakah File Upload dokumen ini mau diganti ?, klik cancel untuk tambah file, klik ok untuk ganti file");
        if(tanya){
            $("#myfiles").val("");
            $("#olfiles").empty();
            $("#filebox").hide();
        } else {
            return false
        }
 } else {   $("#myfiles").val("");
            $("#olfiles").empty();
            $("#filebox").hide();
 }
}

</script>