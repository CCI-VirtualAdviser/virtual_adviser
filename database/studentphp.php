
<?php 
session_start();
$username = 'root';
$password = '';
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
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taken
                            ON program_courses.dept_id = courses_taken.dept_id AND program_courses.course_id = courses_taken.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_communications = 1 AND courses_taken.student_id = :sid) AS
                            communications_courses");
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
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taking_now
                            ON program_courses.dept_id = courses_taking_now.dept_id AND program_courses.course_id = courses_taking_now.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_major = 1 AND             
                            courses_taking_now.student_id = :sid) AS major_courses");
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
	}
    
    $result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$taking_now_math_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	
    if($math_hours == 0)
    {
        $taking_now_math_percent = 0;
    }
    else
    {
	   $taking_now_math_percent = number_format(($completed_social_science_hours/$social_science_hours)*100,2,'.','');
    }
	if ($taking_now_math_percent > 100)
	{
		$taking_now_math_percent = number_format(100,2,'.','');
	}
    
    //get science hours taking now
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taking_now
                            ON program_courses.dept_id = courses_taking_now.dept_id AND program_courses.course_id = courses_taking_now.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_science = 1 AND             
                            courses_taking_now.student_id = :sid) AS science_courses");
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$taking_now_science_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	if($science_hours == 0)
    {
        $taking_now_science_percent = 0;
    }
    else
    {
	   $taking_now_science_percent = number_format(($taking_now_science_hours/$science_hours)*100,2,'.','');
    }

	if ($taking_now_science_percent > 100)
	{
		$taking_now_science_percent = number_format(100,2,'.','');
	}
    
    //get social science hours taking now
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taking_now
                            ON program_courses.dept_id = courses_taking_now.dept_id AND program_courses.course_id = courses_taking_now.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_social_science = 1 AND             
                            courses_taking_now.student_id = :sid) AS social_science_courses");
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$taking_now_social_science_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	if($social_science_hours == 0)
    {
        $taking_now_social_science_percent = 0;
    }
    else
    {
	   $taking_now_social_science_percent = number_format(($taking_now_social_science_hours/$social_science_hours)*100,2,'.','');
    }

	if ($taking_now_social_science_percent > 100)
	{
		$taking_now_social_science_percent = number_format(100,2,'.','');
	}
    
    //get the total number of liberal education requirements taking now	
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taking_now
                            ON program_courses.dept_id = courses_taking_now.dept_id AND program_courses.course_id = courses_taking_now.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_liberalEd = 1 AND             
                            courses_taking_now.student_id = :sid) AS liberalEd_courses");
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$taking_now_liberal_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	if($liberal_hours == 0)
    {
        $taking_now_liberal_percent = 0;
    }
    else
    {
	   $taking_now_liberal_percent = number_format(($taking_now_liberal_hours/$liberal_hours)*100,2,'.','');
    }

	if ($taking_now_liberal_percent > 100)
	{
		$taking_now_liberal_percent = number_format(100,2,'.','');
	}
    
    //get the number of hours the student is taking now toward communications requirement
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_taking_now
                            ON program_courses.dept_id = courses_taking_now.dept_id AND program_courses.course_id = courses_taking_now.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_communications = 1 AND             
                            courses_taking_now.student_id = :sid) AS communications_courses");
	$result->bindParam(':sid',$id);
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$taking_now_communication_hours = $result->fetchColumn();
    
    //student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	$taking_now_communication_percent = number_format(($taking_now_communication_hours/$communication_hours)*100,2,'.','');
	if ($taking_now_communication_percent > 100)
	{
		$taking_now_communication_percent = number_format(100,2,'.','');
	}
		
}
//get the number of hours the student is planning taking toward their major
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_planning
                            ON program_courses.dept_id = courses_planning.dept_id AND program_courses.course_id = courses_planning.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_major = 1 AND courses_planning.student_id 
                            = :sid) AS major_courses");
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
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_planning
                            ON program_courses.dept_id = courses_planning.dept_id AND program_courses.course_id = courses_planning.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_science = 1 AND courses_planning.student_id 
                            = :sid) AS science_courses");
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
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_planning
                            ON program_courses.dept_id = courses_planning.dept_id AND program_courses.course_id = courses_planning.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_science = 1 AND courses_planning.student_id 
                            = :sid) AS social_science_courses");
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
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_planning
                            ON program_courses.dept_id = courses_planning.dept_id AND program_courses.course_id = courses_planning.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_liberalEd = 1 AND courses_planning.student_id 
                            = :sid) AS liberalEd_courses");
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
	$result = $conn->prepare("SELECT COUNT(*) FROM (
                            SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
                            INNER JOIN courses_planning
                            ON program_courses.dept_id = courses_planning.dept_id AND program_courses.course_id = courses_planning.course_id
                            WHERE program_id = :pid AND concentration_id = :conid AND fulfills_communications = 1 AND courses_planning.student_id 
                            = :sid) AS communications_courses");
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