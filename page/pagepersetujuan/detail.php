<?php
 session_start();
 include "../../conf.php";

 $sql = "select ArsipPinjam, Keterangan, RoleId_To, StatusPinjam, Reservation1, Reservation2, Item from v_peminjaman where PeminjamanId = '".$_GET['id']."' ";
 $result = mysqli_query($connect, $sql);
 $rows = mysqli_fetch_array($result);
 $bid = explode('|',$rows['ArsipPinjam']);

//
// $html = '<div class="col-md-12">
//            <div class="box box-success">
//             <div class="box-body"><div class="col-md-6">';
// $html .= ' <table class="table table-striped">
//                <tr class="bg-blue">
//                  <th style="width: 10px">#</th>
//                  <th style="width: 25%"><center>Nomor Berkas</center></th>
//                  <th><center>Uraian</center></th>
//                </tr>';
//  $no = 1;
//
// if($rows['Keterangan']=='aktif' or $rows['Keterangan']=='inaktif'){
//  foreach($bid as $b){
//    $sql = "select BerkasId, Uraian from berkas where BerkasId= '".$b."' ";
//    $resulte = mysqli_query($connect, $sql);
//    $arows = mysqli_fetch_array($resulte);
//
//    if(strlen($arows['BerkasId'])==1)
//       $Nober = "00".$arows['BerkasId'];
//    if(strlen($arows['BerkasId'])==2)
//       $Nober = "0".$arows['BerkasId'];
//
//    $html .= '<tr><td align="right">'.$no.'.</td><td align="right">'.$Nober.'</td><td>'.$arows['Uraian'].'</td></tr>';
//    $no++;
//  }
// }
//
// if($rows['Keterangan']=='vital_proof' or $rows['Keterangan']=='vital_kualitas'){
//   foreach($bid as $b){
//    $sql = "select * from v_naskah_vital_proof where RegVitalId= '".$b."' ";
//    $resulte = mysqli_query($connect, $sql);
//    $arows = mysqli_fetch_array($resulte);
//
//    $uraian = $arows['KatProdukName']."/".$arows['JProdukName']."/".$arows['DetailProdukName'];
//
//    $html .= '<tr><td align="right">'.$no.'.</td><td align="right">-</td><td>'.$uraian.'</td></tr>';
//    $no++;
//  }
// }
// $html .= '</table></div></div></div></div>';
// echo $html;
?>

 <div class="box box-primary">
     <div class="box-header">
         <i class="ion ion-clipboard"></i>
              <h3 class="box-title">Daftar Peminjaman Dokumen</h3>
     </div>
     <div class='alert'><b>Limit Peminjaman : <?php echo $rows['Reservation1'].' s.d '.$rows['Reservation2']; ?></b></div>
     <div class="col-md-8">
     <div class="box-body body-success">
        <ul class="todo-list">

       <?php
       $uraian = "";
       $i = 0;
       foreach($bid as $it){
         switch ($rows['Keterangan']){
           case 'm0'   : $sql = "select * from v_naskah_vital where RegVitalId = '".$it."'  ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $id = $data['RegVitalId'];
                         $gr = explode(',',$rows['Item']);
                         $ketrinci = rinci($gr[$i]);
                         $i++;
                         $uraian = $data['KatProdukName'].' >> '.$data['JProdukName'].' >> '.$data['DetailProdukName'].$ketrinci;
                                break;
           case 'm1'   : $sql = "select * from v_naskah_vital_proof where RegVitalId = '".$it."'  ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $id = $data['RegVitalId'];
                         $gr = explode(',',$rows['Item']);
                         $ketrinci = rinci($gr[$i]);
                         $i++;
                         $uraian = $data['KatProdukName'].' >> '.$data['JProdukName'].' >> '.$data['DetailProdukName'].$ketrinci;
                                break;
           case 'm2'   : $sql = "select * from v_berkas_v1 where BerkasId = '".$it."' ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $sql = "select * from v_berkas_v1 where BerkasId = '".$data['ParrentBerkasId']."' ";
                         $result = mysqli_query($connect, $sql);
                         $data1 = mysqli_fetch_array($result);
                         $kodeklas = explode('-',$data['KlasBerkas']);
                         $status = '<span class="text-red">[Dokumen Vital]</span>';
                         $uraian = ''.$data1['Nip'].'.'.$data1['Uraian'].' >> '.trim($kodeklas[0]).'/'.$data['Nomor'].' - '.$data['Uraian'];
                                break;
           case 'm3'   : $sql = "select * from v_berkas_v2 where BerkasId = '".$it."'  ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $sql = "select * from v_berkas_v2 where BerkasId = '".$data['ParrentBerkasId']."' ";
                         $result = mysqli_query($connect, $sql);
                         $data1 = mysqli_fetch_array($result);
                         $id = $data['BerkasId'];
                         $uraian = $data1['Ur'].' >> '.$data['Ur'];
                                break;
          case 'm4'   :  $sql = "select * from v_berkas_aktif where BerkasId = '".$it."' ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $status = '<span class="text-blue">[Dokumen Aktif]</span>';
                         $uraian = $data['Ur'];
                                break;
          case 'm5'   :  $sql = "select * from v_berkas_inaktif where BerkasId = '".$it."' ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $status = '<span class="text-blue">[Dokumen Inaktif]</span>';
                         $uraian = $data['Ur'];
                                break;
         }
       echo "<li>
              <span class=\"handle\">
                  <i class=\"fa fa-ellipsis-v\"></i>
                  <i class=\"fa fa-ellipsis-v\"></i>
              </span>";

              echo "<span class=\"text\">".$uraian."</span>";

            if($rows['StatusPinjam']=="1")

           echo "</li>";
       }
       ?>
          </ul>
        </div>
     </div>
 </div>
 <?php

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

 ?>