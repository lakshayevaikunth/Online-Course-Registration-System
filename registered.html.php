<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Welcome</title>
</head>
<body background="images.png">
<h1 style="text-align: center;">University Course Registraion</h1>
<?php
session_start();
if($_SESSION['sid']!=session_id())
header("Location:index.php");
$username=$_SESSION['username'];
$total=$_SESSION['total'];
$pdo = new PDO('mysql:host=localhost;dbname=Course_Registration', 'root',
'');
$sql="select sum(Course_Details.Credits) from Course_Details,Student_Registers WHERE Student_Registers.CCode LIKE Course_Details.CCode and Student_Registers.Rno like '$username';";
         $result=$pdo->query($sql);
         $row=$result->fetch();
         $total=$row[0];
         $_SESSION['total']=$total;
$sql="select * from Student where Rno like '$username'";
$result=$pdo->query($sql);
$output=$result->fetch();
$Fname=$output['Fname'];
$Lname=$output['Lname'];
?>
<br>
<h1 style="text-align: center;"><?php echo "$Fname  $Lname" ?></h1>
<font size="6" color="blue">
<a href="welcome.html.php">Home</a>
<br>
<a href="registered.html.php">View Registered Courses</a>
<br>
<a href="logout.php">Log Out</a>
</font> 
<br>
<h3>Your Registered Courses Are</h3>
<style>
table {
    width:100%;
}
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
}
table#t01 tr:nth-child(even) {
    background-color: #eee;
}
table#t01 tr:nth-child(odd) {
   background-color:#fff;
}
table#t01 th {
    background-color: black;
    color: white;
}
</style>
<table id="t01">
  <tr>
    <th>Course Code</th>
    <th>Course Name</th>
    <th>Faculty Name</th>
    <th>Slot</th>
    <th>Classroom</th>
    <th>Location</th>
    <th>Credits</th>
</tr>
<?php
$sql= "select a.ccode,a.slot,a.cno,a.location,b.fname,b.lname,c.cname,c.credits from Course_Available a,Faculty b,Course_Details c where a.fno like b.fno and a.ccode like c.ccode and a.ccode in (SELECT CCode FROM Student_Registers where Rno like '$username') and a.fno like(Select fno from Student_Registers where ccode like a.ccode and Rno like '$username') and a.slot like(SELECT slot from Student_Registers where CCode like a.ccode)";
$result=$pdo->query($sql);
while ($row = $result->fetch())
{
    echo "
    <tr>
    <td>$row[0]</td>
    <td>$row[6]</td>
    <td>$row[4] $row[5]</td>
    <td>$row[1]</td>
    <td>$row[2]</td>
    <td>$row[3]</td>
    <td>$row[7]</td>
</tr>";

}
?>
</table>
<font size="5">
<center>
<?php echo "Credits Registered=$total";?>
<br><br><br>
<strong>Select course to drop</strong>
<form name="frmdropdown" method="post" action="">
<select name="select">
<?php
session_start();
$sql="select ccode from Student_Registers where Rno like '$username';";
$result=$pdo->query($sql);
while($row=$result->fetch())
{
echo "<option value='$row[0]'>$row[0]</option>" ;
}
?>
</select>
<input type="submit" name="submit" value="Submit"/> 

</form>

<?php
if($_SERVER['REQUEST_METHOD'] == "POST")
{
    $x=$_POST['select'];
    $sql="update Course_Available set Seats_left=Seats_left+1 where Ccode like '$x' and slot like (select slot from Student_Registers where ccode like '$x' and rno like '$username') and fno like (select fno from Student_Registers where ccode like '$x' and rno like '$username')";
    $pdo->exec($sql);
    $sql="delete from Student_Registers where ccode like '$x' and Rno like '$username';";
    $pdo->exec($sql);
    echo"<strong>Course Dropped</strong>";
     echo "<script>location='registered.html.php'</script>";
}
?>
</center>
</font>
</body>
</html>
