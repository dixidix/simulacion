<?php
require('./conn.php');

$rows[] = array();

$users = "SELECT id, firstname, lastname FROM mdl_user";

// makeQuery($sql, $conn);
makeQuery($users, $conn);

function makeQuery($sql, $conn){
$result = $conn->query($sql);
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$rows[] = $row;
		}
	echo json_encode($rows);
	}
}
$conn->close();
 ?>
