<?php
require('./conn.php');

$rows[] = array();
$from = $_POST['from'];
$to = $_POST['to'];
$subject = $_POST['subject'];
$fullmessage = $_POST['fullmessage'];

$message = "INSERT INTO `mdl_message`(`useridfrom`, `useridto`, `subject`, `fullmessage`, `fullmessageformat`, `fullmessagehtml`, `smallmessage`, `notification`, `contexturl`, `contexturlname`, `timecreated`) VALUES (".$from.",".$to.",'".$subject."','".$fullmessage."',null,null,null,null,null,null, ".time().")";

// makeQuery($sql, $conn);
makeQuery($message, $conn);

function makeQuery($sql, $conn){
$result = $conn->query($sql);
print $result;
}
$conn->close();
 ?>
