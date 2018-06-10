<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Welcome</title>
</head>
<body background="images.png">
<?php
session_start();
if (!isset($_REQUEST['username']))
{
echo'
<font size=5>
<center>
<form action="" method="post">
<br><br><br><br><br><br><br><br><br><br><br><br><br>Username:  <input type="text" name="username" id="username" required>
<br><br>Password:  <input type="password" name="password" id="password" required>

<br><br><input type="submit" value="GO">
</form>
</font>
</center>
';
}
else
{

$username = $_REQUEST['username'];
$password = $_REQUEST['password'];
$pdo = new PDO('mysql:host=localhost;dbname=Course_Registration', 'root',
'');
$sql = "SELECT Password FROM Login where Rno like '$username'";
$result = $pdo->query($sql);
$output = $result->fetch();
$_SESSION['username'] = "$username";
if($output['Password']== $password)
{
session_start();
	$_SESSION['sid']=session_id();
header('Location:welcome.html.php');
}
else
header('Location:index.php');

}
?>
</body>
</html>

