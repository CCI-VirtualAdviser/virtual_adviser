<?php 
// start the session for this page and create the array to hold error messages
session_start();
$errmsg_arr = array();
$errflag = false;

$username = 'root';
$password = 'root';
$url = 'localhost';
$database = 'virtual_adviser';

/*	Note that above variables are using single quote for string. When they
	get replaced in the connection statement below, single quotes within
	single quotes will fail, therefore, the string argument in $conn= statement
	must be double quotes
*/

try
{
	$conn = new PDO("mysql:host=$url; dbname=$database",$username,$password);		//create PDO object (PHP Data Objects = PDO)
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);					/*set the attribute that controls the error mode once the database
																					has been connected to, so that it throws exceptions (PDO switches to
																					"silent failure" mode after establishing a successful connection) */
	$conn->exec('SET NAMES "utf8"');													/* PDO has a method exec that runs SQL scripts. Configure the character
																					encoding to UTF-8 for special characters like smart quotes */

}	
catch (PDOException $e)
{
	$output = 'Unable to connect to the database server.'.							//the '.' is the concatenation operator for a string
	$e->getMessage();																//the '->' is the equivalent of the dot operator in Java
	include 'error.html.php';
	exit();
}

//get the username and password posted from the login page (index.php)
$user = $_POST['user'];
$pass = $_POST['pass'];


//query the database for the posted data from form
	$result = $conn->prepare("SELECT * FROM students WHERE username= :un AND password= :pw");
	$result->bindParam(':un', $user);
	$result->bindParam(':pw', $pass);
	$result->execute();
	$rows = $result->fetch(PDO::FETCH_NUM);
	if($rows > 0) 
	{
	$result = $conn->prepare("SELECT * FROM students WHERE username = :un");	//PDO can only handle a row of data at a time?? Cannot select first_name from students, etc.??
	$result->bindParam(':un',$user);
	$result->execute();
	$name = $result->fetchColumn(1);	//the second column is the student's first name, the first column (column 0) is the student id
	$_SESSION['name'] = $name;
	$_SESSION['user'] = $user;			//the next page student.php will need the username to get information from the database
	header("location: student.php");
	}
else{
	$errmsg_arr[] = 'Username and Password are not found';
	$errflag = true;
	}

if($errflag) {
	$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
	session_write_close();
	header("location: index.php");
	exit();
}
?>