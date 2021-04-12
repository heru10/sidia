<?php

session_start();

	/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
	 * Easy set variables
	 */

	/* Array of database columns which should be read and sent back to DataTables. Use a space where
	 * you want to insert a non-database field (for example a counter or static image)
	 */
	$aColumns = array('PeminjamanId', 'TglPinjam', 'TglKembali', 'Nip','Nama','UnitKerja', 'Catatan','ArsipPinjam', 'Item', 'TglReg', 'Keterangan', 'StatusPinjam', 'Nip_B', 'Nama_B', 'Catatan_B');

//	$aColumns = array( 'NId', 'NTipe', 'StatusReceive', 'Nomor', 'Hal', 'Tgl', 'InstansiPengirim' );

	/* Indexed column (used for fast and accurate table cardinality) */
	$sIndexColumn = "PeminjamanId";

	/* DB table to use */
	$sTable = "v_peminjaman_fisik";

	/* Database connection information   */
	include "../../conf.php";

	/*
	 * Paging
	 */
	$sLimit = "";
	if ( isset( $_GET['iDisplayStart'] ) && $_GET['iDisplayLength'] != '-1' )
	{
		$sLimit = "LIMIT ".intval( $_GET['iDisplayStart'] ).", ".
			intval( $_GET['iDisplayLength'] );
	}


	/*
	 * Ordering
	 */
	$sOrder = "";
	if ( isset( $_GET['iSortCol_0'] ) )
	{
		$sOrder = "ORDER BY  ";
		for ( $i=0 ; $i<intval( $_GET['iSortingCols'] ) ; $i++ )
		{
			if ( $_GET[ 'bSortable_'.intval($_GET['iSortCol_'.$i]) ] == "true" )
			{
				$sOrder .= "`".$aColumns[ intval( $_GET['iSortCol_'.$i] ) ]."` ".
					($_GET['sSortDir_'.$i]==='asc' ? 'asc' : 'desc') .", ";
			}
		}

		$sOrder = substr_replace( $sOrder, "", -2 );
		if ( $sOrder == "ORDER BY" )
		{
			$sOrder = "";
		}
	}


	/*
	 * Filtering
	 * NOTE this does not match the built-in DataTables filtering which does it
	 * word by word on any field. It's possible to do here, but concerned about efficiency
	 * on very large tables, and MySQL's regex functionality is very limited
	 */
	$sWhere = "";
	if ( isset($_GET['sSearch']) && $_GET['sSearch'] != "" )
	{
		$sWhere = "WHERE (";
		for ( $i=0 ; $i<count($aColumns) ; $i++ )
		{
			if ( isset($_GET['bSearchable_'.$i]) && $_GET['bSearchable_'.$i] == "true" )
			{
				$sWhere .= "`".$aColumns[$i]."` LIKE '%".$connect->real_escape_string( $_GET['sSearch'] )."%' OR ";
			}
		}
		$sWhere = substr_replace( $sWhere, "", -3 );
		$sWhere .= ')';
	}

	/* Individual column filtering */
	for ( $i=0 ; $i<count($aColumns) ; $i++ )
	{
		if ( isset($_GET['bSearchable_'.$i]) && $_GET['bSearchable_'.$i] == "true" && $_GET['sSearch_'.$i] != '' )
		{
			if ( $sWhere == "" )
			{
				$sWhere = "WHERE ";
			}
			else
			{
				$sWhere .= " AND ";
			}
			$sWhere .= "`".$aColumns[$i]."` LIKE '%".$connect->real_escape_string($_GET['sSearch_'.$i])."%' ";
		}
	}


	/*
	 * SQL queries
	 * Get data to display
	 */
	if ($sWhere=="") {
		$sQuery = "
			SELECT SQL_CALC_FOUND_ROWS ".str_replace(" , ", " ", implode(", ", $aColumns))."
			FROM   $sTable
			Where RoleId_Reg = '".$_SESSION['RoleId']."'
            Order by TglReg Desc
			$sLimit
		";
	} else {
		$sQuery = "
			SELECT SQL_CALC_FOUND_ROWS ".str_replace(" , ", " ", implode(", ", $aColumns))."
			FROM   $sTable
			$sWhere and RoleId_Reg = '".$_SESSION['RoleId']."'
			Order TglReg Desc
			$sLimit
			";
	}
    $rQuery = $sQuery;
	$rResult = mysqli_query($connect, $sQuery) or fatal_error( 'MySQL Error: ' . mysql_errno() );

	/* Data set length after filtering */
	$sQuery = "
		SELECT FOUND_ROWS()
	";
	$rResultFilterTotal = mysqli_query($connect, $sQuery) or fatal_error( 'MySQL Error: ' . mysql_errno() );
	$aResultFilterTotal = mysqli_fetch_array($rResultFilterTotal);
	$iFilteredTotal = $aResultFilterTotal[0];

	/* Total data set length */
	$sQuery = "
		SELECT COUNT(`".$sIndexColumn."`)
		FROM   $sTable
	";
	$rResultTotal = mysqli_query($connect, $sQuery) or fatal_error( 'MySQL Error: ' . mysql_errno() );
	$aResultTotal = mysqli_fetch_array($rResultTotal);
	$iTotal = $aResultTotal[0];


	/*
	 * Output
	 */
    if(isset($_GET['sEcho']))
      $sEcho = $_GET['sEcho'];
    else
      $sEcho = "";

	$output = array(
		"sEcho" => intval($sEcho),
		"iTotalRecords" => $iTotal,
		"iTotalDisplayRecords" => $iFilteredTotal,
		"aaData" => array()
	);
$no = 1;
while($aRow = mysqli_fetch_array($rResult)){

    $row = array();

       $uraian = "";
       $status = "";
       $noi = 1;
       $ketrinci = "";
       $bid = explode("|",$aRow['ArsipPinjam']);
       foreach($bid as $it){
         switch ($aRow['Keterangan']){
           case 'm0'   : $sql = "select * from v_naskah_vital where RegVitalId = '".$it."'  ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $ketrinci = rinci($aRow['Item']);
                         $status = '<span class="text-red">[Dokumen Vital]</span>';
                         $uraian = $data['KatProdukName'].' >> '.$data['JProdukName'].' >> '.$data['DetailProdukName'].$ketrinci;
                                break;
           case 'm1'   : $sql = "select * from v_naskah_vital_proof where RegVitalId = '".$it."'  ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $ketrinci = rinci($aRow['Item']);
                         $status = '<span class="text-red">[Dokumen Vital]</span>';
                         $uraian = $data['KatProdukName'].' >> '.$data['JProdukName'].' >> '.$data['DetailProdukName'];
                                break;
           case 'm2'   : $sql = "select * from v_berkas_v1 where BerkasId = '".$it."'  ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $kodeklas = explode('-',$data['KlasBerkas']);
                         $status = '<span class="text-red">[Dokumen Vital]</span>';
                         $uraian = trim($kodeklas[0]).'/'.$data['Nomor'].' - '.$data['Nip'].'&nbsp;'.$data['Uraian'];
                                break;
           case 'm3'   : $sql = "select * from v_berkas_v2 where BerkasId = '".$it."'  ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $status = '<span class="text-red">[Dokumen Vital]</span>';
                         $uraian = $data['Ur'];
                                break;
           case 'm4'   : $sql = "select * from v_berkas_aktif where BerkasId = '".$it."' ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $status = '<span class="text-blue">[Dokumen Aktif]</span>';
                         $uraian = $data['Ur'];
                                break;
           case 'm5'   : $sql = "select * from v_berkas_inaktif where BerkasId = '".$it."' ";
                         $result = mysqli_query($connect, $sql);
                         $data = mysqli_fetch_array($result);
                         $status = '<span class="text-blue">[Dokumen Inaktif]</span>';
                         $uraian = $data['Ur'];
                                break;
          }
       }

    if($aRow['StatusPinjam']==1){
      $status = '<center><button type="button" title="Proses Pengembalian Dokumen" data-toggle="modal" data-target="#modal-info" onclick=pengembalian("'. $aRow['PeminjamanId'] .'"); class="btn btn-success btn-sm"><i class="fa fa-briefcase"></i></button></center>';

    } else {
      $status = "<center><span>Sudah Kembali</span></center>";
    }

    $row[] .= '<div align="right">'.$no++.'.</div>';
    $row[] .= ''.$uraian.'';
    $row[] .= '<center>'.$aRow['TglPinjam'].'</center>';
    $row[] .= '<center>'.$aRow['TglKembali'].'</center>';
    $row[] .= ''.$aRow['Nip'].' / '.$aRow['Nama'].'<br /><span class="text-blue">Unit Kerja :'.$aRow['UnitKerja'].'</span><br />Catatan :'.$aRow['Catatan'];
    if($aRow['StatusPinjam']==0)
      $row[] .= ''.$aRow['Nip_B'].' / '.$aRow['Nama_B'].'<br /><span class="text-blue">Unit Kerja :'.$aRow['UnitKerja'].'</span><br />Catatan :'.$aRow['Catatan_B'];
    else
      $row[] .= '';
    $row[] .= ''.$status.'';
    $output['aaData'][] = $row;

}
mysqli_close($connect);
echo json_encode($output);

function rinci($si){
 $cklist = "inline";
 $noi = 1;
 $gd = explode('|',$si);
 $gabname = "";
    foreach($gd as $idis){
      $name = "Semua Item Dokumen";
      switch($idis){
        case 'sp' : $name = 'Spesimen';
                    break;
        case 'ut' : $name = "Uraian Teknis";
                    break;
        case 'st' : $name = 'Spesifikasi Teknis';
                    break;
        case 'pl' : $name = 'Dokumen Pendukung';
                    break;
      }
      //$gabname .= '<br />'.$noi++.'.&nbsp;<input type="checkbox" style="display: '.$cklist.'" name="chklist[]" values='.$idis.'>&nbsp;Dokumen&nbsp;'.$name;
      $gabname .= '<br />'.$noi++.'.'.$name;
    }
    if($noi==2)
       $gabname = str_replace("1.","",$gabname);
    $gabname = '<text class="text-blue">'.$gabname.'.</text>';
    return $gabname;
 }




?>
