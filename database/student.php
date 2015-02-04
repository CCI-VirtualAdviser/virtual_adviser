<?php 
session_start();
$username = 'root';
$password = '';
$url = 'localhost';
$database = 'virtual_adviser3';
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
	echo $e;
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
	
    //create a view (temporary table) of rows of courses/credit hours in student's major
    $result = $conn->prepare("CREATE OR REPLACE VIEW major_hours (dept_id,course_id,credit_hours) AS
                SELECT  c.dept_id, c.course_id, c.credit_hours
                FROM course_list c
                INNER JOIN program_courses p
                ON c.dept_id=p.dept_id AND c.course_id=p.course_id
                WHERE p.program_id = :pid AND
                    p.concentration_id = :conid AND p.fulfills_major = 1");
        $result->bindParam(':pid',$program);
        $result->bindParam(':conid',$concentration);
        $result->execute();
	//get the total number of credit hours in the student's major for his or her concentration
	$result = $conn->prepare("SELECT SUM(credit_hours) FROM major_hours");
	$result->bindParam(':pid',$program);
	$result->bindParam(':conid',$concentration);
	$result->execute();
	$major_hours = $result->fetchColumn();
    
    //now, the variable $major_hours contains the sum of all the rows returned by the query above, which includes duplicates like
    //PHIL 1105 and PHIL 1106, so we need to subtract the duplicate credits
    $result = $conn->prepare("SELECT SUM(credit_hours) FROM(
                                SELECT m.dept_id,m.course_id,m.credit_hours
                                FROM major_hours m
                                INNER JOIN course_equivalence c 
                                ON m.dept_id=c.dept_id AND m.course_id=c.course_id) AS duplicate_hours");
    $result->execute();
	$duplicate_hours = $result->fetchColumn();
    $major_hours -= $duplicate_hours;
	
	//get the number of hours the student has completed toward their major
    //use the alias table called "major_hours" which is a table of the classes in the major
    //from the above sql query and do an inner join on it with courses_taken
	$result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                SELECT c.dept_id,c.course_id,m.credit_hours 
                                FROM courses_taken c
                                INNER JOIN major_hours m
                                ON m.dept_id=c.dept_id AND m.course_id=c.course_id
                                WHERE c.student_id=:sid) AS major_taken");
	$result->bindParam(':sid',$id);
	$result->execute();
    $completed_major_hours = $result->fetchColumn();
	
	//if completed major hours is greater than those required, set completed major hours to total required and the rest will be electives
	if ($completed_major_hours > $major_hours)
	{
		$completed_major_hours = $major_hours;
	}
	if($major_hours == 0)
    {
        $completed_major_percent = 0;
    }
    else
    {
	   $completed_major_percent = number_format(($completed_major_hours/$major_hours)*100,2,'.','');
    }
	//student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	if ($completed_major_percent > 100)
	{
		$completed_major_percent = number_format(100,2,'.','');
	}
	
	//get student's math option
	$result = $conn->prepare("SELECT option_number FROM Math_Option WHERE student_id = :sid");
	$result->bindParam(':sid',$id);
	$result->execute();
	$math_option = $result->fetchColumn();
    
    //create a view (temporary table) of rows of courses/credit hours in both math options
    $result = $conn->prepare("CREATE OR REPLACE VIEW math1_hours (dept_id,course_id,credit_hours) AS
                SELECT  c.dept_id, c.course_id, c.credit_hours
                FROM course_list c
                INNER JOIN program_courses p
                ON c.dept_id=p.dept_id AND c.course_id=p.course_id
                WHERE p.program_id = :pid AND
                    p.concentration_id = :conid AND p.fulfills_math1 = 1");
        $result->bindParam(':pid',$program);
        $result->bindParam(':conid',$concentration);
        $result->execute();
    
    $result = $conn->prepare("CREATE OR REPLACE VIEW math2_hours (dept_id,course_id,credit_hours) AS
                SELECT  c.dept_id, c.course_id, c.credit_hours
                FROM course_list c
                INNER JOIN program_courses p
                ON c.dept_id=p.dept_id AND c.course_id=p.course_id
                WHERE p.program_id = :pid AND
                    p.concentration_id = :conid AND p.fulfills_math2 = 1");
        $result->bindParam(':pid',$program);
        $result->bindParam(':conid',$concentration);
        $result->execute();
    
	//get the total hours for that option
	//note probably not necessary to use === instead of == for math option but leaving it in for now until it comes time to clean up messy code
    if($math_option === 1)
    {
        $result = $conn->prepare("SELECT SUM(credit_hours) FROM(
                            SELECT  c.dept_id, c.course_id, c.credit_hours
                            FROM course_list c
                            INNER JOIN program_courses p
                            ON c.dept_id=p.dept_id AND c.course_id=p.course_id
                            WHERE p.program_id = :pid AND
                                p.concentration_id = :conid AND p.fulfills_math1 = 1) AS math1_hours");
        $result->bindParam(':pid',$program);
        $result->bindParam(':conid',$concentration);
        $result->execute();
        $math_hours = $result->fetch();
        //get the number of hours the student has completed toward their math option
        $result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                    SELECT c.dept_id,c.course_id,m.credit_hours 
                                    FROM courses_taken c
                                    INNER JOIN math1_hours m
                                    ON m.dept_id=c.dept_id AND m.course_id=c.course_id
                                    WHERE c.student_id=:sid) AS math_taken");
        $result->bindParam(':sid',$id);
        //$result->bindParam(':pid',$program);
        //$result->bindParam(':conid',$concentration);
        $result->execute();
        $completed_math_hours = $result->fetch();
    }
    else
    {
        $result = $conn->prepare("SELECT SUM(credit_hours) FROM(
                                SELECT  c.dept_id, c.course_id, c.credit_hours
                                FROM course_list c
                                INNER JOIN program_courses p
                                ON c.dept_id=p.dept_id AND c.course_id=p.course_id
                                WHERE p.program_id = :pid AND
                                p.concentration_id = :conid AND p.fulfills_math2 = 1) AS math2_hours");
        $result->bindParam(':pid',$program);
        $result->bindParam(':conid',$concentration);
        $result->execute();
        $math_hours = $result->fetch();
        //get the number of hours the student has completed toward their math option
        $result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                    SELECT c.dept_id,c.course_id,m.credit_hours 
                                    FROM courses_taken c
                                    INNER JOIN math2_hours m
                                    ON m.dept_id=c.dept_id AND m.course_id=c.course_id
                                    WHERE c.student_id=:sid) AS math_taken");
        $result->bindParam(':sid',$id);
        //$result->bindParam(':pid',$program);
        //$result->bindParam(':conid',$concentration);
        $result->execute();
        $completed_math_hours = $result->fetch();
        
    }
	//if completed math hours is greater than those required, set completed math hours to total required and the rest will be electives
	if ($completed_math_hours > $math_hours)
	{
		$completed_math_hours = $math_hours;
	}

	if($math_hours == 0)
    {
        $completed_math_percent = 0;
    }
    else
    {
	   $completed_math_percent = number_format(($completed_math_hours[0]/$math_hours[0])*100,2,'.','');
    }
    
	if ($completed_math_percent > 100)
	{
		$completed_math_percent = number_format(100,2,'.','');
	}
    
    
	
	
	//the total number of credit hours for science and social science
	$science_hours = 7;
	$social_science_hours = 3;
	
	//create a view (temporary table) of rows of courses/credit hours in science requirements for the student's
    //program and concentration
    $result = $conn->prepare("CREATE OR REPLACE VIEW science_hours (dept_id,course_id,credit_hours) AS
                SELECT  c.dept_id, c.course_id, c.credit_hours
                FROM course_list c
                INNER JOIN program_courses p
                ON c.dept_id=p.dept_id AND c.course_id=p.course_id
                WHERE p.program_id = :pid AND
                    p.concentration_id = :conid AND p.fulfills_science = 1");
        $result->bindParam(':pid',$program);
        $result->bindParam(':conid',$concentration);
        $result->execute();
	
	//get the number of hours the student has completed toward their science requirements
	$result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                SELECT c.dept_id,c.course_id,m.credit_hours 
                                FROM courses_taken c
                                INNER JOIN science_hours m
                                ON m.dept_id=c.dept_id AND m.course_id=c.course_id
                                WHERE c.student_id=:sid) AS science_taken");
	$result->bindParam(':sid',$id);
	$result->execute();
    $completed_science_hours = $result->fetchColumn();
	
	//if completed science hours is greater than those required, set completed science hours to total required and the rest will be electives
	if ($completed_science_hours > $science_hours)
	{
		$completed_science_hours = $science_hours;
	}
    
	if($science_hours == 0)
    {
        $completed_science_percent = 0;
    }
    else
    {
	   $completed_science_percent = number_format(($completed_science_hours/$science_hours)*100,2,'.','');
    }
    
	//student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	if ($completed_science_percent > 100)
	{
		$completed_science_percent = number_format(100,2,'.','');
	}
	
	//create a view (temporary table) of rows of courses/credit hours in science requirements for the student's
    //program and concentration
    $result = $conn->prepare("CREATE OR REPLACE VIEW social_science_hours (dept_id,course_id,credit_hours) AS
                SELECT  c.dept_id, c.course_id, c.credit_hours
                FROM course_list c
                INNER JOIN program_courses p
                ON c.dept_id=p.dept_id AND c.course_id=p.course_id
                WHERE p.program_id = :pid AND
                    p.concentration_id = :conid AND p.fulfills_social_science = 1");
        $result->bindParam(':pid',$program);
        $result->bindParam(':conid',$concentration);
        $result->execute();
	
	//get the number of hours the student has completed toward their social science requirements
	$result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                SELECT c.dept_id,c.course_id,m.credit_hours 
                                FROM courses_taken c
                                INNER JOIN social_science_hours m
                                ON m.dept_id=c.dept_id AND m.course_id=c.course_id
                                WHERE c.student_id=:sid) AS social_science_taken");
	$result->bindParam(':sid',$id);
	$result->execute();
    $completed_social_science_hours = $result->fetchColumn();
    
	//if completed social hours is greater than those required, set completed social hours to total required and the rest will be electives
	if ($completed_social_science_hours > $social_science_hours)
	{
		$completed_social_science_hours = $social_science_hours;
	}
	
	if($social_science_hours == 0)
    {
        $completed_social_science_percent = 0;
    }
    else
    {
	   $completed_social_science_percent = number_format(($completed_social_science_hours/$social_science_hours)*100,2,'.','');
    }
    
	//student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	if ($completed_social_science_percent > 100)
	{
		$completed_social_science_percent = number_format(100,2,'.','');
	}
	
	//the total number of hours for liberal education requirements
	$liberal_hours = 12;
	
	//create a view (temporary table) of rows of courses/credit hours in liberal ed requirements for the student's
    //program and concentration
    $result = $conn->prepare("CREATE OR REPLACE VIEW liberal_hours (dept_id,course_id,credit_hours) AS
                SELECT  c.dept_id, c.course_id, c.credit_hours
                FROM course_list c
                INNER JOIN program_courses p
                ON c.dept_id=p.dept_id AND c.course_id=p.course_id
                WHERE p.program_id = :pid AND
                    p.concentration_id = :conid AND p.fulfills_liberalEd = 1");
        $result->bindParam(':pid',$program);
        $result->bindParam(':conid',$concentration);
        $result->execute();
	
	//get the number of hours the student has completed toward their liberal ed requirements
	$result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                SELECT c.dept_id,c.course_id,m.credit_hours 
                                FROM courses_taken c
                                INNER JOIN liberal_hours m
                                ON m.dept_id=c.dept_id AND m.course_id=c.course_id
                                WHERE c.student_id=:sid) AS liberal_taken");
	$result->bindParam(':sid',$id);
	$result->execute();
    $completed_liberal_hours = $result->fetchColumn();
	
	//if completed liberal hours is greater than those required, set completed liberal hours to total required and the rest will be electives
	if ($completed_liberal_hours > $liberal_hours)
	{
		$completed_liberal_hours = $liberal_hours;
	}
	
	$completed_liberal_percent = number_format(($completed_liberal_hours/$liberal_hours)*100,2,'.','');
	
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
	
	//create a view (temporary table) of rows of courses/credit hours in communications requirements for the student's
    //program and concentration
    $result = $conn->prepare("CREATE OR REPLACE VIEW comm_hours (dept_id,course_id,credit_hours) AS
                SELECT  c.dept_id, c.course_id, c.credit_hours
                FROM course_list c
                INNER JOIN program_courses p
                ON c.dept_id=p.dept_id AND c.course_id=p.course_id
                WHERE p.program_id = :pid AND
                    p.concentration_id = :conid AND p.fulfills_writing_communications = 1");
        $result->bindParam(':pid',$program);
        $result->bindParam(':conid',$concentration);
        $result->execute();
	
	//get the number of hours the student has completed toward their communications ed requirements
	$result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                SELECT c.dept_id,c.course_id,m.credit_hours 
                                FROM courses_taken c
                                INNER JOIN comm_hours m
                                ON m.dept_id=c.dept_id AND m.course_id=c.course_id
                                WHERE c.student_id=:sid) AS comm_taken");
	$result->bindParam(':sid',$id);
	$result->execute();
    $completed_communication_hours = $result->fetchColumn();
	
	//if completed communication hours is greater than those required, set completed communication hours to total required and the rest will be electives
	if ($completed_communication_hours > $communication_hours)
	{
		$completed_communication_hours = $communication_hours;
	}
	
	//student cannot complete more than 100% of a program, so if the completed percentage is greater than 100 make it 100
	   $completed_communication_percent = number_format(($completed_communication_hours/$communication_hours)*100,2,'.','');
    
	if ($completed_communication_percent > 100)
	{
		$completed_communication_percent = number_format(100,2,'.','');
	}

	//get all courses student is taking now
     $result = $conn->prepare("CREATE OR REPLACE VIEW courses_now (dept_id,course_id,credit_hours) AS
                                SELECT c.dept_id,c.course_id,p.credit_hours 
                                FROM courses_taking_now c
                                INNER JOIN course_list p
                                ON p.dept_id=c.dept_id AND p.course_id=c.course_id
                                WHERE c.student_id=:sid");
        $result->bindParam(':sid',$id);
        $result->execute();
		
    //get number of hours taking now for major
	$result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                SELECT p.dept_id,p.course_id,h.credit_hours 
                                FROM program_courses p
                                INNER JOIN courses_now h
                                ON h.dept_id=p.dept_id AND h.course_id=p.course_id
                                WHERE p.program_id=:pid AND p.concentration_id=:conid AND p.fulfills_major=1) AS major_taking");
    $result->bindParam(':pid',$program);
    $result->bindParam(':conid',$concentration);
	$result->execute();
	$major_hours_now = $result->fetchColumn();
	
	//get hours taking now for math option
    if($math_option === 1)
	{
		$result = $conn->prepare("SELECT SUM(credit_hours) FROM (
									SELECT p.dept_id,p.course_id,h.credit_hours 
									FROM program_courses p
									INNER JOIN courses_now h
									ON h.dept_id=p.dept_id AND h.course_id=p.course_id
									WHERE p.program_id=:pid AND p.concentration_id=:conid AND p.fulfills_math1=1) AS math_taking");
		$result->bindParam(':pid',$program);
		$result->bindParam(':conid',$concentration);
		$result->execute();
		$math_hours_now = $result->fetchColumn();
	}
	else //math option is 2
	{
		$result = $conn->prepare("SELECT SUM(credit_hours) FROM (
									SELECT p.dept_id,p.course_id,h.credit_hours 
									FROM program_courses p
									INNER JOIN courses_now h
									ON h.dept_id=p.dept_id AND h.course_id=p.course_id
									WHERE p.program_id=:pid AND p.concentration_id=:conid AND p.fulfills_math2=1) AS math_taking");
		$result->bindParam(':pid',$program);
		$result->bindParam(':conid',$concentration);
		$result->execute();
		$math_hours_now = $result->fetchColumn();
	}
    
    //get hours taking now for science
	$result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                SELECT p.dept_id,p.course_id,h.credit_hours 
                                FROM program_courses p
                                INNER JOIN courses_now h
                                ON h.dept_id=p.dept_id AND h.course_id=p.course_id
                                WHERE p.program_id=:pid AND p.concentration_id=:conid AND p.fulfills_science=1) AS 
                                science_taking");
	$result->bindParam(':pid',$program);
    $result->bindParam(':conid',$concentration);$result->execute();
	$science_hours_now = $result->fetchColumn();
    
    //get hours taking now for social science   
	$result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                SELECT p.dept_id,p.course_id,h.credit_hours 
                                FROM program_courses p
                                INNER JOIN courses_now h
                                ON h.dept_id=p.dept_id AND h.course_id=p.course_id
                                WHERE p.program_id=:pid AND p.concentration_id=:conid AND p.fulfills_social_science=1) 
                                AS social_taking");
	$result->bindParam(':pid',$program);
    $result->bindParam(':conid',$concentration);$result->execute();
	$social_hours_now = $result->fetchColumn();
    
    //get hours taking now for liberal ed
	$result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                SELECT p.dept_id,p.course_id,h.credit_hours 
                                FROM program_courses p
                                INNER JOIN courses_now h
                                ON h.dept_id=p.dept_id AND h.course_id=p.course_id
                                WHERE p.program_id=:pid AND p.concentration_id=:conid AND p.fulfills_liberalEd=1) AS 
                                liberal_taking");
	$result->bindParam(':pid',$program);
    $result->bindParam(':conid',$concentration);$result->execute();
	$liberal_hours_now = $result->fetchColumn();
    
     //get hours taking now for communications
     $result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                SELECT p.dept_id,p.course_id,h.credit_hours 
                                FROM program_courses p
                                INNER JOIN courses_now h
                                ON h.dept_id=p.dept_id AND h.course_id=p.course_id
                                WHERE p.program_id=:pid and p.concentration_id=:conid AND
                                p.fulfills_writing_communications=1) AS comm_taking");
	$result->bindParam(':pid',$program);
    $result->bindParam(':conid',$concentration);$result->execute();
	$comm_hours_now = $result->fetchColumn();
    
    //get hours student is planning for all categories
     $result = $conn->prepare("CREATE OR REPLACE VIEW course_plan (dept_id,course_id,credit_hours) AS
                                SELECT c.dept_id,c.course_id,p.credit_hours 
                                FROM courses_planning c
                                INNER JOIN course_list p
                                ON p.dept_id=c.dept_id AND p.course_id=c.course_id
                                WHERE c.student_id=:sid");
        $result->bindParam(':sid',$id);
        $result->execute();
		
    //get hours student is planning in major
	$result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                SELECT p.dept_id,p.course_id,h.credit_hours 
                                FROM program_courses p
                                INNER JOIN course_plan h
                                ON h.dept_id=p.dept_id AND h.course_id=p.course_id
                                WHERE p.program_id=:pid AND p.concentration_id=:conid AND p.fulfills_major=1) AS 
                                major_planning");
	$result->bindParam(':pid',$program);
    $result->bindParam(':conid',$concentration);$result->execute();
	$major_hours_plan = $result->fetchColumn();
	
	//get hours planning for math option
    if($math_option === 1)
	{
		$result = $conn->prepare("SELECT SUM(credit_hours) FROM (
									SELECT p.dept_id,p.course_id,h.credit_hours 
									FROM program_courses p
									INNER JOIN course_plan h
									ON h.dept_id=p.dept_id AND h.course_id=p.course_id
									WHERE p.program_id=:pid AND p.concentration_id=:conid AND p.fulfills_math1=1) AS math_taking");
		$result->bindParam(':pid',$program);
		$result->bindParam(':conid',$concentration);
		$result->execute();
		$math_hours_plan = $result->fetchColumn();
	}
	else //math option is 2
	{
		$result = $conn->prepare("SELECT SUM(credit_hours) FROM (
									SELECT p.dept_id,p.course_id,h.credit_hours 
									FROM program_courses p
									INNER JOIN course_plan h
									ON h.dept_id=p.dept_id AND h.course_id=p.course_id
									WHERE p.program_id=:pid AND p.concentration_id=:conid AND p.fulfills_math2=1) AS math_taking");
		$result->bindParam(':pid',$program);
		$result->bindParam(':conid',$concentration);
		$result->execute();
		$math_hours_plan = $result->fetchColumn();
	}
    
    //get hours taking plan for science
     $result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                SELECT p.dept_id,p.course_id,h.credit_hours 
                                FROM program_courses p
                                INNER JOIN course_plan h
                                ON h.dept_id=p.dept_id AND h.course_id=p.course_id
                                WHERE p.program_id=:pid AND p.concentration_id=:conid AND p.fulfills_science=1) AS     
                                science_planning");
	$result->bindParam(':pid',$program);
    $result->bindParam(':conid',$concentration);$result->execute();
	$science_hours_plan = $result->fetchColumn();
    
    //get hours planning plan for social science
	$result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                SELECT p.dept_id,p.course_id,h.credit_hours 
                                FROM program_courses p
                                INNER JOIN course_plan h
                                ON h.dept_id=p.dept_id AND h.course_id=p.course_id
                                WHERE p.program_id=:pid AND p.concentration_id=:conid AND p.fulfills_social_science=1) 
                                AS social_taking");
	$result->bindParam(':pid',$program);
    $result->bindParam(':conid',$concentration);$result->execute();
	$social_hours_plan = $result->fetchColumn();
    
    //get hours taking plan for liberal ed
     $result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                SELECT p.dept_id,p.course_id,h.credit_hours 
                                FROM program_courses p
                                INNER JOIN course_plan h
                                ON h.dept_id=p.dept_id AND h.course_id=p.course_id
                                WHERE p.program_id=:pid AND p.concentration_id=:conid AND p.fulfills_liberalEd=1) AS 
                                liberal_taking");
	$result->bindParam(':pid',$program);
    $result->bindParam(':conid',$concentration);$result->execute();
	$liberal_hours_plan = $result->fetchColumn();
    
    //get hours taking plan for communications
    $result = $conn->prepare("SELECT SUM(credit_hours) FROM (
                                SELECT p.dept_id,p.course_id,h.credit_hours 
                                FROM program_courses p
                                INNER JOIN course_plan h
                                ON h.dept_id=p.dept_id AND h.course_id=p.course_id
                                WHERE p.program_id=:pid AND p.concentration_id=:conid AND p.fulfills_writing_communications=1) 
                                AS comm_planning");
	$result->bindParam(':pid',$program);
    $result->bindParam(':conid',$concentration);$result->execute();
	$comm_hours_plan = $result->fetchColumn();
	
	//get the total of completed hours for each category
	$total_completed_hours = 
		$completed_major_hours +
		$completed_math_hours[0] +
		$completed_science_hours +
		$completed_social_science_hours +
		$completed_liberal_hours +
		$completed_communication_hours;
		
	//get the total of hours taking now for each category
	$total_hours_now = 
		$major_hours_now +
		$math_hours_now +
		$science_hours_now +
		$social_hours_now +
		$liberal_hours_now +
		$comm_hours_now;
	
	//get the total of hours planning for each category
	$total_hours_plan = 
		$major_hours_plan +
		$math_hours_plan +
		$science_hours_plan +
		$social_hours_plan +
		$liberal_hours_plan +
		$comm_hours_plan;
		
}
   
	//create array for progress bars
	$taken_array = json_encode (array(
		array(intVal($completed_major_hours),5),
		array(intVal($completed_science_hours),4),
		array(intVal($completed_social_science_hours),3),
		array(intVal($completed_liberal_hours),2),
		array(intVal($completed_communication_hours),1)));	

    $now_array = json_encode (array(
        array(intVal($major_hours_now),5),
        array(intVal($science_hours_now),4),
        array(intVal($social_hours_now),3),
        array(intVal($liberal_hours_now),2),
        array(intVal($comm_hours_now),1))); 

    $plan_array = json_encode (array(
        array(intVal($major_hours_plan),5),
        array(intVal($science_hours_plan),4),
        array(intVal($social_hours_plan),3),
        array(intVal($liberal_hours_plan),2),
        array(intVal($comm_hours_plan),1))); 
		
		
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>UNCC CCI Virtual Advisor</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
	<link rel="stylesheet" type="text/css" media='screen' href="css/style.css"/>
	
	<script src="./jqplot/src/jquery.js"></script>
	<script src="./jqplot/src/jquery.jqplot.js"></script>
	<script src="./jqplot/src/plugins/jqplot.barRenderer.js"></script>
	<script src="./jqplot/src/plugins/jqplot.categoryAxisRenderer.js"></script>
	<script src="./jqplot/src/plugins/jqplot.pointLabels.js"></script>
	<script src="./testBars.js"></script>
	<link rel="stylesheet" type="text/css" media='screen' href="./jqplot/src/jquery.jqplot.css"/>
	
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
	
	
	<!-- Custom JavaScript -->
	<script src="js/customjs.js"></script>
	
    <!-- JQuery function using jplot to draw "progress" bars -->
	<script>
		$( document ).ready(function() {
			var data = [[12, 1], [8, 2], [6, 3], [10, 4], [27, 5]];
			var data1 = <?php echo $taken_array;?>;
			var data2 = <?php echo $now_array;?>;
			var data3 = <?php echo $plan_array;?>;
			var ticks = ['Communications', 'Liberal Education', 'Social Science', 'Science', 'Major'];;
			var options = {
				animate: true,
				animateReplot: true,
				stackSeries: true,
				seriesColors:['#007f00', '#00b200', '#00ff00'],
				seriesDefaults: {
					renderer: $.jqplot.BarRenderer,
					pointLabels: {show: true,location: 'w'},
					rendererOptions: { 
						barMargin: 13,
						barDirection: 'horizontal'},
				},
				axesDefaults:{
					tickOptions: {textColor: 'black'}
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
			 $.jqplot('myChart', [data1,data2,data3],options);
		});
	</script>
	

    
  </head>

  <body>

    <div class="container">
      <div class="header top_header">
        <nav>
          <div class="pull-right select_boxes">
			  <select class="form-control">
				  <option>BS Computer Science</option>
				  <option>BA Computer Science</option>
				  <option>BA Software Information Systems</option>
				</select>
				<select class="form-control">
				  <option>Cyber Security</option>
				  <option>Software Info Systems</option>
				  <option>Web Development</option>
				  <option>Software Engineering</option>
				  <option>Information Technology</option>
				</select>
				<select class="form-control">
				  <option>Math Option 1</option>
				  <option>Math Option 2</option>
				</select>
          </div>
        </nav>
		<div class="pull-right select_labels">
			<h4>Degree Program</h4>
			<h4>Concentration</h4>
			<h4>Math Option</h4>
		</div>
		<div class="pull-right welcome">
			<h3>Welcome, David!</h3>
			<h3>I'm Professor Bruce, your Virtual Advisor</h3>
		
		</div>
         <img class="img-responsive" src="images/CrownLogo_White.png" alt="UNCC Logo">
      </div>
      <div class="jumbotron bar_area">
		<div class="pull-right clickables">
			<div class="add_class"><button id="comm" type="button" class="glyphButtons"><span class="glyphicon glyphicon-plus"></span></button></div>
			<div class="add_class"><button id="lib" type="button" class="glyphButtons"><span class="glyphicon glyphicon-plus"></span></button></div>
			<div class="add_class"><button id="ss" type="button" class="glyphButtons"><span class="glyphicon glyphicon-plus"></span></button></div>
			<div class="add_class"><button id="sc" type="button" class="glyphButtons"><span class="glyphicon glyphicon-plus"></span></button></div>
			<div class="add_class"><button id="con" type="button" class="glyphButtons"><span class="glyphicon glyphicon-plus"></span></button></div>
			<div class="add_class"><button id="maj" type="button" class="glyphButtons"><span class="glyphicon glyphicon-plus"></span></button></div>
			<div class="add_class"><button id="total" type="button" class="glyphButtons"><span class="glyphicon glyphicon-plus"></span></button></div>
		</div>
        <div id="myChart" style="height:400px;width:500px; "></div>
			
      </div>
<!------------------------------------------------------------------------------------------------->
	<div id="dialog-form" title="">
		
		<div>
			<h5>Available Classes</h5>
			<select class="form-control" id="list1" multiple="multiple" rows=6>
				<option value=1>Option 1</option>
				<option value=2>Option 2</option>
				<option value=3>Option 3</option>
				<option value=4>Option 4</option>
				<option value=5>Option 5</option>
				<option value=6>Option 6</option>
			</select>
			<button class="btn btn-success" id="button1" type="button" value="Add"><span class="glyphicon glyphicon-chevron-down"></button>
			<button class="btn btn-danger" id="button2" type="button" value="Add"><span class="glyphicon glyphicon-chevron-up"></button>
		</div>
		<div>
			<h5>Classes Added</h5>
			<select class="form-control" id="list2" multiple="multiple" rows=4>
				
			</select>
			
			<button id="addClassesButton" class="btn btn-success" type="button"><span class="glyphicon glyphicon-ok-sign"></span>Add Classes to Plan</button>
		</div>
	</div>	
 <!------------------------------------------------------------------------------------->
	<div class="row marketing">
        <div class="col-lg-6">
          <h4>Major Hours Completed: <?php echo $completed_major_hours ?></h4>
		  <h5>Percentage Completed: <?php echo $completed_major_percent ?>%</h5>
          <p>ITIS 1212</p>
		  <p>ITIS 1213</p>
		  <p>ITCS 2214</p>
		  <p>ITIS 2300</p>
		  <p>ITIS 3200</p>

          <h4>Math Hours Completed: <?php echo $completed_math_hours[0] ?></h4>
		  <h5>Percentage Completed: <?php echo $completed_math_percent ?>%</h5>
          <p>MATH 2164</p>
		 
          <h4>Total COMM hours Completed: <?php echo $completed_communication_hours ?></h4>
		  <h5>Percentage Completed: <?php echo $completed_communication_percent ?>%</h5>
          <p>COMM 2252</p>
		  
        </div>

        <div class="col-lg-6">
          <h4>Science Hours Completed: <?php echo $completed_science_hours ?></h4>
		  <h5>Percentage Completed: <?php echo $completed_science_percent ?>%</h5>
          <p>PYSH 1220</p>
		  <p>BIOL 1120</p>

          <h4>Liberal Education Completed: <?php echo $completed_liberal_hours ?></h4>
		  <h5>Percentage Completed:<?php echo $completed_liberal_percent ?>%</h5>
          <p>LIBB 1100</p>
		  <p>LIBB 1100</p>
		  <p>LIBB 1100</p>

          <h4>Social Science Completed: <?php echo $completed_social_science_hours ?></p></h4>
		  <h5>Percentage Completed:<?php echo $completed_social_science_hours ?>%</h5>
          <p>SCOC 1100</p>
        </div>
	</div>
		

 
 
 
 <!------------------------------------------------------------------------------------->
	
 
      <footer class="footer">
        <p>&copy; UNCC 2015</p>
      </footer>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>