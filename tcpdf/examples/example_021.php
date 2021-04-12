<?php

require_once('tcpdf_include.php');


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
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 7);
        // Page number
        $this->Cell(0, 10, 'sumber : perum.peruri/Departemen Pengendalian Kualitas - Tanggal Terbit : 05-07-2018 08:09:56', 0, false, 'L', 0, '', 0, false, 'T', 'M');
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
$pdf->SetTitle('TCPDF Example 003');
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
$pdf->AddPage();

// create some HTML content
$html = '<hr/>
        <br />
        <table border="0">
           <tr>
             <td align="center">
               <b>DAFTAR DOKUMEN VITAL</b><br />
               Departemen Pengendalian Kualitas<br />
               <i>Periode : 01 Januari 2018 s.d 30 Desember 2018</i>
             </td>
           </tr>
        </table>
        <br /><br />
        <table width="100%" border="1" cellspacing="0" cellpadding="3">
              <tr>
                <td width="5%"><div align="center"><b>No.</b></div></td>
                <td width="25%"><div align="center"><b>Kategori Produk</b></div></td>
                <td width="25%"><div align="center"><b>Jenis Produk</b></div></td>
                <td width="25%"><div align="center"><b>Detail Produk</b></div></td>
                <td width="20%"><div align="center"><b>Tahun</b></div></td>
              </tr>
               <tr>
                 <td align="right">&nbsp;1.</td>
                 <td>&nbsp;Captive</td>
                 <td>&nbsp;Meterai</td>
                 <td>&nbsp;Rp. 3000</td>
                 <td align="center">2008</td>
               </tr>
         </table>
         ';
// output the HTML content
$pdf->writeHTML($html, true, 0, true, 0);

// reset pointer to the last page
$pdf->lastPage();

// ---------------------------------------------------------

//Close and output PDF document
$pdf->Output('example_021.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+
?>