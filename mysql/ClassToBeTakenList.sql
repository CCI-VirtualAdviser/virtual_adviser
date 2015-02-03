use virtual_adviser3;

-- this script will create a table of all the classes the student has taken in their major
-- and determine which classes they have left

-- get the list of classes for BA in Web Development 
CREATE OR REPLACE VIEW major_classes AS
SELECT p.dept_id,p.course_id FROM program_courses AS p
WHERE p.program_id = 'Bachelor of Arts' AND
	p.concentration_id = 'Web Development' AND p.fulfills_major = 1;
    
select * from major_classes;


-- get the classes student has taken in major
CREATE OR REPLACE VIEW student_major_classes AS
SELECT c.dept_id,c.course_id FROM courses_taken c
INNER JOIN major_classes m
ON m.dept_id=c.dept_id AND m.course_id=c.course_id
WHERE c.student_id='800726001';

select * from student_major_classes;

-- get classes student hasn't taken in major
CREATE OR REPLACE VIEW major_to_take AS
SELECT  m.dept_id,m.course_id from major_classes m
WHERE (m.dept_id,m.course_id) NOT IN
(SELECT s.dept_id,s.course_id FROM student_major_classes s);

select * from major_to_take;