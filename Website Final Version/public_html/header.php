<?php
include'functions.php';	
session_start();
//connect to database
//$db=mysqli_connect("localhost","root","sierracharlie","authentication");
$db=mysqli_connect("localhost","id1826599_adminroot","sierracharlie","id1826599_admin");
if (isset($_SESSION['username'])) {
	$user_email = $_SESSION['username'];
	$user = GetUser($user_email);
}

if(isset($_SESSION['message']))
{
     echo '<div class="alert success"><span class="closebtn">&times;</span> '.$_SESSION['message'].'</div>';
     //echo "<div id='error_msg'>".$_SESSION['message']."</div>";
     unset($_SESSION['message']);
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Mr David's Realestate </title>
<meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

 	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" />
  <link rel="stylesheet" href="assets/style.css"/>
  <script src="assets/jquery.js"></script>
	<script src="assets/bootstrap/js/bootstrap.js"></script>
  <script src="assets/script.js"></script>



<!-- Owl stylesheet -->
<link rel="stylesheet" href="assets/owl-carousel/owl.carousel.css">
<link rel="stylesheet" href="assets/owl-carousel/owl.theme.css">
<script src="assets/owl-carousel/owl.carousel.js"></script>
<!-- Owl stylesheet -->


<!-- slitslider -->
    <link rel="stylesheet" type="text/css" href="assets/slitslider/css/style.css" />
    <link rel="stylesheet" type="text/css" href="assets/slitslider/css/custom.css" />
    <script type="text/javascript" src="assets/slitslider/js/modernizr.custom.79639.js"></script>
    <script type="text/javascript" src="assets/slitslider/js/jquery.ba-cond.min.js"></script>
    <script type="text/javascript" src="assets/slitslider/js/jquery.slitslider.js"></script>
<!-- slitslider -->
<style>
.alert {
    padding: 20px;
    background-color: #f44336;
    color: white;
    opacity: 1;
    transition: opacity 0.6s;
    margin-bottom: 15px;
	font-size: 20px;
}

.alert.success {background-color: #4CAF50;}
.alert.info {background-color: #2196F3;}
.alert.warning {background-color: #ff9800;}

.closebtn {
    margin-left: 15px;
    color: white;
    font-weight: bold;
    float: right;
    font-size: 40px;
    line-height: 20px;
    cursor: pointer;
    transition: 0.3s;
}

.closebtn:hover {
    color: black;
}
</style>
</head>

<body>


<!-- Header Starts -->
<div class="navbar-wrapper">

        <div class="navbar-inverse" role="navigation">
          <div class="container">
            <div class="navbar-header">


              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>

            </div>


            <!-- Nav Starts -->
            <div class="navbar-collapse  collapse">
              <ul class="nav navbar-nav navbar-right">
			   <?php
					if (isset($_SESSION['username'])) {
						echo '<li class="active"><a href="index.php">Hi, '.$user[1].'</a></li>';
						echo '<li><a href="logout.php">Logout</a></li>' ;
					}else{
						echo '<li class="active"> <a data-toggle="modal" href="#loginpop"> Login / Register </a></li>';
						
					}
				?>
              </ul>
            </div>
            <!-- #Nav Ends -->

          </div>
        </div>

    </div>
<!-- #Header Starts -->





<div class="container">

<!-- Header Starts -->
<div class="header">
<a href="index.php"><img src="images/logo.png" alt="Realestate"></a>

              <ul class="pull-right">
			  <li><a href="about.php">About</a></li> 
                <li><a href="agents.php">Agents</a></li> 
				<li><a href="contact.php">Contact</a></li>
              </ul>
</div>
<!-- #Header Starts -->
</div>