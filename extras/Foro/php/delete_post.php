<?php
require('./conn.php');

$rows[] = array();

$id = $_POST['id'];

$delete_post = "DELETE FROM `sf_post` WHERE `postId` = ".$id."";

makeQuery($delete_post, $conn);

function makeQuery($sql, $conn){
$result = $conn->query($sql);
print $result;
}
$conn->close();
 ?>
