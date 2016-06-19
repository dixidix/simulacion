<?php
require('./conn.php');

$rows[] = array();
$uid = $_GET['userid'];
$messages = "SELECT mdl_message.id, mdl_message.subject, mdl_message.fullmessage , mdl_message.timecreated,mdl_message.useridto, mdl_message.useridfrom,  mdl_user.firstname,  mdl_user.lastname from mdl_message  JOIN mdl_user  WHERE mdl_message.useridto=".$uid." AND mdl_message.useridfrom = mdl_user.id";

// makeQuery($sql, $conn);
makeQuery($messages, $conn);

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
