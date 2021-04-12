<script src="bower_components/select2/dist/js/select2.min.js"></script>
<link rel="stylesheet" href="bower_components/datatables/jquery.dataTables.css">
<script src="bower_components/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript">

$(function () {
    reTable();
    $("#forminput").hide();
    $("#formtable").show();
    $("#lblstatus").html("Status : Tambah Klasifikasi");
    $('.select2').select2();
    $('.select3').select2();
    $("#task").val("new");
    $("#id").val("0");
  });

function labelklas(){
  var kode = $("#txt2").val();
  var namaklas = $("#txt3").val();
  if(kode!="")
  $("#labelklas").html('<h4>'+kode+' - '+ namaklas +'</h4>');
}

function format ( d ) {
    // `d` is the original data object for the row

    var shtml = $.ajax({
    type: "POST",
    url: "page/pageklasifikasi/detail_klas.php?id="+d,
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
      "aLengthMenu" : [[5,  50, 100], [5, 50, 100]],
      "pageLength"  : 5,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pageklasifikasi/bantai.php',
      "columns": [
            {
                "className"  : 'details-control',
                "orderable"  : true,
                "data"       : null,
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
    });
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

$(function(e){
   $("#myfrm").on('submit',(function(e) {
        e.preventDefault();

       $.ajax({
        url: "page/pageklasifikasi/klasifikasi_proses.php", // Url to which the request is send
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
          pageurl("page/pageklasifikasi/klasifikasi.php");
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
    $("#txt2").val('');
    $("#txt3").val('');
    $("#txt4").val('');
    $("#txt5").val('');
    //$("#txt6").val('');
    //$("#txt7").val('');
    //$("#txt8").val('');
    //$("#txt9").val('');
    //$("#txt10").val('');
    //$("#txt11").val('');
    $("#txt12").val('');
    $("#txt13").val('');
    $("#txt14").val('');
   }

   function closed(){
    $("#txt1").val('');
    $("#txt2").val('');
    $("#txt3").val('');
    $("#txt4").val('');
    $("#txt5").val('');
    $("#txt6").val('0');
    $("#txt7").val('-');
    $("#txt8").val('0');
    $("#txt9").val('-');
    $("#txt10").val('Musnah');
    $("#txt11").val('');
    $("#txt12").val('');
    $("#txt13").val('');
    closeform();
    pageurl("page/pageklasifikasi/klasifikasi.php");
   }


   function deldata(id){
    var tanya = confirm("Apakah Klasifikasi ini mau dihapus ?");
    if(tanya){
     $.ajax({
        url: "page/pageklasifikasi/klasifikasi_proses.php", // Url to which the request is send
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
            case "found"  : toastr.warning("Klasifikasi tidak dapat dihapus, karena sudah digunakan !!", "PERHATIAN");
                            break;
            case "fparent"  : toastr.warning("Klasifikasi tidak dapat dihapus, karena ada sub klasifikasi dibawahnya !!", "PERHATIAN");
                            break;
          }
          pageurl("page/pageklasifikasi/klasifikasi.php");
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }

   function viewka(id){
    $("#dialog").dialog();
   }

   function getload(id, vx){
    var AmbilData;
    $.ajax({
        url: "page/pageklasifikasi/listklasifikasi.php", // Url to which the request is send
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
        counter = data.items.length;

        if(vx=='ubah'){
          $("#lblstatus").html("Status : Ubah Klasifikasi");
          $("#txt1").val(data.items[0].ClParentId).change();
          $("#txt2").val(data.items[0].ClCode);
          $("#txt3").val(data.items[0].ClName);
          $("#txt4").val(data.items[0].ClDesc);

          if(data.items[0].CIStatus == 1)
            $('#txt5').attr('checked', true);
          else
            $('#txt5').attr('checked', false);

          $("#txt6").val(data.items[0].RetensiThn_Active);
          $("#txt7").val(data.items[0].Ket_Active);
          $("#txt8").val(data.items[0].RetensiThn_InActive);
          $("#txt9").val(data.items[0].Ket_InActive);
          $("#txt10").val(data.items[0].SusutId).change();
          $("#txt11").val(data.items[0].ClKeamanan).change();
          var b = [];
          a = data.items.length;
          for(i=0;i<a;i++){
            b.push(data.items[i].RoleId);
          }
          if(i > 0)
           $('#txt1A').select2().val(b).trigger("change");


          //$("select").val(data.items.HakAses).trigger('change.select2');
          $("#task").val('edit');
          $("#id").val(data.items[0].ClId);
          //$("#txt9").val(data.items.SusutId).change();
          //$("#txt10").val(data.items.ClKeamanan).change();

          var ArR = data.items[0].HakAkses.split("#");
          $("#txt12").val(ArR).change();
          $("#txt13").val(data.items[0].DasarPertimbang).change();
          $("#txt14").val(data.items[0].UnitPengolah).change();
          closetable();
        } else {
          $("#klasarsip").html(data.items[0].ClCode + " - " + data.items.ClName);
          $("#klaskeamanan").html(data.items[0].KeamananName);
          $("#klashak").html(GJ(data.items[0].HakAkses));
          $("#klasdasar").html(data.items[0].DasarPertimbang);
          $("#klasunit").html(role(data.items[0].UnitPengolah));
          $('#modal-info').modal('toggle');
        }
       }
     });
   }

   function GJ(rid){
   var datax = '';
     $.ajax({
        url: "page/pageklasifikasi/listklasifikasi.php", // Url to which the request is send
        type: "POST",
        data: "task=loadg&rid="+rid,
        success: function(data){
          datax = data;
        },
        async: false
     });
     return datax;
   }

 function role(rid){
   var datay = '';
     $.ajax({
        url: "page/pageklasifikasi/listklasifikasi.php", // Url to which the request is send
        type: "POST",
        data: "task=loadrole&rid="+rid,
        success: function(data){
          //alert(data);
          datay = data;
        },
        async: false
     });
     return datay;
   }
</script>