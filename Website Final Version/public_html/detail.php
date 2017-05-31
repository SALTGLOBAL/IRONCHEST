<?php 
	include'header.php';

	if(isset($_GET['id'])) {
			$property = $_GET['id'];
			
			$propertyinfo = getPropertyInfo($property);
			
			$property_id = $propertyinfo[0];
			$address = $propertyinfo[1];
			$suburb = $propertyinfo[2];
			$postcode = $propertyinfo[3];
			$bedrooms = $propertyinfo[4];
			$bathrooms = $propertyinfo[5];
			$parking_spaces = $propertyinfo[6];
			$property_type = $propertyinfo[7];
			$pet = $propertyinfo[8];
			$furnishing = $propertyinfo[9];
			$owner_name = $propertyinfo[10];
			$manager_name = $propertyinfo[11];
			$price = $propertyinfo[12];
			$date_available = $propertyinfo[13];
			
			if(isset($_GET['save'])){
				$IsSaved = getFavouriteProperty($user[0], $_GET['id']);
			}
			
			
		}
?>
<!-- banner -->
<div class="inside-banner">
  <div class="container"> 
    <?php echo '<h2>'.$address.' '.$suburb.' QLD '.$postcode.'</h2>'; ?>
</div>
</div>
<!-- banner -->
<script>
var close = document.getElementsByClassName("closebtn");
var i;

for (i = 0; i < close.length; i++) {
    close[i].onclick = function(){
        var div = this.parentElement;
        div.style.opacity = "0";
        setTimeout(function(){ div.style.display = "none"; }, 600);
    }
}
</script>


<div class="container">
<br>



<?php
	if(isset($_POST['saveThis'])){
		saveProperty($user[0], $_GET['id']);
		echo '<div class="alert success"><span class="closebtn">&times;</span> Property is successfully saved.</div>';
	}
	if(isset($_POST['removeThis'])){
		removeProperty($user[0], $_GET['id']);
		echo '<div class="alert info"><span class="closebtn">&times;</span> Property is successfully removed.</div>';
	}
	if(isset($_POST['sendMessageBtn'])){
		if(!isset($_POST['type'])){
			echo '<div class="alert warning"><span class="closebtn">&times;</span> Please select a message type and try again.</div>';
		}else if(!isset($_POST['message2'])){
			echo '<div class="alert warning"><span class="closebtn">&times;</span> Your message is empty. Try again with some message.</div>';
		}else{
			saveMessage($_POST['type'], $user[1], $_GET['id'], htmlspecialchars($_POST['message2']));
			echo '<div class="alert success"><span class="closebtn">&times;</span> Message is successfully sent.</div>';
		}
		
	}
?>
  <div class="col-lg-8">
  <div class="property-images">
    <!-- Slider Starts -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators hidden-xs">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
        <li data-target="#myCarousel" data-slide-to="3" class=""></li>
		<li data-target="#myCarousel" data-slide-to="4" class=""></li>
      </ol>
      <div class="carousel-inner">
        <!-- Item 1 -->
        <div class="item active">
          <?php echo '<img src="images/properties/'.$property_id.'.jpg" class="properties" alt="properties" />'; ?>
        </div>
        <!-- #Item 1 -->

        <!-- Item 2 -->
        <div class="item">
          <?php echo '<img src="images/properties/'.$property_id.'.1.jpg" class="properties" alt="properties" />'; ?>
         
        </div>
        <!-- #Item 2 -->

        <!-- Item 3 -->
         <div class="item">
          <?php echo '<img src="images/properties/'.$property_id.'.2.jpg" class="properties" alt="properties" />'; ?>
        </div>
        <!-- #Item 3 -->

        <!-- Item 4 -->
        <div class="item ">
          <?php echo '<img src="images/properties/'.$property_id.'.3.jpg" class="properties" alt="properties" />'; ?>
          
        </div>
        <!-- # Item 4 -->
		<!-- Item 5 -->
        <div class="item ">
          <?php echo '<img src="images/properties/'.$property_id.'.4.jpg" class="properties" alt="properties" />'; ?>
          
        </div>
        <!-- # Item 5 -->
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div>
<!-- #Slider Ends -->

  </div>
  



  <div class="spacer"><h4><span class="glyphicon glyphicon-th-list"></span> Properties Detail</h4>
  <p>Efficiently unleash cross-media information without cross-media value. Quickly maximize timely deliverables for real-time schemas. Dramatically maintain clicks-and-mortar solutions without functional solutions.</p>
  <p>Completely synergize resource sucking relationships via premier niche markets. Professionally cultivate one-to-one customer service with robust ideas. Dynamically innovate resource-leveling customer service for state of the art customer service</p>

  </div>
  <div><h4><span class="glyphicon glyphicon-map-marker"></span> Location</h4>
<div class="well"><iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Pulchowk,+Patan,+Central+Region,+Nepal&amp;aq=0&amp;oq=pulch&amp;sll=37.0625,-95.677068&amp;sspn=39.371738,86.572266&amp;ie=UTF8&amp;hq=&amp;hnear=Pulchowk,+Patan+Dhoka,+Patan,+Bagmati,+Central+Region,+Nepal&amp;ll=27.678236,85.316853&amp;spn=0.001347,0.002642&amp;t=m&amp;z=14&amp;output=embed"></iframe></div>
  </div>

  </div>
  <div class="col-lg-4">
  <div class="col-lg-12  col-sm-6">
<div class="property-info">
<?php
	echo '<p class="price">$ '.$price.' pw</p>';
	if(time()>= strtotime($date_available)){
		echo '<p class="price">Available Now</p>';
	}else{
		echo '<p class="price">Available on '.$date_available.'</p>';
	}
?>
  <div class="profile">
  <span class="glyphicon glyphicon-user"></span> Agent Details
  <p><?php echo $manager_name; ?></p>
  </div>
</div>

    <h6><span class="glyphicon glyphicon-home"></span> Availabilty</h6>
    <div class="listing-detail">
		<h6><span data-toggle="tooltip" data-placement="bottom" data-original-title="Bedroom"><?php echo $bedrooms; ?></span> bedrooms</h6>
		<h6><span data-toggle="tooltip" data-placement="bottom" data-original-title="Bathroom"><?php echo $bathrooms; ?></span> bathrooms</h6>
		<h6><span data-toggle="tooltip" data-placement="bottom" data-original-title="Parking"><?php echo $parking_spaces; ?></span> parkings</h6>	
			<?php
				if ($pet == 1){
					echo '<h6><span data-toggle="tooltip" data-placement="bottom" data-original-title="Pet Is Allowed">Y</span> Pet<h6>';
				}else{
					echo '<h6><span data-toggle="tooltip" data-placement="bottom" data-original-title="Pet Is Not Allowed">N</span> Pet<h6>';
				}
			?>
			<?php
				if ($furnishing == 1){
					echo '<h6><span data-toggle="tooltip" data-placement="bottom" data-original-title="Furnished">Y</span> Furnishing<h6>';
				}else{
					echo '<h6><span data-toggle="tooltip" data-placement="bottom" data-original-title="Not Furnished">N</span> Furnishing<h6>';
				}
			?>
		<?php
			if ($property_type == "House"){
				echo '<h6><span data-toggle="tooltip" data-placement="bottom" data-original-title="House">H</span> Property Type<h6>';
			}else if ($property_type == "Apartment"){
				echo '<h6><span data-toggle="tooltip" data-placement="bottom" data-original-title="Apartment">A</span> Property Type<h6>';
			}else if ($property_type == "Townhouse"){
				echo '<h6><span data-toggle="tooltip" data-placement="bottom" data-original-title="Townhouse">T</span> Property Type<h6>';
			}else if ($property_type == "Villa"){
				echo '<h6><span data-toggle="tooltip" data-placement="bottom" data-original-title="Villa">V</span> Property Type<h6>';
			}else if ($property_type == "Unit"){
				echo '<h6><span data-toggle="tooltip" data-placement="bottom" data-original-title="Unit">U</span> Property Type<h6>';
			}
		?>
	</div>
<div class="enquiry">
	<?php
		if (isset($_SESSION['username'])) {
			
			if(count(hasSaved($user[0],$_GET['id'])) == 0){
				echo'<form action="detail.php?id='.$_GET['id'].'" method="post" name="doSearch"><button type="submit" class="btn btn-primary" name="saveThis">Save This Property</button></form>';
			}else{
				echo'<form action="detail.php?id='.$_GET['id'].'" method="post" name="doSearch"><button type="submit" class="btn btn-primary" name="removeThis">Remove from Favourites</button></form>';
			}
		}else{
			echo '<a data-toggle="modal" href="#loginpop"><button class="btn btn-primary">Login or Register to Favourite Properties</button></a>';
		}
	?>
	<br><br>
</div>	
	

</div>
<div class="col-lg-12 col-sm-6">
<div class="enquiry">
  <h6><span class="glyphicon glyphicon-envelope"></span> Post Enquiry</h6>
    <?php
					if (isset($_SESSION['username'])) {
						echo '
							<form action="detail.php?id='.$property_id.'" method="POST" name="doSearch">
							<input type="radio" name="type" value="enquiry"> Enquiry
							<input type="radio" name="type" value="inspection"> Inspection
							<input type="radio" name="type" value="maintenance"> Maintenance 
							<input type="radio" name="type" value="dispute"> Dispute 
							<textarea rows="6" class="form-control" name="message2" placeholder="your message"></textarea>
							<button type="submit" class="btn btn-primary" name="sendMessageBtn">Send Message</button>
							</form>';
					}else{ 
					
						echo '
							<input type="radio" name="type" value="enquiry"> Enquiry
							<input type="radio" name="type" value="Inspection"> Inspection
							<input type="radio" name="type" value="Maintenance"> Maintenance 
							<textarea rows="6" class="form-control" placeholder="your message"></textarea>
							<a data-toggle="modal" href="#loginpop"><button class="btn btn-primary">Login or Register to Write a Message</button></a>';
					}
					?>
 </div>         
</div>
</div>
</div>

<?php include'footer.php';?>