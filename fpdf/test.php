<?php
use setasign\Fpdi\Fpdi;
use setasign\Fpdi\PdfReader;
require('fpdf.php');
require_once('src/autoload.php');
require('code128.php');

 class Genpdf extends Fpdf{
    public function __construct()
    {
       parent::__construct();
    }
    public function build()
    {
       $this->AddPage();
       $this->SetFont('3of9','B',16);
       $this->Cell(40,10,'¡Hola, Mundo!');
       $this->Output();
    }
}
$pdf = new Fpdi();
$pageCount = $pdf->setSourceFile('test1.pdf');
$pdf->SetY(15);
for ($i = 1; $i <= $pageCount; $i++) {
    $tplIdx = $pdf->importPage($i, '/MediaBox');
    $pdf->AddPage();
    $pdf->useTemplate($tplIdx, 5,15,195);

// Instanciation of inherited class
//$pdf = new PDF();

    $pdf->AliasNbPages();
    $pdf->SetFont('times','I',10);
    $pdf->SetTextColor(192, 192, 192);
    $pdf->Cell(0,0,'M-9981726612',0,10);
    $pdf->writeHTML($data_body_chunk, true, false, false, false, '');
    $pdf->Output();
 }


?>