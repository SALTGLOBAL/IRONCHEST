<?php 
include'header.php';



?>
<!-- banner -->
<div class="inside-banner">
  <div class="container"> 
    <span class="pull-right"><a href="#">Home</a> / Agents</span>
    <h2>Agents</h2>
</div>
</div>
<!-- banner -->


<div class="container">
<div class="spacer agents">

<div class="row">
  <div class="col-lg-8  col-lg-offset-2 col-sm-12">
	<?php	
	$agentDetails = getAgentDetails();
	foreach ($agentDetails as $detail) {
      echo'<div class="row">
        <div class="col-lg-2 col-sm-2 "><a href="#"><img src="images/agents/'.$detail[0].'.jpg" class="img-responsive"  alt="'.$detail[1].'"></a></div>
        <div class="col-lg-6 col-sm-7 "><h4>'.$detail[1].'</h4><p>'.$detail[5].'</p></div>
        <div class="col-lg-4 col-sm-3 "><span class="glyphicon glyphicon-envelope"></span> <a href="mailto:'.$detail[3].'">'.$detail[3].'</a><br>
        <span class="glyphicon glyphicon-earphone"></span> 0'.$detail[2].'</div>
		</div>';
	}
	?>
      
       
      
     
  </div>
</div>


</div>
</div>

<?php include'footer.php';?>