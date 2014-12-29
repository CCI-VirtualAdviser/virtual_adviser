<?php 

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

$output = 'Database connection established.';
include 'output.html.php';

try
{
	$output = '';
	$sql = $conn->prepare('SELECT * FROM course_list WHERE course_id LIKE \'ITIS%\'');
	$sql->execute(array('value%'));
	$sql-> execute();
	while($row = $sql->fetch())
	{
		$output = $output.$row['course_id']." ".$row['course_name']." ".$row['credit_hours']."<br/>\n";
	}
	include 'output.html.php';
}
catch (PDOException $e)
{
	$output = 'Error selecting from course_list table: ' . $e->getMessage();
	include 'error.html.php';
	exit();
}

?>