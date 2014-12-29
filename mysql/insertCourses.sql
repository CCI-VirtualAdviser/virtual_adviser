USE virtual_adviser;
SET SQL_SAFE_UPDATES = 0;
SET SQL_MODE = '';

DELETE FROM course_list WHERE course_id = 'ARCH 4201';

SELECT * FROM course_list WHERE course_id LIKE 'ARCH%';


-- DELETE FROM course_list WHERE course_id LIKE 'ITCS 465%';

-- -----------------------------------------------------------------------
-- DO NOT ERASE THESE INSERT STATEMENTS
-- THIS LIST WILL HAVE TO HAVE PREQUISITES AND CROSS LIST UPDATES ADDED
-- -----------------------------------------------------------------------

-- Updates to ITCS and ITIS courses added since 2009-2010
INSERT INTO course_list (course_id,course_name,credit_hours) 
VALUES ('ITCS 1200','Freshman Seminar','3'),
	('ITCS 1212','Introduction To Computer Science','4'),
	('ITCS 1213','Introduction To Computer Science II','4'),
	('ITCS 1600','Computing Professionals','1'),
	('ITCS 1610','Computing Applications Seminar','3'),
	('ITCS 1712','Introduction To Computer Science (Honors)','3'),
	('ITCS 3211','Computing Leaders Team Projects','1'),
	('ITCS 3212','Computing Leaders Team Leaders','1'),
	('ITCS 3610','Computing Leaders Seminar','3'),
	('ITCS 4180','Mobile Application Development','3'),
	('ITCS 4490','Professional Internship','0'),
	('ITCS 4650','Senior Project I','3'),
	('ITCS 4651','Senior Project II','3'),

	('ITIS 1350','eScience','4'),
	('ITIS 1350L','eScience Laboratory','0'),
	('ITIS 1600','Computing Professionals','4'),
	('ITIS 2110L','IT Infrastructure I: Design and Practice Lab','0'),
	('ITIS 3110L','IT Infrastructure II: Design and Practice Lab','0'),
	('ITIS 3320','Software Requirements and Project Management','3'),
	('ITIS 3650','Senior Project I','3'),
	('ITIS 3651','Senior Project II','3'),
	('ITIS 4180','Mobile Appplication Development','3'),
	('ITIS 4490','Professional Internship','0'),
	('ITIS 4510','Web Mining','3');

INSERT INTO Course_List VALUES ('ITIS 3300','Software Requirements and Project Management',3);

INSERT INTO course_list (course_id,course_name,credit_hours) 
VALUES ('ITCS 1212L','Programming Lab I','0'),
	('ITCS 1213L','Programming Lab II','0');

INSERT INTO course_list (course_id,course_name,credit_hours) 
VALUES ('ITIS 1212L','Media Programming Lab I','0'),
	('ITIS 1213L','Media Programming Lab II','0');

DELETE FROM Course_List WHERE course_id = 'ITIS 1212L' OR course_id = 'ITIS 1213L';

INSERT INTO Course_List VALUES ('ITIS 2300L','Web Development Lab',3);

INSERT INTO course_list (course_id,course_name,credit_hours) 
VALUES ('PHIL 1106','Critical Thinking','3'),
	('MATH 1121','Calculus for Engineering Technology','3'),
	('ITCS 2600','Computing Professionals (Transfer)','3'),
	('ITIS 2600','Computing Professionals (Transfer)','3');

INSERT INTO course_list (course_id,course_name,credit_hours) 
VALUES ('CHEM 1200','Fundamentals of Chemistry','3');

-- the following courses are inserted to handle courses that are listed on transcript as transfer electives
INSERT INTO course_list 
VALUES ('TRNF 0001','Transfer Elective','1'),
	('TRNF 0002','Transfer Elective','2'),
	('TRNF 0003','Transfer Elective','3'),
	('TRNF 0004','Transfer Elective','4');

INSERT INTO course_list
VALUES ('GEOL 0004','Geology Elective',4),
	('HIST 0003','History Elective', 3),
	('ITCS 0003','Comp Sci Elective',3);

INSERT INTO course_list
VALUES ('PHIL 0003','Philosophy Elective',3);

INSERT INTO course_list
VALUES ('INST 1111','General Education Exemption',0);

INSERT INTO course_list
VALUES ('ANTH 0003','Anthropology Elective',3);

INSERT INTO course_list
VALUES ('MATH 0003','Math Elective',3);

-- DELETE FROM course_list WHERE course_id = 'HIST 0001' OR course_id = 'ITCS 0001' OR course_id = 'GEOL 0001';

-- Updates to ENGL courses added since 2009-2010
INSERT INTO course_list VALUES ('ENGL 2109','Children`s Literature, Media, and Culture',3),
	('ENGL 2111','Introduction to Ancient World Literature',3),
	('ENGL 2125','Imagined Worlds: Creative Writing Laboratory',3),
	('ENGL 2161','Grammar for Writing',3),
	('ENGL 2200','Contemporary Literature',3),
	('ENGL 2201','Contemporary Poetry',3),
	('ENGL 2202','Contemporary Fiction',3),
	('ENGL 2400','American Literature Survey',3),
	('ENGL 2401','British Literature Survey I',3),
	('ENGL 2402','British Literature Survey II',3),
	('ENGL 3162','Language and the Virtual World',3),
	('ENGL 3180','Language and Digital Technology',3);

-- add these to English course listings:
-- ENGL 3201. Intermediate Poetry Writing Workshop. (3)  Prerequisite: ENGL 2125, ENGL 2126, ENGL 2127, ENGL 2128, ENGL 2200, ENGL 2201, or ENGL 2202, or permission of instructor.  Workshop combines the reading and discussion of published poetry with the writing of original creative works. (Yearly)
-- ENGL 3202. Intermediate Fiction Writing Workshop. (3)  Prerequisite: ENGL 2125, ENGL 2126, ENGL 2127, ENGL 2128, ENGL 2200, ENGL 2201, or ENGL 2202, or permission of instructor.  Workshop combines the reading and discussion of published fiction with the writing of original creative works. (Yearly)
-- ENGL 3211. Medieval Literature. (3)  Representative British literary texts (poetry, prose, and/or drama) that embody the cultural and literary developments of the Medieval era. (On demand)
-- ENGL 3212. British Renaissance Literature. (3)  Representative British literary texts (poetry, prose, and/or drama) that embody the cultural and literary developments of the 16th and/or 17th centuries. (On demand)
-- ENGL 3213. British Literature of the Restoration and 18th Century. (3)  Representative British literary texts (poetry, prose, and/or drama) that embody the cultural and literary developments of the Restoration and/or 18th century. (On demand)
-- ENGL 3214. Romantic British Literature, 1785-1832. (3)  Literature from the Romantic period, with emphasis on the works of specific writers, which may include works by men and women writers such as Wordsworth, Blake, Coleridge, Wollstonecraft, Austen, and Smith. (On demand)
-- ENGL 3215. British Victorian Literature. (3)  Representative British literary texts (poetry, prose, and/or drama) that embody the cultural and literary developments of the Victorian era. (On demand)
-- ENGL 3216. British Literature in Transition, 1870-1914. (3)  Representative British literary texts (poetry, prose, and/or drama) that embody the cultural and literary developments of the period 1870-1914. (On demand)
-- ENGL 3217. Modern British Literature. (3)  Representative British literary texts (poetry, prose, and/or drama) that embody the cultural and literary developments of the 20th and 21st centuries. (On demand)
-- ENGL 3231. Early African-American Literature. (3)  Exploration of the major periods, texts, and issues in African-American literature from its origins to the Harlem Renaissance. (On demand)
-- ENGL 3232. Early American Literature. (3)  Origins of American literature, from Colonial times to Washington Irving, including such authors as Edwards, Taylor, Franklin, Crevecoeur, Freneau, and Brown. (On demand)
-- ENGL 3233. American Literature of the Romantic Period. (3)  Important writers and ideas of the period of American romanticism, from Irving through Whitman, including such authors as Poe, Emerson, Thoreau, Hawthorne, and Melville. (On demand)
-- ENGL 3234. American Literature of the Realist and Naturalist Periods. (3)  Important writers and ideas of American literature, from Whitman through the period of World War I, including such authors as Dickinson, Twain, Howells, James, Crane, Dreiser, and Frost.  (On demand)
-- ENGL 3235. Modern American Literature. (3)  Representative American literary texts (poetry, prose, and/or drama) that embody the cultural and literary developments of the 20th and 21st centuries.  (On demand)
-- ENGL 3236. African-American Literature, Harlem Renaissance to Present. (3)  Exploration of the major periods, texts, and issues in African-American literature from the Harlem Renaissance to the present. (On demand)
-- ENGL 3237. Modern and Recent U.S. Multiethnic Literature. (3)  Representative U.S. multiethnic texts (poetry and/or prose) exemplifying the literary and cultural developments of the 20th and 21st centuries.  (On demand)
-- ENGL 3267. Vocabulary, Etymology, and Grammar. (3)  Theoretical and practical exploration of vocabulary, etymology, and grammar for applications in teaching, writing, and editing in professional and technical arenas. (On demand)

-- Updates to MATH courses added since 2009-2010
INSERT INTO course_list VALUES ('MATH 1100','College Algebra and Probability',3);

-- Updates to AAHP (Arts + Architecture Honors Program) courses added since 2009-2010
INSERT INTO course_list VALUES ('AAHP 2600','Introductory Honors Seminar',2);
INSERT INTO course_list VALUES ('AAHP 3001','Honors Seminar in Dance',3);
INSERT INTO course_list VALUES ('AAHP 3002','Honors Seminar in Architecture',3);
INSERT INTO course_list VALUES ('AAHP 3003','Honors Seminar in Music',3);
INSERT INTO course_list VALUES ('AAHP 3004','Honors Seminar in Theater',3);
INSERT INTO course_list VALUES ('AAHP 3005','Honors Seminar in Art and Art History',3);
INSERT INTO course_list VALUES ('AAHP 3006','Interdisciplinary Honors Seminar',3);
INSERT INTO course_list VALUES ('AAHP 3900','Honors Thesis',3);

-- Updates to ARCH  courses added since 2009-2010
INSERT INTO course_list VALUES ('ARCH 4201','Architectural History I: Pre-history-1750',3);

-- add these to Architecture course listings:
-- ARCH 3601. Writing Architecture. (3)
-- ARCH 4202. Architectural History II: 1750-Present. (3)
-- ARCH 4203. Architectural History III: Survey of Contemporary Theory (1950-Present). (3)
-- ARCH 4204. Architectural History Topic. (3)
-- ARCH 4205. Architectural History Topic. (3)
-- ARCH 4206. Professional Practice. (3)
-- ARCH 4301. Material and Assembly Principles. (3)
-- ARCH 4302. Environmental Systems Principles. (3)
-- ARCH 4303. Structural Principles. (3)
-- ARCH 4304. Structural Systems. (3)
-- ARCH 4305. Building Systems Integration. (3)
-- ARCH 4604. Computational Methods. (3)
-- ARCH 4605. Computational Practice. (3)
-- ARCH 4890. Directed Independent Study. (1-3) 

-- Updates to HONR  courses added since 2009-2010
INSERT INTO course_list VALUES ('HONR 2100','Architectural History I: Pre-history-1750',3);

-- Need to update and add courses from each year between 2009 and 2015 (some courses are no longer offered
-- in 2015 year but are still on transfer credit

-- missing department KNES


-- what is this????!  800726006,LTAM 2002, B, 201110 "Topics in LTAM - Historical Context"?


SELECT * FROM course_list WHERE course_id LIKE 'KNES%';
-- SELECT * From course_list WHERE course_id LIKE 'ITIS%' OR course_id LIKE 'ITCS%';
