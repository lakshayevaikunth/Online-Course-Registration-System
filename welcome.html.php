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
<h1 style="text-align: center;"><?php echo "Welcome! $Fname  $Lname" ?></h1>
<font size="6" color="blue">
<a href="welcome.html.php">Home</a>
<br>
<a href="registered.html.php">View Registered Courses</a>
<br>
<a href="logout.php">Log Out</a>
</font> 
<br>
<h3>Select your course</h3>
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
    <th>Faculty Id</th>
    <th>Slot</th>
    <th>Classroom</th>
    <th>Location</th>
    <th>Credits</th>
    <th>Seats left</th>
    <th>Prerequsite</th>
</tr>
<?php
$sql= "select a.ccode,a.slot,a.cno,a.location,b.fname,b.lname,c.cname,c.Credits,a.Seats_left,a.fno from Course_Available a,Faculty b,Course_Details c where a.fno like b.fno and a.ccode like c.ccode";
$result=$pdo->query($sql);
while ($row = $result->fetch())
{
    $sql="select PreCCode from Course_Prerequisite where CCode like '$row[0]'";
    $result2=$pdo->query($sql);
    $s="";
    while($row2=$result2->fetch())
    $s=$s.",".$row2[0];
    $s=ltrim($s,",");
    echo "
    <tr>
    <td>$row[0]</td>
    <td>$row[6]</td>
    <td>$row[4] $row[5]</td>
    <td>$row[9]</td>
    <td>$row[1]</td>
    <td>$row[2]</td>
    <td>$row[3]</td>
    <td>$row[7]</td>
    <td>$row[8]</td>
    <td>$s</td>
    </tr>
    ";


}

?>

</table>
<center>
<form name="frmdropdown" method="post" action="">
<font size="5" >
<?php echo "Credits Registered=$total";?>

<br><br><br>
<strong>Select course to register</strong>
<br>
<select name="select">

<?php
session_start();
$sql="select ccode,slot,Fno from Course_Available a order by ccode";
$result=$pdo->query($sql);
while($row=$result->fetch())
{
echo "<option value='$row[0] $row[1] $row[2]'>$row[0] $row[1] $row[2]</option>" ;
}

?>

</select>
<input type="submit" name="submit" value="Submit"/> 
<br>
<?php
if($_SERVER['REQUEST_METHOD'] == "POST")
{
if($total<20)
   {
         $x=$_POST['select'];
         $y=explode(" ",$x);
         $sql="select Seats_left from Course_Available where CCode like '$y[0]' and slot like '$y[1]' and fno like $y[2]";
         $result=$pdo->query($sql);
         $row=$result->fetch();
         if($row[0]>0)
         {
         $sql="select count(RNo) from Student_Registers where RNo like '$username' and CCode like '$y[0]';";
         $result=$pdo->query($sql);
         $row=$result->fetch();
         $y1=$row[0];
         $sql="select count(RNo) from Student_Completed where RNo like '$username' and CCode like '$y[0]';";
         $result=$pdo->query($sql);
         $row=$result->fetch();
         $y1=$y1+$row[0];
         if($y1==0)
        {
         $sql="select count(Slot) from Student_Registers where RNo like '$username' and Slot like '$y[1]';";
         $result=$pdo->query($sql);
         $row=$result->fetch();
         if($row[0]>0)
         {
         echo "Slot already taken";
         }
         else
         {
         $sql="SELECT count(CCode) from Student_Completed WHERE Rno like '$username'";
         $result=$pdo->query($sql);
         $row=$result->fetch();
         $sql="select count(*) from (SELECT PreCCode from Course_Prerequisite WHERE CCode like '$y[0]' UNION SELECT CCode from Student_Completed WHERE Rno LIKE '$username') s";
         $result=$pdo->query($sql);
         $row1=$result->fetch();
         if($row1[0]<=$row[0])
          {
         $sql="update Course_Available set Seats_left=Seats_left-1 where CCode like '$y[0]' and Slot like '$y[1]' and fno like $y[2]";
         $pdo->exec($sql);
         $sql = "INSERT INTO Student_Registers VALUES ('$username','$y[1]','$y[0]',$y[2])";
         $pdo->exec($sql);
         $sql="select sum(Course_Details.Credits) from Course_Details,Student_Registers WHERE Student_Registers.CCode LIKE Course_Details.CCode and Student_Registers.Rno like '$username';";
         $result=$pdo->query($sql);
         $row=$result->fetch();
         $total=$row[0];
         $_SESSION['total']=$total;
        echo "<script>location='registered.html.php'</script>";
         }
         else
         echo "Prerequsite not met";
         }
         }
         else
         echo "Course already taken";
         }
         else
         echo "No available seats";
        
    }
else
echo "Maximum credit limit is 20";

}
    
    ?>
</form>
</font>
</center>
</body>
</html>
