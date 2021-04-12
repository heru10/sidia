<?php
 session_start();
 include "../../conf.php";

 $sql = "select PeminjamanId, Filename, Keterangan, ArsipPinjam, Item, StatusPinjam, UnitKerja from v_peminjaman_fisik where PeminjamanId = '".$_GET['id']."' ";
 $result = mysqli_query($connect, $sql);
 $rows = mysqli_fetch_array($result);
 $bid = explode('|',$rows['ArsipPinjam']);
 $ketpinjam = "Sudah Kembali";
 $btnback = "none";
    if($rows['StatusPinjam']==1){
       $ketpinjam = "Masih Dipinjam";
       $btnback = "inline";
    }

?>

 <div class="box box-primary">
     <div class="box-header">
         <i class="ion ion-clipboard"></i>
              <h3 class="box-title">Daftar Peminjaman Dokumen Fisik</h3>
     </div>
     <div class="col-md-12">
     <div class="box-body body-success">
      <div style="display: <?php echo $btnback; ?>"><button type="button" title="Registrasi Pengembalian Dokumen" onclick="getkembali()" id="btn_modal" data-toggle="modal" class="btn btn-success btn-sm">Registrasi Pengembalian Dokumen</button><br /><br /></div>
      <input type="hidden" id="idp" value="<?php echo $rows['PeminjamanId'] ?>" />
      <input type="hidden" id="uk"  value="<?php echo $rows['UnitKerja'] ?>" />
      <table class="table table-bordered table-striped">
      <thead>
      <tr class="bg-yellow">
          <th><center>No.</center></th>
          <th><center>Nama Berkas / Dokumen</center></th>
          <th><center>Status</center></th>
          <th><center>Proses</center></th>
      </tr>
       </thead>
       <?php
       $uraian = "";
       $status = "";
       $no = 1;
       $ketrinci = "";
       foreach($bid as $it){
         switch ($rows['Keterangan']){
           case 'm0'   : $sql = "select * from v_naskah_vital where RegVitalId = '".$it."'  ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $ketrinci = rinci($rows['Item']);
                         $status = '<span class="text-red">[Dokumen Vital]</span>';
                         $uraian = $data['KatProdukName'].' >> '.$data['JProdukName'].' >> '.$data['DetailProdukName'].$ketrinci;
                         $uraian1 = $data['KatProdukName'].' >> '.$data['JProdukName'].' >> '.$data['DetailProdukName'];
                                break;
           case 'm1'   : $sql = "select * from v_naskah_vital_proof where RegVitalId = '".$it."'  ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $ketrinci = rinci($rows['Item']);
                         $status = '<span class="text-red">[Dokumen Vital]</span>';
                         $uraian = $data['KatProdukName'].' >> '.$data['JProdukName'].' >> '.$data['DetailProdukName'];
                                break;
           case 'm2'   : $sql = "select * from v_berkas_v1 where BerkasId = '".$it."'  ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $kodeklas = explode('-',$data['KlasBerkas']);
                         $status = '<span class="text-red">[Dokumen Vital]</span>';
                         $uraian = trim($kodeklas[0]).'/'.$data['Nomor'].' - '.$data['Nip'].'&nbsp;'.$data['Uraian'];
                                break;
           case 'm3'   : $sql = "select * from v_berkas_v2 where BerkasId = '".$it."'  ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $status = '<span class="text-red">[Dokumen Vital]</span>';
                         $uraian = $data['Ur'];
                                break;
           case 'm4'   : $sql = "select * from v_berkas_aktif where BerkasId = '".$it."' ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $status = '<span class="text-blue">[Dokumen Aktif]</span>';
                         $uraian = $data['Ur'];
                                break;
           case 'm5'   : $sql = "select * from v_berkas_inaktif where BerkasId = '".$it."' ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $status = '<span class="text-blue">[Dokumen Inaktif]</span>';
                         $uraian = $data['Ur'];
                                break;
          }

          echo "<tr>";
          echo "<td align='right'>".$no++.".</td>";
          echo "<td><b>".$uraian.'</b>'.$ketrinci."</td>";
          echo "<td><center>".$ketpinjam."</center></td>";
          echo '<td><center><button type="button" title="Proses Pengembalian Dokumen" onclick=pengembalian("'.$rows['PeminjamanId'].'"); class="btn btn-success btn-sm"><i class="fa fa-briefcase"></i></button></center></td>';
          echo "</tr>";
         }
       ?>
       </table>
       <br /><br />
         <?php

         $Xfile = explode(".",$rows['Filename']);

         if($Xfile[1]=='jpg' or $Xfile[1]=='png' or $Xfile[1]=='bmp') { ?>
              <center>
                  <img id="image" style="width: 50%" src="<?php echo $rows['Filename'] ?>"  alt="Picture">
              </center>
         <?php } else { ?>

                <!--<input id="zoomslider" class="zoomslider" type="range" min="0" max="100.00" step="1" ng-model="selectedRange">-->
                  <object data="<?php echo $rows['Filename'] ?>" type = "application/pdf" width="100%" height="400"  ></object>
         <?php } ?>
        </div>
     </div>
 </div>

 <?php
 mysqli_close($connect);

 function rinci($si){
 $cklist = "inline";
 $no = 1;
 $gd = explode('|',$si);
 $gabname = "";
    foreach($gd as $idis){
      $name = "Semua Item Dokumen";
      switch($idis){
        case 'sp' : $name = 'Spesimen';
                    break;
        case 'ut' : $name = "Uraian Teknis";
                    break;
        case 'st' : $name = 'Spesifikasi Teknis';
                    break;
        case 'pl' : $name = 'Dokumen Pendukung';
                    break;
      }
      $gabname .= '<br />'.$no++.'.&nbsp;<input type="checkbox" style="display: '.$cklist.'" name="chklist[]" values='.$idis.'>&nbsp;Dokumen&nbsp;'.$name;
    }
    $gabname = '<text class="text-blue">'.$gabname.'.</text>';
    return $gabname;
 }

  function hitungHari($awal,$akhir){
    $tglAwal = strtotime($awal);
    $tglAkhir = strtotime($akhir);
    $jeda = abs($tglAkhir - $tglAwal);
   return floor($jeda/(60*60*24));
  }
 ?>
