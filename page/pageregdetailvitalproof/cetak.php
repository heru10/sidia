<link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css">
<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<?php
  session_start();
  include_once "../../conf.php";
  $sql = "select * from v_metaproof where RegVitalId = '".$_REQUEST['ids']."' ";
  $result = mysqli_query($connect, $sql);
?>

<script> window.print(); </script>

       <div class="box-body" style="padding: 20px">
         <center>
              <h5><b><u>Departemen Desain & Proof</u></b></h5>
         </center>
              <table class="table table-bordered" style="100%">
                <tr>
                  <th style="width: 3%">No</th>
                  <th><center>Tanggal</center></th>
                  <th><center>Dasar</center></th>
                  <th><center>Perihal</center></th>
                  <th><center>Pelaksana</center></th>
                  <th><center>Nota Penyerahan</center></th>
                  <!-- <th><center>Lokasi Simpan</center></th> -->
                  <th><center>Keterangan</center></th> <!-- heru PDS menambahkan ini, Lokasi simpan didelete, 2020-12-10 -->
                </tr>
                <?php
                  $no = 1;
                  while($datas=mysqli_fetch_array($result)){
                    $dbpelaksana = array();
                    echo "<tr>";
                    echo "<td align=right>".$no.".</td>";
                    echo "<td align=center>".date('d/m/Y', strtotime($datas['Tgl_Nodin']))."</td>";
                    echo "<td>".$datas['Dasar']."</td>";
                    echo "<td>".$datas['Perihal']."</td>";
                    $dbpelaksana  = explode("#",$datas['IdPelaksana']);
                    $pelaksana = '';

                    foreach($dbpelaksana as $teknis){
                      $sql = "select concat(Nip,' - ',Nama) as pt from pelaksana_teknis where IdPT = '".$teknis."' ";
                      $res = mysqli_query($connect, $sql);
                      $data1 = mysqli_fetch_array($res);
                      $pelaksana .= $data1['pt'].', ';
                    }

                    $pelaksana = substr(trim($pelaksana),0,-1);
                    echo "<td>".$pelaksana."</td>";
                    echo "<td align=center>".$datas['Nota_Penyerahan']."</td>";
                    // echo "<td align=center>".$datas['Lokasi']."</td>";
                    echo "<td align=center>".$datas['Keterangan']."</td>"; # heru PDS menambahkan ini, Lokasi didelete, 2020-12-10
                    echo "</tr>";
                    $no++;
                  }




                ?>
              </table>
       </div>