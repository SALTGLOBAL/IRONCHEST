<script type="text/javascript" src="scripts/myscript.js"></script>
<?php
// Create PDO
function GetConnection() {
	
	//$pdo = new PDO('mysql:host=localhost;dbname=authentication', 'root', 'sierracharlie');
	$pdo = new PDO('mysql:host=localhost;dbname=id1826599_admin', 'id1826599_adminroot', 'isengard');

	return $pdo;   
}

function getProperties1() {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT * FROM properties;");
	$query->execute();
	$results = $query->fetchAll();

	return $results;
}

function getTopRatedHotspot() {
	$pdo = GetConnection();
	
	$query1 = $pdo->prepare("SELECT MAX(avg_rating)
							FROM (SELECT DISTINCT h.hotspot_id, h.name, h.address, h.suburb, h.latitude, h.longitude, AVG(r.rating) AS avg_rating
							FROM n8891010.hotspots h 
							JOIN ratings r ON r.hotspot_id = h.hotspot_id
							GROUP BY h.hotspot_id) AS t1;"); 
							
	$query1->execute();
	$results1 = $query1->fetch();
	
	$max_rating = $results1[0];
	
	$query2 = $pdo->prepare("SELECT DISTINCT h.hotspot_id, h.name, h.address, h.suburb, h.latitude, h.longitude, AVG(r.rating) AS avg_rating
							FROM n8891010.hotspots h 
							JOIN ratings r ON r.hotspot_id = h.hotspot_id
							GROUP BY h.hotspot_id
							HAVING avg_rating = :rating;");
	
	$query2->bindParam(":rating", $max_rating);
	
	$query2->execute();
	$results2 = $query2->fetch();
	
	return $results2;
}

function getHotspotInfo($id) {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT DISTINCT h.name, h.address, h.suburb, h.latitude, h.longitude, AVG(r.rating) AS avg_rating 
							FROM n8891010.hotspots h 
							JOIN ratings r ON r.hotspot_id = h.hotspot_id 
							WHERE h.hotspot_id = :id");
	
	$query->bindParam(":id", $id);
	
	$query->execute();
	$results = $query->fetch();

	return $results;
}

function getPropertyInfo($id) {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT * 
							FROM properties
							WHERE id = :id");
	$query->bindParam(":id", $id);
	
	$query->execute();
	$results = $query->fetch();

	return $results;
}

function getFavouriteProperty($user_id, $property_id) {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT * 
							FROM saved_properties
							WHERE user_id = :user_id
							AND property_id = :property_id");
	$query->bindParam(":user_id", $user_id);
	$query->bindParam(":property_id", $property_id);
	
	$query->execute();
	$results = $query->fetchall();

	return $results;
}

function getFavouriteCount($user_id) {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT * 
							FROM saved_properties
							WHERE user_id = :user_id");
	$query->bindParam(":user_id", $user_id);
	
	$query->execute();
	$results = $query->fetchall();

	return $results;
}

function checkType($user_id) {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT type
							FROM users
							WHERE id = :user_id");
	$query->bindParam(":user_id", $user_id);
	
	$query->execute();
	$results = $query->fetchall();
	
	if(count($results) > 0) {
		return $results[0][0];
	}
	
	return "";
}

function getMessageCount($user_name) {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT * 
							FROM enquiries
							WHERE user_name = :user_name");
	$query->bindParam(":user_name", $user_name);
	
	$query->execute();
	$results = $query->fetchall();

	return $results;
}

function getAgentDetails() {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT * 
							FROM employees");
	
	$query->execute();
	$results = $query->fetchall();

	return $results;
}

function getResponseCount($user_name) {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT * 
							FROM enquiries
							WHERE user_name = :user_name AND response IS NOT NULL ");
	$query->bindParam(":user_name", $user_name);
	
	$query->execute();
	$results = $query->fetchall();

	return $results;
}

function hasSaved($user_id, $property_id) {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT * 
							FROM saved_properties
							WHERE user_id = :user_id AND property_id = :property_id");
	$query->bindParam(":user_id", $user_id);
	$query->bindParam(":property_id", $property_id);
	
	$query->execute();
	$results = $query->fetchall();

	return $results;
}

function getUser($user_email) {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT id, username, email
							FROM users
							WHERE email = :user_email");
	$query->bindParam(":user_email", $user_email);
	
	$query->execute();
	$results = $query->fetch();

	return $results;
}

function getAgents() {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT *
							FROM employees");	
	$query->execute();
	$results = $query->fetchall();

	return $results;
}

function saveProperty($user_id, $property_id) {
	$pdo = GetConnection();
	if(count(getFavouriteProperty($user_id, $property_id)) == 0){
		$query = $pdo->prepare("INSERT INTO saved_properties (user_id, property_id) VALUES (:user_id, :property_id)");
		
		$query->bindParam(":user_id", $user_id);
		$query->bindParam(":property_id", $property_id);
		
		$query->execute();
	}
}

function saveMessage($type, $name, $property_id, $message) {
	$pdo = GetConnection();
	$query = $pdo->prepare("INSERT INTO enquiries (type, user_name, property_id, message) VALUES (:type, :name, :property_id, :message)");
	
	$query->bindParam(":type", $type);
	$query->bindParam(":name", $name);
	$query->bindParam(":property_id", $property_id);
	$query->bindParam(":message", $message);
	
	$query->execute();
}

function removeProperty($user_id, $property_id) {
	$pdo = GetConnection();
	
		$query = $pdo->prepare("DELETE FROM saved_properties WHERE user_id = :user_id AND property_id = :property_id");
		
		$query->bindParam(":user_id", $user_id);
		$query->bindParam(":property_id", $property_id);
		
		$query->execute();

}


function getProperties($suburb, $type, $pet, $furnishing, $min_beds, $max_beds, $min_price, $max_price) {
	$pdo = GetConnection();
	
	$querystring = "SELECT id, address, suburb, postcode, bedrooms, bathrooms, parking_spaces, property_type, pet, furnishing, price, occupied, date_available 
					FROM properties
					WHERE occupied = 0";
	
	$bindsuburb = false;
	$bindtype = false;
	$bindpet = false;
	$bindfurnishing = false;
	$bindminbeds = false;
	$bindmaxbeds = false;
	$bindminprice = false;
	$bindmaxprice = false;
	
	if ($suburb != 'Any') {
		$querystring = $querystring . " AND suburb LIKE '%' :suburb '%'";
		$bindsuburb = true;
	}	
	if ($type != 'Any') {
		$querystring = $querystring . " AND property_type = :type ";
		$bindtype = true;
	}
	if ($pet != 'Any') {
		$querystring = $querystring . " AND pet = :pet ";
		$bindpet = true;
	}
	if ($furnishing != 'Any') {
		$querystring = $querystring . " AND furnishing = :furnishing ";
		$bindfurnishing = true;
	}
	if ($min_beds != 'Any') {
		$querystring = $querystring . " AND bedrooms >= :min_beds ";
		$bindminbeds = true;
	}
	if ($max_beds != 'Any') {
		$querystring = $querystring . " AND bedrooms <= :max_beds ";
		$bindmaxbeds = true;
	}	
	if ($min_price != 'Any') {
		$querystring = $querystring . " AND price >= :min_price ";
		$bindminprice = true;
	}	
	if ($max_price != 'Any') {
		$querystring = $querystring . " AND price <= :max_price ";
		$bindmaxprice = true;
	}
	
	$query = $pdo->prepare($querystring);
		
	if($bindsuburb) {
		$query->bindParam(":suburb", $suburb);
	}	
	if($bindtype) {
		$query->bindParam(":type", $type);
	}	
	if($bindpet) {
		$query->bindParam(":pet", $pet);
	}	
	if($bindfurnishing) {
		$query->bindParam(":furnishing", $furnishing);
	}	
	if($bindminbeds) {
		$query->bindParam(":min_beds", $min_beds);
	}	
	if($bindmaxbeds) {
		$query->bindParam(":max_beds", $max_beds);
	}	
	if($bindminprice) {
		$query->bindParam(":min_price", $min_price);
	}
	if($bindminprice) {
		$query->bindParam(":max_price", $max_price);
	}
	
	$query->execute();
	$results = $query->fetchAll();
	return $results;
}

function getSavedList($user_name) {
	$pdo = GetConnection();
	
	$querystring = "SELECT p.id, p.address, p.suburb, p.postcode, p.bedrooms, p.bathrooms, p.parking_spaces, p.property_type, p.pet, p.furnishing, p.price, p.occupied, p.date_available, u.username
					FROM properties p 
                    JOIN saved_properties s ON s.property_id = p.id
                    JOIN users u on u.id = s.user_id
					WHERE occupied = 0  AND u.username = :user_name";
	
	$query = $pdo->prepare($querystring);
		
	$query->bindParam(":user_name", $user_name);
	
	$query->execute();
	$results = $query->fetchAll();
	return $results;
}

function getFilteredHotspots($suburb, $name, $rating, $distance, $currentlat, $currentlong) {
	$pdo = GetConnection();
	
	$querystring = "SELECT h.hotspot_id, h.name, h.address, h.suburb, h.latitude, h.longitude, AVG(r.rating) AS avg_rating 
					FROM n8891010.hotspots h 
					JOIN ratings r ON r.hotspot_id = h.hotspot_id 
					WHERE name LIKE '%' :name '%'";
	
	$bindsuburb = false;
	
	if ($suburb != 'Any') {
		$querystring = $querystring . " AND suburb LIKE :suburb '%'";
		$bindsuburb = true;
	}
	
	$querystring = $querystring . " GROUP BY h.hotspot_id HAVING avg_rating >= :rating;";
	
	$query = $pdo->prepare($querystring);
	
	$query->bindParam(":name", $name);
	
	if($bindsuburb) {
		$query->bindParam(":suburb", $suburb);
	}
	$query->bindParam(":rating", $rating);
	
	$query->execute();
	$results = $query->fetchAll();
	
	for ($i = 0; $i < count($results); $i++) {
		$lat = $results[$i][4];
		$long = $results[$i][5];
		
		if($distance == 5) {
			if(distanceBetweenCoords($currentlat, $currentlong, $lat, $long) <= 5)
			{
				array_push($results[$i], distanceBetweenCoords($currentlat, $currentlong, $lat, $long));
				
				if(empty($hotspots)) {
					$hotspots[0] = $results[$i];
				}
				else {
					array_push($hotspots, $results[$i]);
				}
			}
		}
		else if($distance == 10) {
			if(distanceBetweenCoords($currentlat, $currentlong, $lat, $long) <= 10)
			{
				array_push($results[$i], distanceBetweenCoords($currentlat, $currentlong, $lat, $long));
				
				if(empty($hotspots)) {
					$hotspots[0] = $results[$i];
				}
				else {
					array_push($hotspots, $results[$i]);
				}
			}
		}
		else if($distance == 25) {
			if(distanceBetweenCoords($currentlat, $currentlong, $lat, $long) <= 25)
			{
				array_push($results[$i], distanceBetweenCoords($currentlat, $currentlong, $lat, $long));
				
				if(empty($hotspots)) {
					$hotspots[0] = $results[$i];
				}
				else {
					array_push($hotspots, $results[$i]);
				}
			}
		}
		else if($distance == 50) {
			if(distanceBetweenCoords($currentlat, $currentlong, $lat, $long) <= 50) {
				array_push($results[$i], distanceBetweenCoords($currentlat, $currentlong, $lat, $long));
				
				if(empty($hotspots)) {
					$hotspots[0] = $results[$i];
				}
				else {
					array_push($hotspots, $results[$i]);
				}
			}
		}
		else {
			array_push($results[$i], distanceBetweenCoords($currentlat, $currentlong, $lat, $long));
			
			if(empty($hotspots)) {
				$hotspots[0] = $results[$i];
			}
			else {
				array_push($hotspots, $results[$i]);
			}
		}
	}
	
	if(!empty($hotspots)) {
		return $hotspots;
	}
	else {
		return 0;
	}
}

function hasUserRated($userid, $hotspot_id) {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT COUNT(user_id) AS Count FROM ratings WHERE user_id = :userid AND hotspot_id = :hotspot_id;");
	
	$query->bindParam(":userid", $userid);
	$query->bindParam(":hotspot_id", $hotspot_id);
	
	$query->execute();
	$result = $query->fetch();
	
	$rated = $result['Count'];
	
	if($rated != 0) {
		return true;
	}
	
	return false;
}

function makeRating($userid, $hotspot_id, $rating) {
	$pdo = GetConnection();
	
	if (!hasUserRated($userid, $hotspot_id)) {
		$query = $pdo->prepare("INSERT INTO ratings (hotspot_id, rating, user_id) VALUES (:hotspot_id, :rating, :user_id);");
		
		$query->bindParam(":hotspot_id", $hotspot_id);
		$query->bindParam(":rating", $rating);
		$query->bindParam(":user_id", $userid);
		
		$query->execute();
		
		return true;
	}
	else {
		return false;
	}
}

function distanceBetweenCoords($lat1, $lon1, $lat2, $lon2) {
	$lat1 = floatval($lat1);
	$lat2 = floatval($lat2);
	$lon1 = floatval($lon1);
	$lon2 = floatval($lon2);
	$theta = $lon1 - $lon2;
	$dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
	$dist = acos($dist);
	$dist = rad2deg($dist);
	$km = $dist * 60 * 1.853159616;
  
	return $km;
}

function getSuburbs() {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT DISTINCT suburb FROM n8891010.hotspots ORDER BY suburb;");
	$query->execute();
	$results = $query->fetchAll();
	
	for ($i = 0; $i < count($results); $i++) {
		$temp[$i] = explode(",", $results[$i][0]);
	}
	
	for ($i = 0; $i < count($temp); $i++) {
		$suburbs[$i] = $temp[$i][0];
	}
	
	foreach($suburbs as $suburb) {
		if(empty($output)) {
			$output = array($suburb);
		}
		else {
			if(!in_array($suburb, $output)) {
				array_push($output, $suburb);
			}
		}
	}
	
	return $output;
}

function generateSalt($max = 13) {
	$characterList = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	$i = 0;
	$salt = "";
	while ($i < $max) {
		$salt .= $characterList{mt_rand(0, (strlen($characterList) - 1))};
		$i++;
	}
	return $salt;
}

function checkUserExists($username) {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT COUNT(username) AS Count FROM users WHERE username = :user");
	
	$query->bindParam(":user", $username);
	
	$query->execute();
	$result = $query->fetch();
	
	$exists = $result['Count'];
	
	if($exists != 0) {
		return true;
	}
	
	return false;
}

function checkEmailExists($email) {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT COUNT(email) AS Count FROM users WHERE email = :email");
	
	$query->bindParam(":email", $email);
	
	$query->execute();
	$result = $query->fetch();
	
	$exists = $result['Count'];
	
	if($exists != 0) {
		return true;
	}
	
	return false;
}

function registerUser($username, $email, $password, $dob, $gender) {
	$salt = generateSalt();
	
	$pdo = GetConnection();
	
	$query = $pdo->prepare("INSERT INTO users (username, email, password, salt, date_of_birth, gender, admin) VALUES (?, ?, SHA2(CONCAT(?, ?), 0), ?, ?, ?, 0);");
	
	$query->bindParam(1, $username);
	$query->bindParam(2, $email);
	$query->bindParam(3, $password);
	$query->bindParam(4, $salt);
	$query->bindParam(5, $salt);
	$query->bindParam(6, $dob);
	$query->bindParam(7, $gender);

	$query->execute();
}

function getUserID($username, $password) {
	$pdo = GetConnection();
	
	$query = $pdo->prepare("SELECT user_id FROM users WHERE username = :username AND password = SHA2(CONCAT(:password, salt), 0);");
	
	$query->bindParam(":username", $username);
	$query->bindParam(":password", $password);
	
	$query->execute();
	
	$result = $query->fetch();
	
	$userid = $result[0];
	
	return $userid;
}
?>