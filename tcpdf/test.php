<?php
use setasign\Fpdi;

require_once('tcpdf.php');
require_once('src/autoload.php');

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
    'text' => false,
    'font' => 'helvetica',
    'fontsize' => 8,
    'stretchtext' => 4
);
// initiate PDF
$pdf = new Pdf();
$pdf->SetMargins(PDF_MARGIN_LEFT, 40, PDF_MARGIN_RIGHT);
$pdf->SetAutoPageBreak(true, 40);

$pdf->SetDisplayMode('fullpage', 'SinglePage', 'UseNone');
$pageCount = $pdf->setSourceFile('sk.pdf');
for ($i = 1; $i <= $pageCount; $i++) {
$tplIdx = $pdf->importPage($i,'/MediaBox');
$pdf->AddPage('P', 'A4');
$pdf->useImportedPage($tplIdx,0, 3, 220);

$pdf->SetFont('freesans', 'B', 12);
$pdf->SetTextColor(0);
$pdf->SetXY(PDF_MARGIN_LEFT, 0);

$pdf->SetY(4);
$pdf->SetX(4);
$pdf->write1DBarcode('M-88712876', 'C128', '', '', '', 13, 0.4, $style, 'N');
$pdf->Ln();
}
// get external file content
//$utf8text = file_get_contents('tcpdf/examples/data/utf8test.txt', true);

$pdf->SetFont('freeserif', '', 12);
// now write some text above the imported page
//$pdf->Write(5, $utf8text);

$pdf->Output(code('pr_',7).'.pdf','D');


  function code($symbol, $panjang)
  {
  $karakter= '123456789098765432106856845634234401234234626362343724634524210423523523231212454634622341425346342342344';
  $string = '';
  for ($i = 0; $i < $panjang; $i++)
  { $pos = rand(0, strlen($karakter)-1);
//     if($i==2)
//     $string .= $karakter{$pos};
//     else
     $string .= $karakter{$pos};
  }
     $string = $symbol.$string;
     return $string;
}

?>