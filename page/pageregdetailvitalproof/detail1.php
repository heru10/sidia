<?php
  include "../../conf.php";

 $sql = "select DetailVitalId, Filename, Concat(Gedung,'.',Lemari,'.',Baris,'.',Boks) as Lokasi from detailvital where RegVitalId = '". $_REQUEST['ids'] ."' and Ket = '".$_REQUEST['ket']."' ";

 $result = mysqli_query($connect, $sql) or die ('Error');
 $file = "";
 $lokasi = "";
 $vitalid = "";
 if(mysqli_num_rows($result) > 0){
 while($data=mysqli_fetch_array($result)){
  if(isset($data['Filename']))
   $file .= $data['Filename']."#";
  if(isset($data['Lokasi']))
   $lokasi .= $data['Lokasi']."#";
  if(isset($data['DetailVitalId']))
  $vitalid .= $data['DetailVitalId'];
 }
 echo substr($file,0,-1)."|".substr($lokasi,0,-1)."|".$vitalid;
 } else
    echo "";
?>