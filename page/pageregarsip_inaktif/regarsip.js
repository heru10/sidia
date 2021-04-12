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
$(function () {
    reTable();
    $('#datepicker').datepicker({
      autoclose: true,
      format: 'dd/mm/yyyy'
    });
    $('.select2').select2({
      placeholder: 'Klasifikasi Dokumen',
    });
    $('.select3').select2({
      placeholder: 'Jenis Dokumen',
    });
    $('.select4').select2({
      placeholder: 'Berkas',
    });

    $("#forminput").hide();
    $("#formtable").show();
    $("#lblstatus").html("Status : Tambah Registrasi Metadata Dokumen");
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
    url: "page/pageregarsip/detail.php?id="+d,
    data: "request_type=generator",
    async: false
    }).responseText;

    return shtml;
}

function view_file(id){
  var ids = $("#idx").val();
  pageurl("page/pageregarsip_inaktif/test_img.php?pfile="+id+"&ids="+ids);
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

function reTable(){
  id = $("#idx").val();
  var table = $('#mytbl').DataTable({
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
      "pageLength"  : 10,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pageregarsip/bantai.php?idx='+id,
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
   id = $("#idx").val();
   $("#myfrm").on('submit',(function(e) {
        e.preventDefault();
       var urls = "<?php echo 'page/pageregarsip_inaktif/regarsip_proses.php'; ?>";
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
          $("#btn_save").attr("disabled","disabled");
          switch(data){
            case "sukses" : toastr.success("Data Berhasil disimpan", "BERHASIL");
                            break;
            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                            break;
            case "found"  : toastr.warning("Ada data dengan nama yang sama", "PERHATIAN");
                            break;
          }
          //$("#close").click();

          pageurl("page/pageregarsip_inaktif/regarsip.php?id="+id);

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
    id = $("#idx").val();
    pageurl("page/pageregarsip_inaktif/regarsip.php?id="+id);
   }

   function backpage(){
     pageurl("page/pageregdokberkas_inaktif/regdokberkas.php");
   }

   function deldata(id){
    idx = $("#idx").val();
    var tanya = confirm("Apakah dokumen ini mau dihapus ?");
    if(tanya){
     var urls = "<?php echo 'page/pageregarsip_inaktif/regarsip_proses.php'; ?>";
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
        pageurl("page/pageregarsip_inaktif/regarsip.php?id="+idx);
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }


   function getload(id){
    //var AmbilData;
    //alert(id);
    $.ajax({
        url: "page/pageregarsip_inaktif/regarsip_proses.php", // Url to which the request is send
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
          $("#lblstatus").html("Status : Ubah Detail Dokumen");
          $("#txt1").val(data.items['meta'][0].ClId).change();
          $("#txt2").val(data.items['meta'][0].JenisId).change();
          $("#tblberkas").show();
          $("#berkas").val(data.items['meta'][0].BerkasId).change();
          var tt = data.items['meta'][0].Tgl_Dok.split("-");
          tgl = tt[2]+"/"+tt[1]+"/"+tt[0];
          $("#datepicker").val(tgl).change();
          $("#txt4").val(data.items['meta'][0].Nomor_Dok).change();
          $("#txt5").val(data.items['meta'][0].Uraian).change();
          $("#txt6").val(data.items['meta'][0].Jumlah).change();
          $("#txt7").val(data.items['meta'][0].SatuanId).change();
          $("#txt8").val(data.items['meta'][0].TPId).change();
          $("#txt9").val(data.items['meta'][0].MediaId).change();
          $("#txt10").val(data.items['meta'][0].KondisiId).change();
          $("#txt11").val(data.items['meta'][0].Keterangan).change();

          $("#task").val('edit');
          $("#id").val(data.items['meta'][0].DokumenId);
          $("#txt1").focus();
          $("#jmlfile").val('0');
          carryIMG = data.items['img'].length;
          totsize = 0;
          no = 1;
          $("#jmlfile").val(carryIMG);
          for(var i=0;i<carryIMG;i++){
            filer = data.items['img'][i].Filename.split("/");
            totsize = totsize + parseInt(data.items['img'][i].FileSize);
            $("#filebox").show();
            $("#olfiles").append("<tr class='bg-warning'><td align='right'>"+no+".</td><td>"+filer[3]+"</td><td align=right>"+humanFileSize(data.items['img'][i].FileSize,true)+"</td><td><button type='button' onclick=delfiles('"+data.items['img'][i].FilesId+"'); title='Hapus File' class='btn btn-danger btn-sm' id='btndelfile'><i class='fa fa-bitbucket' ></i></button></td></tr>");
            no++;
          }

        }
     });
   }

function delfiles(id){

   var tanya = confirm("Apakah File Upload dokumen ini dihapus ? ");
   if(tanya) {
    $.ajax({
        url: "page/pageregarsip_inaktif/regarsip_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=delfile&id="+id,
        success: function(msg){
             $("#olfiles").html("");
             $("#filebox").hide();
             getload($('#id').val());
        }
       });
   }
  }


function fileExists(url) {
  var filex = "Upload_Files/"+"<?php echo $_SESSION['CodeRole']; ?>/"+url;
    if(filex){
        var req = new XMLHttpRequest();
        req.open('GET', filex, false);
        req.send();
        return req.status==200;
    } else {
        return true;
    }
}

function getupload(){
   var files = document.getElementById("myfiles").files;
   var extfile = ['jpg','jpeg','pdf'];
   var no = $("#jmlfile").val();
   var totsize = 0;
    for (var i = 0; i < files.length; i++)
    {

       if(fileExists(files[i].name,'UT')){
         toastr.error("File "+ files[i].name +" ditemukan nama yang sama !!", "Kesalahan");
         batalupload()
         return false;
       }

       var g = 0;
       ext = files[i].name.split('.');
       for(f=0;f < extfile.length;f++){
         if(ext[1] == extfile[f])
           g++;
       }

       if(g==0){
           toastr.error("Jenis extension file "+ files[i].name +" tidak ijinkan", "Kesalahan");
           batalupload()
           return false;
       }

    if($("#task").val()=='new'){
       totsize = totsize + (files[i].size);
       $("#filebox").show();
       $("#olfiles").append("<tr class='bg-warning'><td align='right'>"+no+".</td><td>"+files[i].name+"</td><td>"+humanFileSize(files[i].size,true)+"</td></tr>");
       no++;

    } else {
       no++;
       $("#filebox").show();
       totsize = totsize + (files[i].size);
       $("#oxfiles").append("<tr class='bg-warning'><td align='right'>"+no+".</td><td>"+files[i].name+"</td><td>"+humanFileSize(files[i].size,true)+"</td><td><div class='label label-info label-xs'>Baru</div></td></tr>");
       $("#oxfiles").append("<tr class='bg-info'><td colspan=2 align='right'><b>Total File :</b> </td><td><strong>"+humanFileSize(totsize,true)+"</strong></td><td><div class='btn btn-warning btn-xs' onclick='batalupload()'> X Batal</div></td></tr>");
    }
   }

   if($("#task").val()=='new')
    $("#olfiles").append("<tr class='bg-info'><td colspan=2 align='right'><b>Total File :</b> </td><td><strong>"+humanFileSize(totsize,true)+"</strong></td></tr>");



    if(totsize > 25000000) {
        toastr.error('Total Ukuran File melebihi 25 MB!','KESALAHAN');
        batalupload();
        return false;
    }
}

function batalupload(){
  $("#oxfiles").html("");
  $("#myfiles").val("");
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





</script>