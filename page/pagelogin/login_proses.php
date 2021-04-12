<?php
session_start();
include "../../conf.php";

$s=anti_sql_injection($_POST['username']);
$p=anti_sql_injection($_POST['password']);
if(!anti_sql_injection($_POST['username']) or !anti_sql_injection($_POST['password']) ){
die('<script>location.href = "index.php";</script>');
}
else
{
   $sql = "SELECT * FROM v_login where Pengguna = '".$_POST['username']."' and Key2 = '".md5($_POST['password'])."' and PeopleStatus = '1' limit 0,1 ";
   $result = mysqli_query($connect, $sql) or die ("error");
   //echo $result;
   if(mysqli_num_rows($result)){
     $log = mysqli_fetch_array($result);
     $_SESSION["PeopleId"] = $log['PeopleId'];
     $_SESSION['RoleId'] = $log['RoleId'];
     $_SESSION['PeopleName'] = $log['PeopleName'];
     $_SESSION['PeopleTipe'] = $log['PeopleTipe'];
     $_SESSION['RoleParentId'] = $log['RoleParentId'];
     $_SESSION['GroupId'] = $log['GroupId'];
     $_SESSION['RoleName'] = $log['RoleName'];
     $_SESSION['CodeRole'] = $log['CodeRole'];
     $_SESSION['Approve'] = $log['Approve'];
     $_SESSION['Menu'] = $log['Menu'];
     loguser('login sukses ');
     die("sukses");

   } else { die("noakses");};

}

   function anti_sql_injection( $input ) {
          // daftarkan perintah-perintah SQL yang tidak boleh ada
            // dalam query dimana SQL Injection mungkin dilakukan

          $aforbidden = array (
          "insert ", "select ", "update ", "delete ", "truncate ",
          "replace", "drop ", " or ", ";", "#", "--", "=", "'", "@". "!" );

          // lakukan cek, input tidak mengandung perintah yang tidak boleh

          $breturn=true;
            foreach($aforbidden as $cforbidden) {
                if(strrpos($input, $cforbidden)) {
                    $breturn=false;
                    break;
             }
            }

          return $breturn;
      }
?>