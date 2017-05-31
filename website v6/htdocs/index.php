<?php 

	include'header.php';
	
	if (isset($_GET['search'])) {
		$suburb = $_GET['suburb'];
		$type = $_GET['type'];
		$pet = $_GET['pet'];
		$furnishing = $_GET['furnishing'];
		$min_beds = $_GET['min_beds'];
		$max_beds = $_GET['max_beds'];
		$min_price = $_GET['min_price'];
		$max_price = $_GET['max_price'];
		
		$properties = getproperties($suburb, $type, $pet, $furnishing, $min_beds, $max_beds, $min_price, $max_price);
	}else if (isset($_GET['showfavourites'])){
		$properties = getSavedList($user[1]);
	}
	else{
		$properties = getproperties('Any', 'Any', 'Any', 'Any', 'Any', 'Any', 'Any', 'Any');
	}
?>

<div class="banner-search">
	<div class="container"> 
		<!-- banner -->
		<h3>Search properties for rent</h3>
		<div class="searchbar">
			<div class="row">
				<form action="index.php" method="get" name="doSearch">
					<div class="col-lg-6 col-sm-6">
						<div class="row">			
							<div class="col-lg-12 col-sm-3 ">
								<input type="text" class="form-control" name="suburb" placeholder="Search by suburb or postcode">
							</div>
							<div class="col-lg-3 col-sm-3 ">
							  Property Type
								<select class="form-control" name="type">
									<option value="Any">Any</option>
									<option value="House">House</option>
									<option value="Apartment">Apartment</option>
									<option value="Unit">Unit</option>
									<option value="Townhouse">Townhouse</option>
									<option value="Villa">Villa</option>
								</select>
							  Pet
								<select class="form-control" name="pet">
									<option value="Any">Any</option>
									<option value="1">Allowed</option>
									<option value="0">Not allowed</option>
								</select>
							</div>
							<div class="col-lg-3 col-sm-4">
								Furnishing
								<select class="form-control" name="furnishing">
									<option value="Any">Any</option>
									<option value="1">Furnished</option>
									<option value="0">Not furnished</option>
								</select>
							</div>
							<div class="col-lg-3 col-sm-4">
							  Min. Beds
								<select class="form-control" name="min_beds">
									<option value="Any">Any</option>
									<option value ="1">1</option>
									<option value ="2">2</option>
									<option value ="3">3</option>
									<option value ="4">4</option>
									<option value ="5">5</option>
								</select>
							  Max. Beds
								<select class="form-control" name="max_beds">
									<option value="Any">Any</option>
									<option value ="1">1</option>
									<option value ="2">2</option>
									<option value ="3">3</option>
									<option value ="4">4</option>
									<option value ="5">5</option>
								</select>
							</div>
							<div class="col-lg-3 col-sm-4">
							  Min. Price pw
								<select class="form-control" name="min_price">
									<option value="Any">Any</option>
									<option value ="100">100</option>
									<option value ="200">200</option>
									<option value ="300">300</option>
									<option value ="400">400</option>
									<option value ="500">500</option>
								</select>
							  Max. Price pw
								<select class="form-control" name="max_price">
									<option value="Any">Any</option>
									<option value ="100">100</option>
									<option value ="200">200</option>
									<option value ="300">300</option>
									<option value ="400">400</option>
									<option value ="500">500</option>
								</select>
							</div>
							
							<div class="col-lg-12 col-sm-4">
								<button class="btn btn-success" name="search">Find Now</button>
							</div>		
						</div>  
					</div>
					<div class="col-lg-5 col-lg-offset-1 col-sm-6 ">
						<?php
						if (isset($_SESSION['username'])) {
							$user_type = checkType($user[0]);
							if($user_type == "user"){
								echo '
								
								<h3>Welcome back, '.$user[1].'!</h3>
								<p>You have '.count(getFavouriteCount($user[0])).' properties saved in your favourites.<br>
									You have '.count(getMessageCount($user[1])).' messages sent.<br>
									You have '.count(getResponseCount($user[1])).' messages responded.</p>
								<div class="col-lg-6 col-sm-4">
									<form action="index.php" method="get" name="doSearch">
									<button class="btn btn-success" name="showfavourites">Show My Favourites</button>
									</form>
								</div>';	
							}else if($user_type == "admin"){
								echo'<h3>Welcome back, Admin_'.$user[1].'!</h3>
								<div class="col-lg-6 col-sm-4">
									<form action="index.php" method="get" name="doSearch">
									<button class="btn btn-success" name="gotoDatabase">Go to database</button>
									</form></div>';
							}else if($user_type == "tenant"){
								echo'<h3>Welcome back, Tenant_'.$user[1].'!</h3>
								<p>You have '.count(getFavouriteCount($user[0])).' properties saved in your favourites.<br>
									You have '.count(getMessageCount($user[1])).' messages sent.<br>
									You have '.count(getResponseCount($user[1])).' messages responded.</p>
								<div class="col-lg-6 col-sm-4">
									<form action="index.php" method="get" name="doSearch">
									<button class="btn btn-success" name="viewlease">Show your Lease Info</button>
									</form></div>';
							}else if($user_type == "employee"){
								echo'<h3>Welcome back, Employee_'.$user[1].'!</h3>
								<p>You have '.count(getFavouriteCount($user[0])).' properties saved in your favourites.<br>
									You have '.count(getMessageCount($user[1])).' messages are awaiting your response.
								<div class="col-lg-6 col-sm-4">
									<form action="index.php" method="get" name="doSearch">
									<button class="btn btn-success" name="gotoDatabase">Go to database</button>
									</form></div>';
							}
						}else{ 
							echo "<p>Join now and get updated with all the properties deals.</p>";
							echo '<button class="btn btn-info"   data-toggle="modal" data-target="#loginpop">Login / Register</button>';
						}
						?>
					
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- banner -->
<div class="container">
	<div class="properties-listing spacer">
		<div class="sortby clearfix">
		<div class="pull-left result">
			Showing: <?php echo count($properties); ?> of <?php echo count($properties); ?>
		</div>
		  <div class="pull-right">
		  <select class="form-control">
		  <option>Sort by</option>
		  <option>Price: Low to High</option>
		  <option>Price: High to Low</option>
		</select></div>

		</div>
		<div class="row">
		<?php
			foreach ($properties as $property) {
				echo'
					<div class="col-lg-4 col-sm-6">
						<div class="properties">
							<div class="image-holder"><img src="images/properties/'.$property[0].'.jpg" class="img-responsive" alt="properties">';
								if(time()>= strtotime($property[12])){
									echo '<div class="status sold">Available Now</div>';
								}
							echo '
								
							</div>
							<h4><a href="detail.php">'.$property[1].' '.$property[2].'</a></h4>
							<p class="price">Price: $'.$property[10].' pw</p>
							<div class="listing-detail">
								<span data-toggle="tooltip" data-placement="bottom" data-original-title="Bedroom">'.$property[4].'</span> 
								<span data-toggle="tooltip" data-placement="bottom" data-original-title="Bathroom">'.$property[5].'</span>
								<span data-toggle="tooltip" data-placement="bottom" data-original-title="Parking">'.$property[6].'</span> ';
								if ($property[8] == 1){
									echo '<span data-toggle="tooltip" data-placement="bottom" data-original-title="Pet Is Allowed">Y</span> ';
								}else{
									echo '<span data-toggle="tooltip" data-placement="bottom" data-original-title="Pet Is Not Allowed">N</span> ';
								}
								if ($property[9] == 1){
									echo '<span data-toggle="tooltip" data-placement="bottom" data-original-title="Furnished">Y</span> ';
								}else{
									echo '<span data-toggle="tooltip" data-placement="bottom" data-original-title="Not Furnished">N</span> ';
								}
								if ($property[7] == "House"){
									echo '<span data-toggle="tooltip" data-placement="bottom" data-original-title="House">H</span>';
								}else if ($property[7] == "Apartment"){
									echo '<span data-toggle="tooltip" data-placement="bottom" data-original-title="Apartment">A</span>';
								}else if ($property[7] == "Townhouse"){
									echo '<span data-toggle="tooltip" data-placement="bottom" data-original-title="Townhouse">T</span>';
								}else if ($property[7] == "Villa"){
									echo '<span data-toggle="tooltip" data-placement="bottom" data-original-title="Villa">V</span>';
								}else if ($property[7] == "Unit"){
									echo '<span data-toggle="tooltip" data-placement="bottom" data-original-title="Unit">U</span>';
								}
								
								echo'
							</div>
							<a class="btn btn-primary" href="detail.php?id='.$property[0].'">View Details</a>
						</div>
					</div>
				';





			}  
			?>
		</div>
	</div>  
  
</div>
<?php include'footer.php';?>