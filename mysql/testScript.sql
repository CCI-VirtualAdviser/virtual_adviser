USE virtual_adviser;
SET SQL_SAFE_UPDATES = 0;
SET SQL_MODE = '';

SELECT * FROM Program_Courses WHERE fulfills_major=1 AND program_id='Bachelor Of Arts' AND concentration_id='Web Development';

-- DELETE FROM students WHERE first_name = 'Laura';
SELECT * FROM students;

-- INSERT INTO course_list (course_id,course_name,credit_hours) VALUES ('ITCS 3112','Design and Implentation of Object-Oriented Systems','3');

SELECT * FROM course_list WHERE course_id = 'ITIS 4170';
SELECT * From course_list WHERE course_id LIKE 'ITCS%' OR course_id LIKE 'ITIS%';

-- DELETE FROM course_list WHERE course_id = 'ITIS 1200';
-- INSERT INTO course_list
-- VALUES ('ITIS 1200', 'Freshman Seminar','3');

-- example of inserting column in a table after a specific other column or first in the table
-- ALTER TABLE Program_Courses ADD program_id VARCHAR(100) FIRST;
-- ALTER TABLE Program_Courses ADD conentration_id VARCHAR(100) AFTER program_id;

-- what is the character set default for a table
SELECT CCSA.character_set_name FROM information_schema.`TABLES` T,
       information_schema.`COLLATION_CHARACTER_SET_APPLICABILITY` CCSA
WHERE CCSA.collation_name = T.table_collation
  AND T.table_schema = 'virtual_adviser'
  AND T.table_name = 'advisers';

-- what is character set default for a schema
SELECT default_character_set_name FROM information_schema.SCHEMATA S
WHERE S.schema_name = "schemaname";


-- the following alterations won't occur because of foreign key constraints (changes to one table must match foreign key in another)
-- therefore, you must drop all foreign keys and reinsert them to alter the tables
-- see http://stackoverflow.com/questions/13606469/cannot-change-column-used-in-a-foreign-key-constraint
-- alter a table's character set
ALTER TABLE advisers CONVERT TO CHARACTER SET utf8;
ALTER TABLE students CONVERT TO CHARACTER SET utf8;
ALTER TABLE substitutions CONVERT TO CHARACTER SET utf8;
ALTER TABLE course_list CONVERT TO CHARACTER SET utf8;
ALTER TABLE corequisites CONVERT TO CHARACTER SET utf8;
ALTER TABLE prerequisites CONVERT TO CHARACTER SET utf8;
ALTER TABLE pre_or_corequisites CONVERT TO CHARACTER SET utf8;
ALTER TABLE outside_concentration CONVERT TO CHARACTER SET utf8;
ALTER TABLE courses_taking_now CONVERT TO CHARACTER SET utf8;
ALTER TABLE courses_planning CONVERT TO CHARACTER SET utf8;
ALTER TABLE degree_program CONVERT TO CHARACTER SET utf8;
ALTER TABLE program_courses CONVERT TO CHARACTER SET utf8;
ALTER TABLE math_option CONVERT TO CHARACTER SET utf8;
ALTER TABLE courses_taken CONVERT TO CHARACTER SET utf8;



SELECT * FROM Program_Courses WHERE concentration_id = 'Software Engineering';

SELECT * FROM Course_list WHERE course_id Like 'AAHP%';

SELECT * FROM courses_taken;


-- inserting a fake advsisers for fake students
INSERT INTO advisers VALUES ('800000000','Ethel','Mertz','Ethel.Mertz@uncc.edu','emertz','Shorty2014!');
INSERT INTO advisers VALUES ('800000001','Lucille','Ball','Lucille.Ball@uncc.edu','lball','AbFab99!');
INSERT INTO advisers VALUES ('800000002','Ricky','Ricardo','Ricky.Ricardo@uncc.edu','rricardo','Samba2014!');

-- updating the middle intials of the fake advisers to null since the table was modified 
UPDATE advisers SET middle_intial = NULL WHERE last_name = 'Ball' OR last_name = 'Mertz' OR last_name = 'Ricardo';

-- modifying the data type of program_id in Students table, because create table statement was erroneously VARCHAR(3)
ALTER TABLE Students  MODIFY program_id VARCHAR(100);

-- modify enum data type of letter_grade in Courses_Taken table to include transfer credits
-- only grades for transfer courses are TA, TB and TC, however, advanced placement comes in as TP (for pass?)
ALTER TABLE Courses_Taken MODIFY letter_grade ENUM('A','B','C','D','F','P','I','W','TP','TA','TB','TC','QF','QD','RF') NOT NULL;

-- add column for middle initial to student and advisers table
ALTER TABLE Students ADD `middle_intial` VARCHAR(3) NULL AFTER `first_name`;
ALTER TABLE Advisers ADD `middle_intial` VARCHAR(3) NULL AFTER `first_name`;

SELECT Course_List.course_id,Course_List.credit_hours FROM Program_Courses, Course_List 
WHERE program_id='BA in SIS' and concentration_id='Information Technology' and fulfills_major=1 and Program_Courses.course_id = Course_List.course_id;

-- how to sum the column of a derived table. Every derived table must have its own alias!!
SELECT COALESCE(SUM(credit_hours),0) AS hours FROM(
SELECT Course_List.credit_hours FROM Program_Courses, Course_List 
WHERE program_id='BA in SIS' and concentration_id='Information Technology' and fulfills_major=1 and Program_Courses.course_id = Course_List.course_id 
) AS major_credits;

SELECT * FROM course_list WHERE course_id='ITCS 2214';

SELECT course_id FROM courses_taken WHERE student_id='800726001';

SELECT *
FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
WHERE program_id='BA in SIS' and concentration_id='Web Development' AND fulfills_major=1 AND Program_Courses.course_id = Course_List.course_id 
) AS a
WHERE a.course_id IN 
(SELECT course_id FROM Courses_Taken WHERE student_id = '800726001');


SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
WHERE program_id='Bachelor of Arts' and concentration_id='Web Development' AND fulfills_major=1 AND Program_Courses.course_id = Course_List.course_id;


SELECT *
FROM (SELECT * FROM Courses_Taken WHERE student_id='800726001') AS a
INNER JOIN 
(SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
WHERE program_id='Bachelor of Arts' and concentration_id='Web Development' AND fulfills_major=1 AND Program_Courses.course_id = Course_List.course_id 
) AS b
ON a.course_id = b.course_id;

SELECT(SUM(credit_hours)) AS hours FROM(
SELECT *
FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
WHERE program_id='Bachelor of Arts' and concentration_id='Web Development' AND fulfills_major=1 AND Program_Courses.course_id = Course_List.course_id 
) AS a
WHERE a.course_id IN 
(SELECT course_id FROM Courses_Taken WHERE student_id = '800726001')) AS major_courses;

SELECT * FROM (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
WHERE program_id='Web Development' AND concentration_id='Web Development' AND fulfills_science=1 AND Program_Courses.course_id = Course_List.course_id) as science_hours; 

SELECT * FROM Course_list WHERE course_id LIKE 'LBST 110%';

SELECT * FROM Program_Courses, Course_List 
WHERE program_id='Bachelor of Arts' AND concentration_id='Web Development' AND fulfills_liberalEd=1 AND Program_Courses.course_id = Course_List.course_id 
AND Course_List.course_id IN 
(SELECT course_id FROM Courses_Taken WHERE student_id = '800726001');



SELECT *
FROM (SELECT * FROM Courses_Taken WHERE student_id='800726001') AS a
INNER JOIN 
(SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
WHERE program_id='Bachelor of Arts' and concentration_id='Web Development' AND fulfills_major=1 AND Program_Courses.course_id = Course_List.course_id 
) AS b
ON a.course_id = b.course_id;


-- doesn't work to select a course from the students courses_taken where it also fulfills major and has a course equivalent that student has also taken
SELECT * FROM 
	(SELECT * FROM Courses_Taken WHERE student_id='800726001') AS a,
	(SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
	WHERE program_id='Bachelor of Arts' and concentration_id='Web Development' AND fulfills_major=1 AND Program_Courses.course_id = Course_List.course_id 
	) AS b,
	(SELECT * FROM course_equivalence) AS c
WHERE
	a.course_id = b.course_id AND
	a.course_id = c.course_id AND 
	EXISTS (SELECT * FROM Courses_Taken WHERE student_id='800726001' AND c.course_sub = a.course_id);


-- DOES work to select a course from the students courses_taken where it also fulfills major and has a course equivalent that student has also taken
SELECT * FROM
	(SELECT * FROM Courses_Taken WHERE student_id='800726001') AS a
	INNER JOIN (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
		WHERE program_id='Bachelor of Arts' and concentration_id='Web Development' AND fulfills_major=1 AND Program_Courses.course_id = Course_List.course_id 
		) AS b ON a.course_id = b.course_id
	INNER JOIN (SELECT * FROM course_equivalence) AS c ON c.course_sub = a.course_id;

-- calculates the hours to subtract from complete hours in major where an equivalent course has also been taken
SELECT SUM(credit_hours) FROM
	(SELECT * FROM Courses_Taken WHERE student_id='800726001') AS a
	INNER JOIN (SELECT Course_List.course_id,credit_hours FROM Program_Courses, Course_List 
		WHERE program_id='Bachelor of Arts' and concentration_id='Web Development' AND fulfills_major=1 AND Program_Courses.course_id = Course_List.course_id 
		) AS b ON a.course_id = b.course_id
	INNER JOIN (SELECT * FROM course_equivalence) AS c ON c.course_sub = a.course_id;
