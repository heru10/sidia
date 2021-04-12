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
    var req = $("#req").val();
    $("#tr_nberkas").hide();
    if(req=='sub'){
     reTable2();
     $("#tr_nip").hide();
     $("#tr_nama").hide();
     $("#tr_nberkas").show();
    }else {
     reTable();
     $("#id").val("0");
    }
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
    $("#lblstatus").html("Status : Tambah Dokumen Vital");
    $("#task").val("new");

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
    url: "page/pageregdokberkas_v1/detail.php?id="+d,
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
	  'statsave'	: true,
      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
      "pageLength"  : 10,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pageregdokberkas_v1/bantai.php',
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
            { "aaData": "5" }
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

function format2 ( d ) {
    // `d` is the original data object for the row

    var shtml = $.ajax({
    type: "POST",
    url: "page/pageregdokberkas_v1/detail.php?id="+d,
    data: "request_type=generator",
    async: false
    }).responseText;

    return shtml;
}

function reTable2(){
  var table = $('#mytbl2').DataTable({
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
      "pageLength"  : 10,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pageregdokberkas_v1/bantai1.php?id='+$("#id").val(),
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
            { "aaData": "4" }
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

   $('#mytbl2 tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row( tr );

        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( format2(row.data()[0])).show();
            tr.addClass('shown');
        }
    } );
}



$(function(e){
   $("#myfrm").on('submit',(function(e) {
        e.preventDefault();
       var urls = "<?php echo 'page/pageregdokberkas_v1/regdokberkas_proses.php'; ?>";
		//return alert('error maintenance');
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
		  console.log(data);
          switch(data){
            case "sukses" : toastr.success("Data Berhasil disimpan", "BERHASIL");
                            break;
            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                            break;
            case "found"  : toastr.warning("Ada data dengan nama yang sama", "PERHATIAN");
                            break;
			case "eror_np"  : toastr.error("NP Sudah Ada", "KESALAHAN");
                            break;
			default:
				toastr.error(data,'ERROR');
          }
          //$("#close").click();
        if($("#req").val()=='sub'){
         var id=$("#idx").val();
           pageurl("page/pageregdokberkas_v1/regdoksubberkas.php?id="+id+"&req=sub");
        } else
           pageurl("page/pageregdokberkas_v1/regdokberkas.php");

        },
        error: function(){
            toastr.error('Permintaan tidak diproses','ERROR');
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
    pageurl("page/pageregdokberkas_v1/regdokberkas.php");
   }

   function closed2(){
    var id = $("#idx").val();
    pageurl("page/pageregdokberkas_v1/regdoksubberkas.php?id="+id+"&req=sub");
   }

   function deldata(id){
    var tanya = confirm("Apakah metadata dokumen ini mau dihapus ?");
    if(tanya){
     var urls = "<?php echo 'page/pageregdokberkas_v1/regdokberkas_proses.php'; ?>";
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

     if($("#req").val()=='sub'){
         var id=$("#idx").val();
         pageurl("page/pageregdokberkas_v1/regdoksubberkas.php?id="+id+"&req=sub");
       } else
        pageurl("page/pageregdokberkas_v1/regdokberkas.php");

       }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }


   function getload(id){
    //var AmbilData;

    $.ajax({
        url: "page/pageregdokberkas_v1/regdokberkas_proses.php", // Url to which the request is send
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

          if(data.items.SubBerkas!=""){
            $("#tr_nip").hide();
            $("#txtnip").attr('required', false);
            $("#gedung").show();
            $("#lemari").show();
            $("#baris").show();
            $("#sarana").show();
          }else{
            $("#txtnip").val(data.items.Nip).change();
          }
          $("#txt1").val(data.items.ClId).change();
          $("#txt2").val(data.items.RoleId).change();

          if($("#req").val()!='sub')
           $("#txt3").val(data.items.Uraian).change();
          else
           $("#txt3A").val(data.items.Uraian).change();

          $("#txt4").val(data.items.KurunWaktu).change();
          $("#txt5").val(data.items.Jumlah).change();
          $("#txt6").val(data.items.TPId).change();
          $("#txt7").val(data.items.MediaId).change();
          $("#txt8").val(data.items.KondisId).change();
          $("#txt9").val(data.items.Keterangan).change();
          $("#txt10").val(data.items.Gedung).change();
          $("#txt11").val(data.items.Lemari).change();
          $("#txt12").val(data.items.Baris).change();
          $("#txt13").val(data.items.Boks).change();
          $("#id").val(data.items.BerkasId);
          $("#task").val('edit');
          $("#txt1").focus();

        }
     });
   }


function detail_berkas(id,idx){
  //alert(id+idx);
  pageurl("page/pageregarsip_v1/regarsip.php?id="+id+"&idx="+idx);
}
function subberkas(id){
  pageurl("page/pageregdokberkas_v1/regdoksubberkas.php?id="+id+"&req=sub");
}
function addsub_berkas(id){
  var urls = "<?php echo 'page/pageregdokberkas_v1/regdokberkas_proses.php'; ?>";
   $.ajax({
        url: urls, // Url to which the request is send
        type: "POST",
        data: "task=loadberkas&id="+id,
        async: true,
        success: function(data){

            var a = data.split("#");
            $("#berkas").html(a[0]+"/"+a[1]+" - "+a[2]);
            $("#txtberkas").val(a[0]+"/"+a[1]+" - "+a[2]);
            $("#sub").html('Sub');
            var no_subberkas = parseInt(a[3])+1;
            $("#nosubberkas").val(a[1]+'.'+no_subberkas);
            closetable();
            $("#vberkas").show();
            $("#lok").hide();
            $("#tr_nip").hide();
            $("#tr_nama").hide();
            $("#txtnip").attr('required', false);
            $("#gedung").hide();
            $("#lemari").hide();
            $("#baris").hide();
            $("#sarana").hide();

            $("#id").val(id);
            $("#request").val("subberkas");
            $("#txt1").val('');
            $("#txt1").focus();
        }
     })
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