<link rel="stylesheet" href="bower_components/datatables/jquery.dataTables.css">
<script src="bower_components/datatables/jquery.dataTables.min.js"></script>

<script type="text/javascript">
$(function () {
    reTable();
    $("#formtable").show();
  });


function format ( d ) {
    // `d` is the original data object for the row
    var idb = $("#idb").val();
    var idsb = $("#idsb").val();
    var req = $("#request").val();

    var shtml = $.ajax({
    type: "POST",
    url: "page/pageregarsip_v2/detail.php?id="+d+"&idb="+idb+"&idsb="+idsb+"&req="+req,
    data: "request_type=generator",
    async: false
    }).responseText;

    return shtml;
}

function view_file(id){
  var idb = $("#idb").val();
  var idsb = $("#idsb").val();
  var req = $("#request").val();
  pageurl("page/pagedaftararsip_v2/test_img.php?pfile="+id+"&idb="+idb+"&idsb="+idsb+"&req="+req);
}


function reTable(){
  var req = $("#request").val();

  if(req=="subberkas")
    idb = $("#idsb").val();
  else
    idb = $("#idb").val();

  var table = $('#mytbl').DataTable({
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
      "pageLength"  : 10,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pagedaftararsip_v2/bantai.php?idb='+idb,
      'oLanguage': {
				"sSearch": "Pencarian :",
		},
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


   function backpage(){
    if($("#request").val()=='subberkas'){
     var idsb = $("#idb").val();
     pageurl("page/pagedaftardokberkas_v2/daftardoksubberkas.php?idberkas="+idsb);
    }else
     pageurl("page/pagedaftardokberkas_v2/daftardokberkas.php");
   }



</script>