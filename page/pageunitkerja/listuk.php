<?php
   include_once "../../conf.php";
    $sql = "SELECT RoleId, RoleName FROM role";
    $result = mysqli_query($connect, $sql);

  if (mysqli_num_rows($result) > 0) {
     $list = array();
     $key=0;
     while($row = mysqli_fetch_assoc($result)) {
         $list[$key]['id'] = $row['RoleId'];
         $list[$key]['text'] = $row['RoleName'];
     $key++;
     }
     echo json_encode($list);
 } else {
     echo "hasil kosong";
 }

?>