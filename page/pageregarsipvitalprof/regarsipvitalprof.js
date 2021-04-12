<script src="bower_components/select2/dist/js/select2.full.min.js"></script>
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.js"></script>

<script type="text/javascript">
   $(this).load(function() {
     $("#loadery").fadeOut("slow");

   });

function load_txt1(idjp){
   var id = $("#txt1").val();
    $.ajax({
      url  : 'page/pageregarsipvitalprof/regarsipvitalprof_proses.php',
      data : 'task=loadjp&id='+id+'&idjp='+idjp,
      type : 'post',
      success: function(jp){
        $("#txt2").html(jp);
      }
    })
};

function load_txt2(t,idkp,idjp,iddp){
 if(t != 'load'){
    var idkp = $("#txt1").val();
    var idjp = $("#txt2").val();
 }
    $.ajax({
      url  : 'page/pageregarsipvitalprof/regarsipvitalprof_proses.php',
      data : 'task=loaddp&idjp='+idjp+'&idkp='+idkp+'&iddp='+iddp,
      type : 'post',
      success: function(dp){
        $("#txt3").html(dp);
      }
    })
}

$(function () {
    var dis_uk = "<?php echo $_SESSION['PeopleTipe'] ?>";
    
    $("#txt5").prop('disabled', false);
    if(dis_uk > 1){
    $("#txt5").val("<?php echo $_SESSION['RoleId']; ?>").change();
    $("#txt5").prop('disabled', true);
    }


    reTable();
    $('#datepicker').datepicker({
      autoclose: true,
      format: 'dd/mm/yyyy'
    });

    $('#txt1').select2();
    $('#txt2').select2();
    $('#txt3').select2();
    $('#txt7').select2({placeholder: 'Pekerja'});
    $('#txt5').select2({placeholder: 'Pilih Unit Kerja'});
    $('#txt4').select2({
      placeholder: 'Klasifikasi Naskah'
    });

    $("#forminput").hide();
    $("#formtable").show();
    $("#lblstatus").html("Status : Tambah Registrasi Metadata Dokumen Vital");
    $("#task").val("new");
    $("#id").val("0");
  });

//function getsatuan(f){
//  var satuan = f.split("#");
//  var jumlah = $("#txt5").val();
//  if(jumlah!="")
//    $("#txt5").val("");
//
//  $("#txt5").val(jumlah+" "+satuan[1]);
//  $("#txt6").val(satuan[0]);
//}

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
  var exts = ext[1].toLowerCase();

  if(exts == "pdf" )
     types = "application/pdf";
  if(exts== "jpg" || exts == "jpeg")
     types = "application/jpg";
  var location = "Upload_Files/"+r+"/"+file;
  $( "#viewerpdf").attr('data',  location);
  $( "#viewerpdf").attr('type',  types);
}

$("#txt3").change(function(){
    var dproduk = $("#txt3").val();
    var urls = "<?php echo 'page/pageregarsipvitalprof/regarsipvitalprof_proses.php'; ?>";
    $.ajax({
        url: urls, // Url to which the request is send
        type: "POST",
        data: "task=kerja&id="+dproduk,
        success: function(data){
           $("#txt7").html(data);
        }
    });
})


function reTable(){
  var table = $('#mytbl').DataTable({
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
      "pageLength"  : 10,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pageregarsipvitalprof/bantai.php',
      'oLanguage': {
				"sSearch": "Pencarian :",
		}
    });


   //var table = $('#mytbl').DataTable();

    // Apply the search
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


function getinfo(){
  $('#formdetail').show(1000);
}

function detail_vital(id){
  pageurl('page/pageregdetailvitalproof/regdetailvitalproof.php?ids='+id);
}

$(function(e){
   $("#myfrm").on('submit',(function(e) {
        e.preventDefault();
       var urls = "<?php echo 'page/pageregarsipvitalprof/regarsipvitalprof_proses.php'; ?>";
       $.ajax({
        url: urls, // Url to which the request is send
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
          pageurl("page/pageregarsipvitalprof/regarsipvitalprof.php");
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
    pageurl("page/pageregarsipvitalprof/regarsipvitalprof.php");
   }


   function deldata(id){
    var tanya = confirm("Apakah metadata dokumen ini mau dihapus ?");
    if(tanya){
     var urls = "<?php echo 'page/pageregarsipvitalprof/regarsipvitalprof_proses.php'; ?>";
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
        pageurl("page/pageregarsipvitalprof/regarsipvitalprof.php");
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }


   function getload(id){
    $.ajax({
        url: "page/pageregarsipvitalprof/regarsipvitalprof_proses.php", // Url to which the request is send
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

          $("#codereg").val(data.items.KodeReg);
          $('#txt1').val(data.items.KatProdukId).change();
          load_txt1(data.items.JProdukId);
          load_txt2('load',data.items.KatProdukId,data.items.JProdukId,data.items.DetailProdukId);
          $("#txt4").val(data.items.ClId).change();

          var dis_uk = "<?php echo $_SESSION['PeopleTipe'] ?>";

          $("#txt5").prop('disabled', false);
          $("#txt5").val(data.items.RoleId).change();
          $("#txt5a").val(data.items.RoleId).change();
          if(dis_uk == 3)
            $("#txt5").prop('disabled', true);

          $("#txt6").val(data.items.Uraian).change();
          $("#txt7").val(data.items.KodeId).change();
          $("#txt8").val(data.items.Tahun).change();
          $("#txt9").val(data.items.TPId).change();
          $("#txt10").val(data.items.MediaId).change();
          $("#txt11").val(data.items.KondisiId).change();
          $("#txt12").val(data.items.Jumlah).change();
          $("#txt13").val(data.items.SatuanId).change();
          $("#txt14").val(data.items.Gedung).change();
          $("#txt15").val(data.items.Lemari).change();
          $("#txt16").val(data.items.Baris).change();
          $("#txt17").val(data.items.Boks).change();
          $("#id").val(data.items.RegVitalId);
          $("#task").val('edit');
          $("#txt1").focus();
          $("#forminput").show(1000);
          $("#formtable").hide(1000);
        }
     });
   }

function delfile(id){
  $.ajax({
        url: "page/pageregarsipvitalprof/regarsipvitalprof_proses.php", // Url to which the request is send
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
        url: "page/pageregarsipvitalprof/regarsipvitalprof_proses.php", // Url to which the request is send
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

    if(totsize > 100000000) {
        toastr.error('Total Ukuran File melebihi 100 MB!','KESALAHAN');
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

//$('#txt4').change(function(){
//  alert();
//})

</script>