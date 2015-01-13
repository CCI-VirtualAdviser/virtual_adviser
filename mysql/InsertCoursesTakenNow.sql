use virtual_adviser2;

select * from students;
select * from course_list
GROUP BY dept_id,course_id;

insert into courses_taking_now (student_id,dept_id,course_id) 
	values ('800726001','ITCS','3160');
insert into courses_taking_now (student_id,dept_id,course_id) 
	values ('800726001','ITIS','2211');
insert into courses_taking_now (student_id,dept_id,course_id) 
	values ('800726001','ITIS','2110');
insert into courses_taking_now (student_id,dept_id,course_id) 
	values ('800726001','MATH','2164');
insert into courses_taking_now (student_id,dept_id,course_id) 
	values ('800726001','PHYS','1101');
insert into courses_taking_now (student_id,dept_id,course_id) 
	values ('800726001','PHYS','1101L');
insert into courses_taking_now (student_id,dept_id,course_id) 
	values ('800726001','SOCY','1101');
insert into courses_taking_now (student_id,dept_id,course_id) 
	values ('800726001','LBST','2215');
insert into courses_taking_now (student_id,dept_id,course_id) 
	values ('800726001','ITCS','3688');



select *  from program_courses where dept_id = 'ITCS' and course_id = '3688';

