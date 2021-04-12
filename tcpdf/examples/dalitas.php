<?php
	
if ($_POST['kategori']==null or $_POST['kategori']==''){
	 $wherekat = "";
 }else{
	$wherekat = "and KatProdukId ='".$_POST['kategori']."'";
 }

 if ( (trim($_POST['thn1'])==null or trim($_POST['thn1'])=='') and (trim($_POST['thn2'])==null or trim($_POST['thn2'])=='')){
	$whereth = "Tahun BETWEEN '".$_POST['thn1']."' and '".$_POST['thn2']."'"; 
		 if ($_POST['kategori']==null or $_POST['kategori']==''){
			$thstrip = "or (tahun='-')";
		 }else{
			$thstrip = "and (tahun='-')";
		 }
 }else{
	 $whereth ="Tahun BETWEEN '".$_POST['thn1']."' and '".$_POST['thn2']."'" ;
	 $thstrip = "";
 }
 


 $sql = "select * from v_naskah_vital where $whereth $wherekat $thstrip";


 //query asli
 //$sql = "select * from v_naskah_vital where Tahun BETWEEN '".$_POST['thn1']."' and '".$_POST['thn2']."' ";
 $result = mysqli_query($connect, $sql);

 if(mysqli_num_rows($result)==0){
     echo "<script>alert('Tidak ditemukan berkas dokumen di tahun tersebut !');</script>";
     die("<script>window.close();</script>");
 }

 $html ='<hr/>
        <br />
        <table border="0">
           <tr>
             <td align="center">
               <br />
               <b>DAFTAR DOKUMEN VITAL</b><br />
               '.$_SESSION['RoleName'].'<br />
               <i>Periode : '.$_POST['thn1'].' s.d '.$_POST['thn2'].'</i>
             </td>
           </tr>
        </table>
        <br /><br />
        <table width="100%" border="1" cellspacing="0" cellpadding="3">
              <tr>
                <td width="5%"><div align="center"><b>No.</b></div></td>
                <td width="20%"><div align="center"><b>Kategori Produk</b></div></td>
                <td width="25%"><div align="center"><b>Jenis Produk</b></div></td>
                <td width="25%"><div align="center"><b>Detail Produk</b></div></td>
                <td width="8%"><div align="center"><b>Tahun</b></div></td>
                <td width="20%"><div align="center"><b>Lokasi Simpan</b></div></td>
              </tr>';
              $no = 1;
              while($arows = mysqli_fetch_array($result)){

$html .=      '<tr>
                 <td align="right">&nbsp;'.$no++.'.</td>
                 <td>'.$arows["KatProdukName"].'</td>
                 <td>'.$arows["JProdukName"].'</td>
                 <td>'.$arows["DetailProdukName"].'</td>
                 <td align="center">'.$arows["Tahun"].'</td>
                 <td align="center">'.$arows["Lokasi_Simpan"].'</td>
               </tr>';
              }
$html .=       '</table>';

 mysqli_close($connect);
?>