<?php
session_start();
require_once('../../conf.php');
require_once('tcpdf_include.php');

if($_POST['thn1'] > $_POST['thn2']){
  echo "<script>alert('Tahun Awal tidak boleh lebih besar dari Tahun Akhir !');</script>";
  die("<script>window.close();</script>");
}

// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF {

    //Page header
    public function Header() {
        // Logo
        $image_file = K_PATH_IMAGES.'peruri.jpg';
        $this->Image($image_file, 13, 5, 30, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);

    }

    // Page footer
    public function Footer() {
        $datenow = date('d-m-Y H:i:s');
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 7);
		
		switch($_POST['txtm']){
		  case 'm0' : $unit_kerja = "Departemen Laboratorium";
					  break;
		  case 'm1' : $unit_kerja = "Desain dan Proof";
					  break;
		  case 'm2' : $unit_kerja = "HRO";
					  break;
		  case 'm3' : $unit_kerja = "Setkol";
				break;
		}
		
        // Page number
        $this->Cell(0, 10, "sumber : perum.peruri/$unit_kerja - Tanggal Cetak : ".$datenow, 0, false, 'L', 0, '', 0, false, 'T', 'M');
        $this->SetY(-20);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
    }
}

// create new PDF document
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Nicola Asuni');
$pdf->SetTitle('Report Dokumen');
$pdf->SetSubject('TCPDF Tutorial');
$pdf->SetKeywords('TCPDF, PDF, example, test, guide');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING);

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
    require_once(dirname(__FILE__).'/lang/eng.php');
    $pdf->setLanguageArray($l);
}

// ---------------------------------------------------------

// set font
$pdf->SetFont('helvetica', '', 10);

// add a page

$type = 'P';
switch($_POST['txtm']){
  case 'm0' : $url = "dalitas.php";
              break;
  case 'm1' : $url = "sainproof.php";
              break;
  case 'm2' : $url = "osdm.php";
              break;
  case 'm3' : $url = "setkol.php";
              break;
  case 'm4' : $url = "aktif.php";
              $type = 'P';
              break;
  case 'm5' : $url = "inaktif.php";
              break;
}

include_once($url);

$pdf->AddPage($type,'A4');

$pdf->writeHTML($html, true, 0, true, 0);

// reset pointer to the last page
$pdf->lastPage();

// ---------------------------------------------------------
//Close and output PDF document
$pdf->Output('cetak.pdf','I');

//============================================================+
// END OF FILE
//============================================================+
die ("<script>print();</script>");
?>