<?php
require('./conn.php');

$rows[] = array();
$id = $_POST['id'];

$delete_message = "DELETE FROM `mdl_message` WHERE `id` = ".$id."";

makeQuery($delete_message, $conn);

function makeQuery($sql, $conn){
$result = $conn->query($sql);
print $result;
}
$conn->close();
 ?>
