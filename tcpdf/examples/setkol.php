<?php
 $sql = "select * from v_berkas_v2 where KurunWaktu BETWEEN '".$_POST['thn1']."' and '".$_POST['thn2']."'
         order by KurunWaktu Desc, Nomor Asc ";
 $result = mysqli_query($connect, $sql);

if(mysqli_num_rows($result)==0){
     echo "<script>alert('Tidak ditemukan berkas dokumen di tahun tersebut !');</script>";
     die("<script>window.close();</script>");
}

 $html = '<hr/>
        <br />
        <table border="0">
           <tr>
             <td align="center">
               <b>DAFTAR DOKUMEN VITAL</b><br />'. $_SESSION['RoleName'] .' <br />
               <i>Periode : '.$_POST['thn1'].' s.d '.$_POST['thn2'].'</i>
             </td>
           </tr>
        </table>
        <br /><br />
        <table width="100%" border="1" cellspacing="0" cellpadding="3">
              <tr>
                <td width="5%"><div align="center"><b>No.</b></div></td>
                <td width="25%"><div align="center"><b>Kode Klasifikasi</b></div></td>
                <td width="10%"><div align="center"><b>Nomor Berkas</b></div></td>
                <td width="30%"><div align="center"><b>Uraian</b></div></td>
                <td width="10%"><div align="center"><b>Kurun Waktu</b></div></td>
                <td width="10%"><div align="center"><b>Jumlah</b></div></td>
                <td width="10%"><div align="center"><b>Kondisi</b></div></td>
              </tr>';

         $no = 1;
         While($rows = mysqli_fetch_array($result)){

         $sdl = "select dokumen_v2.Jumlah, master_satuanarsip.SatuanArsip From dokumen_v2
                 inner join  master_satuanarsip ON master_satuanarsip.SatuanId =   dokumen_v2.SatuanId
                 where BerkasId = '".$rows['BerkasId']."' ";
         $res = mysqli_query($connect, $sdl);
         $arows = mysqli_fetch_array($res);

           if(!empty($rows['Nip']))
              $uraian = $rows['Nip']."-".$rows['Uraian'];
           else
              $uraian = $rows['Uraian'];

$html .=     '<tr>
                 <td align="right">'.$no++.'.</td>
                 <td>'.$rows['KlasBerkas'].'</td>
                 <td><div align="center">'.$rows['Nomor'].'</div></td>
                 <td>'.$uraian.'</td>
                 <td><div align="center">'.$rows['KurunWaktu'].'</div></td>
                 <td><div align="center">'.$arows['Jumlah'].'&nbsp;'.$arows['SatuanArsip'].'</div></td>
                 <td>'.$rows['KondisiName'].'</td>
               </tr>';
      }

$html .= '</table>';


?>