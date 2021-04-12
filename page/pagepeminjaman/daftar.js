<link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="bower_components/datatables/jquery.dataTables.css">
<script src="bower_components/datatables/jquery.dataTables.min.js"></script>
<script src="bower_components/moment/min/moment.min.js"></script>
<script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="bower_components/select2/dist/js/select2.full.min.js"></script>

<script type="text/javascript">
$(function () {

    $('.select2').select2({
      placeholder: 'Klasifikasi Dokumen',
    });
    $('.select3').select2({
      placeholder: 'Jenis Dokumen',
    });
    $('.select4').select2({
      placeholder: 'Unit Kerja',
    });

    $('#reservation').daterangepicker({
        locale: {
          format: 'DD/MM/YYYY'
        },
    });

    $("#forminput").hide();
    $("#formtable").show();
    $("#lblstatus").html("Status : Registrasi Peminjaman Dokumen");
    $("#task").val("new");
    $("#id").val("0");
    reTable();
  });

function format ( d ) {
    // `d` is the original data object for the row

    var shtml = $.ajax({
    type: "POST",
    url: "page/pagepeminjaman/detail.php?id="+d,
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
      'ajax'        : 'page/pagepeminjaman/bantai.php',
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
  var ka = $("#txt5").val();
  var role = $("#txt4").val();
  var task = $("#task").val();
  $("#tbldok").hide();

   urls = 'page/pagepeminjaman/bantai1.php?role='+role;

   if(task=='edit'){
      var idx = $("#idx").val();
      var idi = $("#idi").val();
   }

  switch(ka){
    case "m0" : urls = 'page/pagepeminjaman/bantai3.php?role='+role+'&idx='+idx+'&idi='+idi;
                $("#tbldok").show();
                break;
    case "m1" : urls = 'page/pagepeminjaman/bantai2.php?role='+role+'&idx='+idx+'&idi='+idi;
                $("#tbldok").show();
                break;
    case "m2" : urls = 'page/pagepeminjaman/bantai4.php?role='+role+'&ka='+ka+'&idx='+idx;
                $("#tbldok").show();
                break;
    case "m3" : urls = 'page/pagepeminjaman/bantai5.php?role='+role+'&ka='+ka+'&idx='+idx;
                $("#tbldok").show();
                break;
    case "m4" : urls = 'page/pagepeminjaman/bantai1.php?role='+role+'&ka='+ka+'&idx='+idx;
                $("#tbldok").show();
                break;
    case "m5" : urls = 'page/pagepeminjaman/bantai1.php?role='+role+'&ka='+ka+'&idx='+idx;
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
      //"order": [[1, 'asc']],
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

function tampiltable(){
  var ka = $("#txt5").val();
  var role = $("#txt4").val();

  if(ka==""){
     toastr.warning("Kategori Arsip belum dipilih", "PERHATIAN");
     return false;
  }
  if(role==""){
     toastr.warning("Tujuan Unit Kerja belum dipilih", "PERHATIAN");
     return false;
  }

  reTableDaftarvital();


}




function getinfo(){
  $('#formdetail').show(1000);
}

$(function(e){
   id = $("#idx").val();

   $("#myfrm").on('submit',(function(e) {
        e.preventDefault();
       var urls = "<?php echo 'page/pagepeminjaman/regpeminjaman_proses.php'; ?>";
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
            case "found"  : toastr.warning("Ada data dengan Nip/Nama yang sama", "PERHATIAN");
                            break;
            case "doknotfound"  : toastr.warning("Belum memilih dokumen yang akan dipinjam... !!", "PERHATIAN");
                                  return false;
                                  break;
          }
          //$("#close").click();
          pageurl("page/pagepeminjaman/regpeminjaman.php?id="+id);

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
    pageurl("page/pagepeminjaman/regpeminjaman.php?id="+id);
   }

   function backpage(){
     pageurl("page/pageregdokberkas/regdokberkas.php");
   }

   function deldata(id){
    idx = $("#idx").val();
    var tanya = confirm("Apakah dokumen ini mau dihapus ?");
    if(tanya){
     var urls = "<?php echo 'page/pagepeminjaman/regpeminjaman_proses.php'; ?>";
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
        pageurl("page/pagepeminjaman/regpeminjaman.php?id="+idx);
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }


   function getload(id){
    //var AmbilData;
    //alert(id);
    $.ajax({
        url: "page/pagepeminjaman/regpeminjaman_proses.php", // Url to which the request is send
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
          $("#txt4").val(data.items['meta'].RoleId_To).change();
          var ketmenu = data.items['meta'].Keterangan;
          $("#"+ketmenu).show();
          $("#txt5").val(data.items['meta'].Keterangan).change();
          var tglres = data.items['meta'].Reservation1+'-'+data.items['meta'].Reservation2;

          $("#reservation").data('daterangepicker').setStartDate(data.items['meta'].Reservation1);
          $("#reservation").data('daterangepicker').setEndDate(data.items['meta'].Reservation2);
          //$("#reservation").datepicker("setDate" , tglres);
          //$('#datepicker').datepicker("setDate" , tgl);
          //var dok = data.items['meta'].ArsipPinjam.split('|');
          $("#txt3").val(data.items['meta'].Uraian);
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
   var extfile = ['jpg','jpeg','pdf','bmp','gif','png','txt','cdr'];
   var no = $("#jmlfile").val();
   var totsize = 0;
    for (var i = 0; i < files.length; i++)
    {

       if(fileExists(files[i].name,'UT')){
         toastr.error("File "+ files[i].name +" ditemukan nama yang sama !!", "Kesalahan");
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
           moveupload();
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



    if(totsize > 2048000) {
        toastr.error('Total Ukuran File melebihi 2 MB!','KESALAHAN');
        moveupload();
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