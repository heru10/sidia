<?php
 include "../../conf.php";

 $sql = "SELECT *,
         (select concat(klasifikasi.ClCode,' - ',klasifikasi.ClName) from klasifikasi where klasifikasi.ClId = k.ClParentId) as ClInduk
         FROM klasifikasi k
         RIGHT JOIN master_susut ON master_susut.SusutId = k.SusutId
         RIGHT JOIN master_klaskeamanan ON master_klaskeamanan.ClKeamanan = k.ClKeamanan
         where ClId = '".$_GET['id']."' ";

 $result = mysqli_query($connect, $sql);
 $rows = mysqli_fetch_array($result);
 $html = "";
 $html = '<div class="col-md-12">
            <div class="box box-success">
             <div class="box-header with-border">
                 <h4 class="box-title">Detail Klasifikasi Dokumen</h4>
             </div>
             <div class="box-body">
             <small>
           <table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px; width= 80%">';
 $html .= '<tr><td style="width: 15%">Klasifikasi Induk</td><td style="width: 1%">:</td><td style="width: 86%">'.$rows['ClInduk'].'</td></tr>';
           if(empty($rows['ClDesc']))
             $desc = '-';
           else
             $desc = $rows['ClDesc'];
 $html .= '<tr><td>Deskripsi Klasifikasi</td><td>:</td><td>'.$desc.'</td></tr>';

           if($rows['CIStatus']==1)
             $status = "Aktif";
           else
             $status = "Tidak Aktif";

 $html .= '<tr><td>Status</td><td>:</td><td>'.$status.'</td></tr>';
 //$html .= '<tr><td>Tingkat Akses</td><td>:</td><td>'.$rows['KeamananName'].'</td></tr>';

          $hakakses = explode("#",$rows['HakAkses']);
          $hk = "";
          foreach($hakakses as $h){
            $sql = "select GroupName from groupjabatan where GroupId = '".$h."' ";
            $result = mysqli_query($connect, $sql);
            $hk .= mysqli_fetch_array($result)[0].", ";
          }
            $hk = substr($hk,0,-2);

          if(empty($rows['DasarPertimbang']))
             $Dtimbang = "-";
          else
             $Dtimbang = $rows['DasarPertimbang'];

 //$html .= '<tr><td>Hak Akses</td><td>:</td><td>'.$hk.'</td></tr>';
 //$html .= '<tr><td>Dasar Pertimbangan</td><td>:</td><td>'.$Dtimbang.'</td></tr>';

   $sql = "SELECT role.RoleName, role_klasifikasi.ClId FROM role_klasifikasi
           INNER JOIN role ON role.RoleId = role_klasifikasi.RoleId
           where role_klasifikasi.ClId = '".$_GET['id']."' ";
   $res = mysqli_query($connect, $sql);
   $unitkerja = "";
   while($r = mysqli_fetch_array($res))
     $unitkerja .= $r['RoleName'].", ";

  $unitkerja = substr($unitkerja,0,-2);


 $html .= '<tr><td>Unit Pengolah</td><td>:</td><td>'.$unitkerja.'</td></tr>';
 $html .= '</table></small></div></div></div>';
 echo $html;
?>