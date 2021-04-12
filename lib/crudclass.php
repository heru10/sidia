<?php
try
{
//$con = new PDO("mysql:host=localhost:3307;dbname=db_siarip_peruri","sidia","s1d14.null");

$con = new mysqli('localhost:3307','sidia','s1d14.null','db_siarip_peruri');
}
catch(PDOException $e)
{
	echo $e->getMessage();
}
?>