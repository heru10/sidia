<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.js"></script>

<script type="text/javascript">

$(function () {

    reTable();

  });


function reTable(){
  var table = $('#mytbl').DataTable({
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
      "pageLength"  : 10,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pagedaftararsipvitalprof/bantai.php',
      'oLanguage': {
				"sSearch": "Pencarian :",
		}
    });


   //var table = $('#mytbl').DataTable();

    // Apply the search
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


function detail_vital(id){
  pageurl('page/pagedaftardetailvitalproof/daftardetailvitalproof.php?ids='+id);
}
</script>