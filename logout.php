<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Welcome</title>
</head>
<body background="images.png">
<?php

    session_start();
	session_destroy();
	setcookie(PHPSESSID,session_id(),time()-1);
	     echo "<script>location='index.php'</script>";

?>
