<?php
require('fpdf.php');
$tgl = date('d-M-Y');
$pdf = new FPDF();
$pdf->Open();
$pdf->addPage();
$pdf->setAutoPageBreak(false);
$pdf->setFont('Arial','',12);
$pdf->text(50,30,'SMA NEGERI 1 BUKIT');
$pdf->text(50,36,'BENER MERIAH ACEH');
$yi = 50;
$ya = 44;
$pdf->setFont('Arial','',9);
$pdf->setFillColor(222,222,222);
$pdf->setXY(10,$ya);
$pdf->CELL(6,6,'NO',1,0,'C',1);
$pdf->CELL(25,6,'NIS',1,0,'C',1);
$pdf->CELL(50,6,'NAMA SISWA',1,0,'C',1);
$pdf->CELL(50,6,'ALAMAT',1,0,'C',1);
$ya = $yi + $row;
$sql = mysql_query("select *from tblsiswa order by nis");
$i = 1;
$no = 1;
$max = 31;
$row = 6;
while($data = mysql_fetch_array($sql)){
$pdf->setXY(10,$ya);
$pdf->setFont('arial','',9);
$pdf->setFillColor(255,255,255);
$pdf->cell(6,6,$no,1,0,'C',1);
$pdf->cell(25,6,$data[nis],1,0,'L',1);
$pdf->cell(50,6,$data[nama_siswa],1,0,'L',1);
$pdf->CELL(50,6,$data[tempat_lahir],1,0,'L',1);
$ya = $ya+$row;
$no++;
$i++;
$dm[kode] = $data[kdprog];
}
$pdf->text(100,$ya+6,"BENER MERIAH , ".$tgl);
$pdf->text(100,$ya+18,"KEPALA SEKOLAH");
$pdf->output();
?>
?>