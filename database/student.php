<?php 
session_start();
$username = 'root';
$password = 'root';
$url = 'localhost';
$database = 'virtual_adviser2';
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
$user = $_SESSION['user'];
/* Get the user's degree program and concentration */
$result = $conn->prepare("SELECT * FROM students WHERE username= :un");
$result->bindParam(':un', $user);
$result->execute();
$rows = $result->fetch(PDO::FETCH_NUM);
if($rows > 0) 
{
	$result = $conn->prepare("SELECT * FROM students WHERE username = :un");	
	$result->bindParam(':un',$user);
	$result->execute();
	$data = $result->fetch(PDO::FETCH_ASSOC);	//returns an associated array where the indices are the column names
	$program = $data['program_id'];
	$concentration = $data['concentration_id'];
	$id = $data['student_id'];
	
	//get the total number of credit hours in the student's major for his or her concentration
	$result = $conn->prepare("SELECT SUM(credit_hours) AS hours FROM(
								SELECT Course_List.credit_hours FROM Program_Courses, Course_List 
								WHERE program_id= :pid and concentration_id= :conid 
								and fulfills_major=1 and Program_Courses.course_id = Course_List.course_id 
								) AS major_credits");
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$major_hours = $result->fetchColumn();
	
	//get the number of hours the student has completed toward their major
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taken
                            ON program_courses.dept_id = courses_taken.dept_id AND program_courses.course_id = courses_taken.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_major = 1 AND courses_taken.student_id = :sid) AS major_courses");
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$completed_major_hours = $result->fetchColumn();
    
	
	/* 	if the student has taken two courses that are equivalent (such as PHIL 1105 and PHIL 1106), the completed hours count should be reduced by the total number
		of duplicate hours 
	*/
	//get the number of hours of any courses where student has taken the course AND its equivalent
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM
								(SELECT * FROM courses_taken WHERE student_id = :sid) AS a
								INNER JOIN (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_major=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS b ON a.course_id = b.course_id
								INNER JOIN (SELECT * FROM course_equivalence) as c ON c.course_id = a.course_id");
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$duplicate_hours = $result->fetchColumn();
	
	//subtract the duplicate hours from the total hours completed in major
	$completed_major_hours -= $duplicate_hours;
	
	
	//student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	$completed_major_percent = number_format(($completed_major_hours/$major_hours)*100,2,'.','');
	if ($completed_major_percent > 100)
	{
		$completed_major_percent = number_format(100,2,'.','');
	}
	
	//get student's math option
	$result = $conn->prepare("SELECT option_number FROM Math_Option WHERE student_id = :sid");
	$result->bindParam(':sid',$id);
	$result->execute();
	$math_option = $result->fetchColumn();
	
	//get the total hours for that option
	if($math_option === 1)
	{
		$result = $conn->prepare("SELECT SUM(credit_hours) AS hours FROM(
								SELECT Course_List.credit_hours FROM Program_Courses, Course_List 
								WHERE program_id= :pid and concentration_id= :conid 
								and fulfills_math1=1 and Program_Courses.course_id = Course_List.course_id 
								) AS math_hours");
	}
	else
	{
		$result = $conn->prepare("SELECT SUM(credit_hours) AS hours FROM(
								SELECT Course_List.credit_hours FROM Program_Courses, Course_List 
								WHERE program_id= :pid and concentration_id= :conid 
								and fulfills_math2=1 and Program_Courses.course_id = Course_List.course_id 
								) AS math_hours");
	}
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$math_hours = $result->fetchColumn();
	
	//get the number of hours the student has completed toward their math option
	if($math_option == 1)
	{
		$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taken
                            ON program_courses.dept_id = courses_taken.dept_id AND program_courses.course_id = courses_taken.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_math1 = 1 AND courses_taken.student_id = :sid) AS math1_courses");
	}
	else
	{
		$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taken
                            ON program_courses.dept_id = courses_taken.dept_id AND program_courses.course_id = courses_taken.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_maht2 = 1 AND courses_taken.student_id = :sid) AS math_courses");
	}
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$completed_math_hours = $result->fetchColumn();
	
	//subtract any hours from the math total where student has taken a course AND its equivalent
	if($math_option == 1)
	{
		$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM
								(SELECT * FROM courses_taken WHERE student_id = :sid) AS a
								INNER JOIN (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_math1=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS b ON a.course_id = b.course_id
								INNER JOIN (SELECT * FROM course_equivalence) as c ON c.course_id = a.course_id");
	}
	else
	{
		$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM
								(SELECT * FROM courses_taken WHERE student_id = :sid) AS a
								INNER JOIN (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_math2=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS b ON a.course_id = b.course_id
								INNER JOIN (SELECT * FROM course_equivalence) as c ON c.course_id = a.course_id");
	}
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$duplicate_hours = $result->fetchColumn();
	
	//subtract the duplicate hours from the total hours completed in math option
	$completed_major_hours -= $duplicate_hours;
    
	if($math_hours == 0)
    {
        $completed_math_percent = 0;
    }
    else
    {
	   $completed_math_percent = number_format(($completed_math_hours/$math_hours)*100,2,'.','');
    }
    
	if ($completed_math_percent > 100)
	{
		$completed_math_percent = number_format(100,2,'.','');
	}
	
	
	//the total number of credit hours for science and social science
	$science_hours = 7;
	$social_science_hours = 3;
	
	//get the number of hours the student has completed toward their science requirement
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taken
                            ON program_courses.dept_id = courses_taken.dept_id AND program_courses.course_id = courses_taken.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_science = 1 AND courses_taken.student_id = :sid) AS
                            science_courses");
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$completed_science_hours = $result->fetchColumn();
	
	//get the number of hours of any courses where student has taken the course AND its equivalent
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM
								(SELECT * FROM courses_taken WHERE student_id = :sid) AS a
								INNER JOIN (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_science=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS b ON a.course_id = b.course_id
								INNER JOIN (SELECT * FROM course_equivalence) as c ON c.course_id = a.course_id");
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$duplicate_hours = $result->fetchColumn();
	
	//subtract the duplicate hours from the total hours completed in science
	$completed_science_hours -= $duplicate_hours;
	
	if($science_hours == 0)
    {
        $completed_science_percent = 0;
    }
    else
    {
	   $completed_science_percent = number_format(($completed_science_hours/$science_hours)*100,2,'.','');
    }
    
	if ($completed_math_percent > 100)
	{
		$completed_math_percent = number_format(100,2,'.','');
	}
	$completed_science_percent = number_format(($completed_science_hours/$science_hours)*100,2,'.','');
	if ($completed_science_percent > 100)
	{
		$completed_science_percent = number_format(100,2,'.','');
	}
	
	//get the number of hours the student has completed toward their social science requirement
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taken
                            ON program_courses.dept_id = courses_taken.dept_id AND program_courses.course_id = courses_taken.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_social_science = 1 AND courses_taken.student_id = :sid) AS
                            social_science_courses");
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$completed_social_science_hours = $result->fetchColumn();
	
	//get the number of hours of any courses where student has taken the course AND its equivalent
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM
								(SELECT * FROM courses_taken WHERE student_id = :sid) AS a
								INNER JOIN (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_social_science=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS b ON a.course_id = b.course_id
								INNER JOIN (SELECT * FROM course_equivalence) as c ON c.course_id = a.course_id");
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$duplicate_hours = $result->fetchColumn();
	
	//subtract the duplicate hours from the total hours completed in major
	$completed_social_science_hours -= $duplicate_hours;
	
	if($social_science_hours == 0)
    {
        $completed_social_science_percent = 0;
    }
    else
    {
	   $completed_social_science_percent = number_format(($completed_social_science_hours/$social_science_hours)*100,2,'.','');
    }
    
	if ($completed_social_science_percent > 100)
	{
		$completed_social_science_percent = number_format(100,2,'.','');
	}
	
	//the total number of hours for liberal education requirements
	$liberal_hours = 12;
	
	//get the total number of liberal education requirements completed	
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taken
                            ON program_courses.dept_id = courses_taken.dept_id AND program_courses.course_id = courses_taken.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_liberalEd = 1 AND courses_taken.student_id = :sid) AS
                            liberalEd_courses");
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$completed_liberal_hours = $result->fetchColumn();
	
	//get the number of hours of any courses where student has taken the course AND its equivalent
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM
								(SELECT * FROM courses_taken WHERE student_id = :sid) AS a
								INNER JOIN (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_liberalEd=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS b ON a.course_id = b.course_id
								INNER JOIN (SELECT * FROM course_equivalence) as c ON c.course_id = a.course_id");
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$duplicate_hours = $result->fetchColumn();
	
	//subtract the duplicate hours from the total hours completed in major
	$completed_liberal_hours -= $duplicate_hours;
	
    if($liberal_hours == 0)
    {
        $completed_liberal_percent = 0;
    }
    else
    {
	   $completed_liberal_percent = number_format(($completed_liberal_hours/$liberal_hours)*100,2,'.','');
    }
	
	if ($completed_liberal_percent > 100)
	{
		$completed_liberal_percent = number_format(100,2,'.','');
	}
	
	
	//get the total number of communications credit hours for student's concentration
	//if the student completed UWRT 1103 (3 credit hours) which fulfills requirement for both 1101 and 1102, then the number of required credit hours is 9
	$result = $conn->prepare("SELECT COUNT(*) FROM courses_taken WHERE course_id='UWRT 1103'AND student_id=:sid");
	$result->bindParam(':sid',$id);
	$result->execute();
	if($result->fetchColumn() > 0) $communication_hours = 9;
	else $communication_hours = 12;
	
	//get the number of hours the student has completed toward communications requirement
<<<<<<< HEAD
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taken
                            ON program_courses.dept_id = courses_taken.dept_id AND program_courses.course_id = courses_taken.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_communications = 1 AND courses_taken.student_id = :sid) AS
                            communications_courses");
=======
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM(
								SELECT *
								FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_communications=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS a
								WHERE a.course_id IN 
								(SELECT course_id FROM Courses_Taken WHERE student_id = :sid
								 UNION SELECT DISTINCT exemption_for FROM courses_taken WHERE student_id = :sid AND exemption_for LIKE 'LBST%')) AS communications_courses");
>>>>>>> feature/progressBar
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$completed_communication_hours = $result->fetchColumn();
	
	//get the number of hours of any courses where student has taken the course AND its equivalent
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM
								(SELECT * FROM courses_taken WHERE student_id = :sid) AS a
								INNER JOIN (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_communications=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS b ON a.course_id = b.course_id
								INNER JOIN (SELECT * FROM course_equivalence) as c ON c.course_id = a.course_id");
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$duplicate_hours = $result->fetchColumn();
	
	//subtract the duplicate hours from the total communications hours completed
	$completed_communication_hours -= $duplicate_hours;
	
	
	//student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	if($communication_hours == 0)
    {
        $completed_communication_percent = 0;
    }
    else
    {
	   $completed_communication_percent = number_format(($completed_communication_hours/$communication_hours)*100,2,'.','');
    }
    
	if ($completed_communication_percent > 100)
	{
		$completed_communication_percent = number_format(100,2,'.','');
	}
    
    
    //get the number of hours the student is currently taking toward their major
<<<<<<< HEAD
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taking_now
                            ON program_courses.dept_id = courses_taking_now.dept_id AND program_courses.course_id = courses_taking_now.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_major = 1 AND             
                            courses_taking_now.student_id = :sid) AS major_courses");
=======
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM(
								SELECT *
								FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_major=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS a
								WHERE a.course_id IN 
								(SELECT course_id FROM Courses_Taking_Now WHERE student_id = :sid)) 
								AS major_courses");
>>>>>>> feature/progressBar
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$taking_now_major_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	$taking_now_major_percent = number_format(($taking_now_major_hours/$major_hours)*100,2,'.','');
	if ($taking_now_major_percent > 100)
	{
		$taking_now_major_percent = number_format(100,2,'.','');
	}
    
    //get number of hours student is taking now toward their math option
	if($math_option == 1)
	{
<<<<<<< HEAD
		$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taking_now
                            ON program_courses.dept_id = courses_taking_now.dept_id AND program_courses.course_id = courses_taking_now.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_math1 = 1 AND             
                            courses_taking_now.student_id = :sid) AS math_courses");
	}
	else
	{
		$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taking_now
                            ON program_courses.dept_id = courses_taking_now.dept_id AND program_courses.course_id = courses_taking_now.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_math2 = 1 AND             
                            courses_taking_now.student_id = :sid) AS math2_courses");
=======
		$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM(
								SELECT *
								FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_math1=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS a
								WHERE a.course_id IN 
								(SELECT course_id FROM Courses_Taking_Now WHERE student_id = :sid))
								 AS math_credits");
	}
	else
	{
		$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM(
								SELECT *
								FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_math2=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS a
								WHERE a.course_id IN 
								(SELECT course_id FROM Courses_Taking_Now WHERE student_id = :sid))
								 AS math_credits");
>>>>>>> feature/progressBar
	}
    
    $result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$taking_now_math_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> origin/master
	
    if($math_hours == 0)
    {
        $taking_now_math_percent = 0;
    }
    else
    {
	   $taking_now_math_percent = number_format(($completed_social_science_hours/$social_science_hours)*100,2,'.','');
    }
<<<<<<< HEAD
=======
	$taking_now_math_percent = number_format(($taking_now_math_hours/$math_hours)*100,2,'.','');
>>>>>>> feature/progressBar
=======
>>>>>>> origin/master
	if ($taking_now_math_percent > 100)
	{
		$taking_now_math_percent = number_format(100,2,'.','');
	}
    
    //get science hours taking now
<<<<<<< HEAD
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taking_now
                            ON program_courses.dept_id = courses_taking_now.dept_id AND program_courses.course_id = courses_taking_now.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_science = 1 AND             
                            courses_taking_now.student_id = :sid) AS science_courses");
=======
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM(
								SELECT *
								FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_science=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS a
								WHERE a.course_id IN 
								(SELECT course_id FROM Courses_Taken WHERE student_id = :sid))
								 AS science_courses");
>>>>>>> feature/progressBar
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$taking_now_science_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> origin/master
	if($science_hours == 0)
    {
        $taking_now_science_percent = 0;
    }
    else
    {
	   $taking_now_science_percent = number_format(($taking_now_science_hours/$science_hours)*100,2,'.','');
    }

<<<<<<< HEAD
=======
	$taking_now_science_percent = number_format(($taking_now_science_hours/$science_hours)*100,2,'.','');
>>>>>>> feature/progressBar
=======
>>>>>>> origin/master
	if ($taking_now_science_percent > 100)
	{
		$taking_now_science_percent = number_format(100,2,'.','');
	}
    
    //get social science hours taking now
<<<<<<< HEAD
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taking_now
                            ON program_courses.dept_id = courses_taking_now.dept_id AND program_courses.course_id = courses_taking_now.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_social_science = 1 AND             
                            courses_taking_now.student_id = :sid) AS social_science_courses");
=======
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM(
								SELECT *
								FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_social_science=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS a
								WHERE a.course_id IN 
								(SELECT course_id FROM Courses_Taking_now WHERE student_id = :sid))
								 AS science_courses");
>>>>>>> feature/progressBar
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$taking_now_social_science_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> origin/master
	if($social_science_hours == 0)
    {
        $taking_now_social_science_percent = 0;
    }
    else
    {
	   $taking_now_social_science_percent = number_format(($taking_now_social_science_hours/$social_science_hours)*100,2,'.','');
    }

<<<<<<< HEAD
=======
	$taking_now_social_science_percent = number_format(($taking_now_science_hours/$science_hours)*100,2,'.','');
>>>>>>> feature/progressBar
=======
>>>>>>> origin/master
	if ($taking_now_social_science_percent > 100)
	{
		$taking_now_social_science_percent = number_format(100,2,'.','');
	}
    
    //get the total number of liberal education requirements taking now	
<<<<<<< HEAD
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taking_now
                            ON program_courses.dept_id = courses_taking_now.dept_id AND program_courses.course_id = courses_taking_now.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_liberalEd = 1 AND             
                            courses_taking_now.student_id = :sid) AS liberalEd_courses");
=======
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM(
								SELECT *
								FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_liberalEd=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS a
								WHERE a.course_id IN 
<<<<<<< HEAD
								(SELECT course_id FROM Courses_Taken WHERE student_id = :sid)) AS liberalEd_courses");
>>>>>>> feature/progressBar
=======
								(SELECT course_id FROM Courses_taking_now WHERE student_id = :sid)) AS liberalEd_courses");
>>>>>>> origin/master
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$taking_now_liberal_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> origin/master
	if($liberal_hours == 0)
    {
        $taking_now_liberal_percent = 0;
    }
    else
    {
	   $taking_now_liberal_percent = number_format(($taking_now_liberal_hours/$liberal_hours)*100,2,'.','');
    }

<<<<<<< HEAD
=======
	$taking_now_liberal_percent = number_format(($taking_now_science_hours/$science_hours)*100,2,'.','');
>>>>>>> feature/progressBar
=======
>>>>>>> origin/master
	if ($taking_now_liberal_percent > 100)
	{
		$taking_now_liberal_percent = number_format(100,2,'.','');
	}
    
    //get the number of hours the student is taking now toward communications requirement
<<<<<<< HEAD
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taking_now
                            ON program_courses.dept_id = courses_taking_now.dept_id AND program_courses.course_id = courses_taking_now.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_communications = 1 AND             
                            courses_taking_now.student_id = :sid) AS communications_courses");
=======
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM(
								SELECT *
								FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_communications=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS a
								WHERE a.course_id IN 
<<<<<<< HEAD
								(SELECT course_id FROM Courses_Taken WHERE student_id = :sid)) AS communications_courses");
>>>>>>> feature/progressBar
=======
								(SELECT course_id FROM Courses_taking_now WHERE student_id = :sid)) AS communications_courses");
>>>>>>> origin/master
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$taking_now_communication_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
<<<<<<< HEAD
<<<<<<< HEAD
	$taking_now_communication_percent = number_format(($taking_now_communication_hours/$communication_hours)*100,2,'.','');
=======
	$taking_now_communication_percent = number_format(($taking_now_science_hours/$science_hours)*100,2,'.','');
>>>>>>> feature/progressBar
=======
	$taking_now_communication_percent = number_format(($taking_now_communication_hours/$communication_hours)*100,2,'.','');
>>>>>>> origin/master
	if ($taking_now_communication_percent > 100)
	{
		$taking_now_communication_percent = number_format(100,2,'.','');
	}
		
}
//get the number of hours the student is planning taking toward their major
<<<<<<< HEAD
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_planning
                            ON program_courses.dept_id = courses_planning.dept_id AND program_courses.course_id = courses_planning.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_major = 1 AND courses_planning.student_id 
                            = :sid) AS major_courses");
=======
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM(
								SELECT *
								FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_major=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS a
								WHERE a.course_id IN 
								(SELECT course_id FROM Courses_planning WHERE student_id = :sid)) 
								AS major_courses");
>>>>>>> origin/master
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$planning_major_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	if($major_hours == 0)
    {
        $planning_major_percent = 0;
    }
    else
    {
	   $planning_major_percent = number_format(($planning_major_hours/$major_hours)*100,2,'.','');
    }

	if ($planning_major_percent > 100)
	{
		$planning_major_percent = number_format(100,2,'.','');
	}
//get number of hours student is planning toward their math option
	if($math_option == 1)
	{
<<<<<<< HEAD
		$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_planning
                            ON program_courses.dept_id = courses_planning.dept_id AND program_courses.course_id = courses_planning.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_math1 = 1 AND courses_planning.student_id 
                            = :sid) AS math1_courses");
	}
	else
	{
		$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_planning
                            ON program_courses.dept_id = courses_planning.dept_id AND program_courses.course_id = courses_planning.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_math2 = 1 AND courses_planning.student_id 
                            = :sid) AS math2_courses");
=======
		$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM(
								SELECT *
								FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_math1=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS a
								WHERE a.course_id IN 
								(SELECT course_id FROM Courses_planning WHERE student_id = :sid))
								 AS math_credits");
	}
	else
	{
		$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM(
								SELECT *
								FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_math2=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS a
								WHERE a.course_id IN 
								(SELECT course_id FROM Courses_planning WHERE student_id = :sid))
								 AS math_credits");
>>>>>>> origin/master
	}
    
    $result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$planning_math_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	if($math_hours == 0)
    {
        $planning_math_percent = 0;
    }
    else
    {
	   $planning_math_percent = number_format(($planning_math_hours/$math_hours)*100,2,'.','');
    }
	if ($planning_math_percent > 100)
	{
		$planning_math_percent = number_format(100,2,'.','');
	}
//get science hours planning
<<<<<<< HEAD
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_planning
                            ON program_courses.dept_id = courses_planning.dept_id AND program_courses.course_id = courses_planning.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_science = 1 AND courses_planning.student_id 
                            = :sid) AS science_courses");
=======
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM(
								SELECT *
								FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_science=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS a
								WHERE a.course_id IN 
								(SELECT course_id FROM Courses_planning WHERE student_id = :sid))
								 AS science_courses");
>>>>>>> origin/master
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$planning_science_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	if($science_hours == 0)
    {
        $planning_science_percent = 0;
    }
    else
    {
	   $planning_science_percent = number_format(($planning_science_hours/$science_hours)*100,2,'.','');
    }
	if ($planning_science_percent > 100)
	{
		$planning_science_percent = number_format(100,2,'.','');
	}
    
    //get social science hours taking now
<<<<<<< HEAD
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_planning
                            ON program_courses.dept_id = courses_planning.dept_id AND program_courses.course_id = courses_planning.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_science = 1 AND courses_planning.student_id 
                            = :sid) AS social_science_courses");
=======
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM(
								SELECT *
								FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_social_science=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS a
								WHERE a.course_id IN 
								(SELECT course_id FROM Courses_planning WHERE student_id = :sid))
								 AS science_courses");
>>>>>>> origin/master
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$planning_social_science_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	if($social_science_hours == 0)
    {
        $planning_social_science_percent = 0;
    }
    else
    {
	   $planning_social_science_percent = number_format(($planning_social_science_hours/$social_science_hours)*100,2,'.','');
    }
	if ($planning_social_science_percent > 100)
	{
		$planning_social_science_percent = number_format(100,2,'.','');
	}
    
    //get the total number of liberal education requirements taking now	
<<<<<<< HEAD
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_planning
                            ON program_courses.dept_id = courses_planning.dept_id AND program_courses.course_id = courses_planning.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_liberalEd = 1 AND courses_planning.student_id 
                            = :sid) AS liberalEd_courses");
=======
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM(
								SELECT *
								FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_liberalEd=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS a
								WHERE a.course_id IN 
								(SELECT course_id FROM Courses_planning WHERE student_id = :sid)) AS liberalEd_courses");
>>>>>>> origin/master
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$planning_liberal_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	if($liberal_hours == 0)
    {
        $planning_liberal_percent = 0;
    }
    else
    {
	   $planning_liberal_percent = number_format(($planning_liberal_hours/$liberal_hours)*100,2,'.','');
    }
	if ($planning_liberal_percent > 100)
	{
		$planning_liberal_percent = number_format(100,2,'.','');
	}
    
    //get the number of hours the student is taking now toward communications requirement
<<<<<<< HEAD
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_planning
                            ON program_courses.dept_id = courses_planning.dept_id AND program_courses.course_id = courses_planning.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_communications = 1 AND courses_planning.student_id 
                            = :sid) AS communications_courses");
=======
	$result = $conn->prepare("SELECT(SUM(credit_hours)) AS hours FROM(
								SELECT *
								FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
								WHERE program_id=:pid AND concentration_id=:conid AND fulfills_communications=1 AND Program_Courses.course_id = Course_List.course_id 
								) AS a
								WHERE a.course_id IN 
								(SELECT course_id FROM Courses_planning WHERE student_id = :sid)) AS communications_courses");
>>>>>>> origin/master
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$planning_communication_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	if($communication_hours == 0)
    {
        $planning_communication_percent = 0;
    }
    else
    {
	   $planning_communication_percent = number_format(($planning_communication_hours/$liberal_hours)*100,2,'.','');
    }
	if ($planning_communication_percent > 100)
	{
		$planning_communication_percent = number_format(100,2,'.','');
	}
		
?>

<!DOCTYPE html>   
<!-- This is a html file for the student's page within the virtual adviser -->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> 
	<head>
		<meta charset="UTF-8">
<<<<<<< HEAD
		<title> Virtual Adviser</title>		
        <script src="./jqplot/src/jquery.js"></script>
        <script src="./jqplot/src/jquery.jqplot.js"></script>
        <script src="./jqplot/src/plugins/jqplot.barRenderer.js"></script>
        <script src="./jqplot/src/plugins/jqplot.categoryAxisRenderer.js"></script>
        <script src="./jqplot/src/plugins/jqplot.pointLabels.js"></script>
        <script src="./testBars.js"></script>
        <link rel="stylesheet" type="text/css" media='screen' href="css/student.screen.css">
        <link rel="stylesheet" type="text/css" media='screen' href="./jqplot/src/jquery.jqplot.css"/>
            
            <!-- JQuery function using jplot to draw "progress" bars -->
            <script>
            $( document ).ready(function() {
                var data = [[12, 1], [8, 2], [6, 3], [10, 4], [7, 5]];
                var data2 = [[14, 1], [12, 2], [4, 3], [14, 4], [11, 5]];
                var data3 = [[18, 1], [10, 2], [5, 3], [9, 4], [9, 5]];
                var ticks = ['Germany', 'Italy', 'Spain', 'France', 'UK'];
                var options = {
                    animate: true,
                    animateReplot: true,
                    stackSeries: true,
                    seriesDefaults: {
                        renderer: $.jqplot.BarRenderer,
                        pointLabels: {show: true,location: 'w'},
                        rendererOptions: { 
                            barMargin: 10,
                            barDirection: 'horizontal'},
                    },
                    axesDefaults:{
                        tickOptions: {textColor: '#ffffff'}
                    },
                    axes:{
                        yaxis:{renderer: $.jqplot.CategoryAxisRenderer,
                            ticks: ticks,
                            tickOptions: {showGridline:false, showMark:false}
                        },
                        xaxis:{showTicks:false,
                               show: false,
                               tickOptions:{showGridline: false},
                               rendererOptions:{drawBaseline:false}
                        }
                    },
                    grid:{
                        background:'transparent',
                        drawBorder: false,
                        shadow: false}
                };
                 $.jqplot('myChart', [data,data2,data3],options);
            });
            </script>
 </head>
    <body>
		<!-- The div that displays the welcome message-->
		<div class="welcome">
			<h1><strong>Welcome, <?php echo $_SESSION['name'] ?>, I'm Professor Bruce, your Virtual Adviser</strong></h1>
<<<<<<< HEAD
=======
=======
		<title> Virtual Adviser</title>
		<link rel="stylesheet" type="text/css" media='screen' href="css/student.screen.css">
        <script src="js/jquery.jsj"></script>
        <script src="js/progressbar.js"></script> 
        <script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
        <script src="js/d3circle.js"</script>
        <script src="js/d3horizontalBars.js"</script>
	</head>
	<body>
        <!-- div for horizontal progress bars -->
        <div id="tooltip" class="hidden">
            <p><span id="value">100</span>
                <script type="text/javascript">var margins = {
    top: 12,
    left: 48,
    right: 24,
    bottom: 24
},
legendPanel = {
    width: 180
},
width = 500 - margins.left - margins.right - legendPanel.width,
    height = 100 - margins.top - margins.bottom,
    dataset = [{
        data: [{
            month: 'Major',
            count: <?php echo $completed_math_percent ?>
        }, {
            month: 'Math',
            count: 234
        }, {
            month: 'Science',
            count: 345
        }],
        name: 'Series #1'
    }, {
        data: [{
            month: 'Major',
            count: 235
        }, {
            month: 'Math',
            count: 267
        }, {
            month: 'Science',
            count: 573
        }],
        name: 'Series #2'
    }

    ],
    series = dataset.map(function (d) {
        return d.name;
    }),
    dataset = dataset.map(function (d) {
        return d.data.map(function (o, i) {
            // Structure it so that your numeric
            // axis (the stacked amount) is y
            return {
                y: o.count,
                x: o.month
            };
        });
    }),
    stack = d3.layout.stack();

stack(dataset);

var dataset = dataset.map(function (group) {
    return group.map(function (d) {
        // Invert the x and y values, and y0 becomes x0
        return {
            x: d.y,
            y: d.x,
            x0: d.y0
        };
    });
}),
    svg = d3.select('body')
        .append('svg')
        .attr('width', width + margins.left + margins.right + legendPanel.width)
        .attr('height', height + margins.top + margins.bottom)
        .append('g')
        .attr('transform', 'translate(' + margins.left + ',' + margins.top + ')'),
    xMax = d3.max(dataset, function (group) {
        return d3.max(group, function (d) {
            return d.x + d.x0;
        });
    }),
    xScale = d3.scale.linear()
        .domain([0, xMax])
        .range([0, width]),
    months = dataset[0].map(function (d) {
        return d.y;
    }),
    _ = console.log(months),
    yScale = d3.scale.ordinal()
        .domain(months)
        .rangeRoundBands([0, height], .1),
    xAxis = d3.svg.axis()
        .scale(xScale)
        .orient('bottom'),
    yAxis = d3.svg.axis()
        .scale(yScale)
        .orient('left'),
    colours = d3.scale.category10(),
    groups = svg.selectAll('g')
        .data(dataset)
        .enter()
        .append('g')
        .style('fill', function (d, i) {
        return colours(i);
    }),
    rects = groups.selectAll('rect')
        .data(function (d) {
        return d;
    })
        .enter()
        .append('rect')
        .attr('x', function (d) {
        return xScale(d.x0);
    })
        .attr('y', function (d, i) {
        return yScale(d.y);
    })
        .attr('height', function (d) {
        return yScale.rangeBand();
    })
        .attr('width', function (d) {
        return xScale(d.x);
    })
        .on('mouseover', function (d) {
        var xPos = parseFloat(d3.select(this).attr('x')) / 2 + width / 2;
        var yPos = parseFloat(d3.select(this).attr('y')) + yScale.rangeBand() / 2;

        d3.select('#tooltip')
            .style('left', xPos + 'px')
            .style('top', yPos + 'px')
            .select('#value')
            .text(d.x);

        d3.select('#tooltip').classed('hidden', false);
    })
        .on('mouseout', function () {
        d3.select('#tooltip').classed('hidden', true);
    })

    svg.append('g')
        .attr('class', 'axis')
        .attr('transform', 'translate(0,' + height + ')')
        .call(xAxis);

svg.append('g')
    .attr('class', 'axis')
    .call(yAxis);

svg.append('rect')
    .attr('fill', 'yellow')
    .attr('width', 160)
    .attr('height', 30 * dataset.length)
    .attr('x', width + margins.left)
    .attr('y', 0);

series.forEach(function (s, i) {
    svg.append('text')
        .attr('fill', 'black')
        .attr('x', width + margins.left + 8)
        .attr('y', i * 24 + 24)
        .text(s);
    svg.append('rect')
        .attr('fill', colours(i))
        .attr('width', 60)
        .attr('height', 20)
        .attr('x', width + margins.left + 90)
        .attr('y', i * 24 + 6);
});</script>
            </p>
        </div>
		<!-- The div that displays the welcome message-->
		<div class="welcome">
			<h1><strong>Welcome, <?php echo $_SESSION['name'] ?>, I'm Professor Bruce, your Virtual Adviser</strong></h1>
            >h1><?php echo $completed_major_hours; ?></h1>
>>>>>>> origin/master
            <hr/>
            <div class = "bardiv">
                <p class = "alignleft">MAJOR</p>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $completed_major_percent ?>,$('#progressBar'));</script></div>
                </div>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $taking_now_major_percent ?>,$('#progressBar'));</script></div>
                </div>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $planning_major_percent ?>,$('#progressBar'));</script></div>
                </div>
                <br>
                <p class = "alignleft">MATH</p>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $completed_math_percent ?>,$('#progressBar'));</script></div>
                </div>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $taking_now_math_percent ?>,$('#progressBar'));</script></div>
                </div>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $planning_math_percent ?>,$('#progressBar'));</script></div>
                </div>
                <br>
                <p class = "alignleft">SCIENCE</p>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $completed_science_percent ?>,$('#progressBar'));</script></div>
                </div>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $taking_now_science_percent ?>,$('#progressBar'));</script></div>
                </div>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $planning_science_percent ?>,$('#progressBar'));</script></div>
                </div>
                <br>
                <p class = "alignleft">SOCIAL SCIENCE</p>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $completed_social_science_percent ?>,$('#progressBar'));</script></div>
                </div>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $taking_now_social_science_percent ?>,$('#progressBar'));</script></div>
                </div>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $planning_social_science_percent ?>,$('#progressBar'));</script></div>
                </div>
                <br>
                <p class = "alignleft">LIBERAL STUDIES</p>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $completed_liberal_percent ?>,$('#progressBar'));</script></div>
                </div>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $taking_now_liberal_percent ?>,$('#progressBar'));</script></div>
                </div>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $planning_liberal_percent ?>,$('#progressBar'));</script></div>
                </div>
                <br>
                <p class = "alignleft">COMMUNICATIONS</p>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $completed_communication_percent ?>,$('#progressBar'));</script></div>
                </div>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $taking_now_communication_percent ?>,$('#progressBar'));</script></div>
                </div>
                <div id="progressBar" class = "alignleft">
                    <div><script>progress(<?php echo $planning_communication_percent ?>,$('#progressBar'));</script></div>
                </div>
                <br>
            </div> <!-- end bardiv class div -->
<<<<<<< HEAD
            <!--
>>>>>>> feature/progressBar
=======
            
>>>>>>> origin/master
            <p>Your degree program is <?php echo $program ?></p> 
			<p>Your concentration is <?php echo $concentration ?></p>
            <hr/>
            <!-- draw "progress" bars -->
            <div id="myChart" style="height:400px;width:500px; "></div>
			<p>Total major hours: <?php echo $major_hours ?>  Total Completed: <?php echo $completed_major_hours ?></p>
			<p>Completed major percentage: <?php echo $completed_major_percent ?>%</p>
            <!--
			<p>Math Option: <?php echo $math_option ?> Total hours: <?php echo $math_hours ?> Completed: <?php echo $completed_math_hours ?></p>
			<p>Completed math percentage: <?php echo $completed_math_percent ?>%</p>
			<p>Total science hours: <?php echo $science_hours ?>  Total Completed: <?php echo $completed_science_hours ?></p>
			<p>Completed science percentage: <?php echo $completed_science_percent ?>%</p>
			<p>Total social science hours: <?php echo $social_science_hours ?>  Total Completed: <?php echo $completed_social_science_hours ?></p>
			<p>Completed social science percentage: <?php echo $completed_social_science_percent ?>%</p>
			<p>Total liberal education hours: <?php echo $liberal_hours ?>  Total Completed: <?php echo $completed_liberal_hours ?></p>
			<p>Completed liberal education percentage: <?php echo $completed_liberal_percent ?>%</p>
			<p>Total communications hours: <?php echo $communication_hours ?>  Total Completed: <?php echo $completed_communication_hours ?></p>
			<p>Completed communications percentage: <?php echo $completed_communication_percent ?>%</p> -->
			<!-- include the uncc white crown logo with green background -->
			
            <img src="images/CrownLogo_White.png" alt="UNCC Logo" style="width:194px;height:97px" class = "center">

        </div> <!-- end welcome class div -->
        
	</body>
</html>
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> feature/progressBar
=======
>>>>>>> origin/master
