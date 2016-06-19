<?php
require('./conn.php');

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
	$path = "/foro/files/".$ownerId."/".$fileSystemname;
}
if(!file_exists("../files/".$ownerId)){
	mkdir("../files/".$ownerId);
	if(!empty($_FILES['filepost'])){
		move_uploaded_file($file_tmp, "$tmp_path");
	}
}else{
	if(!empty($_FILES['filepost'])){
		move_uploaded_file($file_tmp, "$tmp_path");
	}
}

if(!empty($_FILES['filepost'])){
$savePost = "INSERT INTO `sf_post`(`ownerId`, `title`, `detail`, `filepath`,`filesystemname`, `created`) VALUES (".$ownerId.",'".$title."','".$detail."','".$path."','".$file_name."',".time().")";
echo $savePost;
}
makeQuery($savePost, $conn);

function makeQuery($sql, $conn){
$result = $conn->query($sql);
print $result;
}
$conn->close();
?>
