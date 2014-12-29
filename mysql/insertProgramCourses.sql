USE virtual_adviser;

-- Insert courses into Program_Courses for Bachelor of Arts, Software Information Systems Concentration
-- fulfills Major
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 1212',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 1213',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 1600',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 2600',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 2110',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 2110L',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 2211',1,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','LBST 2211',1,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITCS 2175',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITCS 2214',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITCS 2215',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 2300',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 3105',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 3110',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 3110L',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 3130',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITCS 3160',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 3200',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 3300',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 3310',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 3320',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITCS 3688',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ITIS 4166',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHIL 1106',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHIL 1105',1,0,0,0,0,0,0,0);
-- fulfills Math Option 1
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','MATH 1120',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','MATH 2164',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','STAT 1220',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','STAT 1221',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','STAT 1222',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','STAT 2223',0,0,1,0,0,0,0,0);
-- fulfills Math Option 2
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','MATH 1241',0,0,0,1,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','MATH 1242',0,0,0,1,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','MATH 2164',0,0,0,1,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','STAT 2122',0,0,0,1,0,0,0,0);
-- fulfills Writing
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','UWRT 1101',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','UWRT 1102',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','UWRT 1103',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ENGL 2116',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','COMM 2105',0,1,0,0,0,0,0,0);
-- fulfills Liberal Education
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','LBST 1101',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','LBST 1102',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','LBST 1103',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','LBST 1104',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','LBST 1105',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','LBST 2101',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','LBST 2102',0,0,0,0,0,0,1,0);
-- fulfills Science
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHYS 1130',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHYS 1130L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHYS 1101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHYS 1101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHYS 1102',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHYS 1102L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHYS 1201',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHYS 1201L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHYS 1202',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHYS 1203',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHYS 1203L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHYS 2101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHYS 2101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHYS 2102',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PHYS 2102L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','BINF 1101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','BINF 1101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ANTH 2141',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ANTH 2141L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','BIOL 1110',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','BIOL 1110L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','BIOL 1115',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','CHEM 1111',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','CHEM 1111L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','CHEM 1112',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','CHEM 1112L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','CHEM 1200',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','CHEM 1203',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','CHEM 1203L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','CHEM 1204',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','CHEM 1204L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','CHEM 1251',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','CHEM 1251L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','CHEM 1252',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','CHEM 1252L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ESCI 1101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ESCI 1101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','GEOL 1200',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','GEOL 1200L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','GEOL 1210',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','GEOL 1210L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PSYC 1101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','PSYC 1101L',0,0,0,0,1,0,0,0);
-- fulfills Social Science
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ANTH 1101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','GEOG 1105',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ECON 1101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ECON 2101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','ECON 2102',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','POLS 1110',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Information Systems','SOCY 1101',0,0,0,0,0,1,0,0);

-- Insert courses into Program_Courses for Bachelor of Arts, Web Development Concentration
-- fulfills Major
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 1212',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 1213',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 1600',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 2600',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 2110',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 2110L',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 2211',1,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','LBST 2211',1,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITCS 2214',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITCS 2215',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 2300',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 3105',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 3110',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 3110L',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 3130',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 3150',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITCS 3160',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 3200',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 3300',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 3320',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITCS 3688',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 4166',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 4170',1,0,0,0,0,0,0,0); 
 	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 4221',1,0,0,0,0,0,0,0);	
 	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ITIS 4250',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHIL 1106',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHIL 1105',1,0,0,0,0,0,0,0);

-- fulfills Math Option 1
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','MATH 1120',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','MATH 2164',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','STAT 1220',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','STAT 1221',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','STAT 1222',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','STAT 2223',0,0,1,0,0,0,0,0);
-- fulfills Math Option 2
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','MATH 1241',0,0,0,1,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','MATH 1242',0,0,0,1,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','MATH 2164',0,0,0,1,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','STAT 2122',0,0,0,1,0,0,0,0);
-- fulfills Writing
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','UWRT 1101',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','UWRT 1102',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','UWRT 1103',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ENGL 2116',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','COMM 2105',0,1,0,0,0,0,0,0);
-- fulfills Liberal Education
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','LBST 1101',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','LBST 1102',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','LBST 1103',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','LBST 1104',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','LBST 1105',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','LBST 2101',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','LBST 2102',0,0,0,0,0,0,1,0);
-- fulfills Science
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHYS 1130',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHYS 1130L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHYS 1101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHYS 1101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHYS 1102',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHYS 1102L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHYS 1201',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHYS 1201L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHYS 1202',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHYS 1203',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHYS 1203L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHYS 2101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHYS 2101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHYS 2102',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PHYS 2102L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','BINF 1101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','BINF 1101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ANTH 2141',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ANTH 2141L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','BIOL 1110',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','BIOL 1110L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','BIOL 1115',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','CHEM 1111',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','CHEM 1111L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','CHEM 1112',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','CHEM 1112L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','CHEM 1200',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','CHEM 1203',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','CHEM 1203L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','CHEM 1204',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','CHEM 1204L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','CHEM 1251',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','CHEM 1251L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','CHEM 1252',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','CHEM 1252L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ESCI 1101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ESCI 1101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','GEOL 1200',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','GEOL 1200L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','GEOL 1210',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','GEOL 1210L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PSYC 1101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','PSYC 1101L',0,0,0,0,1,0,0,0);
-- fulfills Social Science
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ANTH 1101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','GEOG 1105',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ECON 1101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ECON 2101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','ECON 2102',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','POLS 1110',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Web Development','SOCY 1101',0,0,0,0,0,1,0,0);

-- Insert courses into Program_Courses for Bachelor of Arts, Software Engineering Concentration
-- fulfills Major
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITIS 1212',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITIS 1213',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITIS 1600',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITIS 2600',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITIS 2110',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITIS 2110L',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITIS 2211',1,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','LBST 2211',1,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITCS 2214',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITCS 2215',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITIS 2300',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITIS 3130',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITIS 3150',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITCS 3160',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITIS 3200',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITIS 3300',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITIS 3310',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITIS 3320',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITCS 3688',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ITCS 4155',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHIL 1106',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHIL 1105',1,0,0,0,0,0,0,0);

-- fulfills Math Option 1
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','MATH 1120',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','MATH 2164',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','STAT 1220',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','STAT 1221',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','STAT 1222',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','STAT 2223',0,0,1,0,0,0,0,0);
-- fulfills Math Option 2
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','MATH 1241',0,0,0,1,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','MATH 1242',0,0,0,1,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','MATH 2164',0,0,0,1,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','STAT 2122',0,0,0,1,0,0,0,0);
-- fulfills Writing
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','UWRT 1101',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','UWRT 1102',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','UWRT 1103',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ENGL 2116',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','COMM 2105',0,1,0,0,0,0,0,0);
-- fulfills Liberal Education
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','LBST 1101',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','LBST 1102',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','LBST 1103',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','LBST 1104',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','LBST 1105',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','LBST 2101',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','LBST 2102',0,0,0,0,0,0,1,0);
-- fulfills Science
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHYS 1130',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHYS 1130L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHYS 1101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHYS 1101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHYS 1102',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHYS 1102L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHYS 1201',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHYS 1201L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHYS 1202',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHYS 1203',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHYS 1203L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHYS 2101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHYS 2101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHYS 2102',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PHYS 2102L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','BINF 1101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','BINF 1101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ANTH 2141',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ANTH 2141L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','BIOL 1110',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','BIOL 1110L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','BIOL 1115',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','CHEM 1111',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','CHEM 1111L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','CHEM 1112',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','CHEM 1112L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','CHEM 1200',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','CHEM 1203',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','CHEM 1203L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','CHEM 1204',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','CHEM 1204L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','CHEM 1251',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','CHEM 1251L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','CHEM 1252',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','CHEM 1252L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ESCI 1101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ESCI 1101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','GEOL 1200',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','GEOL 1200L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','GEOL 1210',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','GEOL 1210L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PSYC 1101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','PSYC 1101L',0,0,0,0,1,0,0,0);
-- fulfills Social Science
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ANTH 1101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','GEOG 1105',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ECON 1101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ECON 2101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','ECON 2102',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','POLS 1110',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Software Engineering','SOCY 1101',0,0,0,0,0,1,0,0);
	
	
-- Insert courses into Program_Courses for Bachelor of Arts, Cyber Security Concentration
-- fulfills Major
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 1212',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 1213',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 1600',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 2600',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 2110',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 2110L',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 2211',1,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','LBST 2211',1,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITCS 2214',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITCS 2215',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 2300',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 3110',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 3110L',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 3130',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITCS 3160',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 3200',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 3300',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITCS 3688',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 4166',1,0,0,0,0,0,0,0); 
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 4221',1,0,0,0,0,0,0,0); 
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ITIS 4250',1,0,0,0,0,0,0,0); 
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHIL 1106',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHIL 1105',1,0,0,0,0,0,0,0);

-- fulfills Math Option 1
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','MATH 1120',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','MATH 2164',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','STAT 1220',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','STAT 1221',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','STAT 1222',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','STAT 2223',0,0,1,0,0,0,0,0);
-- fulfills Math Option 2
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','MATH 1241',0,0,0,1,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','MATH 1242',0,0,0,1,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','MATH 2164',0,0,0,1,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','STAT 2122',0,0,0,1,0,0,0,0);
-- fulfills Writing
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','UWRT 1101',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','UWRT 1102',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','UWRT 1103',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ENGL 2116',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','COMM 2105',0,1,0,0,0,0,0,0);
-- fulfills Liberal Education
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','LBST 1101',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','LBST 1102',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','LBST 1103',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','LBST 1104',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','LBST 1105',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','LBST 2101',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','LBST 2102',0,0,0,0,0,0,1,0);
-- fulfills Science
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHYS 1130',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHYS 1130L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHYS 1101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHYS 1101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHYS 1102',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHYS 1102L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHYS 1201',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHYS 1201L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHYS 1202',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHYS 1203',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHYS 1203L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHYS 2101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHYS 2101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHYS 2102',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PHYS 2102L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','BINF 1101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','BINF 1101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ANTH 2141',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ANTH 2141L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','BIOL 1110',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','BIOL 1110L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','BIOL 1115',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','CHEM 1111',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','CHEM 1111L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','CHEM 1112',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','CHEM 1112L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','CHEM 1200',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','CHEM 1203',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','CHEM 1203L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','CHEM 1204',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','CHEM 1204L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','CHEM 1251',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','CHEM 1251L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','CHEM 1252',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','CHEM 1252L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ESCI 1101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ESCI 1101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','GEOL 1200',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','GEOL 1200L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','GEOL 1210',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','GEOL 1210L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PSYC 1101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','PSYC 1101L',0,0,0,0,1,0,0,0);
-- fulfills Social Science
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ANTH 1101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','GEOG 1105',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ECON 1101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ECON 2101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','ECON 2102',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','POLS 1110',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Cyber Security','SOCY 1101',0,0,0,0,0,1,0,0);
	
	
-- Insert courses into Program_Courses for Bachelor of Arts, Information Technology Concentration
-- fulfills Major
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITIS 1212',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITIS 1213',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITIS 1600',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITIS 2600',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITIS 2110',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITIS 2110L',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITIS 2211',1,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','LBST 2211',1,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITIS 2300',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITIS 3110',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITIS 3110L',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITIS 3130',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITCS 3160',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITIS 3200',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITIS 3300',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITIS 3320',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ITCS 3688',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','INFO 3211',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHIL 1106',1,0,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHIL 1105',1,0,0,0,0,0,0,0);

-- fulfills Math Option 1
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','MATH 1120',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','MATH 2164',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','STAT 1220',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','STAT 1221',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','STAT 1222',0,0,1,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','STAT 2223',0,0,1,0,0,0,0,0);
-- fulfills Math Option 2
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','MATH 1241',0,0,0,1,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','MATH 1242',0,0,0,1,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','MATH 2164',0,0,0,1,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','STAT 2122',0,0,0,1,0,0,0,0);
-- fulfills Writing
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','UWRT 1101',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','UWRT 1102',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','UWRT 1103',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ENGL 2116',0,1,0,0,0,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','COMM 2105',0,1,0,0,0,0,0,0);
-- fulfills Liberal Education
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','LBST 1101',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','LBST 1102',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','LBST 1103',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','LBST 1104',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','LBST 1105',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','LBST 2101',0,0,0,0,0,0,1,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','LBST 2102',0,0,0,0,0,0,1,0);
-- fulfills Science
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHYS 1130',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHYS 1130L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHYS 1101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHYS 1101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHYS 1102',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHYS 1102L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHYS 1201',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHYS 1201L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHYS 1202',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHYS 1203',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHYS 1203L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHYS 2101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHYS 2101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHYS 2102',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PHYS 2102L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','BINF 1101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','BINF 1101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ANTH 2141',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ANTH 2141L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','BIOL 1110',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','BIOL 1110L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','BIOL 1115',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','CHEM 1111',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','CHEM 1111L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','CHEM 1112',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','CHEM 1112L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','CHEM 1200',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','CHEM 1203',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','CHEM 1203L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','CHEM 1204',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','CHEM 1204L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','CHEM 1251',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','CHEM 1251L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','CHEM 1252',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','CHEM 1252L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ESCI 1101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ESCI 1101L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','GEOL 1200',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','GEOL 1200L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','GEOL 1210',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','GEOL 1210L',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PSYC 1101',0,0,0,0,1,0,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','PSYC 1101L',0,0,0,0,1,0,0,0);
-- fulfills Social Science
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ANTH 1101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','GEOG 1105',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ECON 1101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ECON 2101',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','ECON 2102',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','POLS 1110',0,0,0,0,0,1,0,0);
	INSERT INTO Program_Courses VALUES ('Bachelor of Arts','Information Technology','SOCY 1101',0,0,0,0,0,1,0,0);
	
	


