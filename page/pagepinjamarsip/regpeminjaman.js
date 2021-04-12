<link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="bower_components/datatables/jquery.dataTables.css">
<script src="bower_components/datatables/jquery.dataTables.min.js"></script>
<script src="bower_components/moment/min/moment.min.js"></script>
<script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="bower_components/select2/dist/js/select2.full.min.js"></script>

<script type="text/javascript">
$(function () {

    $('.select4').select2({
      placeholder: 'Unit Kerja',
    });
    $('.select3').select2({
      placeholder: 'Pilih Item Dokumen',
    });

    $('#reservation').daterangepicker({
        locale: {
          format: 'DD/MM/YYYY'
        },
    });

    $("#forminput").hide();
    $("#formtable").show();
    $("#lblstatus").html("Status : Registrasi Peminjaman Dokumen Fisik");
    $("#task").val("new");
    $("#id").val("0");
    reTable();
  });

$("#txt1").keyup(function(){
  var id = $('#txt1').val();
  $.ajax({
        url: "page/pagepeople/people_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=loadpeg&id="+id,
        success: function(data){
           $('#txt2').val(data);
        }
  })
})

$("#txtnip").keyup(function(){
  var id = $('#txtnip').val();
  $.ajax({
        url: "page/pagepeople/people_proses.php", // Url to which the request is send
        type: "POST",
        data: "task=loadpeg&id="+id,
        success: function(data){
           $('#txtnama').val(data);
        }
  })
})

function format ( d ) {
    // `d` is the original data object for the row

    var shtml = $.ajax({
    type: "POST",
    url: "page/pagepinjamarsip/detail.php?id="+d,
    data: "request_type=generator",
    async: false
    }).responseText;

    return shtml;
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
      'ajax'        : 'page/pagepinjamarsip/bantai.php',
      "columns": [
            { "aaData": "0" },
            { "aaData": "1" },
            { "aaData": "2" },
            { "aaData": "3" },
            { "aaData": "4" },
            {
                "className":      'details-control',
                "orderable":      true,
                "data":           null,
                "defaultContent": ''
            },
            { "aaData": "5" }

        ],
        "order": [[1, 'desc']]
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
            row.child( format(row.data()[5])).show();
            tr.addClass('shown');
        }
    } );
}

function getkembali(){
  var idp = $("#idp").val();
  var uk = $("#uk").val();
  $("#luk").html("Unit Kerja : "+uk);
  $('#btn_modal').attr('data-target', '#modal-info');
}

//function getkembali(id){
// var tanya = confirm("Apakah pengembalian dokumen sudah lengkap ? ");
// if(tanya){
//  var urls = "<?php echo 'page/pagepinjamarsip/regpeminjaman_proses.php'; ?>";
//  $.ajax({
//        url: urls, // Url to which the request is send
//        type: "POST",
//        data: "task=back&id="+id,
//        success: function(data){
//          switch(data){
//            case "sukses" : toastr.success("Dokumen sudah dikembalikan", "BERHASIL");
//                            pageurl("page/pagepinjamarsip/regpeminjaman.php?id="+id);
//                            break;
//            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
//                            break;
//          }
//
//        }
//  });
//  } else {
//     toastr.error("Transaksi pengembalian dibatalkan !!", "PERHATIAN");
//  }
//}

$("#txt4").change(function(){
  var roleid = $("#txt4").val();
  $("#txt5").val('').change();
  $("#m0").hide();
  $("#m1").hide();
  $("#m2").hide();
  $("#m3").hide();
  $("#m4").hide();
  $("#tbldok").hide();
  $.ajax({
        url: 'page/pagepeminjaman/regpeminjaman_proses.php?roleid='+roleid+'&task=menu', // Url to which the request is send
        type: "POST",
        success : function(data){
          $("#"+data).show();
        }
  })
})

function reTableDaftarvital(){
  var ka = $("#txt4").val();
  var role = '<?php echo $_SESSION["RoleId"] ?>';
  var task = $("#task").val();
  $("#tbldok").hide();

   urls = 'page/pagepeminjaman/bantai1.php?role='+role;

   if(task=='edit'){
      var idx = $("#idx").val();
      var idi = $("#idi").val();
   }

  switch(ka){
    case "m0" : urls = 'page/pagepinjamarsip/bantai3.php?role='+role+'&idx='+idx+'&idi='+idi;
                $("#tbldok").show();
                break;
    case "m1" : urls = 'page/pagepinjamarsip/bantai2.php?role='+role+'&idx='+idx+'&idi='+idi;
                $("#tbldok").show();
                break;
    case "m2" : urls = 'page/pagepinjamarsip/bantai4.php?role='+role+'&ka='+ka+'&idx='+idx;
                $("#tbldok").show();
                break;
    case "m3" : urls = 'page/pagepinjamarsip/bantai5.php?role='+role+'&ka='+ka+'&idx='+idx;
                $("#tbldok").show();
                break;
    case "m4" : urls = 'page/pagepinjamarsip/bantai1.php?role='+role+'&ka='+ka+'&idx='+idx+'&task='+task;
                $("#tbldok").show();
                break;
    case "m5" : urls = 'page/pagepinjamarsip/bantai1.php?role='+role+'&ka='+ka+'&idx='+idx;
                $("#tbldok").show();
                break;
  }

  var tables = $('#mytbldaftarvital').DataTable({
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      'destroy'     : true,
      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
      "pageLength"  : 10,
      'PaginationType': "full_numbers",
      'ajax'        : urls,
      "order"       : [[0, 'asc']],
      'oLanguage': {
				"sSearch": "Pencarian :",
		}
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
   //$('#mytbldaftarvital tbody').on('click', 'td.details-control', function () {
//        var tr = $(this).closest('tr');
//        var row = tables.row( tr );
//
//        if ( row.child.isShown() ) {
//            // This row is already open - close it
//            row.child.hide();
//            tr.removeClass('shown');
//        }
//        else {
//            // Open this row
//            row.child( format(row.data()[0])).show();
//            tr.addClass('shown');
//        }
//    } );
}

function getregkembali(){
  var idp = $("#idp").val();
  var nip = $("#txtnip").val();
  var nama = $("#txtnama").val();
  var catat = $("#komentar").val();

  var urls = "<?php echo 'page/pagepinjamarsip/regpeminjaman_proses.php'; ?>";
  $.ajax({
        url: urls, // Url to which the request is send
        type: "POST",
        data: "task=kembali&id="+idp+"&nip="+nip+"&nama="+nama+"&catat="+catat,
        success: function(data){
          //alert(data);
          switch(data){
            case "sukses" : toastr.success("Registrasi pengembalian berhasil di simpan", "BERHASIL");
                            $('#btn_simpan').attr('data-target', '#modal-info');
                            break;
            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                            break;
          }


        }
  })
}





//function reTableDaftarbiasa(){
//  var ka = $("#txt5").val();
//  var role = $("#txt4").val();
//  var tables = $('#mytbldaftarbiasa').DataTable({
//      'ordering'    : true,
//      'info'        : true,
//      'destroy'     : true,
//      'autoWidth'   : false,
//      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
//      "pageLength"  : 10,
//      'PaginationType': "full_numbers",
//      'ajax'        : 'page/pagepeminjaman/bantai1.php?ka='+ka+'&role='+role,
//
//    } );
//
//   $('#mytbldaftarbiasa tbody').on('click', 'td.details-control', function () {
//        var tr = $(this).closest('tr');
//        var row = tables.row( tr );
//
//        if ( row.child.isShown() ) {
//            // This row is already open - close it
//            row.child.hide();
//            tr.removeClass('shown');
//        }
//        else {
//            // Open this row
//            row.child( format(row.data()[0])).show();
//            tr.addClass('shown');
//        }
//    } );
//}

$("#txt4").change(function (){
  var ka = $("#txt4").val();
  var role = '<?php echo $_SESSION["RoleId"] ?>';

  if(ka==""){
     toastr.warning("Kategori Arsip belum dipilih", "PERHATIAN");
     return false;
  }
  if(role==""){
     toastr.warning("Tujuan Unit Kerja belum dipilih", "PERHATIAN");
     return false;
  }
  reTableDaftarvital();
})



function getinfo(){
  $('#formdetail').show(1000);
}

$(function(e){
   id = $("#idx").val();
   task = $("#task").val()

   if(task != "edit"){
     var files = document.getElementById("myfiles").files;

     if(files==""){
      toastr.warning("Belum upload surat permohonan !", "PERHATIAN");
      return false;
     }
   }


   $("#myfrm").on('submit',(function(e) {
        e.preventDefault();
       var urls = "<?php echo 'page/pagepinjamarsip/regpeminjaman_proses.php'; ?>";
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
            case "found"  : toastr.warning("Ada data dengan Np/Nama yang sama", "PERHATIAN");
                            break;
            case "doknotfound"  : toastr.warning("Belum memilih dokumen yang akan dipinjam... !!", "PERHATIAN");
                                  return false;
                                  break;
          }
          //$("#close").click();
          pageurl("page/pagepinjamarsip/regpeminjaman.php?id="+id);

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
    id = $("#idx").val();
    pageurl("page/pagepinjamarsip/regpeminjaman.php?id="+id);
   }

   function fileExists(url) {
    var filex = $("#path").val()+url;

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

       if(fileExists(files[0].name)){
         toastr.error("File "+ files[0].name +" ditemukan nama yang sama !!", "Kesalahan");
         $("#myfiles").val('');
         return false;
       }
  }



   function deldata(id){
    idx = $("#idx").val();
    var tanya = confirm("Apakah dokumen ini mau dihapus ?");
    if(tanya){
     var urls = "<?php echo 'page/pagepinjamarsip/regpeminjaman_proses.php'; ?>";
     $.ajax({
        url: urls, // Url to which the request is send
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
            case "found"  : toastr.warning("Ada Unit Kerja dibawahnya", "PERHATIAN");
                            break;
          }
        pageurl("page/pagepinjamarsip/regpeminjaman.php?id="+idx);
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }


   function getload(id){
    //var AmbilData;
    //alert(id);
    $.ajax({
        url: "page/pagepinjamarsip/regpeminjaman_proses.php", // Url to which the request is send
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
          $("#lblstatus").html("Status : Ubah Detail Peminjaman Dokumen");
          $("#txt1").val(data.items['meta'].Nip);
          $("#txt2").val(data.items['meta'].Nama);
          $("#txt3").val(data.items['meta'].RoleId).change();
          $("#txt4").val(data.items['meta'].Keterangan).change();
          $("#txt5").val(data.items['meta'].Catatan);
          var tfile = data.items['meta'].Filename.split("/");
          $("#path").val(tfile[0]+"/"+tfile[1]+"/"+tfile[2]+"/");
          $("#ofiles").show();
          $("#ofiles").html("Surat Permohonan : "+tfile[3]);
          $("#idx").val(data.items['meta'].ArsipPinjam);
          $("#idi").val(data.items['meta'].Item);
          $("#task").val('edit');
          $("#id").val(data.items['meta'].PeminjamanId);
          $("#txt1").focus();
          reTableDaftarvital();
          //$("#tmptbl").hide();
        }
     });
   }

function viewdok(id,ket,idx){
 switch(ket){
  case "m0" : pageurl("page/pagepeminjaman/viewdokumen1.php?id="+id+"&idx="+idx+"&ket="+ket);
              break;
  case "m1" : pageurl("page/pagepeminjaman/viewdokumen2.php?id="+id+"&idx="+idx+"&ket="+ket);
              break;
  case "m2" : pageurl("page/pagepeminjaman/viewdokumen5.php?id="+id+"&idx="+idx+"&ket="+ket);
              break;
  case "m3" : pageurl("page/pagepeminjaman/viewdokumen6.php?id="+id+"&idx="+idx+"&ket="+ket);
              break;
  case "m4" : pageurl("page/pagepeminjaman/viewdokumen3.php?id="+id+"&idx="+idx+"&ket="+ket);
              break;
  case "m5" : pageurl("page/pagepeminjaman/viewdokumen4.php?id="+id+"&idx="+idx+"&ket="+ket);
              break;
 }
}


function delfiles(id){
   var tanya = confirm("Apakah File Upload dokumen ini dihapus ? ");
   if(tanya) {
    $.ajax({
        url: "page/pageregarsip/regarsip_proses.php", // Url to which the request is send
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