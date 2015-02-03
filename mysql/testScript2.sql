use virtual_adviser3;


select * from course_equivalence;
INSERT INTO course_equivalence (dept_id,course_id,dept_eq,course_eq) VALUES ('PHIL','1105','PHIL','1106');

    
-- retrieve the rows that satisfy the condition that fulfills_math2 is true from program_courses
SELECT COUNT(*) FROM 
	(SELECT program_courses.dept_id,program_courses.course_id FROM program_courses WHERE program_courses.program_id = 'Bachelor of Arts' AND
	program_courses.concentration_id = 'Web Development' AND program_courses.fulfills_major = 1) AS math_hours;
    
-- retrieve the rows that satisfy the condition that department is MATH from course_list and not a transfer course (those all have course numbers like 0003)
SELECT COUNT(*) FROM 
	(SELECT course_list.dept_id,course_list.course_id FROM course_list WHERE course_list.dept_id  = 'ITIS' AND
	course_list.course_id >= 1000) AS math_hours;

-- get the number of credit hours that fulfill major 
SELECT SUM(credit_hours) FROM(
SELECT  c.dept_id, c.course_id, c.credit_hours
FROM course_list c
INNER JOIN program_courses p
ON c.dept_id=p.dept_id AND c.course_id=p.course_id
WHERE p.program_id = 'Bachelor of Arts' AND
	p.concentration_id = 'Web Development' AND p.fulfills_math1 = 1) AS math_hours;
    
    
-- get the number of credit hours that student has taken in their major 
CREATE OR REPLACE VIEW science_hours (dept_id,course_id,credit_hours) AS
SELECT  c.dept_id, c.course_id, c.credit_hours
FROM course_list c
INNER JOIN program_courses p
ON c.dept_id=p.dept_id AND c.course_id=p.course_id
WHERE p.program_id = 'Bachelor of Arts' AND
	p.concentration_id = 'Web Development' AND p.fulfills_science = 1;

SELECT SUM(credit_hours) FROM (
SELECT c.dept_id,c.course_id,m.credit_hours FROM courses_taken c
INNER JOIN science_hours m
ON m.dept_id=c.dept_id AND m.course_id=c.course_id
WHERE c.student_id='800726001') AS science_taken;
    
SELECT * FROM major_hours;

DROP VIEW major_hours;
    
SELECT  dept_id, course_id, credit_hours
FROM course_list 
WHERE dept_id = 'ITIS';

SELECT  dept_id, course_id, dept_eq, course_eq
FROM course_equivalence;

-- the course equivalence table holds all the courses which are equivalent in credit to each other
-- for example, LBST 2211 and ITIS 2211 are cross-listed (they are the same course 'spelled' differently)
-- also, PHIL 1105 and PHIL 1106 fulfill the same requirement, though the courses are slightly different
-- the above query that gets all the hours in the major contains these duplicates, so we need to find
-- the number of duplicate credits and subtract those from the major credits

-- in order to do this, we need to retrieve only the rows from the course_equivalence table which
-- fulfill the major and sum their credit hours

SELECT SUM(credit_hours) FROM(
SELECT m.dept_id,m.course_id,m.credit_hours
FROM major_hours m
INNER JOIN course_equivalence c 
ON m.dept_id=c.dept_id AND m.course_id=c.course_id) AS duplicate_hours;

CREATE OR REPLACE VIEW major_taken (dept_id,course_id,credit_hours) AS
SELECT c.dept_id,c.course_id,m.credit_hours 
FROM courses_taken c
INNER JOIN major_hours m
ON m.dept_id=c.dept_id AND m.course_id=c.course_id
WHERE c.student_id='800726001';



SELECT SUM(credit_hours) FROM  major_taken;
    
select * from math_option;
DROP VIEW major_taken;

select * from courses_taken;
select * from course_list where dept_id='PHYS';

SELECT c.dept_id,c.course_id,m.credit_hours 
                                FROM courses_taken c
                                INNER JOIN major_hours m
                                ON m.dept_id=c.dept_id AND m.course_id=c.course_id
                                WHERE c.student_id='800726001';
                                
CREATE OR REPLACE VIEW communication_hours (dept_id,course_id,credit_hours) AS
                SELECT  c.dept_id, c.course_id, c.credit_hours
                FROM course_list c
                INNER JOIN program_courses p
                ON c.dept_id=p.dept_id AND c.course_id=p.course_id
                WHERE p.program_id = 'Bachelor of Arts' AND
                    p.concentration_id = 'Web Development' AND p.fulfills_writing = 1;
                    
SELECT SUM(credit_hours) FROM (
                                SELECT c.dept_id,c.course_id,m.credit_hours 
                                FROM courses_taking_now c
                                INNER JOIN communication_hours m
                                ON m.dept_id=c.dept_id AND m.course_id=c.course_id
                                WHERE c.student_id='800726001') AS communication_taken;
                                
SELECT * from course_list where dept_id = 'ENGL' and course_id<1104;

SELECT * from courses_taken;

INSERT INTO Courses_Taking_Now (student_id,dept_id,course_id)VALUES('800726001','UWRT','1102');
INSERT INTO Courses_Taking_Now (student_id,dept_id,course_id)VALUES('800726001','COMM','2105');
INSERT INTO Courses_Taking_Now (student_id,dept_id,course_id)VALUES('800726001','ITIS','4170');
INSERT INTO Courses_Taking_Now (student_id,dept_id,course_id)VALUES('800726001','ITIS','4221');
INSERT INTO Courses_Taking_Now (student_id,dept_id,course_id)VALUES('800726001','MATH','1120');

INSERT INTO Courses_Planning(student_id,dept_id,course_id)VALUES('800726001','STAT','2223');
INSERT INTO Courses_Planning(student_id,dept_id,course_id)VALUES('800726001','ENGL','2116');
INSERT INTO Courses_Planning (student_id,dept_id,course_id)VALUES('800726001','ITIS','3300');
INSERT INTO Courses_Planning (student_id,dept_id,course_id)VALUES('800726001','ITIS','3310');

INSERT INTO Courses_Planning (student_id,dept_id,course_id)VALUES('800726001','PSYC','1101');
INSERT INTO Courses_Planning (student_id,dept_id,course_id)VALUES('800726001','PSYC','1101L');

DELETE FROM courses_taken where student_id = '800726001' and course_id = '1101' and dept_id = 'PSYC';
DELETE FROM courses_taken where student_id = '800726001' and course_id = '3310' and dept_id = 'ITIS';



CREATE OR REPLACE VIEW hours_now (dept_id,course_id,credit_hours) AS
                                SELECT c.dept_id,c.course_id,p.credit_hours 
                                FROM courses_taking_now c
                                INNER JOIN course_list p
                                ON p.dept_id=c.dept_id AND p.course_id=c.course_id
                                WHERE c.student_id='800726001';
                                
SELECT SUM(credit_hours) FROM (
                                SELECT p.dept_id,p.course_id,h.credit_hours 
                                FROM program_courses p
                                INNER JOIN hours_now h
                                ON h.dept_id=p.dept_id AND h.course_id=p.course_id
                                WHERE p.program_id='Bachelor of Arts' and p.concentration_id='Web Development' and p.fulfills_writing=1) AS major_taking;


DELETE FROM courses_planning where student_id = '800726001' and dept_id = 'UWRT' and course_id = '1103';

