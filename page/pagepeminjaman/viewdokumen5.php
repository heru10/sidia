<?php
   session_start();
   include "../../conf.php";
   if(isset($_GET['id']))
    $id = $_GET['id'];
   if(isset($_GET['idx']))
    $idx = $_GET['idx'];

    $sql = "select ArsipPinjam, Keterangan, RoleId_To, StatusPinjam, Reservation1, Reservation2, Item, StatusPinjam, Akses, Kepada from v_peminjaman where PeminjamanId = '".$idx."' ";
    $result = mysqli_query($connect, $sql);
    $rows = mysqli_fetch_array($result);
    $bid = explode('|',$rows['ArsipPinjam']);

   $sql = "select * from v_berkas_v1 where BerkasId = '".$id."'  ";
   $result = mysqli_query($connect, $sql);
   $data = mysqli_fetch_array($result);
   //$ketrinci = rinci($rows['Item']);
   $status = '<span class="text-red">[Dokumen Vital]</span>';
   $uraian = explode("/",$data['Ur']);
?>
  <style type="text/css">
  /*<![CDATA[*/
   tfoot {
    display: table-header-group;
   }
  /*]]>*/
  </style>
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Lihat Dokumen Aktif <?php echo $rows['Kepada']; ?></h3>
            </div>
            <form role="form">
              <div class="box-body">
                <input type="hidden" id="id" value="<?php echo $id; ?>" />
                <input type="hidden" id="idx" value="<?php echo $idx; ?>" />
                <table class='table no-border' style="display: none">
                  <tr>
                    <td width="10%">Nomor Berkas</td>
                    <td>:&nbsp;<b><?php echo $uraian[0]."/".$uraian[1]; ?></b></td>
                  </tr>
                  <tr>
                    <td>Judul Berkas</td>
                    <td>:&nbsp;<b><?php echo $uraian[2]; ?></b></td>
                  </tr>
                </table>
                <br />
                <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-red">
                  <th width="2%"><div align="center">No.</div></th>
                  <th width="10%"><div align="center">Nomor Naskah</div></th>
                  <th width="10%"><div align="center">Tanggal Naskah</div></th>
                  <th width="10%"><div align="center">Jenis Naskah</div></th>
                  <th width="30%"><div align="center">Uraian</div></th>
                  <th width="10%"><div align="center">Lihat Dokumen</div></th>
                 </tr>
                </thead>
                <tfoot class="bg-info">
                    <tr >
                        <th>&nbsp;</th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th>&nbsp;</th>
                    </tr>
                </tfoot>
                <tbody>
                   <tr>
                     <td colspan="7"></td>
                   </tr>
                </tbody>
              </table>


                <div class="box-footer">
                <button onclick="closed();"  type="submit" class="btn btn-primary">Tutup</button>
              </div>
            </div>
            </form>
          </div>
          <!-- /.box -->

          <!-- Form Element sizes -->
     </div>
    </div>
    <link rel="stylesheet" href="bower_components/datatables/jquery.dataTables.css">
    <script src="bower_components/datatables/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
     $(function () {
       reTable();
     })
      function viewimg(pfile){
       var ids = $("#id").val();
       var idx = $("#idx").val();
       pageurl('page/pagepeminjaman/test_img.php?ids='+ids+'&idx='+idx+'&pfile='+pfile);
      }

      function closed(){
        pageurl('page/pagepeminjaman/regpeminjaman.php');
      }

      function format ( d ) {
    // `d` is the original data object for the row
        //alert(d);
          var idx = $("#idx").val();
          var shtml = $.ajax({
          type: "POST",
          url: "page/pagepeminjaman/osdm/detail.php?id="+d+"&idx="+idx,
          data: "request_type=generator",
          async: false
          }).responseText;

          return shtml;
      }
      function reTable(){
       var id = $("#id").val();
       var table = $('#mytbl').DataTable({
          'ordering'    : true,
          'info'        : true,
          'autoWidth'   : false,
          "aLengthMenu" : [[10,  50, 100], [10, 50, 100]],
          "pageLength"  : 10,
          'PaginationType': "full_numbers",
          'ajax'        : 'page/pagepeminjaman/osdm/bantai6.php?idx='+id,
          "columns": [
                { "aaData": "0" },
                { "aaData": "1" },
                { "aaData": "2" },
                { "aaData": "3" },
                { "aaData": "4" },
                {
                    "className":      'details-control',
                    "orderable":      true,
                    "data":           null,
                    "defaultContent": ''
                }
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
                row.child( format(row.data()[5])).show();
                tr.addClass('shown');
            }
          } );
      }

    </script>

<?php
 mysqli_close($connect);
 function rinci($si){
 $gd = explode('|',$si);
 $gabname = "";
    foreach($gd as $idis){
      $name = "Semua Item Dokumen";
      switch($idis){
        case 'sp' : $name = 'Spesimen';
                    break;
        case 'ut' : $name = 'Uraian Teknis';
                    break;
        case 'st' : $name = 'Spesifikasi Teknis';
                    break;
        case 'pl' : $name = 'Dokumen Pendukung';
                    break;
      }
      $gabname .= $name.", ";
    }
    $gabname = ' >> <text class="text-blue">'.substr($gabname,0,-2).'.</text>';
    return $gabname;
 }

   function filesize_formatted($size)
    {
    //$size = $path;
    $units = array( 'B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
    $power = $size > 0 ? floor(log($size, 1024)) : 0;
    return number_format($size / pow(1024, $power), 2, '.', ',') . ' ' . $units[$power];
    }


 ?>