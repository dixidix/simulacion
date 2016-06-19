<?php
require('./conn.php');

$rows[] = array();

$posts = "SELECT postId, ownerId, title, detail, filepath,filesystemname, created, mdl_user.firstname, mdl_user.lastname FROM `sf_post`  JOIN mdl_user  WHERE sf_post.ownerId = mdl_user.id";

// makeQuery($sql, $conn);
makeQuery($posts, $conn);

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
