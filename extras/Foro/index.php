<?php

$db_host =  "localhost";
$db_name = "moodle";
$db_user = "root";
$db_pass = "";

$conn = new mysqli($db_host,$db_user,$db_pass,$db_name);
if($conn->connect_error){
	die("conection failed: ".$con->connect_error);
}
$salt = ']CRJ_>U695AgP1?*{Vr1>?Cs';
$user = $_POST['user'];
$password = $_POST['password'];
$password = $password.$salt;
$password = md5($password);


$sql = "SELECT * from mdl_user WHERE username='".$user."' AND password='".$password."'";

$userLogged = "SELECT userid from mdl_sessions where userid <> 0";

makeQuery($sql, $conn);
makeQuery($userLogged, $conn);

function makeQuery($sql, $conn){
$result = $conn->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			foreach ($row as $key => $value) {
				echo $row[$key].'<br>';
			}
		}
	}else{
		echo "0 results";
	}
}
$conn->close();

 ?>
