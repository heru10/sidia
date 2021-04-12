<?php
session_start();
date_default_timezone_set("Asia/Bangkok");
use setasign\Fpdi\Fpdi;
use setasign\Fpdi\PdfReader;
require('fpdf.php');
require_once('src/autoload.php');
require('code128.php');


$filer="";
if(isset($_POST['filename'])){
  $filer = "../".$_POST['filename'];
  $kode = $_POST['code'];
  $extf = explode("/",$_POST['filename']);
  $extg = explode(".",$extf[3]);

  if($extg[1]=='pdf')
    $pdfile = $extg[1];
  else
    $pdfile = "image";
}else
 $_POST['filename'] = "";

class PDF_JavaScript extends FPDI {

    var $javascript;
    var $n_js;

    function IncludeJS($script) {
        $this->javascript=$script;
    }

    function _putjavascript() {
        $this->_newobj();
        $this->n_js=$this->n;
        $this->_out('<<');
        $this->_out('/Names [(EmbeddedJS) '.($this->n+1).' 0 R]');
        $this->_out('>>');
        $this->_out('endobj');
        $this->_newobj();
        $this->_out('<<');
        $this->_out('/S /JavaScript');
        $this->_out('/JS '.$this->_textstring($this->javascript));
        $this->_out('>>');
        $this->_out('endobj');
    }

    function _putresources() {
        parent::_putresources();
        if (!empty($this->javascript)) {
            $this->_putjavascript();
        }
    }

    function _putcatalog() {
        parent::_putcatalog();
        if (!empty($this->javascript)) {
            $this->_out('/Names <</JavaScript '.($this->n_js).' 0 R>>');
        }
    }
}

class PDF_AutoPrint extends PDF_JavaScript
{
    function AutoPrint($dialog=false)
    {
        //Open the print dialog or start printing immediately on the standard printer
        $param=($dialog ? 'true' : 'false');
        $script="print($param);";
        $this->IncludeJS($script);
    }

    function AutoPrintToPrinter($server, $printer, $dialog=false)
    {
        $script = "document.contentWindow.print();";
        $this->IncludeJS($script);
    }
}


//$pdf=new PDF_AutoPrint();
//$pdf = new PDF_Code128();

if($pdfile == "pdf"){
try{
$pdf = new Fpdi();
$pageCount = $pdf->setSourceFile($filer);
$pdf->SetY(15);
for ($i = 1; $i <= $pageCount; $i++) {
    $tplIdx = $pdf->importPage($i, '/MediaBox');
    $pdf->AddPage();
    $pdf->useTemplate($tplIdx, 5,15,195);

// Instanciation of inherited class
//$pdf = new PDF();

    $pdf->AliasNbPages();
    $pdf->SetFont('Times','I',10);
    $pdf->SetTextColor(192, 192, 192);
    $pdf->Cell(0,0,$kode,0,10);
    $pdf->Output('D', code('pr_',7).'.pdf');
 }
}catch (Exception $e) {
    die("<script>alert('Maaf.. File tidak bisa di download !!');</script>");
  }
} else {
 try{
       $pdf = new PDF_Code128();
       //die('<script>alert("File tidak dapat didownload"); window.history.back();</script>');
       $pdf->AddPage();
       $pdf->Image($filer,10,18,190,195);
       $pdf->SetFont('Times','I',10);
       $pdf->SetTextColor(192, 192, 192);
       //$bar = code('peruri_',15);
       $pdf->Code128(5,5,$kode,100,7);
       $pdf->Output('D', code('pr_',7).'.pdf');

 }catch (Exception $e) {
    die("<script>alert('Maaf.. File tidak bisa di download !!');</script>");
  }
}



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

