<link rel="stylesheet" href="bower_components/datatables/jquery.dataTables.css">
<script src="bower_components/datatables/jquery.dataTables.min.js"></script>

<script type="text/javascript">
$(function () {
    reTable();
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
    url: "page/pageregarsip_v1/detail.php?id="+d,
    data: "request_type=generator",
    async: false
    }).responseText;

    return shtml;
}

function view_file(id){
  var ids = $("#idx").val();
  var idr = $("#id").val();
  pageurl("page/pagedaftararsip_v1/test_img.php?pfile="+id+"&ids="+ids+"&idr="+idr);
}


function loadfile(r){
  var file = $("#fileselect").val();
  var ext = file.split(".");

  if(ext[1] == "pdf" )
     types = "application/pdf";
  if(ext[1]== "jpg")
     types = "application/jpg";
  var location = "Upload_Files/"+r+"/"+file;
  $( "#viewerpdf").attr('data',  location);
  $( "#viewerpdf").attr('type',  types);
}

function reTable(){
  id = $("#id").val();
  var table = $('#mytbl').DataTable({
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
      "pageLength"  : 10,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pagedaftararsip_v1/bantai.php?idx='+id,
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




   function closed(){
    id = $("#idx").val();
    pageurl("page/pagedaftararsip_v1/daftararsip.php?id="+id);
   }

   function backpage(){
     pageurl("page/pagedaftardokberkas_v1/daftardokberkas.php");
   }


</script>