<?php
 include "../../conf.php";
 $tables = '*';

	if($tables == '*'){
		$tables = array();
		$result = mysqli_query($connect, "SHOW TABLES");
		while($row = mysqli_fetch_row($result)){
			$tables[] = $row[0];
		}
	}else{
		$tables = is_array($tables)?$tables:explode(',',$tables);
	}

	//Loop melalui Table
    $return="";
	foreach($tables as $table){
		$result = mysqli_query($connect, "SELECT * FROM $table");
		$numColumns = mysqli_field_count($connect);

		$return .= "DROP TABLE $table;";

        $result2 = mysqli_query($connect, "SHOW CREATE TABLE $table");
        $row2 = mysqli_fetch_row($result2);

		$return .= "\n\n".$row2[1].";\n\n";

		for($i = 0; $i < $numColumns; $i++){
			while($row = mysqli_fetch_row($result)){
				$return .= "INSERT INTO $table VALUES(";
				for($j=0; $j < $numColumns; $j++){
					$row[$j] = addslashes($row[$j]);
					//$row[$j] = ereg_replace("\n","\\n",$row[$j]);
					if (isset($row[$j])) { $return .= '"'.$row[$j].'"' ; } else { $return .= '""'; }
					if ($j < ($numColumns-1)) { $return.= ','; }
				}
				$return .= ");\n";
			}
		}
		$return .= "\n\n\n";
	}

	//simpan file
    $name = $dbname.'_backup-'.time().'.sql';
//	$handle = fopen($name,'w+');
//	fwrite($handle,$return);
//	fclose($handle);
    loguser('Backup Data');
    header('Content-Type: charset=utf-8');
    header("Content-disposition: attachment; filename=$name");
    print $return;

?>