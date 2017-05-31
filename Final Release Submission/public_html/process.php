<?php
session_start();
$db=mysqli_connect("localhost","id1826599_adminroot","sierracharlie","id1826599_admin");
//$db=mysqli_connect("localhost","root","","authentication");
if(isset($_POST['login_btn']))
{
    $email=($_POST['user']);
    $password=($_POST['pass']);
    $password=md5($password);
    $sql="SELECT * FROM users WHERE email='$email' AND password='$password'";
	$result=mysqli_query($db,$sql);
    if(mysqli_num_rows($result)==1)
    {
        $_SESSION['message']="You are now Loggged In";
        $_SESSION['username']=$email;
    }
   else{$_SESSION['message']="Username and Password combiation incorrect";}
}
header("location:index.php");
	
?>