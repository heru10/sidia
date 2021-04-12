<link rel="stylesheet" href="bower_components/datatables/jquery.dataTables.css">
<script src="bower_components/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript">

  $(function () {
    reTable();
  })

  function viewimg(id){
    var ids = $("#ids").val();
    pageurl('page/pagedaftardetailvitaldalitas/test_img.php?pfile='+id+'&ids='+ids);
  }

  function closed(){
    pageurl('page/pagedaftararsipvitaldalitas/daftararsipvitaldalitas.php');
  }

  function loadspesimen(){
    var ids = $("#ids").val();
    pageurl('page/pagedaftararsipvitaldalitas/spesimen/spesimen.php?task=edit&ids='+ids);
  }

  function loadUT(){
    var ids = $("#ids").val();
    pageurl('page/pagedaftararsipvitaldalitas/uraian/uraian.php?task=edit&ids='+ids);
  }

  function loadST(){
    var ids = $("#ids").val();
    pageurl('page/pagedaftararsipvitaldalitas/spesifikasi/spesifikasi.php?task=edit&ids='+ids);
  }

  function loadPL(){
    var ids = $("#ids").val();
    pageurl('page/pagedaftararsipvitaldalitas/pendukung/pendukung.php?task=edit&ids='+ids);
  }


</script>