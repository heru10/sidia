<?php
 session_start();
 include "../../conf.php";

 if(isset($_GET['task']))
  $task = $_GET['task'];

 $aktif=0;
 $jmlvital=0;
 if($task=='lgraph'){
   $sql = "select BerkasId from v_berkas_aktif where RoleId = '".$_SESSION['RoleId']."' ";
   $aktif = mysqli_num_rows(mysqli_query($connect, $sql));
   $aktif['jml_aktif'];
   $sql = "select BerkasId from v_berkas_inaktif where RoleId = '".$_SESSION['RoleId']."' ";
   $inaktif = mysqli_num_rows(mysqli_query($connect, $sql));
   $inaktif['jml_inaktif'];

  $menu = explode("#",$_SESSION['Menu']);

  foreach($menu as $lmenu){
   switch($lmenu){
     case "m0" : $sql = "select RegVitalId from v_naskah_vital where RoleId = '".$_SESSION['RoleId']."' ";
                 $jmlvital = mysqli_num_rows(mysqli_query($connect, $sql));
                 break;
     case "m1" : $sql = "select RegVitalId from v_naskah_vital_proof where RoleId = '".$_SESSION['RoleId']."' ";
                 $jmlvital = mysqli_num_rows(mysqli_query($connect, $sql));
                 break;
     case "m2" : $sql = "select BerkasId from v_berkas_v1 where RoleId = '".$_SESSION['RoleId']."' ";
                 $jmlvital = mysqli_num_rows(mysqli_query($connect, $sql));
                 break;
     case "m3" : $sql = "select BerkasId from v_berkas_v2 where RoleId = '".$_SESSION['RoleId']."' ";
                 $jmlvital = mysqli_num_rows(mysqli_query($connect, $sql));
                 break;
   }

 }
   $sqls = "select PeminjamanId from v_peminjaman_fisik where RoleId_Reg = '".$_SESSION['RoleId']."' ";
   $pinjam = mysqli_num_rows(mysqli_query($connect, $sqls));

   echo $aktif."#".$inaktif."#".$jmlvital."#".$pinjam;
 }


 if($task=='lpinjam'){
   $sql = "select Dari, TglReg from v_peminjaman where RoleId_To = '".$_SESSION['RoleId']."' and StatusPinjam = '0' ";
   $result = mysqli_query($connect, $sql);
   $jk = mysqli_num_rows($result);
   $urls = "pageurl('page/pagepersetujuan/regpersetujuan.php')";
   if($jk!=0){
     $no=1;
     while($disp = mysqli_fetch_array($result)){
         echo "<tr>";
         echo "<td align='right'>".$no++.".</td>";
         echo "<td><small>".$disp[1]."</small><br />".$disp[0]."</td>";
         echo '<td><center><span style="cursor: pointer" onclick='.$urls.' class="badge bg-red"><text class="blink"><i class="fa fa-comments"></i></text></span></center></td>';
         echo "</tr>";

     }
  }
}




?>