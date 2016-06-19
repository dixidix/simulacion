<?php 
$db_host =  "localhost";
$db_name = "moodle";
$db_user = "root";
$db_pass = "";

$conn = new mysqli($db_host,$db_user,$db_pass,$db_name);
if($conn->connect_error){
	die("conection failed: ".$con->connect_error);
}
?>