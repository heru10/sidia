<script src="bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

  <?php
  session_start();
    include_once "daftararsipvitalprof.js";
    include_once "../../conf.php";
    $codreg = code("MVP-",15);

  ?>
  <style type="text/css">
  /*<![CDATA[*/
   tfoot {
    display: table-header-group;
   }
  /*]]>*/
  </style>
  <section class="content-header">
      <h3>
        Daftar Dokumen Vital
      </h3>
        <span class="text-xs"><?php echo $_SESSION['RoleName']; ?></span>

      <!-- <h5>
        <?php echo $_SESSION['RoleName']; ?>
      </h5>   -->
      <ol class="breadcrumb">
        <li><a href="index2.html"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Daftar Dokumen Vital</li>
      </ol>
  </section>


  <div id="formtable">
  <section class="content" >
      <div class="row">
        <!--<div class="col-md-9">-->
          <div class="box">
            <div class="box-header with-border">
             <!-- <h4 class="box-title">Daftar Dokumen <?php echo $_SESSION['RoleName']; ?></h4>     -->
            </div>
            <div class="box-body">

            <table id="mytbl" class="table table-bordered table-striped">
                <thead>
                 <tr class="bg-red">
                  <th width="2%"><div align="center">No.</div></th>
                  <th width="15%"><div align="center">Kategori Produk</div></th>
                  <th width="15%"><div align="center">Produk</div></th>
                  <th width="15%"><div align="center">Detail Produk</div></th>
                  <th width="10%"><div align="center">Tahun</div></th>
                  <th width="10%"><div align="center">Kode Pekerjaan</div></th>
                  <th width="7%"><div align="center">Status</div></th> <!-- heru PDS menambahkan ini, 2020-12-10 -->
                  <th width="5%"><div align="center">Input Detail</div></th>
                 </tr>
                </thead>
                <tfoot class="bg-info">
                    <tr >
                        <th>&nbsp;</th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <!--<th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>-->
                        <th><input type="text" placeholder="Search" class="form-control input-sm" style=" width: 100%" /></th>
                        <th>&nbsp;</th> <!-- heru PDS menambahkan ini, 2020-12-10 -->
                        <th>&nbsp;</th>
                    </tr>
                </tfoot>

              </table>

            </div>
          </div>
      </div>
  </section>
  </div>

