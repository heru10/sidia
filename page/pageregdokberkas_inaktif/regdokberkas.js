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


$("#txt1").change(function(){
   var e = document.getElementById("txt1").selectedIndex - 1;
   var aktif = $("#retensi").val();
   aktif_arry = aktif.split("|");
   $("#txt2").val(aktif_arry[e]);
   $("#vretensi").hide();
   var d = "<?php echo date('d/m/Y'); ?>";
   var daktif = d.split("/");
   var tgl = daktif[0]+"/"+daktif[1]+"/"+(parseInt(daktif[2])+parseInt(aktif_arry[e]));
   //$('#datepicker').datepicker("setDate" , tgl);
})


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

    $("#forminput").hide();
    $("#formtable").show();
    $("#lblstatus").html("Status : Tambah Berkas Inaktif");
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
    url: "page/pageregdokberkas_inaktif/detail.php?id="+d,
    data: "request_type=generator",
    async: false
    }).responseText;

    return shtml;
}

function reTable(){
  var table = $('#mytbl').DataTable({
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
      "pageLength"  : 10,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pageregdokberkas_inaktif/bantai.php',
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
            { "aaData": "6" },
            { "aaData": "7" }
        ],
        "order": [[1, 'asc']]
    } );
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
       var urls = "<?php echo 'page/pageregdokberkas_inaktif/regdokberkas_proses.php'; ?>";
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
          pageurl("page/pageregdokberkas_inaktif/regdokberkas.php");
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
    pageurl("page/pageregdokberkas_inaktif/regdokberkas.php");
   }


   function deldata(id){
    var tanya = confirm("Apakah metadata dokumen ini mau dihapus ?");
    if(tanya){
     var urls = "<?php echo 'page/pageregdokberkas_inaktif/regdokberkas_proses.php'; ?>";
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
            case "found"  : toastr.warning("Ada Dokumen didalam berkas ini !!", "PERHATIAN");
                            break;
          }
        pageurl("page/pageregdokberkas_inaktif/regdokberkas.php");
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }


   function getload(id){
    //var AmbilData;

    $.ajax({
        url: "page/pageregdokberkas_inaktif/regdokberkas_proses.php", // Url to which the request is send
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
          $("#lblstatus").html("Status : Ubah Berkas");
          $("#lblcodreg").html("Nomor Reg. "+data.items.KodeReg);
          $("#codereg").html(data.items.KodeReg);
          $("#txtnomor").val(data.items.Nomor).change();
          $("#txt1").val(data.items.ClId).change();
          $("#txt3").val(data.items.RetensiInAktif).change();
          $("#txt4").val(data.items.RoleId).change();
          $("#txt5").val(data.items.Uraian).change();
          $("#txt6").val(data.items.KurunWaktu).change();
          $("#txt7").val(data.items.Jumlah).change();
          $("#txt8").val(data.items.TPId).change();
          $("#txt9").val(data.items.MediaId).change();
          $("#txt10").val(data.items.KondisId).change();
          $("#txt11").val(data.items.Keterangan).change();
          $("#txt12").val(data.items.Gedung).change();
          $("#txt13").val(data.items.Lemari).change();
          $("#txt14").val(data.items.Baris).change();
          $("#txt15").val(data.items.Boks).change();
          $("#id").val(data.items.BerkasId);
          $("#task").val('edit');
          $("#txt5").focus();

        }
     });
   }

function delfile(id){
  $.ajax({
        url: "page/pageregdokberkas_inaktif/regdok_proses.php", // Url to which the request is send
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
        url: "page/pageregdokberkas_inaktif/regdok_proses.php", // Url to which the request is send
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

function detail_berkas(id){
  //alert(id);
  pageurl("page/pageregarsip_inaktif/regarsip.php?id="+id);
}


//function moveupload(){
// var task = $("#task").val();
// var cekfile = $("#sizefile").val();
// if(task=='edit' && cekfile !=0){
//    var tanya = confirm("Apakah File Upload dokumen ini mau diganti ?, klik cancel untuk tambah file, klik ok untuk ganti file");
//        if(tanya){
//            $("#myfiles").val("");
//            $("#olfiles").empty();
//            $("#filebox").hide();
//        } else {
//            return false
//        }
// } else {   $("#myfiles").val("");
//            $("#olfiles").empty();
//            $("#filebox").hide();
// }
//}

</script>