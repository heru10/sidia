<?php

session_start();

	/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
	 * Easy set variables
	 */

	/* Array of database columns which should be read and sent back to DataTables. Use a space where
	 * you want to insert a non-database field (for example a counter or static image)
	 */
	$aColumns = array('RegVitalId','KatProdukName','JProdukName','DetailProdukName','Uraian','Tahun','Lokasi_Simpan');

//	$aColumns = array( 'NId', 'NTipe', 'StatusReceive', 'Nomor', 'Hal', 'Tgl', 'InstansiPengirim' );

	/* Indexed column (used for fast and accurate table cardinality) */
	$sIndexColumn = "RegVitalId";

	/* DB table to use */
	$sTable = "v_naskah_vital";

	/* Database connection information   */
	include "../../conf.php";

    $idx = "";
    if(isset($_GET['idx']))
       $idx = $_GET['idx'];

    $idi = "";
    if(isset($_GET['idi']))
       $idi = $_GET['idi'];

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
			$sWhere
            $sOrder
			$sLimit
		";
	} else {
		$sQuery = "
			SELECT SQL_CALC_FOUND_ROWS ".str_replace(" , ", " ", implode(", ", $aColumns))."
			FROM   $sTable
			$sWhere
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
    $PId = explode('|',$idx);
    $PIdi = explode('|',$idi);

    $chk="";
    foreach($PId as $idb){

      if($idb == $aRow['RegVitalId'])
          $chk = 'checked';
    }

    $chksp="";
    $chkut="";
    $chkst="";
    $chkpl="";
    foreach($PIdi as $idis){

      switch($idis){
        case 'sp' : $chksp = 'checked';
                    break;
        case 'ut' : $chkut = 'checked';
                    break;
        case 'st' : $chkst = 'checked';
                    break;
        case 'pl' : $chkpl = 'checked';
                    break;
      }

    }


    $row = array();
    $row[] .= '<div align="right">'.$no.'.</div>';
    $row[] .= '<strong>'.$aRow['KatProdukName'].' >> '.$aRow['JProdukName'].' >> '.$aRow['DetailProdukName'].'</strong><br />
              <input type="checkbox" '.$chksp.'  name="chks[]" id="chks" value="sp">&nbsp;Spesimen&nbsp;
              <input type="checkbox" '.$chkut.'  name="chks[]" id="chks" value="ut">&nbsp;Uraian Teknis&nbsp;
              <input type="checkbox" '.$chkst.'  name="chks[]" id="chks" value="st">&nbsp;Spesifikasi Teknis&nbsp;
              <input type="checkbox" '.$chkpl.'  name="chks[]" id="chks" value="pl">&nbsp;Dokumen Pendukung';
    $row[] .= '<center>'.$aRow['Tahun'].'</center>';
//    $row[] .= '<center>'.$aRow['Lokasi_Simpan'].'</center>';

    $row[] .= '<center><input type="checkbox" '.$chk.' name="chk[]" id="chkb" value="'.$aRow['RegVitalId'].'"></center>';

    $sql = "select ArsipPinjam from v_peminjaman_fisik where Keterangan = 'm0' and StatusPinjam = '1'   ";
    $result = mysqli_query($connect, $sql);
    if(mysqli_num_rows($result)){
    while($Rdata=mysqli_fetch_array($result)){
      $Pdata = explode("|",$Rdata['ArsipPinjam']);
      foreach($Pdata as $Fdata){
        if($Fdata!=$aRow['RegVitalId'])
          $output['aaData'][] = $row;
          $no++;
      }
    }
   } else {
     $output['aaData'][] = $row;
     $no++;
   }

}
mysqli_close($connect);
echo json_encode($output);





?>
