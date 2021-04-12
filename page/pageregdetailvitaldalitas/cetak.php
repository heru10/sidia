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
              <h4>SEKSI DESAIN</h4>
              <h5><b><u>Departemen Desain & Proof</u></b></h5>
         </center>
              <table class="table table-bordered" style="100%">
                <tr>
                  <th style="width: 3%">No</th>
                  <th><center>Tanggal</center></th>
                  <th><center>Dasar</center></th>
                  <th><center>Perihal</center></th>
                  <th><center>Pelaksana</center></th>
                  <th><center>Target</center></th>
                  <th><center>Lokasi Simpan</center></th>
                </tr>
                <?php
                  $no = 1;
                  while($data=mysqli_fetch_array($result)){
                    echo "<tr>";
                    echo "<td align=right>".$no.".</td>";
                    echo "<td align=center>".date('d/m/Y', strtotime($data['Tgl_Nodin']))."</td>";
                    echo "<td>".$data['Dasar']."</td>";
                    echo "<td>".$data['Perihal']."</td>";
                    echo "<td>".$data['Pelaksana']."</td>";
                    $tgl_target = explode("#",$data['Target']);
                    echo "<td align=center>".date('d/m/Y',strtotime($tgl_target[0]))." s/d ".date('d/m/Y',strtotime($tgl_target[1]))."</td>";
                    echo "<td align=center>".$data['Lokasi']."</td>";
                    echo "</tr>";
                    $no++;
                  }




                ?>
              </table>
       </div>