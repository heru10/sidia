<?php
date_default_timezone_set("Asia/Bangkok");
global $connect;
global $id;
global $task;

$servername = "localhost";
//$username = "sidia";
//$username = "root";
$username = "sidia_local";
//$password = "s1d14.null";
$password = "S1dia_R00t#2019";
$dbname = "sidia_golive";


// create connection
$connect = new mysqli($servername, $username, $password, $dbname) or die ('error');

// check connection
if($connect->connect_error) {
	die("Connection Failed : " . $connect->connect_error);
}


  function sql($sql){
     $sql = mysqli_query($connect, $sql);
     return $sql;
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

    function engtgl($strdate){
      $date1 = explode("/",$strdate);
      $engdate = $date1[2]."-".$date1[1]."-".$date1[0];
      return $engdate;
    }

    function indotgl($strdate){
      $date1 = explode("/",$strdate);
      $indodate = $date1[0]."-".$date1[1]."-".$date1[2];
      return $indodate;
    }
    
    function mkdate($str){
      $arrDate = explode('/', $str);
      return ($arrDate[2] . '-' . $arrDate[1] . '-' . $arrDate[0]);
	}

     function vnomorberkas($n){
       if(strlen($n)< 3){
          $ng = 3 - strlen($n);
          $nol="";
          for($i=1;$i<=$ng;$i++)
              $nol .= "0";
          $n = $nol.$n;
       }
       return $n;
     }

    function loguser($log){
       $servername = "localhost";
       //$username = "root";
	   $username = "sidia_local";
       $password = "S1dia_R00t#2019";
       $dbname = "sidia_golive";
       $connect = new mysqli($servername, $username, $password, $dbname);
       $log = strtolower($log);
       $log = str_replace("'","",$log);
       $sql = "insert into log_akses(LogName, PeopleId, RoleId, LogDate) values ('".$log."', '".$_SESSION['PeopleId']."','".$_SESSION['RoleId']."', '".date('Y-m-d H:i:s')."')";
       //die($sql);
       mysqli_query($connect, $sql);
     }

     function logdok($log,$kode){
       $servername = "localhost";
      // $username = "root";
	   $username = "sidia_local";
	   $password = "S1dia_R00t#2019";
       //$password = "s1d14.null";
       $dbname = "sidia_golive";
       $connect = new mysqli($servername, $username, $password, $dbname);
       $sql = "insert into log_archive(LogDok, PeopleId, LogDate, RoleId) values ('".$log."', '".$_SESSION['PeopleId']."', '".date('Y-m-d H:i:s')."', '".$_SESSION['RoleId']."')";
       //die($sql);
       mysqli_query($connect, $sql);
       //mysqli_close($connect);
     }


?>