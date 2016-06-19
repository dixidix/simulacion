<?php
require('./conn.php');

$rows[] = array();

$userLogged = "SELECT  mdl_sessions.userid,  mdl_user.email,  mdl_user.firstname,  mdl_user.lastname, mdl_sessions.timemodified from mdl_sessions  JOIN mdl_user  WHERE mdl_user.id = mdl_sessions.userid AND  mdl_sessions.userid <> 0 AND (unix_timestamp(now()) - mdl_sessions.timemodified) < 1800 ";

// makeQuery($sql, $conn);
makeQuery($userLogged, $conn);

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
