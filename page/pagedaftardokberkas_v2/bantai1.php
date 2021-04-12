<?php

session_start();

	/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
	 * Easy set variables
	 */

	/* Array of database columns which should be read and sent back to DataTables. Use a space where
	 * you want to insert a non-database field (for example a counter or static image)
	 */
	$aColumns = array('BerkasId','Nomor','KlasBerkas','Uraian','KurunWaktu','LokasiSimpan','SubBerkas','TglReg');

//	$aColumns = array( 'NId', 'NTipe', 'StatusReceive', 'Nomor', 'Hal', 'Tgl', 'InstansiPengirim' );

	/* Indexed column (used for fast and accurate table cardinality) */
	$sIndexColumn = "BerkasId";

	/* DB table to use */
	$sTable = "v_berkas_v2";

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
			Where RoleId = '".$_SESSION['RoleId']."' and ParrentBerkasId = '".$_GET['idb']."' order by TglReg desc
            $sOrder
			$sLimit
		";
	} else {
		$sQuery = "
			SELECT SQL_CALC_FOUND_ROWS ".str_replace(" , ", " ", implode(", ", $aColumns))."
			FROM   $sTable
			$sWhere and RoleId = '".$_SESSION['RoleId']."' and ParrentBerkasId = '".$_GET['idb']."' order by TglReg desc
			$sOrder
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
    $row[] .= ''.$aRow['BerkasId'].'';
    $row[] .= '<div align="right">'.$no++.'.</div>';
    $row[] .= ''.$aRow['KlasBerkas'].'';


//    $subberkas = "";
//    if(!empty($aRow['SubBerkas']))
//      $subberkas = "<br /><small class='text-red'>Sub Berkas = ".$aRow['SubBerkas']."</small>";


    $row[] .= '<center>'.$aRow['Nomor'].'</center>';
    $row[] .= ''.$aRow['Uraian'].'';
    $row[] .= '<center>'.$aRow['KurunWaktu'].'</center>';

    $sqls = "select * from dokumen_v2 where BerkasId='".$aRow['BerkasId']."' ";
    $res = mysqli_query($connect, $sqls);

    $sqly = "select * from berkas_v2 where ParrentBerkasId='".$aRow['BerkasId']."' ";
    $resi = mysqli_query($connect, $sqly);

    $btndel = "";
    if(mysqli_num_rows($res)>0 or mysqli_num_rows($resi)>0)
      $btndel = 'disabled';

    //$row[] .= '<center><i class="text-blue fa fa-folder fa-2x" onclick=addsub_berkas("'.$aRow['BerkasId'].'") style="cursor: pointer"></i><span class="label label-danger">'.mysqli_num_rows($resi).'</span></center>';
    $row[] .= '<center><i class="text-yellow fa fa-folder fa-2x" onclick=detail_berkas("'.$aRow['BerkasId'].'") style="cursor: pointer"></i><span class="label label-danger">'.mysqli_num_rows($res).'</span></center>';
//    $row[] .= '<center><button type="button" title="Ubah Sub Berkas" onclick=getload("'.$aRow['BerkasId'].'"); class="btn btn-info btn-sm"><i class="fa fa-edit"></i></button>
//               <button '.$btndel.' type="button" title="Hapus Sub Berkas" onclick=deldata("'.$aRow['BerkasId'].'"); class="btn btn-danger btn-sm"><i class="fa fa-bitbucket"></i></button></center>';
    $output['aaData'][] = $row;

}
mysqli_close($connect);
echo json_encode($output);





?>
