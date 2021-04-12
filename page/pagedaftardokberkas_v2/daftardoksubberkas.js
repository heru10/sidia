<link rel="stylesheet" href="bower_components/datatables/jquery.dataTables.css">
<script src="bower_components/datatables/jquery.dataTables.min.js"></script>


<script type="text/javascript">
   $(this).load(function() {
     $("#loadery").fadeOut("slow");
   });


$(function () {
    reTable();
  });


function format ( d ) {
    // `d` is the original data object for the row

    var shtml = $.ajax({
    type: "POST",
    url: "page/pagedaftardokberkas_v2/detail.php?id="+d,
    data: "request_type=generator",
    async: false
    }).responseText;

    return shtml;
}

function reTable(){
  var idb = "<?php echo $_GET['idberkas']; ?>";
  var table = $('#mytbl').DataTable({
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
      "pageLength"  : 10,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pagedaftardokberkas_v2/bantai1.php?idb='+idb,
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


function getinfo(){
  $('#formdetail').show(1000);
}


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
   function backpage(){
     pageurl("page/pagedaftardokberkas_v2/daftardokberkas.php");
   }
   function closed(){
    var idx = $("#idb").val();
    pageurl("page/pagedaftardokberkas_v2/daftardoksubberkas.php?idberkas="+idx);
   }


function detail_berkas(idsb){
  var req = $("#request").val();
  var idb = $("#idb").val();
  pageurl("page/pagedaftararsip_v2/daftararsip.php?idb="+idb+"&idsb="+idsb+"&req="+req);
}

</script>