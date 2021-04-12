<?php
session_start();
use setasign\Fpdi;

require_once('../conf.php');
require_once('tcpdf.php');
require_once('tcpdf.php');
require_once('src/autoload.php');
ini_set('memory_limit', '640M');

$filer="";
$pdfile="";
if(isset($_REQUEST['filename'])){
  $filer = "../".$_REQUEST['filename'];
  $kode = $_REQUEST['code'];
  $extf = explode("/",$_REQUEST['filename']);
  $extg = explode(".",$extf[3]);

  if($extg[1]=='pdf')
    $pdfile = $extg[1];
  else
    $pdfile = "image";
}else
 $_REQUEST['filename'] = "";


class Pdf extends Fpdi\TcpdfFpdi
{
    /**
     * "Remembers" the template id of the imported page
     */
    protected $tplId;

    /**
     * Draw an imported PDF logo on every page
     */
    function Header()
    {
//        if (is_null($this->tplId)) {
//            $this->setSourceFile('surat_pernyataan.pdf');
//            $this->tplId = $this->importPage(1);
//        }
//        $size = $this->useImportedPage($this->tplId,0, 3, 220);
//
//        $this->SetFont('freesans', 'B', 12);
//        $this->SetTextColor(0);
//        $this->SetXY(PDF_MARGIN_LEFT, 0);
        //$this->Cell(0, $size['height'], 'TCPDF and FPDI');
    }

    function Footer()
    {
        // emtpy method body

    }
}


$style = array(
    'position' => '',
    'align' => 'C',
    'stretch' => false,
    'fitwidth' => true,
    'cellfitalign' => '',
    'border' => true,
    'hpadding' => 'auto',
    'vpadding' => 'auto',
    'fgcolor' => array(0,0,0),
    'bgcolor' => false, //array(255,255,255),
    'text' => true,
    'font' => 'helvetica',
    'fontsize' => 8,
    'stretchtext' => 4
);
// initiate PDF
$pdf = new Pdf();
$pdf->SetMargins(PDF_MARGIN_LEFT, 40, PDF_MARGIN_RIGHT);
$pdf->SetAutoPageBreak(true, 40);

$pdf->SetDisplayMode('fullpage', 'SinglePage', 'UseNone');
if($pdfile == "pdf"){
 try{
    $pageCount = $pdf->setSourceFile($filer);
        for ($i = 1; $i <= $pageCount; $i++) {
            $tplIdx = $pdf->importPage($i,'/MediaBox');
            $pdf->AddPage('P', 'F4');
            $pdf->useImportedPage($tplIdx,0, 20, 220);

            $pdf->SetFont('freesans', 'B', 12);
            $pdf->SetTextColor(0);
            $pdf->SetXY(PDF_MARGIN_LEFT, 0);
            $pdf->SetY(4);
            $pdf->SetX(4);
            $pdf->write1DBarcode($kode, 'C128', '', '', '', 13, 0.4, $style, 'N');
            $pdf->SetFont('freesans', '', 9);
            $pdf->Cell(0, 5, 'Klasifikasi keamanan: rahasia', 0, 0);
            $pdf->Ln();
        }
  }catch (Exception $e) {
    die("<script>alert('Maaf.. File tidak bisa di download !!');</script>");
  }
} else {
  try{
    $pdf->AddPage();
    $pdf->SetY(4);
    $pdf->SetX(4);
    $pdf->write1DBarcode($kode, 'C128', '', '', '', 13, 0.4, $style, 'N');
    $pdf->SetFont('freesans', '', 9);
    $pdf->Cell(0, 5, 'Klasifikasi keamanan: rahasia', 0, 0);
    $pdf->setJPEGQuality(75);
    $pdf->SetXY(15, 60);
    //$pdf->Image('IMG_20171215_152139.jpg', '', '', 40, 40, '', '', 'T', false, 300, '', false, false, 1, false, false, false);
    $pdf->Image($filer, 10, 25, 152, 0, 'JPG', '', '', true, 100);
  }catch (Exception $e) {
    die("<script>alert('Maaf.. File tidak bisa di download !!');</script>");
  }
}
$pdf->SetFont('freeserif', '', 12);

$pdf->Output(code('pr_',7).'.pdf','D');
//$pdf->Output(code('pr_',7).'.pdf','I');
//$pdf->Output();

logdok($filer, $kode);

?>