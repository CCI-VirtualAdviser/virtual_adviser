use virtual_adviser2;

-- inserting a fake advsisers for fake students
INSERT INTO advisers (adviser_id,first_name,last_name,email,username,password)VALUES ('800000000','Ethel','Mertz','Ethel.Mertz@uncc.edu','emertz','Shorty2014!');
INSERT INTO advisers (adviser_id,first_name,last_name,email,username,password)VALUES ('800000001','Lucille','Ball','Lucille.Ball@uncc.edu','lball','AbFab99!');
INSERT INTO advisers (adviser_id,first_name,last_name,email,username,password)VALUES ('800000002','Ricky','Ricardo','Ricky.Ricardo@uncc.edu','rricardo','Samba2014!');

SELECT * FROM advisers;

-- inserting fake students
INSERT INTO students VALUES('800726001','Edith',NULL,'Piaf','epiaf@uncc.edu','800000000','Bachelor of Arts','Web Development',NULL,'epiaf','laVieEnRose1947!');
INSERT INTO math_option VALUES ('800726001',1);
INSERT INTO students VALUES('800726002','George',NULL,'Jetson','gjetson@uncc.edu','800000001','Bachelor of Arts','Information Technology',NULL,'gjetson','Astro2147!');
INSERT INTO math_option VALUES ('800726002',2);
INSERT INTO students VALUES('800726003','Ernest','T.','Bass','ebass@uncc.edu','800000002','Bachelor of Arts','Software Engineering',NULL,'ebass','Whiskey1956!');
INSERT INTO math_option VALUES ('800726003',1);
INSERT INTO students VALUES('800726006','Uma',NULL,'Thurman','uthurman@uncc.edu','800000000','Bachelor of Arts','Information Technology',NULL,'uthurman','killBill8579!');
INSERT INTO math_option VALUES ('800726006',1);
INSERT INTO students VALUES('800726005','Camilla',NULL,'Parker-Bowles','cpbowles@uncc.edu','800000001','Bachelor of Arts','Web Development',NULL,'cpbowles','SocialFlower78!');
INSERT INTO math_option VALUES ('800726005',2);
INSERT INTO students VALUES('800726007','Dolph',NULL,'Lundgren','dlund@uncc.edu','800000002','Bachelor of Arts','Information Technology',NULL,'dlund','SkinTrade2014)!');
INSERT INTO math_option VALUES ('800726007',1);
INSERT INTO students VALUES('800726009','Lucy','N.','Disguise','lndis@uncc.edu','800000000','Bachelor of Arts','Software Information Systems',NULL,'lndis','WithDiamonds100*');
INSERT INTO math_option VALUES ('800726009',1);
INSERT INTO students VALUES('800726010','Lou',NULL,'Grant','lgrant@uncc.edu','800000001','Bachelor of Arts','Software Information Systems',NULL,'lgrant','OhLou!1969');
INSERT INTO math_option VALUES ('800726010',2);
INSERT INTO students VALUES('800726015','Grace',NULL,'Jones','gjones54@uncc.edu','800000000','Bachelor of Arts','Information Technology',NULL,'gjones','SlaveToRhythm^1985');
INSERT INTO math_option VALUES ('800726015',1);
INSERT INTO students VALUES('800726004','Steve',NULL,'Jobs','sjobs@uncc.edu','800000001','Bachelor of Arts','Web Development',NULL,'sjobs','KillBilGates%78%');
INSERT INTO math_option VALUES ('800726004',1);
INSERT INTO students VALUES('800726008','Laura','I.','Wilder','lwilder@uncc.edu','800000002','Bachelor of Arts','Information Technology',NULL,'lwilder','ILoveMyLittleHouse$1852');
INSERT INTO math_option VALUES ('800726008',2);

SELECT * FROM program_courses;


-- inserting transfer courses into courses_taken for fake student Edith Piaf
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for) VALUES('800726001','ESCI','1101','TP','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726001','ESCI','1101L','TP','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726001','HIST','1120','TP','T','LBST 2101');
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726001','HIST','1121','TP','T','LBST 2102');
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726001','HIST','1160','TP','T','LBST 2101');
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726001','HIST','1161','TP','T','LBST 2101');
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726001','LBST','1105','TP','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726001','POLS','1110','TP','T',NULL);
-- inserting transfer courses into courses_taken for fake student George Jetson
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726002','BIOL','1110','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726002','BIOL','1110L','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726002','ENGL','1101','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726002','ENGL','1102','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726002','ENGL','2111','TC','T','LBST 2212');
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726002','INFO','2130','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726002','SOCY','1101','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726002','TRNF','0001','TA','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726002','TRNF','0003','TA','T',NULL);
-- inserting transfer courses into courses_taken for fake student Ernest T. Bass
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726003','ENGL','1101','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726003','GEOL','0004','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726003','HIST','0003','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726003','ITCS','0003','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726003','LBST','1105','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726003','MATH','1120','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726003','PHIL','0003','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726003','PSYC','1101','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726003','TRNF','0003','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726003','TRNF','0001','TC','T',NULL);
-- inserting transfer courses into courses_taken for fake student Steve Jobs
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726004','BIOL','1110','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726004','BIOL','1110L','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726004','CJUS','1100','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726004','ENGL','1101','TA','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726004','ENGL','1102','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726004','ENGL','2101','TB','T','LBST 2212');
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726004','HIST','1160','TB','T','LBST 2101');
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726004','INFO','2130','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726004','LBST','1105','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726004','LBST','2213','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726004','PSYC','1101','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726004','SOCY','1101','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726004','SPAN','1202','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726004','TRNF','0001','TA','T',NULL);
-- inserting transfer courses into courses_taken for fake student Uma Thurman
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726006','ECON','2101','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726006','ENGL','1101','TA','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726006','ENGL','1102','TA','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726006','PSYC','1101','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726006','SOCY','1101','TA','T',NULL);
-- inserting transfer courses into courses_taken for fake student Dolph Lundgren
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','INST','1111','TP','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','ANTH','0003','TB','T','LBST 2102');
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','ANTH','2141','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','ARTH','1211','TA','T','LBST 1105');
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','ARTH','1212','TB','T','LBST 1105');
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','BIOL','1110','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','BIOL','1110L','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','BIOL','1115','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','CHEM','1251','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','CHEM','1251L','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','CHEM','1252','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','CHEM','1252L','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','COMM','1101','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','COMM','2107','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','ENGL','1101','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','ENGL','2116','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','JAPN','1201','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','JAPN','1202','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','LBST','2211','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','MATH','0003','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','MATH','1241','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','MATH','1242','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','PSYC','1101','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','STAT','1220','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726007','TRNF','0001','TC','T',NULL);
-- inserting transfer courses into courses_taken for fake student Lou Grant
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726010','COMM','1101','TA','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726010','ENGL','1101','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726010','ENGL','1102','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726010','INFO','2130','TA','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726010','ITCS','0003','TA','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726010','ITCS','1212','TA','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726010','ITCS','1212L','TA','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726010','MATH','1100','TA','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726010','MATH','1102','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726010','PHIL','2105','TA','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726010','POLS','1110','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726010','TRNF','0003','TC','T',NULL);
-- inserting transfer courses into courses_taken for fake student Grace Jones
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726015','BIOL','1110','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726015','BIOL','1110L','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726015','ENGL','1101','TB','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726015','GEOG','1101','TA','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726015','INFO','2130','TA','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726015','LBST','1103','TA','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726015','PSYC','1101','TC','T',NULL);
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726015','MATH','1100','TA','T',NULL);

-- test queries
INSERT INTO Courses_Taken (student_id,dept_id,course_id , letter_grade,semester_id,exemption_for)VALUES('800726002','ENGL','3180','T','T',NULL);
-- DELETE FROM Courses_Taken WHERE student_id = '800726002' AND course_id = 'ENGL 3180';


