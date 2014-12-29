<!-- the following php code starts a session and checks to see if the previous attempt to login resulted in errors -->

<?php
session_start();
?>

<!DOCTYPE html>   
<!-- This is a html file for logging in to the virtual adviser -->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> 

	<head>
		<meta charset="UTF-8">
		<title> Virtual Adviser Login</title>
		<link rel="stylesheet" type="text/css" media='screen' href="css/login.screen.css">
	</head>
	<body>
	
		<!-- The div that displays the login form-->
		<div class="login">
			<h1><strong>Welcome to Virtual Adviser</strong></h1>
			<form action="validate_login.php" method="POST">
			<fieldset>
			<label for="user">Username</label>
			<p><input type="text" required id = "user" name = "user" value=""></p>
			<label for="pass">Password</label>
			<p><input type="password" required id = "pass" name = "pass" value=""></p>
			<!-- <p><a href="#">Forgot Password?</a></p> -->
			<p><input type="submit" value="Login"></p>
			</fieldset>
			</form>
			<!-- include the uncc white crown logo with green background -->
			<img src="images/CrownLogo_White.png" alt="UNCC Logo" style="width:194px;height:97px" class = "center">
		</div>
		<?php
		if(isset($_SESSION['ERRMSG_ARR'])&& is_array($_SESSION['ERRMSG_ARR']) && count($_SESSION['ERRMSG_ARR']) >0 ) 
		{
			echo '<ul style="color:red;list-style-type:none;text-align:center";>';
			foreach($_SESSION['ERRMSG_ARR'] as $msg) {
				echo '<li>',$msg,'</li>'; 
			}
			echo '</ul>';
			unset($_SESSION['ERRMSG_ARR']);
		}
		?>
	</body>
</html>
