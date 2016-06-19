<?php 
require('./conn.php');
$salt = ']CRJ_>U695AgP1?*{Vr1>?Cs';
$user = $_GET['username'];
$password = $_GET['password'];
$password = $password.$salt;
$password = md5($password);

$sql = "SELECT id, firstname , lastname, email from mdl_user WHERE username='".$user."' AND password='".$password."'";

makeQuery($sql, $conn);
function makeQuery($sql, $conn){
	$result = $conn->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			if($row['id']){
				$directoryName = "./../files/".$row['id'];
			}
			$rows[] = $row;
		}
		

//Check if the directory already exists.
		if($directoryName && !is_dir($directoryName)){
    //Directory does not exist, so lets create it.
			mkdir($directoryName, 755, true);
		}
		echo json_encode($rows);
	}
}
$conn->close();
?>