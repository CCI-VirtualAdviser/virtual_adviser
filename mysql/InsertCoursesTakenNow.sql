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


select * from courses_taken where student_id = '800726001';

drop table program_courses;