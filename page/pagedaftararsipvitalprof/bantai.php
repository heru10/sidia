<?php

session_start();

	/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
	 * Easy set variables
	 */

	/* Array of database columns which should be read and sent back to DataTables. Use a space where
	 * you want to insert a non-database field (for example a counter or static image)
	 */
	$aColumns = array('RegVitalId','KatProdukName','JProdukName','DetailProdukName','Tahun','Kode');

//	$aColumns = array( 'NId', 'NTipe', 'StatusReceive', 'Nomor', 'Hal', 'Tgl', 'InstansiPengirim' );

	/* Indexed column (used for fast and accurate table cardinality) */
	$sIndexColumn = "RegVitalId";

	/* DB table to use */
	$sTable = "v_naskah_vital_proof";

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
			Where RoleId = '".$_SESSION['RoleId']."'
            Order by Tgl_Reg Desc
			$sLimit
		";
	} else {
		$sQuery = "
			SELECT SQL_CALC_FOUND_ROWS ".str_replace(" , ", " ", implode(", ", $aColumns))."
			FROM   $sTable
			$sWhere and RoleId = '".$_SESSION['RoleId']."'
			Order by Tgl_Reg Desc
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
    $row[] .= '<div align="right">'.$no++.'.</div>';
    $row[] .= ''.$aRow['KatProdukName'].'';
    $row[] .= ''.$aRow['JProdukName'].'';
    $row[] .= ''.$aRow['DetailProdukName'].'';
    $row[] .= '<center>'.$aRow['Tahun'].'</center>';
    $row[] .= '<center>'.$aRow['Kode'].'</center>';
//    $row[] .= '<center>'.$aRow['Lokasi_Simpan'].'</center>';
    //$sqlp = "select RegVitalId from detailvitalmeta_proof where RegVitalId = '".$aRow['RegVitalId']."' ";
    $sqlp = "select RegVitalId from detailvital_proof where RegVitalId = '".$aRow['RegVitalId']."' ";
    $result = mysqli_query($connect, $sqlp);
    $jmlitem1 = mysqli_num_rows($result);

    $sqls = "select DetailProfId from v_metaproof where RegVitalId  = '".$aRow['RegVitalId']."' ";
    $result = mysqli_query($connect, $sqls);
    $jmlitem2 = mysqli_num_rows($result);

    $jmlitem = $jmlitem1 + $jmlitem2;
	
	# START: heru PDS menambahkan ini, 2020-12-10
	$get_metadata = mysqli_query($connect, "SELECT count(RegVitalId) as count_meta FROM v_metaproof WHERE RegVitalId='".$aRow['RegVitalId']."'");
	while($i = mysqli_fetch_array($get_metadata)) {
		$meta = $i['count_meta'];
		break;
	}
	$count_metadata = $meta;
	
	$get_approval_pendukung = mysqli_query($connect, "select
													COUNT(case when vital.Ket='sp' then 1 end) as count_approval,
													COUNT(case when vital.Ket='pl' then 1 end) as count_pendukung
													from detailvital_proof vital
													join regarsipvital reg on vital.RegVitalId = reg.RegVitalId
													join master_detailproduk prod on reg.DetailProdukId = prod.DetailProdukId
													join master_kodekerja kerja on kerja.KodeId = reg.KodeId
													where vital.RegVitalId = ".$aRow['RegVitalId']);
	while($i = mysqli_fetch_array($get_approval_pendukung)) {
		$approval = $i['count_approval'];
		$pendukung = $i['count_pendukung'];
		break;
	}
	$count_approval = $approval;
	$count_pendukung = $pendukung;
	
	if($count_metadata == 0 && $count_approval==0 && $count_pendukung==0)
		$status = '<label class="label label-default">Mulai</label>';
	else{
		if($count_metadata > 0 && $count_approval>0 && $count_pendukung>0)
			$status = '<label class="label label-success">Selesai</label>';
		else
			$status = '<label class="label label-warning">Proses</label>';
	}
	$row[] .= $status;
	# END: heru PDS menambahkan ini, 2020-12-10

    $row[] .= '<center><i class="text-yellow fa fa-folder fa-2x" onclick=detail_vital("'.$aRow['RegVitalId'].'") style="cursor: pointer"></i><span class="label label-danger">'.$jmlitem.'</span></center>';

    $output['aaData'][] = $row;

}
mysqli_close($connect);
echo json_encode($output);





?>
