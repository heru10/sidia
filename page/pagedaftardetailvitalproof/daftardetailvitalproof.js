<link rel="stylesheet" href="bower_components/datatables/jquery.dataTables.css">
<script src="bower_components/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript">

  $(function () {
//     $('.bxslider').bxSlider({
//	   mode: 'fade',
//	   moveSlides: 1,
//	   slideMargin: 40,
//       slideWidth: 660,
//	   infiniteLoop: true,
//       adaptiveHeight: true,
//	   minSlides: 1,
//	   maxSlides: 1,
//	   speed: 600
//	});
    reTable();
  })

  function viewimg(id){
    var ids = $("#ids").val();
    pageurl('page/pagedaftardetailvitalproof/test_img.php?pfile='+id+'&ids='+ids);
  }

  function format ( d ) {
    // `d` is the original data object for the row

    var shtml = $.ajax({
    type: "POST",
    url: "page/pagedaftardetailvitalproof/detail.php?id="+d,
    data: "request_type=generator",
    async: false
    }).responseText;

    return shtml;
}


  function reTable(){
  var id = $("#ids").val();
  var table = $('#mytbl').DataTable({
      'ordering'    : true,
      'autoWidth'   : false,
      "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
      "pageLength"  : 10,
      'PaginationType': "full_numbers",
      'ajax'        : 'page/pageregdetailvitalproof/bantai.php?id='+id,
      'oLanguage': {
				"sSearch": "Pencarian :",
		},
      'columns': [
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
      'order': [[1, 'asc']]
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

 function getviewfile_meta(pfile){
    var ids = $("#ids").val();
    pageurl('page/pagedaftardetailvitalproof/test_img_m.php?ids='+ids+'&pfiler='+pfile);
  }

  function getviewfile(pfile){
    var ids = $("#ids").val();
    pageurl('page/pagedaftardetailvitalproof/test_img.php?ids='+ids+'&pfile='+pfile);
  }


  function closed(){
    pageurl('page/pagedaftararsipvitalprof/daftararsipvitalprof.php');
  }

  function getload_metadata(id){
    var ids = $("#ids").val();
    pageurl('page/pageregdetailvitalproof/metadata/metadata.php?task=edit&id='+id+'&ids='+ids);
  }


  function date_ind(tgl){
    tglr = tgl.split("-");
    return tglr[2]+"-"+tglr[1]+"-"+tglr[0];
  }

  function loadspesimen(){
    var ids = $("#ids").val();
    pageurl('page/pageregdetailvitalproof/spesimen/spesimen.php?task=edit&ids='+ids);
  }

  function loadUT(){
    var ids = $("#ids").val();
    pageurl('page/pageregdetailvitalproof/uraian/uraian.php?task=edit&ids='+ids);
  }

  function loadST(){
    var ids = $("#ids").val();
    pageurl('page/pageregdetailvitalproof/spesifikasi/spesifikasi.php?task=edit&ids='+ids);
  }

  function loadPL(){
    var ids = $("#ids").val();
    pageurl('page/pageregdetailvitalproof/pendukung/pendukung.php?task=edit&ids='+ids);
  }

  function cetak(){
    var ids = $("#ids").val();
    location.href='page/pageregdetailvitalproof/cetak.php?ids='+ids;
  }

  function deldata_metadata(id){
    var tanya = confirm("Apakah data ini mau dihapus ?");
    if(tanya){
     var urls = "<?php echo 'page/pageregdetailvitalproof/metadata/metadata_proses.php'; ?>";
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
        pageurl("page/pageregdetailvitalproof/regdetailvitalproof.php?ids="+id);
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }

   function deldata_sp(){
    var id = $("#ids").val();
    var tanya = confirm("Apakah data ini mau dihapus ?");
    if(tanya){
     var urls = "<?php echo 'page/pageregdetailvitalproof/spesimen/spesimen_proses.php'; ?>";
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
        pageurl("page/pageregdetailvitalproof/regdetailvitalproof.php?ids="+id);
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }

  function deldata_ut(){
    var id = $("#ids").val();
    var tanya = confirm("Apakah data ini mau dihapus ?");
    if(tanya){
     var urls = "<?php echo 'page/pageregdetailvitalproof/uraian/uraian_proses.php'; ?>";
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
          pageurl("page/pageregdetailvitalproof/regdetailvitalproof.php?ids="+id);
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }

   function deldata_st(){
    var id = $("#ids").val();
    var tanya = confirm("Apakah data ini mau dihapus ?");
    if(tanya){
     var urls = "<?php echo 'page/pageregdetailvitalproof/spesifikasi/spesifikasi_proses.php'; ?>";
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
          pageurl("page/pageregdetailvitalproof/regdetailvitalproof.php?ids="+id);
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }

  function deldata_pl(){
    var id = $("#ids").val();
    var tanya = confirm("Apakah data ini mau dihapus ?");
    if(tanya){
     var urls = "<?php echo 'page/pageregdetailvitalproof/pendukung/pendukung_proses.php'; ?>";
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
          pageurl("page/pageregdetailvitalproof/regdetailvitalproof.php?ids="+id);
        }
     })
    } else toastr.warning("Proses dibatalkan", "PEMBATALAN");
   }
</script>