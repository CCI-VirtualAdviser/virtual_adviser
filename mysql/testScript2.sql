use virtual_adviser2;

SELECT(SUM(credit_hours)) AS hours FROM(

SELECT DISTINCT Course_List.dept_id,Course_List.course_id,course_list.credit_hours FROM Program_Courses,Course_List 
WHERE Program_Courses.course_id = Course_List.course_id AND Program_Courses.dept_id = Course_List.dept_id
INNER JOIN 
SELECT dept_id,course_id FROM Courses_Taken
UNION SELECT DISTINCT Courses_Taken.exemption_for_dept,Courses_Taken.exemption_for_course FROM Program_Courses,Courses_Taken 
WHERE Program_Courses.course_id = Courses_Taken.exemption_for_course AND Program_Courses.dept_id = Courses_Taken.exemption_for_dept 
AND Courses_Taken.student_id = '800726001' 
)
AS major_courses;


SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
WHERE program_id = "Bachelor of Arts" AND concentration_id = 'Web Development' AND fulfills_major = 1
UNION
SELECT courses_taken.dept_id,courses_taken.course_id FROM courses_taken
WHERE courses_taken.student_id = '800726001';

SELECT COUNT(*) FROM (
SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
INNER JOIN courses_taken
ON program_courses.dept_id = courses_taken.dept_id AND program_courses.course_id = courses_taken.course_id
WHERE program_id = "Bachelor of Arts" AND concentration_id = 'Web Development' AND fulfills_science = 1 AND courses_taken.student_id = '800726001') AS science_courses;

SELECT COUNT(*) FROM (
SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
INNER JOIN courses_taking_now
ON program_courses.dept_id = courses_taking_now.dept_id AND program_courses.course_id = courses_taking_now.course_id
WHERE program_id = "Bachelor of Arts" AND concentration_id = 'Web Development' AND fulfills_science = 1 AND courses_taking_now.student_id = '800726001') AS science_courses;

SELECT COUNT(*) FROM (
SELECT program_courses.dept_id,program_courses.course_id FROM program_courses  
INNER JOIN courses_planning
ON program_courses.dept_id = courses_planning.dept_id AND program_courses.course_id = courses_planning.course_id
WHERE program_id = "Bachelor of Arts" AND concentration_id = 'Web Development' AND fulfills_science = 1 AND courses_planning.student_id = '800726001') AS science_courses;

SELECT program_courses.dept_id,program_courses.course_id FROM program_courses WHERE program_courses.program_id = "Bachelor of Arts" AND program_courses.concentration_id = 'Web Development' 
AND program_courses.fulfills_science = 1;