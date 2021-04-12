<link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="bower_components/datatables/jquery.dataTables.css">
<script src="bower_components/datatables/jquery.dataTables.min.js"></script>
<script src="bower_components/moment/min/moment.min.js"></script>
<script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="bower_components/select2/dist/js/select2.full.min.js"></script>

<script type="text/javascript">
$(function () {
    reTable();
    $('#reservation').daterangepicker({
      locale: {
          format: 'DD/MM/YYYY'
      },
    });
  });

function format ( d ) {
    // `d` is the original data object for the row

    var shtml = $.ajax({
    type: "POST",
    url: "page/pagepersetujuan/detail.php?id="+d,
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
      'ajax'        : 'page/pagepersetujuan/bantai.php',
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
        ]
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
       var urls = "<?php echo 'page/pagepersetujuan/regpersetujuan_proses.php'; ?>";
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
            case "sukses" : toastr.success("Permohonan berhasil di proses", "BERHASIL");
                            break;
            case "error"  : toastr.error("Terjadi kesalahan database", "KESALAHAN");
                            break;
            case "found"  : toastr.warning("Ada data dengan nama yang sama", "PERHATIAN");
                            break;
          }
          //closed();
          //$("#close").click();
          pageurl("page/pagepersetujuan/regpersetujuan.php");
        }
       });
   }));
})


   function form_approve(idp){
     $('#btn_approve'+idp).attr('data-target', '#modal-primary');
     $("#idx").val(idp);
     $("#task").val('approve');
     loadreservation();
   }

   function approve(req){
     $("#req").val(req);
     $("#myfrm").submit();
   }

   function closed(){
    id = $("#idx").val();
    pageurl("page/pagepersetujuan/regpersetujuan.php");
   }

  function loadreservation(){
   var id = $("#idx").val();
   var urls = "<?php echo 'page/pagepersetujuan/regpersetujuan_proses.php'; ?>";
   $.ajax({
        url: urls, // Url to which the request is send
        type: "POST",
        data: "task=load&idx="+id,
        success: function(data){
        tgl = data.split('|');
          $("#reservation").data('daterangepicker').setStartDate(tgl[0]);
          $("#reservation").data('daterangepicker').setEndDate(tgl[1]);
       }
    });
  }



</script>