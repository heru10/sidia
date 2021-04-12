<link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="bower_components/datatables/jquery.dataTables.css">
<script src="bower_components/datatables/jquery.dataTables.min.js"></script>
<script src="bower_components/moment/min/moment.min.js"></script>
<script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="bower_components/select2/dist/js/select2.full.min.js"></script>

<script type="text/javascript">
$(function () {
    $("#task").val("new");
    $("#id").val("0");
    reTable();
  });

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
      'ajax'        : 'page/pagepengembalianarsip/bantai.php',
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
}

function getkembali(){
  var idp = $("#idp").val();
  var uk = $("#uk").val();
  $("#luk").html("Unit Kerja : "+uk);
  $('#btn_modal').attr('data-target', '#modal-info');
}

 function pengembalian(id){
    $.ajax({
      url: "page/pagepengembalianarsip/regpengembalian_proses.php", // Url to which the request is send
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
        $("#txtnip").val(data.items['meta'].Nip);
        $("#txtnama").val(data.items['meta'].Nama);
        $("#idp").val(id);
        $("#tasks").val('back');
        $("#luk").html('Unit Kerja : '+data.items['meta'].UnitKerja);
        $('#btn_simpan').attr('data-dismiss', 'modal');
      }
    })
 }

function getkembali(){
  var idp = $("#idp").val();
  var nip = $("#txtnip").val();
  var nama = $("#txtnama").val();
  var catat = $("#komentar").val();

  var urls = "<?php echo 'page/pagepengembalianarsip/regpengembalian_proses.php'; ?>";
  $.ajax({
        url: urls, // Url to which the request is send
        type: "POST",
        data: "task=back&id="+idp+"&nip="+nip+"&nama="+nama+"&catat="+catat,
        success: function(data){
          //alert(data);
          switch(data){
            case "sukses" : toastr.success("Registrasi pengembalian berhasil di simpan", "BERHASIL");
                            break;
            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                            break;
          }
          pageurl("page/pagepengembalianarsip/regpengembalian.php?id="+id);

        }
  })
}










</script>