<?php 
include'header.php';
if(isset($_POST['register_btn']))
{
    $username=($_POST['username']);
    $email=($_POST['email']);
    $password=($_POST['password']);
    $password2=($_POST['password2']);
	$address=($_POST['address']); 	
	
     if($password==$password2)
     {           //Create User
            $password=md5($password); //hash password before storing for security purposes
            $sql="INSERT INTO users(username, email, password, address) VALUES('$username','$email','$password','$address')";
            mysqli_query($db,$sql);  
            $_SESSION['message']="You are now logged in"; 
            $_SESSION['username']=$username;
			echo '<script language="javascript">';
			echo 'alert("Successfully Registered!")';
			echo '</script>';
            header("location:logout.php");  //redirect home page
    }
    else
    {
      $_SESSION['message']="The two password do not match";   
     }
}
?>
<!-- banner -->
<div class="inside-banner">
  <div class="container"> 
    <span class="pull-right"><a href="#">Home</a> / Register</span>
    <h2>Register</h2>
</div>
</div>
<!-- banner -->


<div class="container">
<div class="spacer">
<div class="row register">
<div class="col-lg-6 col-lg-offset-3 col-sm-6 col-sm-offset-3 col-xs-12 ">
	<?php
    if(isset($_SESSION['message']))
    {
         echo "<div id='error_msg'>".$_SESSION['message']."</div>";
         unset($_SESSION['message']);
    }
	?>
	<form method="post" action="register.php">
        <input type="text" class="form-control" placeholder="Full Name" name="username">
        <input type="text" class="form-control" placeholder="Enter Email" name="email">
        <input type="password" class="form-control" placeholder="Password" name="password">
        <input type="password" class="form-control" placeholder="Confirm Password" name="password2">
        <textarea rows="6" class="form-control" placeholder="Address" name="address"></textarea>
		<button type="submit" class="btn btn-success" name="register_btn">Register</button>
	</form>
          


                
</div> 
</div>
</div>
</div>

<?php include'footer.php';?>