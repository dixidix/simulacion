<?php
// FTP  CONNECTION ---------------- 
$ftp_server = "127.0.0.1";
$ftp_username = "admin";
$ftp_userpass = "admin";


$ftp_conn = ftp_connect($ftp_server) or die("Could not connect to $ftp_server");
$login = ftp_login($ftp_conn, $ftp_username, $ftp_userpass);
//--------------------------------
?>