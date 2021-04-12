<?php
 session_start();
 include "../../conf.php";




 $sql = "select DateRange2 from v_peminjaman where PeminjamanId = '".$_GET['id']."' ";
 $result = mysqli_query($connect, $sql);
 $rows = mysqli_fetch_array($result);

 $limithari = hitungHari(date('Y-m-d'),$rows['DateRange2']);
 if($limithari < 0){
  $limithari = 0;
  $sql = "update peminjaman set StatusPinjam = '3' where PeminjamanId = '".$_GET['id']."' ";
  mysqli_query($connect, $sql);
 }

 $sql = "select ArsipPinjam, Keterangan, RoleId_To, StatusPinjam, Reservation1, Reservation2, Item, StatusPinjam, DateRange1, DateRange2 from v_peminjaman where PeminjamanId = '".$_GET['id']."' ";
 $result = mysqli_query($connect, $sql);
 $rows = mysqli_fetch_array($result);
 $bid = explode('|',$rows['ArsipPinjam']);

?>

 <div class="box box-primary">
     <div class="box-header">
         <i class="ion ion-clipboard"></i>
              <h3 class="box-title">Daftar Peminjaman Dokumen</h3>
     </div>
     <div class='alert'><b>Limit Peminjaman : <?php echo $rows['Reservation1'].' s.d '.$rows['Reservation2']; ?></b><br />
      <?php
        $list = 'none';
        if($rows['StatusPinjam']==1){ $list = 'inline'; ?>
        <i>Permohonan peminjaman dokumen telah di setujui.. silahkan klik</i>&nbsp;<span class='badge bg-blue'><i class='fa fa-suitcase text-yellow'></i></span>&nbsp;<i>untuk melihat dokumen</i>.
      <?php }elseif($rows['StatusPinjam']==2) {
      ?>
       <span class="text-red">Maaf.. Permohonan peminjaman dokumen tidak di setujui oleh pemilik dokumen.</span>
      <?php }elseif($rows['StatusPinjam']==3) { ?>
       <span class="text-red">Maaf.. Peminjaman dokumen telah berakhir.</span>
      <?php } ?>
     </div>
     <div class="col-md-12">
     <div class="box-body body-success">
        <ul class="todo-list">

       <?php
       $uraian = "";
       $status = "";
       $i = 0;
       foreach($bid as $it){
         switch ($rows['Keterangan']){
           case 'm0'   : $sql = "select * from v_naskah_vital where RegVitalId = '".$it."'  ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $gr = explode(',',$rows['Item']);
                         $ketrinci = rinci($gr[$i]);
                         $status = '<span class="text-red">[Dokumen Vital]</span>';
                         $uraian = $data['KatProdukName'].' >> '.$data['JProdukName'].' >> '.$data['DetailProdukName'].$ketrinci;
                                break;
           case 'm1'   : $sql = "select * from v_naskah_vital_proof where RegVitalId = '".$it."'  ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $gr = explode(',',$rows['Item']);
                         $ketrinci = rinci($gr[$i]);
                         $i++;
                         $status = '<span class="text-red">[Dokumen Vital]</span>';
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
                         $sql = "select Ur from v_berkas_v2 where BerkasId = '".$data['ParrentBerkasId']."' ";
                         $result = mysqli_query($connect, $sql);
                         $data1 = mysqli_fetch_array($result);
                         $id = $data['BerkasId'];
                         $uraian = $data1['Ur'].' >> '.$data['Ur'];
                                break;
           case 'm4'   : $sql = "select Ur from v_berkas_aktif where BerkasId = '".$it."' ";
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
       echo "<li>
              <span class=\"handle\">
                  <i class=\"fa fa-ellipsis-v\"></i>
                  <i class=\"fa fa-ellipsis-v\"></i>
              </span>";

              echo "<span class=\"text\">".$uraian."&nbsp;".$status."</span>";
              echo "<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <span style=display:".$list.";cursor:pointer onclick=viewdok('".$it."','".$rows['Keterangan']."','".$_GET['id']."') class='badge bg-blue'><i class='fa fa-suitcase text-yellow'></i>&nbsp;Lihat Detail</span>";

            //if($rows['StatusPinjam']=="1")

           echo "</li>";
       }
       ?>

          </ul>
         <?php if($rows['StatusPinjam']=="1"){ ?>
          <span style="padding-left: 10px" class='text-red'><u><b>(Limit time : <?php echo $limithari; ?> Hari)</b></u></span>
         <?php } ?>
       </div>
     </div>

     <?php

     if($limithari==0 and $rows['StatusPinjam']=='1'){
       $sql = "update peminjaman set StatusPinjam = '3' where PeminjamanId = '".$_GET['id']."' ";
       mysqli_query($connect,$sql);
       $rows['StatusPinjam'] = 3;
     }

     if( $_SESSION['RoleId'] == $rows['RoleId_To'] ){ ?>
     <div class="box-footer clearfix no-border">
         <button type="button" class="btn btn-default pull-right"><i class="fa fa-plus"></i> Approve</button>
     </div>
     <?php } ?>
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
  function hitungHari($awal,$akhir){
    $jeda = abs( strtotime($akhir) -  strtotime($awal));
   return floor($jeda/(60*60*24));
  }

   mysqli_close($connect);
 ?>
