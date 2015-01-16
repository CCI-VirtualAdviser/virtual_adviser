USE virtual_adviser;

SELECT * FROM program_courses where fulfills_liberalEd = '1';

-- Originally table had elective column set to not null since SIS programs had elective hours listed in Bruce Long's spreadsheet
-- However, since we don't know yet what elective hours are in CS programs, we are changing table to allow null
-- in the elective column until we figure out what those hours are for those programs

-- Also, we need a column for IT elective hours, and a new column for free elective hours
-- Free elective hours has to be varchar(3) so it can hold '4-7' or '0-2' hours
ALTER TABLE degree_program MODIFY elective_hours TINYINT;
ALTER TABLE degree_program CHANGE elective_hours it_elective_hours TINYINT;
ALTER TABLE degree_program ADD free_elective_hours VARCHAR(3);
ALTER TABLE degree_program ADD major_id VARCHAR(100);
ALTER TABLE degree_program ADD dept_id VARCHAR(100);


INSERT INTO degree_program
VALUES ('Bachelor of Arts','SIS',9,'4-7','Software and Information Systems','Software and Information Systems'),
	('Bachelor of Arts','Web Development',6,'1-4','Software and Information Systems','Software and Information Systems'),
	('Bachelor of Arts','Software Engineering',6,'1-4','Software and Information Systems','Software and Information Systems'),
	('Bachelor of Arts','Cyber Security',6,'0-2','Software and Information Systems','Software and Information Systems'),
	('Bachelor of Arts','Information Technology',9,'1-4','Software and Information Systems','Software and Information Systems');

select * from course_list where dept_id = 'STAT';

use virtual_adviser2;
select * from degree_program;