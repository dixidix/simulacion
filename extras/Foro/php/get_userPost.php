<?php
require('./conn.php');

$rows[] = array();
$id = $_GET['userid'];
$posts = "SELECT postId, ownerId, title, detail, filepath,filesystemname, filename, created, mdl_user.firstname, mdl_user.lastname FROM `sf_post`  JOIN mdl_user  WHERE sf_post.ownerId = mdl_user.id AND ownerId = ".$id."";

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
