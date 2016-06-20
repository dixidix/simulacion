<?php
require('./conn.php');
require('./ftp_conn.php');
$rows[] = array();
$ownerId = $_POST['ownerId'];
$title = $_POST['title'];
$detail = mysqli_real_escape_string($conn, $_POST['detail']);
$created = $_POST['created'];

if(!empty($_FILES['filepost'])){
	$file_name = $_FILES['filepost']['name'];
	$file_name = str_replace(' ', '_', $file_name);
	$file_size =$_FILES['filepost']['size'];
	$file_tmp = $_FILES['filepost']['tmp_name'];
	$file_type =$_FILES['filepost']['type'];
	$file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
	$timestamp = $_POST['created'];
	$fileSystemname = $file_name . $timestamp;
	$fileSystemname= hash('sha256', $fileSystemname);
	$fileSystemname = "$fileSystemname.$file_ext";
	$tmp_path = "./../files/".$ownerId."/".$fileSystemname;
	$path = "files/".$ownerId."/".$fileSystemname;
	$ftp_path = $ownerId."/".$fileSystemname;
}
if (ftp_nlist($ftp_conn, $ownerId) == false) {
	ftp_mkdir($ftp_conn, $ownerId);
}
ftp_put($ftp_conn, $ftp_path, $_FILES['filepost']['tmp_name'], FTP_BINARY);


ftp_close($ftp_conn);
if(!empty($_FILES['filepost'])){
	$savePost = "INSERT INTO `sf_post`(`ownerId`, `title`, `detail`, `filepath`,`filesystemname`,`filename`, `created`) VALUES (".$ownerId.",'".$title."','".$detail."','".$path."','".$file_name."','".$fileSystemname."',".time().")";
	echo $savePost;
}
makeQuery($savePost, $conn);

function makeQuery($sql, $conn){
	$result = $conn->query($sql);
	print $result;
}
$conn->close();
?>
