use virtual_adviser2;

insert into courses_planning (student_id,dept_id,course_id) VALUES ('800726001','ITCS','2215');
insert into courses_planning (student_id,dept_id,course_id) VALUES ('800726001','STAT','2223');
insert into courses_planning (student_id,dept_id,course_id) VALUES ('800726001','ITIS','3105');
insert into courses_planning (student_id,dept_id,course_id) VALUES ('800726001','LBST','2101');
insert into courses_planning (student_id,dept_id,course_id) VALUES ('800726001','ITIS','2211');

select * from courses_planning where student_id = '800726001';