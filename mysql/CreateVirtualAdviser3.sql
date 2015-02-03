CREATE SCHEMA IF NOT EXISTS `virtual_adviser3` DEFAULT CHARACTER SET latin1 ;
USE `virtual_adviser3` ;

-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: virtual_adviser2
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advisers`
--

DROP TABLE IF EXISTS `advisers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advisers` (
  `adviser_id` varchar(9) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_intial` varchar(3) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`adviser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisers`
--

LOCK TABLES `advisers` WRITE;
/*!40000 ALTER TABLE `advisers` DISABLE KEYS */;
INSERT INTO `advisers` VALUES ('800000000','Ethel',NULL,'Mertz','Ethel.Mertz@uncc.edu','Shorty2014!','emertz'),('800000001','Lucille',NULL,'Ball','Lucille.Ball@uncc.edu','AbFab99!','lball'),('800000002','Ricky',NULL,'Ricardo','Ricky.Ricardo@uncc.edu','Samba2014!','rricardo');
/*!40000 ALTER TABLE `advisers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `comm_hours`
--

DROP TABLE IF EXISTS `comm_hours`;
/*!50001 DROP VIEW IF EXISTS `comm_hours`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `comm_hours` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `comm_now`
--

DROP TABLE IF EXISTS `comm_now`;
/*!50001 DROP VIEW IF EXISTS `comm_now`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `comm_now` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `comm_plan`
--

DROP TABLE IF EXISTS `comm_plan`;
/*!50001 DROP VIEW IF EXISTS `comm_plan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `comm_plan` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `communication_hours`
--

DROP TABLE IF EXISTS `communication_hours`;
/*!50001 DROP VIEW IF EXISTS `communication_hours`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `communication_hours` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `corequisites`
--

DROP TABLE IF EXISTS `corequisites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corequisites` (
  `course_id` varchar(11) NOT NULL,
  `coreq_list` varchar(100) NOT NULL,
  `dept_id` varchar(4) NOT NULL,
  PRIMARY KEY (`course_id`,`dept_id`),
  KEY `course_id_idx` (`course_id`),
  KEY `course_id_idx2` (`dept_id`),
  CONSTRAINT `corequisites_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course_list` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corequisites`
--

LOCK TABLES `corequisites` WRITE;
/*!40000 ALTER TABLE `corequisites` DISABLE KEYS */;
/*!40000 ALTER TABLE `corequisites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_equivalence`
--

DROP TABLE IF EXISTS `course_equivalence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_equivalence` (
  `course_id` varchar(11) NOT NULL,
  `course_eq` varchar(11) NOT NULL,
  `dept_id` varchar(4) NOT NULL,
  `dept_eq` varchar(4) NOT NULL,
  PRIMARY KEY (`course_id`,`course_eq`,`dept_id`,`dept_eq`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_equivalence`
--

LOCK TABLES `course_equivalence` WRITE;
/*!40000 ALTER TABLE `course_equivalence` DISABLE KEYS */;
INSERT INTO `course_equivalence` VALUES ('1105','1106','PHIL','PHIL'),('1600','2600','ITIS','ITIS'),('2211','2211','LBST','ITIS');
/*!40000 ALTER TABLE `course_equivalence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_list`
--

DROP TABLE IF EXISTS `course_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_list` (
  `course_id` varchar(11) NOT NULL,
  `course_name` varchar(225) NOT NULL,
  `credit_hours` tinyint(2) unsigned NOT NULL,
  `dept_id` varchar(4) NOT NULL,
  PRIMARY KEY (`course_id`,`dept_id`,`credit_hours`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_list`
--

LOCK TABLES `course_list` WRITE;
/*!40000 ALTER TABLE `course_list` DISABLE KEYS */;
INSERT INTO `course_list` VALUES ('0900','Math Study Skills and Algebra Review',1,'MATH'),('1000','Special Topics in Biology',1,'BIOL'),('1000','Special Topics in Biology',2,'BIOL'),('1000','Special Topics in Biology',3,'BIOL'),('1000','Special Topics in Biology',4,'BIOL'),('1000','Topics in History',3,'HIST'),('1000','Freshman Music Seminar',1,'MUSC'),('1000','New Student Seminar',1,'PHYS'),('1000','College Transition for First Year Students',1,'UCOL'),('1000','College Transition for First Year Students',2,'UCOL'),('1000','College Transition for First Year Students',3,'UCOL'),('1010','College Transition for Transfers',3,'UCOL'),('1011','College Transition for Transfers',3,'UCOL'),('1040-1059','Applied Music for Minors',1,'MUPF'),('1041','Applied Music for Minors: Trumpet',1,'MUPF'),('1042','Applied Music for Minors: French Horn',1,'MUPF'),('1043','Applied Music for Minors: Trombone',1,'MUPF'),('1044','Applied Music for Minors: Tuba',1,'MUPF'),('1045','Applied Music for Minors: Guitar',1,'MUPF'),('1046','Applied Music for Minors: Harp',1,'MUPF'),('1047','Applied Music for Minors: Organ',1,'MUPF'),('1048','Applied Music for Minors: Piano',1,'MUPF'),('1049','Applied Music for Minors: Violin',1,'MUPF'),('1050','Special Approaches to the Study of French',1,'FREN'),('1050','Special Approaches to the Study of French',2,'FREN'),('1050','Special Approaches to the Study of French',3,'FREN'),('1050','Special Approaches to the Study of French',4,'FREN'),('1050','Special Approaches to the Study of French',5,'FREN'),('1050','Special Approaches to the Study of French',6,'FREN'),('1050','Applied Music for Minors: Viola',1,'MUPF'),('1051','Applied Music for Minors: Cello',1,'MUPF'),('1052','Applied Music for Minors: Bass',1,'MUPF'),('1053','Applied Music for Minors: Voice',1,'MUPF'),('1054','Applied Music for Minors: Flute',1,'MUPF'),('1055','Applied Music for Minors: Clarinet',1,'MUPF'),('1056','Applied Music for Minors: Saxophone',1,'MUPF'),('1057','Applied Music for Minors: Oboe',1,'MUPF'),('1058','Applied Music for Minors: Bassoon',1,'MUPF'),('1059','Applied Music for Minors: Percussion',1,'MUPF'),('1099','Topics in Games/Exercise/Sports',1,'EXER'),('1099','Topics in Games/Exercise/Sports',2,'EXER'),('1099','Topics in Games/Exercise/Sports',3,'EXER'),('1100','Introduction to Africana Studies',3,'AFRS'),('1100','Freshman Honors Seminar',1,'BUSN'),('1100','Introduction to Criminal Justice',3,'CJUS'),('1100','English as a Foreign Language',3,'ENGL'),('1100','Freshman Honors Seminar',1,'HONR'),('1100','Introduction to Latin America',3,'LTAM'),('1100','Rudiments of Music',3,'MUSC'),('1100','Exploration of Voice and Movement',3,'THEA'),('1101','The Air Force Today',1,'AERO'),('1101','Introduction to Anthropology',3,'ANTH'),('1101','Architecture Design Studio',5,'ARCH'),('1101','Public Speaking',3,'COMM'),('1101','Economics for Non-Majors',3,'ECON'),('1101','Simulation and Schematic Capture',1,'ELET'),('1101','English Composition',3,'ENGL'),('1101','Earth Sciences-Geography',3,'ESCI'),('1101','Electronics Lab I',1,'ETEE'),('1101','Manufacturing Processes',3,'ETME'),('1101','World Regional Geography',3,'GEOG'),('1101','Introduction to International Studies',3,'INTL'),('1101','Introduction to Computer Concepts',3,'ITCS'),('1101','The Arts and Society: Dance',3,'LBST'),('1101','Leadership and Personal Development',1,'MSCI'),('1101','Introduction to Sight Singing',1,'MUSC'),('1101','Introductory Physics I',3,'PHYS'),('1101','General Psychology',3,'PSYC'),('1101','An Introduction to Religious Studies',3,'RELS'),('1101','Introduction to Sociology',3,'SOCY'),('1101','The Field of Social Work',3,'SOWK'),('1101','Writing and Inquiry in Academic Contexts I',3,'UWRT'),('1101L','The Air Force Today',0,'AERO'),('1101L','Earth Sciences-Geography Laboratory',1,'ESCI'),('1101L','Introductory Physics I Laboratory',1,'PHYS'),('1101L','General Psychology Laboratory',1,'PSYC'),('1102','The Air Force Today',1,'AERO'),('1102','Architecture Design Studio',5,'ARCH'),('1102','Writing in the Academic Community',3,'ENGL'),('1102','Advanced Internet Concepts',3,'ITCS'),('1102','Advanced Internet Concepts',3,'ITIS'),('1102','The Arts and Society: Film',3,'LBST'),('1102','Introduction to Mathematical Thinking',3,'MATH'),('1102','Introduction to Leadership',1,'MSCI'),('1102','Introductory Physics II',3,'PHYS'),('1102L','The Air Force Today',0,'AERO'),('1102L','Introduction to Leadership Lab',1,'MSCI'),('1102L','Introductory Physics II Laboratory',1,'PHYS'),('1103','Accelerated College Writing and Rhetoric',3,'ENGL'),('1103','The Arts and Society: Music',3,'LBST'),('1103','Precalculus Mathematics for Science and Engineering',3,'MATH'),('1103','Writing and Inquiry in Academic Contexts I & II',3,'UWRT'),('1104','Civil/Construction CAD Applications',2,'ETCE'),('1104','The Arts and Society: Theater',3,'LBST'),('1104','The History of Rock Music',3,'MUSC'),('1105','The Location of Human Activity',3,'GEOG'),('1105','The Arts and Society: Visual Arts',3,'LBST'),('1105','Finite Mathematics',3,'MATH'),('1105','The Evolution of Jazz',3,'MUSC'),('1105','Critical Thinking',3,'PHIL'),('1107','Introduction to Communication Contexts',3,'COMM'),('1110','Principles of Biology I',3,'BIOL'),('1110','Orchestra',1,'MUPF'),('1110','American Politics',3,'POLS'),('1110L','Principles of Biology I Laboratory',1,'BIOL'),('1111','DC Circuits',3,'ELET'),('1111','Jazz Ensemble',1,'MUPF'),('1111L','Laboratory in Chemistry',1,'CHEM'),('1111L','DC Circuits Laboratory',1,'ELET'),('1111L','Jazz Ensemble Sectional Rehearsals',0,'MUPF'),('1112','Symphonic Wind Ensemble',1,'MUPF'),('1112L','Laboratory in Chemistry',1,'CHEM'),('1112L','Symphonic Wind Ensemble Sectional Rehearsals',0,'MUPF'),('1113','Concert Band',1,'MUPF'),('1114','Basketball Band',1,'MUPF'),('1115','Principles of Biology II',3,'BIOL'),('1115','Guitar Ensemble',1,'MUPF'),('1118','Chamber Music Ensembles',1,'MUPF'),('1119','Special Instrumental Ensemble',1,'MUPF'),('1120','European History to 1660',3,'HIST'),('1120','Calculus',3,'MATH'),('1120','University Chorale',1,'MUPF'),('1120','The Bible and its Interpreters',3,'RELS'),('1121','Construction Methods',3,'ETCE'),('1121','European History Since 1660',3,'HIST'),('1121','Calculus for Engineering Technology',3,'MATH'),('1121','Chamber Singers',1,'MUPF'),('1122','Men’s Chorus [Mallard Creek Chorale]',1,'MUPF'),('1123','Women’s Glee [Charlotteans]',1,'MUPF'),('1124','Opera Workshop',1,'MUPF'),('1128','Special Vocal Ensemble',1,'MUPF'),('1130','Introduction to Astronomy',3,'PHYS'),('1130','Comparative Politics',3,'POLS'),('1130L','Introduction to Astronomy Laboratory',1,'PHYS'),('1132','Woodwind Quintet',1,'MUPF'),('1133','Flute Quartet',1,'MUPF'),('1134','Flute Choir',1,'MUPF'),('1137','Saxophone Quartet',1,'MUPF'),('1139','Woodwind Chamber Music',1,'MUPF'),('1140','Introduction to Business',3,'MGMT'),('1142','Brass Quintet',1,'MUPF'),('1146','Tuba/Euphonium Ensemble',1,'MUPF'),('1149','Brass Chamber Music',1,'MUPF'),('1150','Honors Percussion Ensemble',1,'MUPF'),('1150','International Politics',3,'POLS'),('1151','Percussion Ensemble',1,'MUPF'),('1152','Mallet Keyboard Ensemble',1,'MUPF'),('1155','Piano Ensemble',1,'MUPF'),('1160','US History I',3,'HIST'),('1160','Chamber Orchestra',1,'MUPF'),('1160','Creative Drama for the Classroom Teacher',3,'THEA'),('1161','US History II',3,'HIST'),('1161','Bonnie Cone String Quartet',1,'MUPF'),('1165','Introduction to Discrete Structures',3,'MATH'),('1169','String Chamber Music',1,'MUPF'),('1170','Jazz Combo',1,'MUPF'),('1170','Introduction to Political Philosophy',3,'POLS'),('1173','Political Science Learning Community Freshman Seminar',3,'POLS'),('1175','Vocal Jazz Ensemble',1,'MUPF'),('1200','Physical Geology',3,'GEOL'),('1200','Freshman Seminar',3,'ITCS'),('1200','Freshman Seminar',3,'ITIS'),('1200','Elements of Design for the Stage',3,'THEA'),('1200','First Year Seminar',3,'UCOL'),('1200L','Physical Geology Laboratory',1,'GEOL'),('1201','2D Design',3,'ARTB'),('1201','Elementary Chinese I',4,'CHNS'),('1201','Introduction to Engineering Practices and Principles I',2,'ENGR'),('1201','Introduction to Engineering Technology',2,'ETGR'),('1201','Foundations of Physical Conditioning',2,'EXER'),('1201','Elementary French I',4,'FREN'),('1201','Elementary German I',4,'GERM'),('1201','Elementary Ancient Greek I',4,'GREK'),('1201','Elementary Italian I',4,'ITLN'),('1201','Elementary Japanese I',4,'JAPN'),('1201','Elementary Foreign Language',3,'LACS'),('1201','Elementary Foreign Language',4,'LACS'),('1201','Elementary Latin I',4,'LATN'),('1201','Sports and Physics',3,'PHYS'),('1201','Elementary Portuguese I',3,'PORT'),('1201','Elementary Russian I',4,'RUSS'),('1201','Elementary Spanish I',4,'SPAN'),('1201L','Sports and Physics Laboratory',1,'PHYS'),('1202','Elementary Arabic II',4,'ARBC'),('1202','3D Design',3,'ARTB'),('1202','Elementary Chinese II',4,'CHNS'),('1202','Weight Training',1,'EXER'),('1202','Elementary French II',4,'FREN'),('1202','Elementary German II',4,'GERM'),('1202','Elementary Ancient Greek II',4,'GREK'),('1202','Elementary Italian II',4,'ITLN'),('1202','Elementary Japanese II',4,'JAPN'),('1202','Elementary Foreign Language',3,'LACS'),('1202','Elementary Foreign Language',4,'LACS'),('1202','Elementary Latin II',4,'LATN'),('1202','Introduction to Physics in Medicine',3,'PHYS'),('1202','Elementary Portuguese II',3,'PORT'),('1202','Elementary Russian II',4,'RUSS'),('1202','Elementary Spanish II',4,'SPAN'),('1203','Drawing I',3,'ARTB'),('1203','General Chemistry',3,'CHEM'),('1203','Fencing',1,'EXER'),('1203','Survey of Computing',3,'ITCS'),('1203','Survey of Computing',3,'ITIS'),('1203','Physics of Music',3,'PHYS'),('1203L','General Chemistry Laboratory',1,'CHEM'),('1203L','Physics of Music Laboratory',1,'PHYS'),('1204','General Chemistry',3,'CHEM'),('1204','Aerobic Fitness',1,'EXER'),('1204L','General Chemistry Laboratory',1,'CHEM'),('1205','Figure Drawing I',3,'ARTB'),('1205','Enrichment Seminar',3,'UCOL'),('1206','Concept Studio',3,'ARTB'),('1206','Adaptive and Developmental Physical Education',1,'EXER'),('1208','Walk, Jog, Run',1,'EXER'),('1209','Step Aerobics',1,'EXER'),('1210','Ballet for Majors I',2,'DANC'),('1210','Beginning Swimming',1,'EXER'),('1210','Earth History',3,'GEOL'),('1210','Introduction to Web-Based Information Systems',3,'ITIS'),('1210','Acting I',3,'THEA'),('1210','Transfer Seminar',3,'UCOL'),('1210L','Earth History Lab',1,'GEOL'),('1211','Art History Survey I',3,'ARTH'),('1211','Modern Dance for Majors I',2,'DANC'),('1211','Surveying I',3,'ETCE'),('1211','Intermediate Swimming',1,'EXER'),('1211','Transfer Seminar',3,'UCOL'),('1211L','Surveying I Laboratory',0,'ETCE'),('1212','Art History Survey II',3,'ARTH'),('1212','Ballet I',2,'DANC'),('1212','AC Circuits',3,'ELET'),('1212','Introduction to Computer Science',3,'ITCS'),('1212','Introduction to Media Programming I',3,'ITIS'),('1212L','AC Circuits Laboratory',1,'ELET'),('1212L','Programming Lab I',0,'ITCS'),('1212L','Introduction to Media Programming I Lab',0,'ITIS'),('1213','Ballet II',2,'DANC'),('1213','Introduction to Media Programming II',3,'ITIS'),('1213L','Introduction to Media Programming II Lab',0,'ITIS'),('1214','Modern Dance I',2,'DANC'),('1215','Modern Dance II',2,'DANC'),('1215','Aquatic Fitness',1,'EXER'),('1215','Introduction to Computer Science II',3,'ITCS'),('1220','Beginning Tennis',1,'EXER'),('1220','Introduction to Instruments',1,'MUSC'),('1220','Elements of Statistics I [BUSN]',3,'STAT'),('1221','Classroom Instruments',1,'MUSC'),('1221','Elements of Statistics I',3,'STAT'),('1222','Construction Materials',3,'ETCE'),('1222','Racquet Sports',1,'EXER'),('1222','Introduction to Statistics',3,'STAT'),('1222L','Construction Materials Laboratory',0,'ETCE'),('1223','Beginning Badminton',1,'EXER'),('1223','Woodwind Techniques I',1,'MUSC'),('1224','Woodwind Techniques II',1,'MUSC'),('1225','Brass Techniques I',1,'MUSC'),('1226','Brass Techniques II',1,'MUSC'),('1227','String Techniques I',1,'MUSC'),('1228','String Techniques II',1,'MUSC'),('1229','Percussion Techniques',1,'MUSC'),('1230','Musical Structure and Style I',2,'MUSC'),('1231','Digital Circuits',3,'ELET'),('1231','Introduction to Outdoor Adventure',1,'EXER'),('1231','Musical Structure and Style II',2,'MUSC'),('1231L','Digital Circuits Laboratory',1,'ELET'),('1232','Orienteering',1,'EXER'),('1233','Rock Climbing',1,'EXER'),('1233','Class Piano I',1,'MUSC'),('1234','Canoeing',1,'EXER'),('1234','Class Piano II',1,'MUSC'),('1235','Challenge Course Activities',1,'EXER'),('1237','Class Voice',1,'MUSC'),('1238','Guitar Class I',2,'MUSC'),('1239','Guitar Class II',2,'MUSC'),('1240','Beginning Golf',1,'EXER'),('1240-1259','Applied Music',2,'MUPF'),('1241','Calculus I',3,'MATH'),('1241','Applied Music: Trumpet',2,'MUPF'),('1242','Archery',1,'EXER'),('1242','Calculus II',3,'MATH'),('1242','Applied Music: French Horn',2,'MUPF'),('1243','Applied Music: Trombone',2,'MUPF'),('1244','Applied Music: Tuba',2,'MUPF'),('1245','Applied Music: Guitar',2,'MUPF'),('1246','Applied Music: Harp',2,'MUPF'),('1247','Applied Music: Organ',2,'MUPF'),('1248','Applied Music: Piano',2,'MUPF'),('1249','Applied Music: Violin',2,'MUPF'),('1250','Volleyball',1,'EXER'),('1250','Applied Music: Viola',2,'MUPF'),('1251','Principles of Chemistry I',3,'CHEM'),('1251','Applied Music: Cello',2,'MUPF'),('1251L','Principles of Chemistry Laboratory I',1,'CHEM'),('1252','Principles of Chemistry II',3,'CHEM'),('1252','Applied Music: Bass',2,'MUPF'),('1252L','Principles of Chemistry Laboratory II',1,'CHEM'),('1253','Applied Music: Voice',2,'MUPF'),('1253L','Introduction to Modern Laboratory Methods',1,'CHEM'),('1254','Applied Music: Flute',2,'MUPF'),('1255','Applied Music: Clarinet',2,'MUPF'),('1256','Applied Music: Saxophone',2,'MUPF'),('1256L','Saxophone Masterclass',0,'MUPF'),('1257','Applied Music: Oboe',2,'MUPF'),('1258','Applied Music: Bassoon',2,'MUPF'),('1259','Bacteriology',3,'BIOL'),('1259','Applied Music: Percussion',2,'MUPF'),('1259L','Bacteriology Laboratory',1,'BIOL'),('1260','Ear Training I',1,'MUSC'),('1261','Ear Training II',1,'MUSC'),('1262','Recreational Dance',1,'EXER'),('1263','Body Shaping',1,'EXER'),('1273','Human Anatomy and Physiology',3,'BIOL'),('1273L','Human Anatomy and Physiology Laboratory',1,'BIOL'),('1274','Human Anatomy and Physiology II',3,'BIOL'),('1274L','Human Anatomy and Physiology Laboratory II',1,'BIOL'),('1280','Improvisation',2,'DANC'),('1300','Recital and Concert Attendance',0,'MUSC'),('1301','Introduction to the Financial Services Industry',3,'ITCS'),('1301','Introduction to the Financial Services Industry',3,'ITIS'),('1401','Music Practicum',1,'MUSC'),('1402','Opera and Musical Theatre Practicum',1,'MUSC'),('1600','Computing Professionals',3,'ITCS'),('1600','Computing Professionals',3,'ITIS'),('1601','Recording Observations',2,'ARCH'),('1602','Components of Form',2,'ARCH'),('1680','Professional Development I',1,'CMET'),('1701','War, Peace, Justice and Human Survival',3,'HONR'),('1860','Preliminary Experience in Student Teaching',1,'THEA'),('2000','Special Topics in Biology',1,'BIOL'),('2000','Special Topics in Biology',2,'BIOL'),('2000','Special Topics in Biology',3,'BIOL'),('2000','Special Topics in Biology',4,'BIOL'),('2000','Topics in Business and Economics',1,'BUSN'),('2000','Topics in Business and Economics',2,'BUSN'),('2000','Topics in Business and Economics',3,'BUSN'),('2000','Introduction to Law Enforcement',3,'CJUS'),('2000','Topics in Earth Sciences',1,'ESCI'),('2000','Topics in Earth Sciences',2,'ESCI'),('2000','Topics in Earth Sciences',3,'ESCI'),('2000','Topics in Earth Sciences',4,'ESCI'),('2000','Topics in Geography',1,'GEOG'),('2000','Topics in Geography',2,'GEOG'),('2000','Topics in Geography',3,'GEOG'),('2000','Topics in Geography',4,'GEOG'),('2000','Topics in Geology',1,'GEOL'),('2000','Topics in Geology',2,'GEOL'),('2000','Topics in Geology',3,'GEOL'),('2000','Topics in Geology',4,'GEOL'),('2000','Topics in US History',3,'HIST'),('2000','Topics in Religious Studies',1,'RELS'),('2000','Topics in Religious Studies',2,'RELS'),('2000','Topics in Religious Studies',3,'RELS'),('2000','Topics in General Education',3,'UCOL'),('2001','Topics in Art History',3,'ARTH'),('2001','Topics in European History',3,'HIST'),('2001','Topics in Latin American Studies',3,'LTAM'),('2002','Topics in Non-Western History',3,'HIST'),('2002','Topics in Latin American Studies',3,'LTAM'),('2003','Topics in Comparative or Applied History',3,'HIST'),('2003','Topics in Latin American Studies',3,'LTAM'),('2009','Hispanic Literature in English Translation',3,'SPAN'),('2010','Topics in Ethnography',3,'ANTH'),('2010','National Parks: Science Behind the Scenery',3,'ESCI'),('2014','Topics in Writing',1,'ENGL'),('2014','Topics in Writing',2,'ENGL'),('2014','Topics in Writing',3,'ENGL'),('2015','Topics in Writing',1,'ENGL'),('2015','Topics in Writing',2,'ENGL'),('2015','Topics in Writing',3,'ENGL'),('2020','The Planets',3,'GEOL'),('2030','Near-Space Balloon Exploration',2,'ESCI'),('2050','Topics in Africana Studies',3,'AFRS'),('2050','Topics in American Studies',3,'AMST'),('2050','Topics in Archaeology',3,'ANTH'),('2050','Topics in English',3,'ENGL'),('2050','Topics in French I',1,'FREN'),('2050','Topics in French I',2,'FREN'),('2050','Topics in French I',3,'FREN'),('2050','Topics in Computer Science',1,'ITCS'),('2050','Topics in Computer Science',2,'ITCS'),('2050','Topics in Computer Science',3,'ITCS'),('2050','Topics in Foreign Language',1,'LACS'),('2050','Topics in Foreign Language',2,'LACS'),('2050','Topics in Foreign Language',3,'LACS'),('2050','Topics in Foreign Language',4,'LACS'),('2050','Topics in Mathematics',2,'MATH'),('2050','Topics in Mathematics',3,'MATH'),('2050','Topics in Spanish',1,'SPAN'),('2050','Topics in Spanish',2,'SPAN'),('2050','Topics in Spanish',3,'SPAN'),('2051','Topics in English – Writing Intensive',3,'ENGL'),('2051','Topics in Women’s Studies',3,'WGST'),('2052','Topics in English – Oral Communication',3,'ENGL'),('2053','Topics in English – Writing Intensive & Oral Communication',3,'ENGL'),('2090','Topics in Anthropology',1,'ANTH'),('2090','Topics in Anthropology',2,'ANTH'),('2090','Topics in Anthropology',3,'ANTH'),('2090','Topics in English',3,'ENGL'),('2090','Topics in Sociology',1,'SOCY'),('2090','Topics in Sociology',2,'SOCY'),('2090','Topics in Sociology',3,'SOCY'),('2091','Topics in English – Writing Intensive',3,'ENGL'),('2092','Topics in English – Oral Communication',3,'ENGL'),('2093','Topics in English – Writing Intensive & Oral Communication',3,'ENGL'),('2100','Introduction to American Indian Studies',3,'AMST'),('2100','Introduction to Art Education',3,'ARTE'),('2100','Introduction to Communication Theory',3,'COMM'),('2100','Introduction to Education and Diversity in Schools',3,'EDUC'),('2100','Writing About Literature',3,'ENGL'),('2100','Maps and Graphs',3,'GEOG'),('2100','The Violent Earth',3,'GEOL'),('2100','Aging and the Lifecourse',3,'GRNT'),('2100','Introduction to Holocaust, Genocide and Human Rights Studies: War Peace, Justice and Human Survival',3,'HGHR'),('2100','Introduction to Historical Methods',3,'HIST'),('2100','Language Craft',2,'JOUR'),('2100','Diversity and Inclusion in Secondary Schools',3,'MDSK'),('2100','General Nutrition',2,'NURS'),('2100','Introduction to Students with Special Needs',3,'SPED'),('2101','Development of Air Power I',1,'AERO'),('2101','Architecture Design Studio',5,'ARCH'),('2101','Civil Engineering Drawing',2,'CEGR'),('2101','Principles of Economics-Macro',3,'ECON'),('2101','Masterpieces of British Literature I',3,'ENGL'),('2101','The Environmental Dilemma',3,'ESCI'),('2101','Cartographic Laboratory',1,'GEOG'),('2101','American Business History',3,'HIST'),('2101','Healthy Lifestyles',3,'HLTH'),('2101','Introduction to African Studies',3,'INTL'),('2101','Western Cultural and Historical Awareness',3,'LBST'),('2101','Innovative Team Leadership',2,'MSCI'),('2101','Introduction to Philosophy',3,'PHIL'),('2101','Physics for Science and Engineering I',3,'PHYS'),('2101','Introduction to Western Religions',3,'RELS'),('2101','Systems Engineering Concepts',3,'SEGR'),('2101L','Development of Air Power I',0,'AERO'),('2101L','Innovative Team Leadership Lab',1,'MSCI'),('2101L','Laboratory I',1,'PHYS'),('2102','Development of Air Power II',1,'AERO'),('2102','Architectural Design Studio',5,'ARCH'),('2102','Engineering Economic Analysis',3,'CEGR'),('2102','Ethics and the Criminal Justice System',3,'CJUS'),('2102','Advanced Public Speaking',3,'COMM'),('2102','Principles of Economics-Micro',3,'ECON'),('2102','Masterpieces of British Literature II',3,'ENGL'),('2102','Global and Intercultural Connections',3,'LBST'),('2102','Foundations of Tactical Leadership',1,'MSCI'),('2102','Introduction to Philosophy – Writing Intensive',3,'PHIL'),('2102','Physics for Science and Engineering II',3,'PHYS'),('2102','Research Methodology',4,'PSYC'),('2102','Introduction to Asian Religions',3,'RELS'),('2102L','Development of Air Power II',0,'AERO'),('2102L','Foundations of Tactical Leadership Lab',1,'MSCI'),('2102L','Laboratory II',1,'PHYS'),('2103','Argumentation and Debate',3,'COMM'),('2103','Computer Utilization in C++',3,'ECGR'),('2103','Masterpieces of Modern Fiction',3,'ENGL'),('2103','Elements of GIScience and Technologies',4,'GEOG'),('2104','Installation Art',3,'ARTZ'),('2104','Surveying and Site Design',3,'CEGR'),('2104','Major American Writers',3,'ENGL'),('2104','Hebrew Scriptures/Old Testament',3,'RELS'),('2105','Black Images in the Media in the US',3,'AFRS'),('2105','Digital Media',3,'ARTM'),('2105','Small Group Communication',3,'COMM'),('2105','Introduction to Poetry',3,'ENGL'),('2105','Introduction to Economic Geography',3,'GEOG'),('2105','American Slavery and Emancipation',3,'HIST'),('2105','Deductive Logic',3,'PHIL'),('2105','New Testament and Christian Origins',3,'RELS'),('2105','Computational Methods for Systems Engineering I',3,'SEGR'),('2105','Spanish Communication Skills Development I',3,'SPAN'),('2106','Film Criticism',3,'ENGL'),('2106','Engineering Economic Analysis',3,'SEGR'),('2106','Spanish Communication Skills Development II',3,'SPAN'),('2107','Global Hip Hop',3,'AFRS'),('2107','Interpersonal Communication',3,'COMM'),('2107','Global Hip Hop',3,'SOCY'),('2108','Introduction to Drama',3,'ENGL'),('2108','Religion in American Culture',3,'RELS'),('2110','Contemporary Art History',3,'ARTH'),('2110','Women and the Media',3,'COMM'),('2110','Introduction to Geographic Research',3,'GEOG'),('2110','Technology and Science in Society I: Before the Industrial Revolution',3,'HIST'),('2110','IT Infrastructure I: Design and Practice',3,'ITIS'),('2110','Judaism',3,'RELS'),('2110','Women and the Media',3,'WGST'),('2111','Peoples of Africa',3,'ANTH'),('2111','Child Study: Interpreting Children’s Behavior',3,'CHFD'),('2111','Technology and Science in Society II: Since the Industrial Revolution',3,'HIST'),('2111','Introduction to Engineering Management',3,'SEGR'),('2112','North American Indians',3,'ANTH'),('2112','Construction Surveying and Layout',3,'ETCE'),('2112','Introduction to Behavior Modification',4,'PSYC'),('2112L','Constructions Surveying and Layout Laboratory',0,'ETCE'),('2113','Cultures of Russia and East Europe',3,'ANTH'),('2113','Arts of Africa, the Pacific and the Americas',3,'ARTH'),('2113','Infant and Early Years',3,'CHFD'),('2114','Indians of the Southeastern United States',3,'ANTH'),('2114','Learning Community Seminar',1,'ENGL'),('2115','Culture and Society in the Middle East',3,'ANTH'),('2115','Education of the Young Child',3,'CHFD'),('2116','Contemporary Latin America',3,'ANTH'),('2116','Introduction to Technical Communication',3,'ENGL'),('2116','C Programming',3,'ITCS'),('2116','Contemporary Latin America',3,'LTAM'),('2117','Cultures of the Caribbean',3,'ANTH'),('2117','Cultures of the Caribbean',3,'LTAM'),('2119','Anatomy for Dancers',3,'DANC'),('2120','General Biology I',3,'BIOL'),('2120','Juvenile Justice',3,'CJUS'),('2120','Black Images in the Media',3,'COMM'),('2120','Geographic Information Systems: Survey of Applications and Techniques',4,'GEOG'),('2120','American Military History',3,'HIST'),('2120','Intermediate Applied Calculus',3,'MATH'),('2120','Introduction to Public Policy',3,'POLS'),('2120','Child Psychology',3,'PSYC'),('2120','Christianity',3,'RELS'),('2120','African American Women',3,'WGST'),('2121','Principles of Accounting I',3,'ACCT'),('2121','Comparative Family Systems',3,'ANTH'),('2121','Developmental Art',3,'ARTE'),('2121','Electronics I',3,'ELET'),('2121','Adolescent Psychology',3,'PSYC'),('2121L','Electronics I Laboratory',1,'ELET'),('2122','Principles of Accounting II',3,'ACCT'),('2122','Beliefs, Symbols and Rituals',3,'ANTH'),('2122','Introduction to Probability and Statistics',3,'STAT'),('2123','Women in Cross Cultural Perspective',3,'ANTH'),('2123','Women in Cross-Cultural Perspective',3,'WGST'),('2124','Psychology of Adult Development and Aging',3,'GRNT'),('2124','Psychology of Adult Development and Aging',3,'PSYC'),('2125','Urban Anthropology',3,'ANTH'),('2125','Inorganic Chemistry',3,'CHEM'),('2125','Business Applications of GIS',3,'GEOG'),('2125','Democracy in America: A Historical Perspective',3,'HIST'),('2126','World Population Problems',3,'ANTH'),('2126','Introduction to Creative Writing',3,'ENGL'),('2126','World Population Problems',3,'SOCY'),('2127','Introduction to Poetry Writing',3,'ENGL'),('2128','Introduction to Fiction Writing',3,'ENGL'),('2130','General Biology II',3,'BIOL'),('2130','Survey of Organic Chemistry',3,'CHEM'),('2130','Introduction to Historic Preservation',3,'HIST'),('2130','Introduction to Business Computing',3,'INFO'),('2130','Masculinity and Manhood',3,'WGST'),('2130L','General Biology II Laboratory',2,'BIOL'),('2131','Painting 1',3,'ARTP'),('2131','Organic Chemistry I',3,'CHEM'),('2131','Islam',3,'RELS'),('2131L','Organic Chemistry Laboratory I',1,'CHEM'),('2132','Organic Chemistry II',3,'CHEM'),('2132','Sociology of Marriage and the Family',3,'SOCY'),('2132L','Organic Chemistry Laboratory II',1,'CHEM'),('2133','Sociology of Marriage and Family – Writing Intensive',3,'SOCY'),('2135','Introduction to Museums & Historic Sites',3,'HIST'),('2136L','Organic Chemistry Laboratory',1,'CHEM'),('2137','Phonetics and Articulation for Singers I',2,'MUSC'),('2138','Phonetics and Articulation for Singers II',2,'MUSC'),('2139','Drawing 2',3,'ARTD'),('2140','Medieval Art',3,'ARTH'),('2140','Geography of North Carolina',3,'GEOG'),('2140','Disease and Medicine in History',3,'HIST'),('2140','Oboe Reedmaking',1,'MUSC'),('2140','Play Analysis',3,'THEA'),('2141','Principles of Biological Anthropology',4,'ANTH'),('2141','Sculpture 1: Construction',3,'ARTZ'),('2141','Survey of Physical Chemistry',3,'CHEM'),('2141','Introduction to Power Systems',3,'ELET'),('2141','Engineering Mechanics I',3,'MEGR'),('2141L','Principles of Biological Anthropology Lab',0,'ANTH'),('2145','Principles of Public Relations',3,'COMM'),('2146','Metalsmithing/Jewelry I',3,'ARTZ'),('2150','Introduction to Kinesiology',3,'ATRN'),('2150','Human Development Across the Life Span',3,'EDUC'),('2150','Introduction to Kinesiology',3,'EXER'),('2150','Geography of Polar Regions',3,'GEOG'),('2150','US Women’s History to 1877',3,'HIST'),('2150','Psychology of Adjustment',3,'PSYC'),('2150','US Women’s History to 1877',3,'WGST'),('2151','Fibers 1',3,'ARTF'),('2151','US Women’s History since 1877',3,'HIST'),('2151','Introduction to Music Technology',2,'MUSC'),('2152','New World Archaeology',3,'ANTH'),('2152','European Women’s/Gender History',3,'HIST'),('2154','Design Project Lab',2,'CEGR'),('2154','Introduction to Corrections',3,'CJUS'),('2154','Hinduism',3,'RELS'),('2155','Geography of the US and Canada',3,'GEOG'),('2155','Southern Women’s History',3,'HIST'),('2156','African Civilization',3,'AFRS'),('2156','African Civilization',3,'ANTH'),('2156','Machine Shop Practices',2,'ETME'),('2156L','Machine Shop Practices Lab',1,'ETME'),('2157','Buddhism',3,'RELS'),('2160','The African American Experience through Civil War',3,'AFRS'),('2160','The South',3,'GEOG'),('2160','African-American History, 1400-1860',3,'HIST'),('2160','Introduction to Journalism',3,'JOUR'),('2160','Introduction to Health Psychology',3,'PSYC'),('2161','The African American Experience: Civil War to Civil Rights',3,'AFRS'),('2161','Introduction to Linguistic Anthropology',3,'ANTH'),('2161','Print Media: Serigraphy, Relief and Mixed Media',3,'ARTR'),('2161','African-American History Since 1860',3,'HIST'),('2162','Print Media: Intaglio Methods',3,'ARTR'),('2163','Introduction to File Processing',3,'ITCS'),('2163','Sociology of Gender',3,'SOCY'),('2164','Matrices and Linear Algebra',3,'MATH'),('2165','Patterns of World Urbanization',3,'GEOG'),('2165','Introduction to Political Philosophy',3,'PHIL'),('2166','Taoism',3,'RELS'),('2171','Ceramics Handbuilding',3,'ARTC'),('2171','Differential Equations',3,'MATH'),('2171','Introduction to Industrial/Organizational Psychology',3,'PSYC'),('2171','Social Problems',3,'SOCY'),('2172','Ceramics Wheel 1',3,'ARTC'),('2175','Logic and Algorithms',3,'ITCS'),('2175','Professional Ethics',3,'PHIL'),('2180','Graphic Design Methods',3,'ARTG'),('2181','Graphic Design 1',3,'ARTG'),('2181','Computer Logic and Design',3,'ITCS'),('2182','Human Behavior in the Social Environment I',3,'SOWK'),('2183','Human Behavior in the Social Environment II',3,'SOWK'),('2186','Illustration I',3,'ARTL'),('2190','Art of the United States',3,'ARTH'),('2191','Photographic Media I',3,'ARTT'),('2191','Incorporating Music Into the Elementary Classroom',3,'MUSC'),('2200','Introduction to Earth Sciences Research',3,'ESCI'),('2200','French for Reading Knowledge',3,'FREN'),('2200','Introduction to Urban Studies',3,'GEOG'),('2200','Asian Civilization',3,'HIST'),('2200','Foundations of Music Education',2,'MUED'),('2200','Human Growth and Development',3,'NURS'),('2200','Spanish for Reading Knowledge',3,'SPAN'),('2200','University Learning Seminar',1,'UCOL'),('2200','University Learning Seminar',2,'UCOL'),('2200','University Learning Seminar',3,'UCOL'),('2200','Introduction to Urban Studies',3,'URBS'),('2201','Intermediate Arabic I',4,'ARBC'),('2201','Intermediate Chinese I',4,'CHNS'),('2201','C Programming',3,'ELET'),('2201','Introduction to Film',3,'FILM'),('2201','Intermediate German I',3,'GERM'),('2201','History of Modern Asia',3,'HIST'),('2201','Introduction to Asian Studies',3,'INTL'),('2201','Intermediate Italian I',3,'ITLN'),('2201','Intermediate Japanese I',4,'JAPN'),('2201','Intermediate Foreign Language',3,'LACS'),('2201','Intermediate Foreign Language',4,'LACS'),('2201','Latin Prose',3,'LATN'),('2201','Communication in Caring Relationships',2,'NURS'),('2201','Intermediate Portuguese I',3,'PORT'),('2201','Intermediate Russian I',4,'RUSS'),('2201','Intermediate Spanish I',3,'SPAN'),('2202','Intermediate Arabic II',4,'ARBC'),('2202','Intermediate Chinese II',4,'CHNS'),('2202','Introduction to Mechanical Design',2,'ETME'),('2202','Intermediate French II',3,'FREN'),('2202','Intermediate German II',3,'GERM'),('2202','Intermediate Italian II',3,'ITLN'),('2202','Intermediate Japanese II',4,'JAPN'),('2202','Intermediate Foreign Language',3,'LACS'),('2202','Intermediate Foreign Language',4,'LACS'),('2202','Intermediate Portuguese II',3,'PORT'),('2202','Intermediate Russian II',4,'RUSS'),('2202','Intermediate Spanish II',3,'SPAN'),('2206','African Literature, Music, and Art',3,'AFRS'),('2206','Colonial Latin America',3,'HIST'),('2206','Colonial Latin America',3,'LTAM'),('2207','Pan-Africanism',3,'AFRS'),('2207','French Phonetics',3,'FREN'),('2207','Modern Latin America',3,'HIST'),('2207','Modern Latin America',3,'LTAM'),('2207','Puppetry',3,'THEA'),('2208','Education and African-Americans',3,'AFRS'),('2208','Audition Techniques',2,'THEA'),('2209','French Civilization',3,'FREN'),('2210','Ballet for Majors II',2,'DANC'),('2210','Field Methods in the Earth Sciences',4,'ESCI'),('2210','Introduction to Business French',3,'FREN'),('2210','German in the Workplace',3,'GERM'),('2210','Pre-Colonial Africa',3,'HIST'),('2210','Introduction to Spanish for Commerce',3,'SPAN'),('2210','Acting II',3,'THEA'),('2211','Modern Dance for Majors II',2,'DANC'),('2211','Modern Africa',3,'HIST'),('2211','Ethical Issues in Personal, Professional, and Public Life: Technology',3,'ITIS'),('2211','Ethical Issues in Personal, Professional, and Public Life',3,'LBST'),('2211','Spanish for Criminal Justice Professionals',3,'SPAN'),('2212','Lifeguard Training',3,'EXER'),('2212','Literature and Culture',3,'LBST'),('2212','Spanish for Health Care Professionals',3,'SPAN'),('2213','Water Safety Instruction',3,'EXER'),('2213','Science, Technology, and Society',3,'LBST'),('2214','Data Structures',3,'ITCS'),('2214','Issues of Health and Quality of Life',3,'LBST'),('2215','Black Families in the United States',3,'AFRS'),('2215','A History of Muslim Societies',3,'HIST'),('2215','Design and Analysis of Algorithms',3,'ITCS'),('2215','Citizenship',3,'LBST'),('2215','Stage Makeup',3,'THEA'),('2216','Choreography I',3,'DANC'),('2216','The Modern Middle East',3,'HIST'),('2216','The Modern Middle East',3,'RELS'),('2218','Scuba Diving Laboratory',1,'EXER'),('2219','Scuba Diving',2,'EXER'),('2220','Advanced Scuba Diving',1,'EXER'),('2220','Political Science Methods',4,'POLS'),('2220','Costume Techniques',2,'THEA'),('2220L','Costume Techniques Laboratory',1,'THEA'),('2221','Contemporary Africa',3,'AFRS'),('2222','Ballet III',2,'DANC'),('2223','Elements of Statistics II',3,'STAT'),('2224','Modern Dance III',2,'DANC'),('2226','Vintage Jazz Dance',2,'DANC'),('2227','Contemporary Jazz Dance',2,'DANC'),('2228','Music and Dance',2,'DANC'),('2230','Wilderness Experience',3,'EXER'),('2230','Musical Structure and Style III',2,'MUSC'),('2230','Scenic Design I',3,'THEA'),('2231','Microprocessor Fundamentals',3,'ELET'),('2231','Wilderness Experience Lab',1,'EXER'),('2231','Introduction to Business Programming',3,'INFO'),('2231','Introduction to Business Programming',3,'ITCS'),('2231','Musical Structure and Style IV',2,'MUSC'),('2232','Wilderness Trip Leading',2,'EXER'),('2233','Class Piano III',1,'MUSC'),('2234','Challenge Course Facilitation',2,'EXER'),('2234','Class Piano IV',1,'MUSC'),('2235','High Ropes Course Facilitation',2,'EXER'),('2235','Jazz Improvisation I',2,'MUSC'),('2236','Jazz Improvisation II',2,'MUSC'),('2240','Stagecraft',2,'THEA'),('2240L','Stagecraft Laboratory',1,'THEA'),('2241','Instrumentation and Controls',3,'ELET'),('2241','Calculus III',3,'MATH'),('2241L','Instrumentation Laboratory',1,'ELET'),('2242','Calculus IV',3,'MATH'),('2250','Russian History from Earliest Times to 1801',3,'HIST'),('2250','Lighting Design I',3,'THEA'),('2251','Introduction to Human Movement: A Personal Approach',3,'EXER'),('2251','Russian History from 1801 to 1917',3,'HIST'),('2251','US Women’s History since 1877',3,'WGST'),('2252','Russian History from 1917 to the Present',3,'HIST'),('2252','New World Archaeology',3,'LTAM'),('2252','European Women’s History',3,'WGST'),('2256','Rug Weaving',3,'ARTF'),('2257','Mixed Media Book Arts & Papermaking',3,'ARTF'),('2260','Britain to 1688',3,'HIST'),('2260','Ear Training III',1,'MUSC'),('2260','Lighting Technology',2,'THEA'),('2260L','Lighting Technology',1,'THEA'),('2261','Britain since 1688',3,'HIST'),('2261','Ear Training IV',1,'MUSC'),('2270','Costume Design I',3,'THEA'),('2271','Modern France,1750-Present',3,'HIST'),('2271','Fundamental Recording Techniques',1,'MUSC'),('2281','Modern Germany',3,'HIST'),('2284','World War II: The European Theater',3,'HIST'),('2285','World War II: The Pacific Theater',3,'HIST'),('2290','First Aid: Responding to Emergencies',3,'ATRN'),('2290','First Aid: Responding to Emergencies',3,'EXER'),('2294','Care and Prevention of Athletic Injuries',3,'ATRN'),('2294','Care and Prevention of Athletic Injuries',3,'EXER'),('2295','Care and Prevention of Athletic Injuries Laboratory',1,'ATRN'),('2295','Care and Prevention of Athletic Injuries Laboratory',1,'EXER'),('2297','History of North Carolina, 1500 to the Present',3,'HIST'),('2298','Applied Kinesiology',3,'ATRN'),('2298','Applied Kinesiology',3,'EXER'),('2300','Web-Based Application Development',3,'ITIS'),('2301','Introduction to African-American Literature',3,'AFRS'),('2301','Introduction to African-American Literature',3,'ENGL'),('2301','Introduction to European Studies',3,'INTL'),('2301','Financial Services Computing Environment',3,'ITCS'),('2301','Financial Services Computing Environment',3,'ITIS'),('2333','Baseball Through History and Playing',3,'EXER'),('2340','Number Concepts and Relationships',3,'MATH'),('2341','Algebra and Algebraic Structures',3,'MATH'),('2342','Data Analysis and Probability',3,'MATH'),('2343','Geometry and Measurement',3,'MATH'),('2400','Business Honors Internship',1,'BUSN'),('2400','History Internship',1,'HIST'),('2400','History Internship',2,'HIST'),('2400','History Internship',3,'HIST'),('2401','Introduction to Latin American Studies',3,'INTL'),('2401','Production Practicum',1,'THEA'),('2402','Performance Practicum',1,'DANC'),('2402','Performance Practicum: Theatre',1,'THEA'),('2410','Introduction to Environmental Engineering Technology',3,'ETCE'),('2412','Practicum I: Observing and Recording Children’s Behavior',3,'CHFD'),('2416','Practicum II: The Child and the Community',3,'CHFD'),('2428','Mathematical Theory of Interest',3,'MATH'),('2460','Practicum in Creative Drama: K-8',3,'THEA'),('2600','Computing Professionals',3,'ITCS'),('2600','Computing Professionals',3,'ITIS'),('2600','Approaches to the Study of Religion',3,'RELS'),('2601','Architectural Seminar',3,'ARCH'),('2640','Playwriting/Screenwriting',3,'THEA'),('2670','Stage Management',3,'THEA'),('2680','Professional Development II',1,'CMET'),('2800','Directed Studies in Art',1,'ARTA'),('2800','Directed Studies in Art',2,'ARTA'),('2800','Directed Studies in Art',3,'ARTA'),('3000','Seminar in American Studies',3,'AMST'),('3000','Topics in Arts and Sciences',3,'ARSC'),('3000','Topics in Art',1,'ARTA'),('3000','Topics in Art',2,'ARTA'),('3000','Topics in Art',3,'ARTA'),('3000','Special Topics in Biology',1,'BIOL'),('3000','Special Topics in Biology',2,'BIOL'),('3000','Special Topics in Biology',3,'BIOL'),('3000','Special Topics in Biology',4,'BIOL'),('3000','Topics in Criminal Justice',3,'CJUS'),('3000','Selected Topics in Earth Sciences',1,'ESCI'),('3000','Selected Topics in Earth Sciences',2,'ESCI'),('3000','Selected Topics in Earth Sciences',3,'ESCI'),('3000','Selected Topics in Earth Sciences',4,'ESCI'),('3000','Topics in Regional Geography',3,'GEOG'),('3000','Selected Topics in Geology',1,'GEOL'),('3000','Selected Topics in Geology',2,'GEOL'),('3000','Selected Topics in Geology',3,'GEOL'),('3000','Selected Topics in Geology',4,'GEOL'),('3000','Topics in US History',3,'HIST'),('3000','Topics in Public Health',1,'HLTH'),('3000','Topics in Public Health',2,'HLTH'),('3000','Topics in Public Health',3,'HLTH'),('3000','Topics in International Business',3,'IBUS'),('3000','Topics in Management Information Systems',3,'INFO'),('3000','Topics in International Studies',1,'INTL'),('3000','Topics in International Studies',2,'INTL'),('3000','Topics in International Studies',3,'INTL'),('3000','Topics in Mathematics Education, Elementary',1,'MAED'),('3000','Topics in Mathematics Education, Elementary',2,'MAED'),('3000','Topics in Mathematics Education, Elementary',3,'MAED'),('3000','Topics in Mathematics Education, Elementary',4,'MAED'),('3000','Topics in Mathematics Education, Elementary',5,'MAED'),('3000','Topics in Mathematics Education, Elementary',6,'MAED'),('3000','Topics in Management',3,'MGMT'),('3000','Topics in Marketing',3,'MKTG'),('3000','Topics in Operations Management',3,'OPER'),('3000','Topics in Physics',1,'PHYS'),('3000','Topics in Physics',2,'PHYS'),('3000','Topics in Physics',3,'PHYS'),('3000','Topics in Physics',4,'PHYS'),('3000','Topics in Religious Studies',3,'RELS'),('3001','Topics in Art History',1,'ARTH'),('3001','Topics in Art History',2,'ARTH'),('3001','Topics in Art History',3,'ARTH'),('3001','Topics in European History',3,'HIST'),('3001','Advanced Topics in Latin American Studies',3,'LTAM'),('3001','Topics in Music',1,'MUSC'),('3001','Topics in Music',2,'MUSC'),('3001','Topics in Music',3,'MUSC'),('3001','Topics in Music',4,'MUSC'),('3001','Topics in Music',5,'MUSC'),('3001','Topics in Music',6,'MUSC'),('3001','Topics in Psychology',3,'PSYC'),('3001','Topics in Religious Studies – Writing Intensive',3,'RELS'),('3002','Topics in Non-Western History',3,'HIST'),('3002','Advanced Topics in Latin American Studies',3,'LTAM'),('3003','Topics in Comparative or Applied History',3,'HIST'),('3003','Advanced Topics in Latin American Studies',3,'LTAM'),('3005','Topics in Digital Media',1,'ARTM'),('3005','Topics in Digital Media',2,'ARTM'),('3005','Topics in Digital Media',3,'ARTM'),('3009','Masterpieces of Hispanic Literature in English',3,'SPAN'),('3010','History and Culture through Film, Non- Western',3,'HIST'),('3010','Topics in American Politics or Public Administration',1,'POLS'),('3010','Topics in American Politics or Public Administration',2,'POLS'),('3010','Topics in American Politics or Public Administration',3,'POLS'),('3010','Topics in American Politics or Public Administration',4,'POLS'),('3011','History and Culture through Film',3,'HIST'),('3019','Hispanic Women Writers in English',3,'SPAN'),('3019','Hispanic Women Writers in English',3,'WGST'),('3020','Seminar in American Studies',3,'AMST'),('3029','Cultural Dimension of Doing Business with Spanish-Speaking Countries',3,'SPAN'),('3030','Studies in German Culture',3,'GERM'),('3030','Topics in Comparative or International Politics',1,'POLS'),('3030','Topics in Comparative or International Politics',2,'POLS'),('3030','Topics in Comparative or International Politics',3,'POLS'),('3030','Topics in Comparative or International Politics',4,'POLS'),('3030','Business and Culture in the Hispanic Caribbean Region',3,'SPAN'),('3031','Topics in Painting',1,'ARTP'),('3031','Topics in Painting',2,'ARTP'),('3031','Topics in Painting',3,'ARTP'),('3040','Topics in Mathematics Education, Middle Grades',1,'MAED'),('3040','Topics in Mathematics Education, Middle Grades',2,'MAED'),('3040','Topics in Mathematics Education, Middle Grades',3,'MAED'),('3040','Topics in Mathematics Education, Middle Grades',4,'MAED'),('3040','Topics in Mathematics Education, Middle Grades',5,'MAED'),('3040','Topics in Mathematics Education, Middle Grades',6,'MAED'),('3041','Topics in Sculpture',1,'ARTZ'),('3041','Topics in Sculpture',2,'ARTZ'),('3041','Topics in Sculpture',3,'ARTZ'),('3046','Topics in Metalsmithing/Jewelry',1,'ARTZ'),('3046','Topics in Metalsmithing/Jewelry',2,'ARTZ'),('3046','Topics in Metalsmithing/Jewelry',3,'ARTZ'),('3050','Topics in Africana Studies',3,'AFRS'),('3050','Topics in Arabic Language and Culture',1,'ARBC'),('3050','Topics in Arabic Language and Culture',2,'ARBC'),('3050','Topics in Arabic Language and Culture',3,'ARBC'),('3050','Topics in Chinese',1,'CHNS'),('3050','Topics in Chinese',2,'CHNS'),('3050','Topics in Chinese',3,'CHNS'),('3050','Topics in Communication Studies',3,'COMM'),('3050','Topics in English',3,'ENGL'),('3050','Topics in Film',3,'FILM'),('3050','Topics in French',1,'FREN'),('3050','Topics in French',2,'FREN'),('3050','Topics in French',3,'FREN'),('3050','Studies in German Literature',3,'GERM'),('3050','Topics in Holocaust, Genocide and Human Rights Studies',3,'HGHR'),('3050','Topics in Computer Science',1,'ITCS'),('3050','Topics in Computer Science',2,'ITCS'),('3050','Topics in Computer Science',3,'ITCS'),('3050','Topics in Journalism',3,'JOUR'),('3050','Topics in Language, Literature and Culture',3,'LACS'),('3050','Selected Topics in Mathematics',2,'MATH'),('3050','Selected Topics in Mathematics',3,'MATH'),('3050','Topics',3,'PHIL'),('3050','Topics in Portuguese',1,'PORT'),('3050','Topics in Portuguese',2,'PORT'),('3050','Topics in Portuguese',3,'PORT'),('3050','Topics in Religion and Modern Culture',3,'RELS'),('3050','Masterpieces of Russian Literature',3,'RUSS'),('3050','Topics in Spanish',1,'SPAN'),('3050','Topics in Spanish',2,'SPAN'),('3050','Topics in Spanish',3,'SPAN'),('3050','Teaching Internship',1,'UCOL'),('3050','Teaching Internship',2,'UCOL'),('3050','Teaching Internship',3,'UCOL'),('3050','Topics in Urban Studies',3,'URBS'),('3051','Topics in Fibers',1,'ARTF'),('3051','Topics in Fibers',2,'ARTF'),('3051','Topics in Fibers',3,'ARTF'),('3051','Topics in Health Communication',3,'COMM'),('3051','Topics in English – Writing Intensive',3,'ENGL'),('3051','Topics in Women’s Studies',3,'WGST'),('3052','Topics in Mass Media',3,'COMM'),('3052','Topics in English – Oral Communication',3,'ENGL'),('3053','Topics in English – Writing Intensive & Oral Communication',3,'ENGL'),('3054','Topics in Organizational Communication',3,'COMM'),('3055','Topics in Public Relations',3,'COMM'),('3060','Major Figure in Philosophy',3,'PHIL'),('3061','Topics in Print Media',1,'ARTR'),('3061','Topics in Print Media',2,'ARTR'),('3061','Topics in Print Media',3,'ARTR'),('3070','Topics in Mathematics Education, Secondary',1,'MAED'),('3070','Topics in Mathematics Education, Secondary',2,'MAED'),('3070','Topics in Mathematics Education, Secondary',3,'MAED'),('3070','Topics in Mathematics Education, Secondary',4,'MAED'),('3070','Topics in Mathematics Education, Secondary',5,'MAED'),('3070','Topics in Mathematics Education, Secondary',6,'MAED'),('3070','Topics in Political or Legal Philosophy',3,'POLS'),('3071','Topics in Ceramics',1,'ARTC'),('3071','Topics in Ceramics',2,'ARTC'),('3071','Topics in Ceramics',3,'ARTC'),('3071','Engineering Technology Professional Seminar',1,'ETGR'),('3081','Topics in Graphic Design',1,'ARTG'),('3081','Topics in Graphic Design',2,'ARTG'),('3081','Topics in Graphic Design',3,'ARTG'),('3086','Topics in Illustration',1,'ARTL'),('3086','Topics in Illustration',2,'ARTL'),('3086','Topics in Illustration',3,'ARTL'),('3090','Topics in American Film',3,'AMST'),('3090','Topics in Anthropology',1,'ANTH'),('3090','Topics in Anthropology',2,'ANTH'),('3090','Topics in Anthropology',3,'ANTH'),('3090','Special Topics in Civil Engineering',1,'CEGR'),('3090','Special Topics in Civil Engineering',2,'CEGR'),('3090','Special Topics in Civil Engineering',3,'CEGR'),('3090','Special Topics in Civil Engineering',4,'CEGR'),('3090','Special Topics in Chemistry',1,'CHEM'),('3090','Special Topics in Chemistry',2,'CHEM'),('3090','Special Topics in Chemistry',3,'CHEM'),('3090','Special Topics in Chemistry',4,'CHEM'),('3090','Topics in Economics',3,'ECON'),('3090','Topics in Sociology',1,'SOCY'),('3090','Topics in Sociology',2,'SOCY'),('3090','Topics in Sociology',3,'SOCY'),('3090','Topics in Social Work',1,'SOWK'),('3090','Topics in Social Work',2,'SOWK'),('3090','Topics in Social Work',3,'SOWK'),('3091','Topics in Photography',1,'ARTT'),('3091','Topics in Photography',2,'ARTT'),('3091','Topics in Photography',3,'ARTT'),('3099','Movement Problems/Topics',1,'ATRN'),('3099','Movement Problems/Topics',2,'ATRN'),('3099','Movement Problems/Topics',3,'ATRN'),('3099','Movement Problems/Topics',4,'ATRN'),('3099','Movement Problems/Topics',5,'ATRN'),('3099','Movement Problems/Topics',6,'ATRN'),('3099','Movement Problems/Topics',1,'EXER'),('3099','Movement Problems/Topics',2,'EXER'),('3099','Movement Problems/Topics',3,'EXER'),('3099','Movement Problems/Topics',4,'EXER'),('3099','Movement Problems/Topics',5,'EXER'),('3099','Movement Problems/Topics',6,'EXER'),('3100','Introduction to American Studies',3,'AMST'),('3100','Field Study in Visual Art',3,'ARTH'),('3100','Criminal Justice Theory',3,'CJUS'),('3100','Communication Research Methods',3,'COMM'),('3100','Approaches to Literature',3,'ENGL'),('3100','Exercise Leadership and Instruction',3,'EXER'),('3100','The City and Its Region',3,'GEOG'),('3100','Introduction to IT Infrastructure Systems',3,'ITIS'),('3100','Operations Management',3,'OPER'),('3100','Social Work Research',3,'SOWK'),('3100','Introduction to General Curriculum for Students with Special Needs',3,'SPED'),('3101','Leadership and Management',3,'AERO'),('3101','Perspectives on Race and Ethnicity in the US',3,'AFRS'),('3101','Foundations of Anthropological Theory',3,'ANTH'),('3101','Architecture Design Studio',5,'ARCH'),('3101','Art Writing',3,'ARTA'),('3101','Digital Media II',3,'ARTM'),('3101','Research Methods in Criminal Justice',4,'CJUS'),('3101','Persuasion',3,'COMM'),('3101','History of Greece',3,'HIST'),('3101','Foundations of Public Health',3,'HLTH'),('3101','Adaptive Team Leadership',3,'MSCI'),('3101','Topics and Methods of General Physics',3,'PHYS'),('3101','Greek Myths and Religions',3,'RELS'),('3101','Professional Roles & Dimensions of Respiratory Therapy',3,'RESP'),('3101','System Design and Deployment',3,'SEGR'),('3101L','Leadership and Management',0,'AERO'),('3101L','Adaptive Team Leadership Lab',1,'MSCI'),('3102','Defense Administration and Military Management',3,'AERO'),('3102','Architecture Design Studio',5,'ARCH'),('3102','American Criminal Courts',3,'CJUS'),('3102','Literature for Young Children',3,'ENGL'),('3102','History of Rome',3,'HIST'),('3102','Comparative Healthcare Systems',3,'HLTH'),('3102','Introduction to Nursing Science',3,'NURS'),('3102','Outpatient Services in Respiratory Therapy',3,'RESP'),('3102','System Simulation, Modeling & Analysis',3,'SEGR'),('3102L','Defense Administration and Military Management',0,'AERO'),('3102L','Applied Team Leadership Lab',1,'MSCI'),('3103','Animation and Interactivity',3,'ARTM'),('3103','Children’s Literature',3,'ENGL'),('3103','Methods Analysis',3,'ETIN'),('3103','Behavior Change Theories and Practice',3,'HLTH'),('3103','Concepts of Professional Nursing Service',3,'NURN'),('3103','Public Opinion',3,'POLS'),('3103','Advanced Pharmacology in Respiratory Therapy',3,'RESP'),('3103','Human System Interface',3,'SEGR'),('3104','Installation Art 2',3,'ARTZ'),('3104','Literature for Adolescents',3,'ENGL'),('3104','Research and Statistics in Health',3,'HLTH'),('3104','Mass Media',3,'POLS'),('3104','Prophecy and Prophetic Literature in Ancient Israel',3,'RELS'),('3104','Advanced Critical Care Pathophysiology',3,'RESP'),('3104L','Research and Statistics in Health LAB',1,'HLTH'),('3105','Video Art',3,'ARTM'),('3105','Industrial Relations',3,'ECON'),('3105','Oceanography',3,'ESCI'),('3105','Geography of the Global Economy',3,'GEOG'),('3105','Public Health Education and Promotion',3,'HLTH'),('3105','Server-Side Applications and Data Management',3,'ITIS'),('3105','Concepts of Professional Nursing',3,'NURS'),('3105','Voting and Elections',3,'POLS'),('3105','Advanced Critical Care Monitoring',3,'RESP'),('3105','Computational Methods for Systems Engineering II',3,'SEGR'),('3106','Labor Economics',3,'ECON'),('3106','Medieval Europe',3,'HIST'),('3106','Structured System Analysis and Design',3,'ITIS'),('3106','Skill Set I – Basic',1,'NURS'),('3107','Employment Law',3,'ECON'),('3107','Pathophysiology: Clinical Concepts of Illness and Disease',3,'NURS'),('3107','The Psalms and Wisdom Literature of Israel',3,'RELS'),('3107','Decision and Risk Analysis',3,'SEGR'),('3108','Health Assessment for Nurses',3,'NURN'),('3108','Health Assessment and Application',3,'NURS'),('3108','Social Movements and Interest Groups',3,'POLS'),('3108L','Health Assessment Lab',0,'NURN'),('3109','Renaissance and Reformation Europe',3,'HIST'),('3109','Political Parties',3,'POLS'),('3110','Criminal Justice and the Law',3,'CJUS'),('3110','Gender and Communication',3,'COMM'),('3110','Instructional Design and the Use of Technology with Elementary School Learners',3,'ELED'),('3110','Urban Political Geography',3,'GEOG'),('3110','Minerals and Rocks',3,'GEOL'),('3110','The Age of Revolutions in Europe, 1789-1871',3,'HIST'),('3110','Compiler Construction',3,'ITCS'),('3110','IT Infrastructure II: Design and Practice',3,'ITIS'),('3110','Black Families in the Diaspora',3,'LTAM'),('3110','Marketing Concepts',3,'MKTG'),('3110','Applied Regression',3,'STAT'),('3111','Applied Anthropology',3,'ANTH'),('3111','Cell Biology',3,'BIOL'),('3111','Quantitative Analysis',4,'CHEM'),('3111','Criminal Procedure',3,'CJUS'),('3111','Manufacturing Processes',3,'ETMF'),('3111','Politics and Culture in Literature',3,'INTL'),('3111','Thermodynamics I',3,'MEGR'),('3111','Operations Research: Deterministic Models',3,'OPRS'),('3111','The Congress',3,'POLS'),('3111','Psychology of Learning',3,'PSYC'),('3111','Women in Judaism',3,'RELS'),('3111','Project Management',3,'SEGR'),('3111L','Cell Biology Laboratory',1,'BIOL'),('3112','Globalization and Culture',3,'ANTH'),('3112','Modern Separation Techniques',4,'CHEM'),('3112','Approaches to Preschool Education',3,'CHFD'),('3112','Famous Criminal Trials of the Twentieth Century',3,'CJUS'),('3112','Econometrics',3,'ECON'),('3112','Globalization and Culture',3,'INTL'),('3112','Design and Implementation of Object- Oriented Systems',3,'ITCS'),('3112','The Presidency',3,'POLS'),('3112','Value Engineering Management',3,'SEGR'),('3113','Economic Anthropology',3,'ANTH'),('3113','Survey of Instrumental Methods of Analysis',4,'CHEM'),('3113','Parent Education',3,'CHFD'),('3113','Network Analysis',3,'ELET'),('3113','Dynamics',3,'ETME'),('3113','Fundamental of Optics',3,'ETMF'),('3113','Operations Research: Probabilistic Models',3,'OPRS'),('3113','Physiological Psychology',3,'PSYC'),('3113','Jesus',3,'RELS'),('3114','Art History Methods',3,'ARTH'),('3114','Research Methods',3,'ECON'),('3114','Thin Films and Optical Coatings',3,'ETMF'),('3114','Constitutional Law and Policy',3,'POLS'),('3114','Motivation',3,'PSYC'),('3114','Production Control Systems',3,'SEGR'),('3115','Honors Art History Methods',3,'ARTH'),('3115','Learning and Development',3,'CHFD'),('3115','Health Communication',3,'COMM'),('3115','Money and Banking',3,'ECON'),('3115','Urban Transportation Problems',3,'GEOG'),('3115','Mineralogy',4,'GEOL'),('3115','Health and the Aging Process',3,'GRNT'),('3115','Nineteenth Century Europe, 1814-1914',3,'HIST'),('3115','Health and the Aging Process',3,'HLTH'),('3115','Globalization and Digital Media',3,'INTL'),('3115','Civil Rights and Liberties',3,'POLS'),('3115','Sensation and Perception',3,'PSYC'),('3116','Twentieth Century Europe, 1914 to the Present',3,'HIST'),('3116','Graph Theory',3,'MATH'),('3116','Judicial Process',3,'POLS'),('3116','Human Cognitive Processes',3,'PSYC'),('3116','Paul',3,'RELS'),('3117','Hereditary Behavior',3,'PSYC'),('3118','Eastern Europe After 1945',3,'HIST'),('3118','Research Methods in Physiological Psychology',4,'PSYC'),('3119','State and Local Government',3,'POLS'),('3120','The Juvenile Offender',3,'CJUS'),('3120','Communication and Mass Media',3,'COMM'),('3120','The Elementary School Child',3,'ELED'),('3120','Financial Management',3,'FINN'),('3120','Geochemistry',3,'GEOL'),('3120','Women’s Studies International',3,'INTL'),('3120','Diversity and Populations-at-Risk',3,'SOWK'),('3120L','Geochemistry Laboratory',1,'GEOL'),('3121','Juvenile Law',3,'CJUS'),('3121','Mass Communication and Society',3,'COMM'),('3121','Classical Mechanics I',3,'PHYS'),('3121','Urban Politics and Policy',3,'POLS'),('3122','Culture, Health and Disease',3,'ANTH'),('3122','Structural Analysis',3,'CEGR'),('3122','Intermediate Microeconomics',3,'ECON'),('3122','Probability and Statistics I',3,'MATH'),('3122','Cognitive and Language Development',3,'PSYC'),('3122','Esoteric Traditions',3,'RELS'),('3122','Implementation of Logistics Systems and Supply Chains',3,'SEGR'),('3122','Probability and Statistics I',3,'STAT'),('3123','Intermediate Macroeconomics',3,'ECON'),('3123','Cost Estimating',3,'ETCE'),('3123','Production Control Systems',3,'ETIN'),('3123','Introduction to Numerical Methods',3,'ITCS'),('3123','Probability and Statistics II',3,'MATH'),('3123','Urban Political Geography',3,'POLS'),('3123','Social and Personality Development',3,'PSYC'),('3123','Probability and Statistics II',3,'STAT'),('3124','Food, Nutrition and Culture',3,'ANTH'),('3124','Sedimentology',4,'GEOL'),('3124','US Domestic Policy',3,'POLS'),('3125','New Media for Communications',3,'COMM'),('3125','Managerial Economics',3,'ECON'),('3125','Health Care Policy',3,'POLS'),('3125','Older Worker and Retirement',3,'PSYC'),('3126','Globalization and Digital Media',3,'COMM'),('3126','Administrative Behavior',3,'POLS'),('3126','Psychology of Women',3,'PSYC'),('3126','Applied Statistical Methods',3,'STAT'),('3128','Actuarial Science I',3,'MATH'),('3128','Politics and Film',3,'POLS'),('3128','Probability and Statistics for Engineers',3,'STAT'),('3129','Cultural Dimension of Doing Business with Spanish-Speaking Countries',3,'LTAM'),('3129','Actuarial Science II',3,'MATH'),('3129','Christian Controversies',3,'RELS'),('3130','The Administration of Criminal Justice',3,'CJUS'),('3130','Communication and Public Advocacy',3,'COMM'),('3130','Structural Geology',4,'GEOL'),('3130','Management Information Systems',3,'INFO'),('3130','Human-Computer Interaction',3,'ITIS'),('3130','The Early Adolescent Learner',4,'MDLG'),('3130','Counterpoint',2,'MUSC'),('3130','Social Psychology',3,'PSYC'),('3130','Ancient, Medieval, and Asian Theatre',3,'THEA'),('3131','Abstract Painting',3,'ARTP'),('3131','African-American Oratory',3,'COMM'),('3131','Economic History of the United States',3,'ECON'),('3131','Foundations and Earthwork',3,'ETCE'),('3131','Computer Integrated Manufacturing',3,'ETMF'),('3131','History of Sexuality',3,'HIST'),('3131','Diplomacy in a Changing World',3,'INTL'),('3131','Human and Computer Info Processing',3,'ITIS'),('3131','The Philosophy and Curriculum of Middle Grades Education',4,'MDLG'),('3131','Computer Aided Design & Manufacturing',3,'SEGR'),('3131','Renaissance European Theatre',3,'THEA'),('3131L','Soil Testing Laboratory',1,'ETCE'),('3132','Aging and Culture',3,'ANTH'),('3132','Figure in Painting',3,'ARTP'),('3132','Interviewing in Criminal Justice',3,'CJUS'),('3132','Digital Systems',3,'ELET'),('3132','Introduction to Contemporary American English',3,'ENGL'),('3132','Aging and Culture',3,'GRNT'),('3132','Information Systems',3,'ITIS'),('3132','Comparative Public Policy',3,'POLS'),('3132','Facilities Planning & Material Handling Systems',3,'SEGR'),('3132','Sociology of Sport',3,'SOCY'),('3132','17th to Early 20th Century Theatre',3,'THEA'),('3132L','Digital Systems Laboratory',1,'ELET'),('3133','Quality Control',3,'ETIN'),('3133','Middle East Politics',3,'POLS'),('3133','Contemporary Theatre',3,'THEA'),('3134','Figure & Anatomy',3,'ARTD'),('3134','Digital Image Processing',3,'ITCS'),('3134','Fundamentals of Conducting',2,'MUSC'),('3134','Costume History',3,'THEA'),('3135','Expressive Drawing',3,'ARTD'),('3135','Leadership, Communication, and Group Dynamics',3,'COMM'),('3135','Origins of Globalization',3,'INTL'),('3135','Choral Conducting',2,'MUSC'),('3135','Terrorism',3,'POLS'),('3135','Psychology of Personality',3,'PSYC'),('3135','Religion in Nineteenth-Century America',3,'RELS'),('3135','History of Ornament',3,'THEA'),('3136','Leadership, Service, and Ethics',3,'COMM'),('3136','Globalization and Resistance',3,'INTL'),('3136','Instrumental Conducting',2,'MUSC'),('3137','Contemporary African-American Religions',3,'RELS'),('3140','Forensic Anthropology',3,'ANTH'),('3140','Paleontology',3,'GEOL'),('3140','Irish History',3,'HIST'),('3140','Introduction to Meteorology & Climatology',3,'METR'),('3140','Management and Organizational Behavior',3,'MGMT'),('3140','Basic Processes in Psychological Assessment',3,'PSYC'),('3140','The Adolescent Learner',3,'SECD'),('3141','Human Evolution',3,'ANTH'),('3141','Introduction to Environmental Engineering',3,'CEGR'),('3141','Physical Chemistry',3,'CHEM'),('3141','Law Enforcement Behavioral Systems',3,'CJUS'),('3141','Organizational Communication',3,'COMM'),('3141','Health Economics',3,'ECON'),('3141','Industrial Applied Optical Systems',3,'ETMF'),('3141','World War I',3,'HIST'),('3141','Advanced Calculus of One Variable',3,'MATH'),('3141','Introduction to Modern Physics',3,'PHYS'),('3141','European Politics',3,'POLS'),('3141','Secondary Schools',3,'SECD'),('3141L','Physical Chemistry Laboratory',1,'CHEM'),('3141L','Applied Optical Systems Laboratory',1,'ETMF'),('3142','Primate Behavioral Ecology',3,'ANTH'),('3142','Sculpture 2: Casting & Fabrication',3,'ARTZ'),('3142','Physical Chemistry',3,'CHEM'),('3142','Applications in Organizational Communication',3,'COMM'),('3142','Advanced Calculus of Several Variables',3,'MATH'),('3142','Issues in Secondary Education',2,'SECD'),('3142L','Physical Chemistry Laboratory',1,'CHEM'),('3143','Hydraulics and Hydrology',3,'CEGR'),('3143','Operating Systems',3,'ITCS'),('3143','African Politics',3,'POLS'),('3143','Social Movements',3,'SOCY'),('3144','Ecology',3,'BIOL'),('3144','Latin American Politics',3,'LTAM'),('3144','Latin American Politics',3,'POLS'),('3144L','Ecology Laboratory',1,'BIOL'),('3146','Operating Systems and Networking',3,'ITCS'),('3146','Introduction to Complex Analysis',3,'MATH'),('3147','The Third Reich',3,'HIST'),('3148','The Holocaust',3,'HIST'),('3148','Chinese Politics',3,'POLS'),('3150','The African-American Church and Civil Rights',3,'AFRS'),('3150','Business Law I',3,'BLAW'),('3150','Community Corrections',3,'CJUS'),('3150','Gender, Culture, and Communication',3,'COMM'),('3150','Natural Environments of North America',3,'ESCI'),('3150','Manufacturing Geography',3,'GEOG'),('3150','The Holocaust through German Literature and Film',3,'GERM'),('3150','Shakespeare’s England',3,'HIST'),('3150','Rapid Prototyping and Interface Building',3,'ITIS'),('3150','Research and Analysis of Teaching Middle School Learners',3,'MDSK'),('3150','Accompanying for Pianists',1,'MUSC'),('3150','Time Series Analysis',3,'STAT'),('3151','Institutional Corrections',3,'CJUS'),('3151','Law and Economics',3,'ECON'),('3151','Instructional Design and the Use of Technology with Middle and Secondary School Learners',3,'MDSK'),('3151','Accompanying for Music Educators',1,'MUSC'),('3151','Thermal Physics',3,'PHYS'),('3151','International Political Economy',3,'POLS'),('3151','Abnormal Psychology',3,'PSYC'),('3152','Early Civilizations',3,'ANTH'),('3152','Correctional Law',3,'CJUS'),('3152','Health and Safety Issues in Middle and Secondary Schools',2,'EXER'),('3152','Symbolic Programming',3,'ITCS'),('3152','Mechanics and Materials Laboratory',2,'MEGR'),('3152','International Organizations',3,'POLS'),('3152','Child Psychopathology',3,'PSYC'),('3153','Archaeological Analysis',3,'ANTH'),('3153','Transportation Laboratory',1,'CEGR'),('3153','Juvenile Corrections',3,'CJUS'),('3153','Optics Laboratory',2,'ETMF'),('3153','Introduction to Artificial Intelligence',3,'ITCS'),('3153','European Union',3,'POLS'),('3153','Evolution of Sociological Theory',3,'SOCY'),('3154','European Prehistory',3,'ANTH'),('3154','Political Economy of Latin America',3,'LTAM'),('3154','Cyberspace and Politics',3,'POLS'),('3154','Evolution of Sociological Theory – Writing Intensive',3,'SOCY'),('3155','Ancient Latin America',3,'ANTH'),('3155','Environmental Laboratory',1,'CEGR'),('3155','Health and Healing in Africa',3,'HIST'),('3155','Software Engineering',3,'ITCS'),('3155','Latin American Political Economy',3,'POLS'),('3155','Community Psychology',3,'PSYC'),('3157','Twentieth Century Black American Literature: Prose',3,'ENGL'),('3157','American Foreign and Defense Policy',3,'POLS'),('3158','Gender and African-American Literature',3,'AFRS'),('3158','Gender and African-American Literature',3,'ENGL'),('3159','African-American Poetry',3,'AFRS'),('3159','African-American Poetry',3,'ENGL'),('3159','Diplomacy in a Changing World',3,'POLS'),('3160','Gender, Culture, and Communication',3,'ANTH'),('3160','Survey of German Film',3,'GERM'),('3160','History of Modern China',3,'HIST'),('3160','Data Base Design and Implementation',3,'ITCS'),('3160','Advanced News Reporting and Writing',3,'JOUR'),('3160','European Cinema',3,'LACS'),('3160','Learning and Development: Birth through Adolescence',3,'MDSK'),('3160','Business Communications',3,'MGMT'),('3160','Guitar History and Literature',2,'MUSC'),('3160','Astrophysics I [Stellar Astrophysics]',3,'PHYS'),('3160','Applied Multivariate Analysis',3,'STAT'),('3161','Mixed Media',3,'ARTP'),('3161','Introduction to Biotechnology',3,'BIOL'),('3161','Transportation Engineering I',3,'CEGR'),('3161','News Editing',3,'JOUR'),('3161','K-12 Curriculum Studies',3,'MDSK'),('3161','Astrophysics II [Interstellar Matter and Galaxies]',3,'PHYS'),('3161','Socialization and Society',3,'SOCY'),('3162','Print Media 3',3,'ARTR'),('3162','Revolutionary Movements in Modern China',3,'HIST'),('3162','Feature Writing',3,'JOUR'),('3162','International Law',3,'POLS'),('3163','Structural Analysis and Design I',3,'ETCE'),('3163','Visual Communication in Media',3,'JOUR'),('3163','Introduction to Modern Algebra',3,'MATH'),('3163','Introduction to Model United Nations',3,'POLS'),('3163','The Religious Art and Architecture of India',3,'RELS'),('3163L','Structures and Materials Laboratory',1,'ETCE'),('3164','US-Latin American Relations',3,'LTAM'),('3164','US-Latin American Relations',3,'POLS'),('3165','History of Modern Japan',3,'HIST'),('3165','East Asia in World Affairs',3,'POLS'),('3166','Genetics',3,'BIOL'),('3166','Introduction to Computer Networks',3,'ITCS'),('3166','Combinatorics',3,'MATH'),('3166','Politics of the Islamic World',3,'POLS'),('3166L','Genetics Laboratory',1,'BIOL'),('3169','Central Asia from 1800 to the Present',3,'HIST'),('3169','African International Relations',3,'POLS'),('3169','Zen Buddhism',3,'RELS'),('3170','Environmental Quality Management',3,'ESCI'),('3170','Applied Scientific Computing',3,'ITCS'),('3170','Music History I',3,'MUSC'),('3171','Ceramic Sculpture',3,'ARTC'),('3171','International Business Economics',3,'ECON'),('3171','Applied Mathematics',3,'MATH'),('3171','Introduction to Measurements and Instrumentation',2,'MEGR'),('3171','Music History II',3,'MUSC'),('3171','History of Classical Political Philosophy',3,'POLS'),('3172','Ceramics Wheel 2',3,'ARTC'),('3172','African-American Political Philosophy',3,'POLS'),('3172','Psychology of Personnel: Employee Selection and Classification',3,'PSYC'),('3173','History of Modern Political Philosophy',3,'POLS'),('3173','Psychological Bases of Training Programs',3,'PSYC'),('3173','Criminology',3,'SOCY'),('3173','Special Education Assessment',3,'SPED'),('3174','Resistance and Adaptation: Indian Peoples Under Spanish Rule',3,'HIST'),('3174','Organizational Psychology',3,'PSYC'),('3175','Reform, Riots, and Rebellions in Colonial Spanish America, 1692-1825',3,'HIST'),('3175','Philosophy of Law',3,'POLS'),('3175','Crowds, Riots, and Disasters',3,'SOCY'),('3175','Instructional Planning in Special Education',3,'SPED'),('3176','History of Mexico',3,'HIST'),('3176','Numerical Analysis',3,'MATH'),('3176','Fascism and Communism',3,'POLS'),('3177','The Cuban Revolution',3,'HIST'),('3177','Social and Political Philosophy',3,'POLS'),('3178','History of Brazil',3,'HIST'),('3179','African American Political Philosophy',3,'AFRS'),('3180','Environmental Impact Analysis',3,'ESCI'),('3180','Caribbean History',3,'HIST'),('3181','Digital Process Control',3,'ETMF'),('3181','Afro-Latin American History',3,'HIST'),('3181','Logic and Computer Systems',3,'ITCS'),('3181','Fundamental Concepts of Geometry',3,'MATH'),('3181','Practice Methods I',3,'SOWK'),('3181L','Computer Systems Lab and Recitation',0,'ITCS'),('3182','Computer Organization and Architecture',3,'ITCS'),('3182','Practice Methods II',3,'SOWK'),('3183','Graphic Design 2',3,'ARTG'),('3183','Hardware System Design',3,'ITCS'),('3184','Typography',3,'ARTG'),('3184','Practice Methods III',3,'SOWK'),('3186','Illustration: Media/Method',3,'ARTL'),('3188','The Figure in Illustration',3,'ARTL'),('3190','The Political Economy of the Caribbean',3,'AFRS'),('3190','Digital Photography',3,'ARTT'),('3190','Environmental Geology',3,'GEOL'),('3190','The Political Economy of the Caribbean',3,'LTAM'),('3190L','Environmental Geology Laboratory',1,'GEOL'),('3191','Camera & Light',3,'ARTT'),('3193','Alternative Photographic Media',3,'ARTT'),('3195','Documentary Photography and Video',3,'ARTT'),('3197','Internship in Community Education and Service',1,'CHEM'),('3197','Internship in Community Education and Service',2,'CHEM'),('3197','Internship in Community Education and Service',3,'CHEM'),('3197','Marching Band Techniques and Materials',2,'MUSC'),('3200','Folklore of Africa and the African Diaspora',3,'AFRS'),('3200','Security and Loss Prevention',3,'CJUS'),('3200','Adaptive Physical Education',3,'EXER'),('3200','Land Use Planning',3,'GEOG'),('3200','Foundations in Business Computing',3,'INFO'),('3200','Introduction to Information Security and Privacy',3,'ITIS'),('3201','National Security Issues in Contemporary American Society',3,'AERO'),('3201','Advanced Arabic I',3,'ARBC'),('3201','Graphic Design and Illustration BFA Portfolio Review',1,'ARTA'),('3201','Systems and Design I',3,'CEGR'),('3201','Chinese Grammar and Conversation',3,'CHNS'),('3201','French Grammar and Conversation',3,'FREN'),('3201','Advanced German Grammar, Composition and Conversation I',3,'GERM'),('3201','Advanced Japanese Grammar, Composition and Conversation I',4,'JAPN'),('3201','Advanced Foreign Language I',3,'LACS'),('3201','Advanced Operations Management',3,'OPER'),('3201','Meaning of Death',3,'PHIL'),('3201','Portuguese Grammar and Conversation',3,'PORT'),('3201','Advanced Russian Grammar, Composition, and Conversation I',3,'RUSS'),('3201','Foundations of Social Welfare',3,'SOWK'),('3201','Advanced Grammar and Composition',3,'SPAN'),('3201-3202','Professional Training Certificate in Dance',8,'DANC'),('3201L','National Security Issues in Contemporary American Society',0,'AERO'),('3202','The Defense Leader: Perspectives on Ethics and Justice',3,'AERO'),('3202','Advanced Arabic II',3,'ARBC'),('3202','2D BFA Portfolio Review',1,'ARTA'),('3202','Horticulture',3,'BIOL'),('3202','Systems and Design II',4,'CEGR'),('3202','Chinese Grammar and Conversation',3,'CHNS'),('3202','French Grammar and Composition',3,'FREN'),('3202','Advanced German Grammar, Composition and Conversation II',3,'GERM'),('3202','American Revolution, 1750-1815',3,'HIST'),('3202','Advanced Japanese Grammar, Composition and Conversation II',4,'JAPN'),('3202','Advanced Foreign Language II',3,'LACS'),('3202','Portuguese Grammar and Conversation',3,'PORT'),('3202','Advanced Russian Grammar, Composition and Conversation II',3,'RUSS'),('3202','Social Welfare Policy',3,'SOWK'),('3202','Advanced Conversation and Composition',3,'SPAN'),('3202L','The Defense Leader: Perspectives on Ethics and Justice',0,'AERO'),('3202L','Horticulture Laboratory',1,'BIOL'),('3203','3D BFA Portfolio Review',1,'ARTA'),('3203','Plant Layout',3,'ETIN'),('3203','Introduction to French Literature',3,'FREN'),('3203','The Antebellum U',3,'HIST'),('3203','Management Science',3,'OPER'),('3203','Russian Civilization and Culture',3,'RUSS'),('3203','Advanced Writing and Rhetoric for Native Speakers',3,'SPAN'),('3204','Management of Service Operations',3,'OPER'),('3205','Interactive Art and Design',3,'ARTM'),('3205','Internal Structure of the City',3,'GEOG'),('3205','Pharmacology in Health and Illness',3,'NURS'),('3205','Philosophy In and Of Literature',3,'PHIL'),('3206','Skill Set II – Intermediate',1,'NURS'),('3206','Managing for Quality',3,'OPER'),('3207','Narrative Philosophy',3,'PHIL'),('3208','Supply Chain Management',3,'OPER'),('3208','Introduction to Literary Analysis',3,'SPAN'),('3209','France Today',3,'FREN'),('3209','Japanese Civilization and Culture',3,'JAPN'),('3209','Quest in Literature',3,'RELS'),('3209','Spanish Civilization and Culture',3,'SPAN'),('3210','Black Families in the Diaspora',3,'AFRS'),('3210','Childhood in America',3,'AMST'),('3210','Problems and Decisions in Criminal Justice',3,'CJUS'),('3210','Ballet for Majors III',2,'DANC'),('3210','Regional Planning',3,'GEOG'),('3210','Advanced Japanese Civilization, Culture, and History',3,'JAPN'),('3210','Atmospheric Thermodynamics',3,'METR'),('3210','Marketing Research and Analysis',3,'MKTG'),('3210','Introduction to Computational Physics',3,'PHYS'),('3210','Black Families in the Diaspora',3,'SOCY'),('3210','Spanish American Civilization and Culture',3,'SPAN'),('3210','Acting III',3,'THEA'),('3211','Modern Dance for Majors III',2,'DANC'),('3211','Topics in Precision Manufacturing',3,'ETMF'),('3211','Civil War and Reconstruction, 1860-1877',3,'HIST'),('3211','Technical Support',3,'INFO'),('3211','Road Vehicle Dynamics',3,'MEGR'),('3211','Advertising and Promotions Management',3,'MKTG'),('3211','Ancient Philosophy',3,'PHIL'),('3211','Introduction to Spanish Peninsular Literature',3,'SPAN'),('3212','Computer Applications in Civil Engineering',3,'CEGR'),('3212','History of the South to 1865',3,'HIST'),('3212','Retailing Management',3,'MKTG'),('3212','Medieval Philosophy',3,'PHIL'),('3212','Films and Identity',3,'RELS'),('3212','Introduction to Spanish American Literature',3,'SPAN'),('3213','History of the South since 1865',3,'HIST'),('3213','Professional Selling and Sales Management',3,'MKTG'),('3213','Modern Philosophy from Descartes to Kant',3,'PHIL'),('3214','Refrigeration and Air/Conditioning',3,'MEGR'),('3214','Internet Marketing',3,'MKTG'),('3214','Contemporary Philosophy',3,'PHIL'),('3215','Economic Botany',3,'BIOL'),('3215','Environmental Planning',3,'GEOG'),('3215','Southerners',3,'HIST'),('3215','Global Marketing Management',3,'MKTG'),('3216','Introduction to Cognitive Science',3,'ITCS'),('3216','Thermal/Fluid Design',3,'MEGR'),('3216','Consumer Behavior',3,'MKTG'),('3216','Introduction to Cognitive Science',3,'PSYC'),('3217','American Philosophy',3,'PHIL'),('3218','Racial Violence, Colonial Times to Present',3,'AFRS'),('3218','Racial Violence, Colonial Times to Present',3,'HIST'),('3219','Marketing Strategy',3,'MKTG'),('3219','History of Ethical Theory',3,'PHIL'),('3220','The Caribbean from Slavery to Independence',3,'AFRS'),('3220','The Criminal Offender',3,'CJUS'),('3220','The Caribbean from Slavery to Independence',3,'LTAM'),('3220','Physical Meteorology',3,'METR'),('3220','Sports Marketing',3,'MKTG'),('3220','Mathematical Methods in Physics',3,'PHYS'),('3220','Spanish for Business and International Trade',3,'SPAN'),('3220','Advanced Costume Techniques',3,'THEA'),('3221','Structural Steel Design I',3,'CEGR'),('3221','Dance History I',3,'DANC'),('3221','Teaching Science to Elementary School Learners',3,'ELED'),('3221','Financial Institutions and Markets',3,'FINN'),('3221','Ethics',3,'PHIL'),('3221','Directing I',3,'THEA'),('3222','Culture, Health and Disease',3,'ANTH'),('3222','General Botany',3,'BIOL'),('3222','Dance History II',3,'DANC'),('3222','Electronics II',3,'ELET'),('3222','Investments',3,'FINN'),('3222','Teaching Mathematics to Elementary School Learners, Grades K-2',3,'MAED'),('3222L','General Botany Laboratory',1,'BIOL'),('3222L','Electronics II Laboratory',1,'ELET'),('3223','Teaching Social Studies to Elementary School Learners',3,'ELED'),('3223','International Financial Management',3,'FINN'),('3223','Existentialism',3,'PHIL'),('3224','Construction Project Administration',3,'CMET'),('3224','Applied Business Finance',3,'FINN'),('3224','Teaching Reading to Primary Level Learners',3,'READ'),('3225','Reinforced Concrete Design I',3,'CEGR'),('3225','Commercial Bank Management',3,'FINN'),('3225','Introduction to Finite Element Analysis',3,'MEGR'),('3225','Aesthetics',3,'PHIL'),('3226','Teaching Language Arts to Elementary School Learners',3,'ELED'),('3226','Financial Theory and Practice',3,'FINN'),('3226','Social and Political Philosophy',3,'PHIL'),('3226','Teaching Reading to Intermediate Grade Learners',3,'READ'),('3227','Feminist Philosophy',3,'PHIL'),('3228','Elementary Physical Activity',2,'EXER'),('3228','Healthcare Ethics',3,'PHIL'),('3229','Field Botany',3,'BIOL'),('3229','Elementary Health Education',2,'EXER'),('3229','Business Data Communications',3,'INFO'),('3230','Poverty and Discrimination in African Diaspora in the Modern Era',3,'AFRS'),('3230','Choreography II',3,'DANC'),('3230','Illness and Disease Management',3,'NURS'),('3231','Invertebrate Zoology',4,'BIOL'),('3231','Business Applications Development',3,'INFO'),('3231','Business Ethics',3,'PHIL'),('3232','Urban Engineering',3,'CEGR'),('3232','Microcontroller Systems',3,'ELET'),('3232','Senior Design Project I',2,'ETME'),('3232','International Information Systems Management',3,'INFO'),('3233','Vertebrate Zoology',4,'BIOL'),('3233','Parametric Solid Modeling',3,'ETGR'),('3233','Occupational Safety',3,'ETIN'),('3233','Teaching Children Movement',3,'EXER'),('3233','Business Database Systems',3,'INFO'),('3234','Field Entomology',3,'BIOL'),('3234','Business Information Systems Development',3,'INFO'),('3235','The Biology of Insects',3,'BIOL'),('3235','Advanced Business Information Systems Development',3,'INFO'),('3235','Advanced Logic',3,'PHIL'),('3236','General Zoology',3,'BIOL'),('3236','Business Decision Support Systems',3,'INFO'),('3236L','General Zoology Laboratory',1,'BIOL'),('3238','Current Issues in The Management of Information Systems',3,'INFO'),('3240','African Americans and the Legal Process',3,'AFRS'),('3240','Fiber Optics Systems',3,'ETEE'),('3240','African-Americans and the Legal Process',3,'HIST'),('3240','Fundamentals of eBusiness',3,'INFO'),('3240','Boundary-Layer Meteorology',4,'METR'),('3241','Audit, Control, and Security of Business Information Systems',3,'INFO'),('3241','Human Resource Management',3,'MGMT'),('3241','Philosophy of Education',3,'PHIL'),('3241','Technical Design',3,'THEA'),('3242','Hydraulics & Hydrology',3,'ETCE'),('3242','United States Social History since 1860',3,'HIST'),('3242','Philosophy of Religion',3,'PHIL'),('3242','Philosophy of Religion',3,'RELS'),('3242L','Hydraulics Laboratory',1,'ETCE'),('3243','Sculpture 3: Additive/Subtractive/ Assemblage',3,'ARTZ'),('3243','Occupational Health Technology',3,'ETIN'),('3243','Employment Law',3,'MGMT'),('3243','Philosophy of Peace',3,'PHIL'),('3244','Philosophy of Body',3,'PHIL'),('3245','Public Relations Writing',3,'COMM'),('3245','Synoptic Meteorology',4,'METR'),('3245','Philosophy of Mind',3,'PHIL'),('3246','PR Strategy',3,'COMM'),('3247','Philosophy of Science',3,'PHIL'),('3249','Philosophy of Technology',3,'PHIL'),('3250','Business Law II',3,'BLAW'),('3250','World Food Problems',3,'GEOG'),('3250','Dynamic Meteorology',4,'METR'),('3250','Nursing Care of the Childbearing Family',2,'NURS'),('3250','Political Sociology',3,'POLS'),('3250','Political Sociology',3,'SOCY'),('3251','Instrumentation Laboratory',1,'ETME'),('3251','CIM Laboratory',2,'ETMF'),('3251','Human Movement',3,'EXER'),('3251','Thermal/Fluids Laboratory',2,'MEGR'),('3251','Political Sociology',3,'POLS'),('3251','Political Sociology',3,'SOCY'),('3252','United States in the 20th Century, 1932-Present',3,'HIST'),('3252','Weather Analysis Laboratory',1,'METR'),('3255','Structural Materials Laboratory I',1,'CEGR'),('3255','ELET Laboratory VII [Computer Emphasis]',1,'ETEE'),('3255','Ancient Latin America',3,'LTAM'),('3255','Integrating Reading and Writing Across Content Area',3,'READ'),('3256','United States Foreign Relations, 1901 to the Present',3,'HIST'),('3258','Geotechnical Laboratory',1,'CEGR'),('3260','Slavery, Racism and Colonialism in the African Diaspora',3,'AFRS'),('3260','Nutrition for the Physically Active',3,'ATRN'),('3260','Nutrition for the Physically Active',3,'EXER'),('3260','Medical Geography',3,'GEOG'),('3260','The United States and Latin America',3,'HIST'),('3260','Slavery, Racism and Colonialism in the African Diaspora',3,'LTAM'),('3260','Managerial Communication',3,'MGMT'),('3260','Nursing Care of Children',2,'NURS'),('3260','Advanced Lighting Technology',3,'THEA'),('3261','Real Estate Finance',3,'FINN'),('3261','Human Sexuality',3,'SOCY'),('3263','Print Media 4',3,'ARTR'),('3263','Human Factors',3,'ETIN'),('3264','Structural Analysis II',3,'ETCE'),('3264','Philosophy of Language',3,'PHIL'),('3265','African Economic Development',3,'AFRS'),('3265','Behavioral Geography',3,'GEOG'),('3265','Theory of Knowledge',3,'PHIL'),('3265','Introduction to Computer Aided Drafting 2D',3,'THEA'),('3267','Sociology of Dying, Death and Bereavement',3,'GRNT'),('3267','Sociology of Dying, Death, and Bereavement',3,'SOCY'),('3270','Afro-Latin American History',3,'AFRS'),('3270','Afro-Latin American History',3,'LTAM'),('3271','Building Systems',3,'ETCE'),('3271','Principles of Risk Management and Insurance',3,'FINN'),('3271L','Building Systems Laboratory',1,'ETCE'),('3272','Plant Physiology',3,'BIOL'),('3272','Applied Numerical Methods',3,'ETGR'),('3272','Life Insurance and Professional Financial Planning',3,'FINN'),('3272L','Plant Physiology Laboratory',1,'BIOL'),('3273','Ceramics 3',3,'ARTC'),('3273','Animal Physiology',3,'BIOL'),('3273','Air Conditioning Systems',3,'ETME'),('3273','Property and Casualty',3,'FINN'),('3274','Ceramics 4',3,'ARTC'),('3274','Resistance and Adaptation: Indian Peoples Under Spanish Rule',3,'LTAM'),('3274','International Business Processes and Problems',3,'MGMT'),('3275','Integrated Circuit Applications',3,'ETEE'),('3275','Advanced Risk Management',3,'FINN'),('3275','Reform, Riots, and Rebellions in Colonial Spanish America, 1692-1825',3,'LTAM'),('3275','International Management',3,'MGMT'),('3275','Metaphysics',3,'PHIL'),('3276','Employee Benefits',3,'FINN'),('3276','History of Mexico',3,'LTAM'),('3277','Legal Aspects of Insurance',3,'FINN'),('3277','The Cuban Revolution',3,'LTAM'),('3277','Entrepreneurship',3,'MGMT'),('3278','Race in the History of Brazil',3,'AFRS'),('3278','Geotechnical Engineering',3,'CEGR'),('3278','History of Brazil',3,'LTAM'),('3279','Authoritarianism in Latin America',3,'LTAM'),('3280','Blacks in Urban America',3,'AFRS'),('3280','Foundations of Exercise Physiology',3,'ATRN'),('3280','Exercise Physiology',3,'EXER'),('3280','Blacks in Urban America',3,'HIST'),('3280','Business Policy',3,'MGMT'),('3281','Exercise Physiology Laboratory',1,'ATRN'),('3281','American Cities',3,'HIST'),('3282','Professional Development',1,'CEGR'),('3282','Statistical Process Control and Metrology',3,'MEGR'),('3282','Managerial Ethics',3,'MGMT'),('3282','Advanced Laboratory in Modern Physics',3,'PHYS'),('3283','Modern Techniques in Energy Conservation and Utilization',3,'ETME'),('3283','Advanced Laboratory in Classical Physics',3,'PHYS'),('3285','Assembly-Language Programming',3,'ETEE'),('3285','Conditioning for Maximum Sports Performance',3,'EXER'),('3286','Illustration Sequence/Story',3,'ARTL'),('3286','Exercise Testing',3,'ATRN'),('3286','Exercise Testing',3,'EXER'),('3287','Environmental Design',3,'ARTG'),('3287','Exercise Testing Lab',1,'ATRN'),('3287','Exercise Testing Lab',1,'EXER'),('3287','Managerial Leadership',3,'MGMT'),('3288','Upper Body Injury Evaluation',3,'ATRN'),('3288','History of the American West',3,'HIST'),('3289','Upper Body Injury Evaluation Laboratory',1,'ATRN'),('3290','Research Methods',3,'AFRS'),('3290','Lower Body Injury Evaluation',3,'ATRN'),('3290','Systems Design Project I',1,'SEGR'),('3291','Therapeutic Modalities',3,'ATRN'),('3291','Systems Design Project II',3,'SEGR'),('3292','Therapeutic Modalities Laboratory',1,'ATRN'),('3293','General Medical and Psychosocial Aspects of Athletic Training',3,'ATRN'),('3295','Lower Body Injury Evaluation Laboratory',1,'ATRN'),('3298','Therapeutic Exercise Foundations',3,'ATRN'),('3299','Professional Development',1,'MEGR'),('3300','American Literature Survey',3,'ENGL'),('3300','World History for Teachers',3,'HIST'),('3300','Software Requirements and Project Management',3,'ITIS'),('3300','Maya Art',3,'LTAM'),('3301','British Literature Survey I',3,'ENGL'),('3301','Introduction to the Regulatory Environment for Financial Services Firms',3,'ITCS'),('3301','Introduction to the Regulatory Environment for Financial Services Firms',3,'ITIS'),('3301','Mexica [Aztec] Art',3,'LTAM'),('3302','British Literature Survey II',3,'ENGL'),('3302','Andean Art',3,'LTAM'),('3309','Masterpieces of Hispanic Literature in English Translation',3,'LTAM'),('3310','Punishment and Freedom',3,'CJUS'),('3310','Teaching History',3,'HIST'),('3310','Software Architecture and Design',3,'ITIS'),('3311','Intermediate Financial Accounting I',3,'ACCT'),('3312','Intermediate Financial Accounting II',3,'ACCT'),('3312','Introduction to Spanish American Literature',3,'LTAM'),('3313','Pre-Columbian Art',3,'LTAM'),('3313','Neuropsychology',3,'PSYC'),('3316','Cognitive Neuroscience',3,'PSYC'),('3317','Maya Art',3,'ARTH'),('3318','Mexica [Aztec] Art',3,'ARTH'),('3319','Andean Art',3,'ARTH'),('3319','Hispanic Women Writers in English Translation',3,'LTAM'),('3320','Ancient Egyptian & Near Eastern Art',3,'ARTH'),('3320','Introduction to Software Testing and Assurance',3,'ITIS'),('3322','Ancient Greek Art',3,'ARTH'),('3323','Ancient Roman Art',3,'ARTH'),('3330','Managerial Cost Accounting',3,'ACCT'),('3330','Weather Forecasting',3,'METR'),('3340','Accounting Information Systems',3,'ACCT'),('3340','Weather Communications',3,'METR'),('3344','Sculpture 4: Public Sculpture',3,'ARTZ'),('3349','Gothic Art',3,'ARTH'),('3350','Introduction to Auditing',3,'ACCT'),('3350','Northern Renaissance Art',3,'ARTH'),('3351','Italian Renaissance Art',3,'ARTH'),('3352','Fibers 2: Surface Design 1',3,'ARTF'),('3353','Fibers 3: Constructed Textiles 1',3,'ARTF'),('3354','Fibers 4: Surface Design 2',3,'ARTF'),('3355','Fibers 5: Constructed Textiles 2',3,'ARTF'),('3360','Northern Baroque Art',3,'ARTH'),('3360','Studies in Hispanic Film',3,'LTAM'),('3380','Fraud Examination',3,'ACCT'),('3381','Modernism',3,'ARTH'),('3391','Black & White Printing',3,'ARTT'),('3392','Color Photography 1',3,'ARTT'),('3393','History of Photography',3,'ARTH'),('3394','Women in Art',3,'ARTH'),('3400','Accounting Internship',3,'ACCT'),('3400','Non-Residential Studies',1,'ARSC'),('3400','Non-Residential Studies',2,'ARSC'),('3400','Non-Residential Studies',3,'ARSC'),('3400','Non-Residential Studies',4,'ARSC'),('3400','Non-Residential Studies',5,'ARSC'),('3400','Non-Residential Studies',6,'ARSC'),('3400','Non-Residential Studies',7,'ARSC'),('3400','Non-Residential Studies',8,'ARSC'),('3400','Non-Residential Studies',9,'ARSC'),('3400','Non-Residential Studies',10,'ARSC'),('3400','Non-Residential Studies',11,'ARSC'),('3400','Non-Residential Studies',12,'ARSC'),('3400','Non-Residential Studies',13,'ARSC'),('3400','Non-Residential Studies',14,'ARSC'),('3400','Non-Residential Studies',15,'ARSC'),('3400','Internship in the Arts',1,'ARTA'),('3400','Internship in the Arts',2,'ARTA'),('3400','Internship in the Arts',3,'ARTA'),('3400','Athletic Training Clinical I',2,'ATRN'),('3400','Economic Internship',1,'ECON'),('3400','Economic Internship',2,'ECON'),('3400','Economic Internship',3,'ECON'),('3400','International Business Internship',3,'IBUS'),('3400','International Studies Internship',1,'INTL'),('3400','International Studies Internship',2,'INTL'),('3400','International Studies Internship',3,'INTL'),('3400','Latin American Studies Internship',1,'LTAM'),('3400','Latin American Studies Internship',2,'LTAM'),('3400','Latin American Studies Internship',3,'LTAM'),('3400','Marketing Internship',3,'MKTG'),('3400','Internship in Community Education and Service',3,'PHYS'),('3400','Internship in Political Science',3,'POLS'),('3400','Internship in Political Science',4,'POLS'),('3400','Internship in Political Science',5,'POLS'),('3400','Internship in Political Science',6,'POLS'),('3400','Applied Research/Field Work',3,'RELS'),('3401','Athletic Training Clinical II',2,'ATRN'),('3401','Journalism Practicum',2,'JOUR'),('3401','Introduction to Translation Studies',3,'TRAN'),('3402','Gallery Internship',3,'ARTA'),('3403','Debate Practicum',2,'COMM'),('3405','Internship in Digital Media',3,'ARTM'),('3405','Internship in Community Education and Service',1,'BIOL'),('3405','Internship in Community Education and Service',2,'BIOL'),('3405','Internship in Community Education and Service',3,'BIOL'),('3405','Practicum in Applied Psychology',1,'PSYC'),('3405','Practicum in Applied Psychology',2,'PSYC'),('3405','Practicum in Applied Psychology',3,'PSYC'),('3405','Practicum in Applied Psychology',4,'PSYC'),('3408','Graphic Design Internship',3,'ARTG'),('3412','The Family and the Community [Birth to 3 Years]',3,'CHFD'),('3416','Internship in Child and Family Development',12,'CHFD'),('3425','Practicum in Concepts of Professional Nursing',1,'NURS'),('3430','Practicum Illness and Disease Management',3,'NURS'),('3440','Practicum in Nursing Care of Children and the Childbearing Family',3,'NURS'),('3450','Study Abroad for Religious Studies Majors',3,'RELS'),('3450','Study Abroad for Religious Studies Majors',4,'RELS'),('3450','Study Abroad for Religious Studies Majors',5,'RELS'),('3450','Study Abroad for Religious Studies Majors',6,'RELS'),('3452','Internship in Applied Ethics',3,'PHIL'),('3480','Internship in Anthropology',3,'ANTH'),('3480','Citizenship and Service Practicum',3,'ARSC'),('3482','Teaching Internship in Anthropology',3,'ANTH'),('3482','Field Placement I',6,'SOWK'),('3484','Field Placement II',9,'SOWK'),('3490','Manufacturing Engineering Technology Practicum',0,'ETMF'),('3500','Cooperative Education and 49ership Experience',0,'ACCT'),('3500','Cooperative Education and 49ership Experience',0,'ARSC'),('3500','Biology Cooperative Education and 49ership Experience',0,'BIOL'),('3500','Chemistry Cooperative Education and 49ership Experience',0,'CHEM'),('3500','Cooperative Education and 49ership Experience',0,'ECON'),('3500','Earth Sciences Cooperative Education and 49ership Experience',0,'ESCI'),('3500','Cooperative Education and 49ership Experience',0,'FINN'),('3500','Geography Cooperative Education and 49ership Experience',0,'GEOG'),('3500','Cooperative Education and 49ership Experience',0,'INFO'),('3500','Cooperative Education and 49ership Experience',0,'MGMT'),('3500','Cooperative Education and 49ership Experience',0,'MKTG'),('3500','Cooperative Education and 49ership Experience',0,'OPER'),('3501','Earth Sciences Cooperative Education Seminar',1,'ESCI'),('3501','Geography Cooperative Education Seminar',1,'GEOG'),('3551','Mathematics Cooperative Education and 49ership Experience',0,'MATH'),('3590','Computer Science Cooperative Education and 49ership Experience',0,'ITCS'),('3590','Software and Information Systems Cooperative Education and 49ership Experience',0,'ITIS'),('3590','Physics Cooperative Education and 49ership Experience',0,'PHYS'),('3600','Teaching Fellows Seminar',1,'EDUC'),('3600','Senior Seminar and Field Experience in Aging',3,'GRNT'),('3605','Geography of Europe',3,'GEOG'),('3611','Professional Leadership Seminar',1,'ETFS'),('3619','Senior Seminar in Child and Family Development',3,'CHFD'),('3643','Senior Design Project',3,'ETGR'),('3652','Mathematics Cooperative Education Seminar',1,'MATH'),('3680','Professional Development III',1,'CMET'),('3683','Field Seminar I',1,'SOWK'),('3685','Field Seminar II',1,'SOWK'),('3688','Computers and Their Impact on Society',3,'ITCS'),('3688','Mathematics Awareness Seminar',0,'MATH'),('3689','Mathematics Project Seminar',1,'MATH'),('3690','Seminar',1,'ITCS'),('3690','Seminar',2,'ITCS'),('3690','Seminar',3,'ITCS'),('3690','Seminar',4,'ITCS'),('3690','Seminar',5,'ITCS'),('3690','Seminar',6,'ITCS'),('3691','Seminar',1,'ITCS'),('3691','Seminar',2,'ITCS'),('3691','Seminar',3,'ITCS'),('3691','Seminar',4,'ITCS'),('3691','Seminar',5,'ITCS'),('3691','Seminar',6,'ITCS'),('3691','Seminar',1,'MATH'),('3691','Seminar',2,'MATH'),('3691','Seminar',3,'MATH'),('3691','Seminar',4,'MATH'),('3691','Seminar',5,'MATH'),('3691','Seminar',6,'MATH'),('3692','Colloquium',3,'AFRS'),('3695','Civil Engineering Cooperative Education Seminar',1,'CEGR'),('3695','Chemistry Seminar',1,'CHEM'),('3695','Computer Science Cooperative Education Seminar',1,'ITCS'),('3695','Software and Information Systems Cooperative Education Seminar',1,'ITIS'),('3699','Senior Seminar',1,'ITCS'),('3699','Senior Seminar',2,'ITCS'),('3699','Senior Seminar',3,'ITCS'),('3701','Science, Technology and Human Values',3,'HONR'),('3770','Business Honors Thesis Topics',1,'BUSN'),('3780','Business Honors Seminar',3,'BUSN'),('3789','Seminar: Honors in Education',3,'EDUC'),('3790','Business Honors Thesis',3,'BUSN'),('3790','Honors Thesis in Education',3,'EDUC'),('3790','University Honors Thesis',3,'HONR'),('3790','Junior Honors Seminar',3,'MATH'),('3791','Senior Honors Tutorial',3,'MATH'),('3791','Honors Thesis I',2,'PHIL'),('3792','Honors Thesis II',2,'PHIL'),('3795','Honors Seminar',3,'HIST'),('3797','Honors Methods and Practice',3,'HIST'),('3798','Preliminary Honors Research',3,'HIST'),('3799','Honors Research and Thesis',3,'HIST'),('3800','Independent Study or Directed Reading in American Studies',1,'AMST'),('3800','Independent Study or Directed Reading in American Studies',2,'AMST'),('3800','Independent Study or Directed Reading in American Studies',3,'AMST'),('3800','Independent Study in Art',1,'ARTA'),('3800','Independent Study in Art',2,'ARTA'),('3800','Independent Study in Art',3,'ARTA'),('3800','Tutorial in Biology',1,'BIOL'),('3800','Tutorial in Biology',2,'BIOL'),('3800','Tutorial in Biology',3,'BIOL'),('3800','Tutorial in Biology',4,'BIOL'),('3800','Individual Study in Child and Family Development',1,'CHFD'),('3800','Individual Study in Child and Family Development',2,'CHFD'),('3800','Individual Study in Child and Family Development',3,'CHFD'),('3800','Individual Study in Child and Family Development',4,'CHFD'),('3800','Individual Study in Child and Family Development',5,'CHFD'),('3800','Individual Study in Child and Family Development',6,'CHFD'),('3800','Directed Individual Study',1,'CJUS'),('3800','Directed Individual Study',2,'CJUS'),('3800','Directed Individual Study',3,'CJUS'),('3800','Directed Individual Study',4,'CJUS'),('3800','Individual Study in Elementary Education',1,'ELED'),('3800','Individual Study in Elementary Education',2,'ELED'),('3800','Individual Study in Elementary Education',3,'ELED'),('3800','Individual Study in Elementary Education',4,'ELED'),('3800','Individual Study in Elementary Education',5,'ELED'),('3800','Individual Study in Elementary Education',6,'ELED'),('3800','Directed Study',1,'FINN'),('3800','Directed Study',2,'FINN'),('3800','Directed Study',3,'FINN'),('3800','Directed Individual Study',1,'FREN'),('3800','Directed Individual Study',2,'FREN'),('3800','Directed Individual Study',3,'FREN'),('3800','Directed Individual Study',1,'GERM'),('3800','Directed Individual Study',2,'GERM'),('3800','Directed Individual Study',3,'GERM'),('3800','Directed Individual Reading',1,'GREK'),('3800','Directed Individual Reading',2,'GREK'),('3800','Directed Individual Reading',3,'GREK'),('3800','Independent Study in Gerontology',1,'GRNT'),('3800','Independent Study in Gerontology',2,'GRNT'),('3800','Independent Study in Gerontology',3,'GRNT'),('3800','Independent Study in Gerontology',4,'GRNT'),('3800','Independent Study in Gerontology',5,'GRNT'),('3800','Independent Study in Gerontology',6,'GRNT'),('3800','Independent Study in Gerontology',7,'GRNT'),('3800','Independent Study in Gerontology',8,'GRNT'),('3800','Independent Study in Holocaust, Genocide and Human Rights Studies',3,'HGHR'),('3800','Independent Projects in History',3,'HIST'),('3800','Independent Study in Humanities, Technology, and Science',3,'HTAS'),('3800','Directed Study',1,'INFO'),('3800','Directed Study',2,'INFO'),('3800','Directed Study',3,'INFO'),('3800','Directed Study',4,'INFO'),('3800','Directed Study',5,'INFO'),('3800','Directed Study',6,'INFO'),('3800','Independent Study',1,'INTL'),('3800','Independent Study',2,'INTL'),('3800','Independent Study',3,'INTL'),('3800','Directed Individual Study',1,'JAPN'),('3800','Directed Individual Study',2,'JAPN'),('3800','Directed Individual Study',3,'JAPN'),('3800','Directed Individual Study',1,'LACS'),('3800','Directed Individual Study',2,'LACS'),('3800','Directed Individual Study',3,'LACS'),('3800','Directed Individual Reading',1,'LATN'),('3800','Directed Individual Reading',2,'LATN'),('3800','Directed Individual Reading',3,'LATN'),('3800','Independent Study',1,'LTAM'),('3800','Independent Study',2,'LTAM'),('3800','Independent Study',3,'LTAM'),('3800','Individual Study in Middle Grades Education',1,'MDLG'),('3800','Individual Study in Middle Grades Education',2,'MDLG'),('3800','Individual Study in Middle Grades Education',3,'MDLG'),('3800','Individual Study in Middle Grades Education',4,'MDLG'),('3800','Individual Study in Middle Grades Education',5,'MDLG'),('3800','Individual Study in Middle Grades Education',6,'MDLG'),('3800','Directed Study',1,'MGMT'),('3800','Directed Study',2,'MGMT'),('3800','Directed Study',3,'MGMT'),('3800','Directed Study',4,'MGMT'),('3800','Directed Study',5,'MGMT'),('3800','Directed Study',6,'MGMT'),('3800','Directed Study',1,'MKTG'),('3800','Directed Study',2,'MKTG'),('3800','Directed Study',3,'MKTG'),('3800','Directed Study',1,'OPER'),('3800','Directed Study',2,'OPER'),('3800','Directed Study',3,'OPER'),('3800','Directed Study',4,'OPER'),('3800','Directed Study',5,'OPER'),('3800','Directed Study',6,'OPER'),('3800','Independent Study',1,'POLS'),('3800','Independent Study',2,'POLS'),('3800','Independent Study',3,'POLS'),('3800','Directed Individual Study',1,'RUSS'),('3800','Directed Individual Study',2,'RUSS'),('3800','Directed Individual Study',3,'RUSS'),('3800','Directed Individual Study',4,'RUSS'),('3800','Individual Study in Secondary Education',1,'SECD'),('3800','Individual Study in Secondary Education',2,'SECD'),('3800','Individual Study in Secondary Education',3,'SECD'),('3800','Individual Study in Secondary Education',4,'SECD'),('3800','Individual Study in Secondary Education',5,'SECD'),('3800','Individual Study in Secondary Education',6,'SECD'),('3800','Directed Individual Study',1,'SPAN'),('3800','Directed Individual Study',2,'SPAN'),('3800','Directed Individual Study',3,'SPAN'),('3800','Individual Study in Special Education',1,'SPED'),('3800','Individual Study in Special Education',2,'SPED'),('3800','Individual Study in Special Education',3,'SPED'),('3800','Individual Study in Special Education',4,'SPED'),('3800','Individual Study in Special Education',5,'SPED'),('3800','Individual Study in Special Education',6,'SPED'),('3800','Independent Study',3,'UCOL'),('3801','Visual Arts Workshop',1,'ARTA'),('3801','Visual Arts Workshop',2,'ARTA'),('3801','Visual Arts Workshop',3,'ARTA'),('3801','Visual Arts Workshop',4,'ARTA'),('3801','Visual Arts Workshop',5,'ARTA'),('3801','Visual Arts Workshop',6,'ARTA'),('3801','Independent Study',1,'URBS'),('3801','Independent Study',2,'URBS'),('3801','Independent Study',3,'URBS'),('3806','Individual Studies in Psychology',1,'PSYC'),('3806','Individual Studies in Psychology',2,'PSYC'),('3806','Individual Studies in Psychology',3,'PSYC'),('3806','Individual Studies in Psychology',4,'PSYC'),('3810','Independent Study in Art History',1,'ARTH'),('3810','Independent Study in Art History',2,'ARTH'),('3810','Independent Study in Art History',3,'ARTH'),('3831','Composition',2,'MUSC'),('3851','Practicum in Philosophy',1,'PHIL'),('3851','Practicum in Philosophy',2,'PHIL'),('3851','Practicum in Philosophy',3,'PHIL'),('3852','Independent Study',1,'ENGL'),('3852','Independent Study',2,'ENGL'),('3852','Independent Study',3,'ENGL'),('3853','Research Methods and Publication',3,'PHIL'),('3859','Independent Study',1,'PHIL'),('3859','Independent Study',2,'PHIL'),('3859','Independent Study',3,'PHIL'),('3880','Independent Study',1,'COMM'),('3880','Independent Study',2,'COMM'),('3880','Independent Study',3,'COMM'),('3890','Individualized Study',1,'CEGR'),('3890','Individualized Study',2,'CEGR'),('3890','Individualized Study',3,'CEGR'),('3895','Independent Study',1,'AFRS'),('3895','Independent Study',2,'AFRS'),('3895','Independent Study',3,'AFRS'),('3895','Directed Individual Study',1,'ANTH'),('3895','Directed Individual Study',2,'ANTH'),('3895','Directed Individual Study',3,'ANTH'),('3895','Directed Individual Study',4,'ANTH'),('3895','Directed Individual Study',1,'ECON'),('3895','Directed Individual Study',2,'ECON'),('3895','Directed Individual Study',3,'ECON'),('3895','Independent Study in Nursing',1,'NURS'),('3895','Independent Study in Nursing',2,'NURS'),('3895','Independent Study in Nursing',3,'NURS'),('3895','Independent Study in Nursing',4,'NURS'),('3895','Directed Individual Study',1,'SOCY'),('3895','Directed Individual Study',2,'SOCY'),('3895','Directed Individual Study',3,'SOCY'),('3895','Directed Individual Study',4,'SOCY'),('3895','Directed Individual Study',1,'SOWK'),('3895','Directed Individual Study',2,'SOWK'),('3895','Directed Individual Study',3,'SOWK'),('3895','Directed Individual Study',4,'SOWK'),('3900','Current Developments in Accounting',1,'ACCT'),('3900','Current Developments in Accounting',2,'ACCT'),('3900','Current Developments in Accounting',3,'ACCT'),('3900','Undergraduate Research',1,'BIOL'),('3900','Undergraduate Research',2,'BIOL'),('3900','Undergraduate Research',3,'BIOL'),('3900','Undergraduate Research',4,'BIOL'),('3900','Senior Project',2,'PHYS'),('3900','Senior Project',3,'PHYS'),('3990','Senior Project in Africana Studies',2,'AFRS'),('3990','Senior Project in Africana Studies',3,'AFRS'),('3990','Senior Project in Africana Studies',4,'AFRS'),('3990','Senior Project in Africana Studies',5,'AFRS'),('3990','Senior Project in Africana Studies',6,'AFRS'),('3990','Senior Project in Africana Studies',7,'AFRS'),('3990','Senior Project in Africana Studies',8,'AFRS'),('3990','Senior Project in Africana Studies',9,'AFRS'),('3990','Senior Project in Africana Studies',10,'AFRS'),('3990','Senior Project in Africana Studies',11,'AFRS'),('3990','Senior Project in Africana Studies',12,'AFRS'),('3990','Senior Project in Africana Studies',13,'AFRS'),('3990','Senior Project in Africana Studies',14,'AFRS'),('3990','Senior Project in Africana Studies',15,'AFRS'),('3990','Undergraduate Research in Civil Engineering',1,'CEGR'),('3990','Undergraduate Research in Civil Engineering',2,'CEGR'),('3990','Undergraduate Research in Civil Engineering',3,'CEGR'),('3990','Undergraduate Research in Civil Engineering',4,'CEGR'),('3990','Undergraduate Research',1,'MEGR'),('3990','Undergraduate Research',2,'MEGR'),('3990','Undergraduate Research',3,'MEGR'),('3990','Undergraduate Research',4,'MEGR'),('4000','Senior Seminar in Africana Studies',3,'AFRS'),('4000','Special Topics in Biology',1,'BIOL'),('4000','Special Topics in Biology',2,'BIOL'),('4000','Special Topics in Biology',3,'BIOL'),('4000','Special Topics in Biology',4,'BIOL'),('4000','Topics in Child and Family Development',1,'CHFD'),('4000','Topics in Child and Family Development',2,'CHFD'),('4000','Topics in Child and Family Development',3,'CHFD'),('4000','Topics in Child and Family Development',4,'CHFD'),('4000','Topics in Child and Family Development',5,'CHFD'),('4000','Topics in Child and Family Development',6,'CHFD'),('4000','Topics in Criminal Justice',1,'CJUS'),('4000','Topics in Criminal Justice',2,'CJUS'),('4000','Topics in Criminal Justice',3,'CJUS'),('4000','Topics in Criminal Justice',4,'CJUS'),('4000','Topics in Criminal Justice',5,'CJUS'),('4000','Topics in Criminal Justice',6,'CJUS'),('4000','Selected Topics in Earth Sciences',1,'ESCI'),('4000','Selected Topics in Earth Sciences',2,'ESCI'),('4000','Selected Topics in Earth Sciences',3,'ESCI'),('4000','Selected Topics in Earth Sciences',4,'ESCI'),('4000','Selected Topics in Geology',1,'GEOL'),('4000','Selected Topics in Geology',2,'GEOL'),('4000','Selected Topics in Geology',3,'GEOL'),('4000','Selected Topics in Geology',4,'GEOL'),('4000','Problems in American History',3,'HIST'),('4000','Special Topics in Public Health',1,'HLTH'),('4000','Special Topics in Public Health',2,'HLTH'),('4000','Special Topics in Public Health',3,'HLTH'),('4000','Topics in Foundations or History of Mathematics',2,'MATH'),('4000','Topics in Foundations or History of Mathematics',3,'MATH'),('4000','Selected Topics in Meteorology',1,'METR'),('4000','Selected Topics in Meteorology',2,'METR'),('4000','Selected Topics in Meteorology',3,'METR'),('4000','Selected Topics in Meteorology',4,'METR'),('4000','Topics in Nursing',1,'NURS'),('4000','Topics in Nursing',2,'NURS'),('4000','Topics in Nursing',3,'NURS'),('4000','Selected Topics in Physics',1,'PHYS'),('4000','Selected Topics in Physics',2,'PHYS'),('4000','Selected Topics in Physics',3,'PHYS'),('4000','Selected Topics in Physics',4,'PHYS'),('4000','Topics in Religious Studies',3,'RELS'),('4000','Topics in Special Education',1,'SPED'),('4000','Topics in Special Education',2,'SPED'),('4000','Topics in Special Education',3,'SPED'),('4000','Topics in Special Education',4,'SPED'),('4000','Topics in Special Education',5,'SPED'),('4000','Topics in Special Education',6,'SPED'),('4001','Topics in Dance',1,'DANC'),('4001','Topics in Dance',2,'DANC'),('4001','Topics in Dance',3,'DANC'),('4001','Problems in European History',3,'HIST'),('4001','Topics in Music',1,'MUSC'),('4001','Topics in Music',2,'MUSC'),('4001','Topics in Music',3,'MUSC'),('4001','Topics in Music',4,'MUSC'),('4001','Topics in Music',5,'MUSC'),('4001','Topics in Music',6,'MUSC'),('4001','Topics in Theatre',1,'THEA'),('4001','Topics in Theatre',2,'THEA'),('4001','Topics in Theatre',3,'THEA'),('4001','Topics in Theatre',4,'THEA'),('4001','Topics in Theatre',5,'THEA'),('4001','Topics in Theatre',6,'THEA'),('4002','Women and Literature',3,'ENGL'),('4002','Problems in Non-Western History',3,'HIST'),('4003','Studies in French Literature',3,'FREN'),('4005','Engineering Geology',3,'ESCI'),('4005','Studies in the French Language',3,'FREN'),('4007','Studies in French Culture and Civilization',3,'FREN'),('4008','Topics in Advanced Technical Communication',3,'ENGL'),('4010','African Diaspora Theory',3,'AFRS'),('4010','Periods in the History of German Literature',3,'GERM'),('4010','Topics in Computer Science',1,'ITCS'),('4010','Topics in Computer Science',2,'ITCS'),('4010','Topics in Computer Science',3,'ITCS'),('4010','Topics in Decision Mathematics',2,'OPRS'),('4010','Topics in Decision Mathematics',3,'OPRS'),('4010','Major Figure in Religious Studies',3,'RELS'),('4020','The Chief Genres in German Literature',3,'GERM'),('4021','Topics in Art Education',1,'ARTE'),('4021','Topics in Art Education',2,'ARTE'),('4021','Topics in Art Education',3,'ARTE'),('4040','Transportation Topics',3,'GEOG'),('4040','Topics in Analysis',2,'MATH'),('4040','Topics in Analysis',3,'MATH'),('4050','Topics in Africana Studies',3,'AFRS'),('4050','Topics in American Studies',3,'AMST'),('4050','Architecture Elective – Topics',3,'ARCH'),('4050','Topics in Communication Studies',3,'COMM'),('4050','Topics in English',3,'ENGL'),('4050','Topics in French',1,'FREN'),('4050','Topics in French',2,'FREN'),('4050','Topics in French',3,'FREN'),('4050','Special Topics in German',1,'GERM'),('4050','Special Topics in German',2,'GERM'),('4050','Special Topics in German',3,'GERM'),('4050','Topics in Gerontology',1,'GRNT'),('4050','Topics in Gerontology',2,'GRNT'),('4050','Topics in Gerontology',3,'GRNT'),('4050','Topics in Gerontology',4,'GRNT'),('4050','Topics in Holocaust, Genocide and Human Rights Studies',3,'HGHR'),('4050','Topics in Foreign Language',3,'LACS'),('4050','Topics in Philosophy',3,'PHIL'),('4050','Topics in Religion and Modern Culture',3,'RELS'),('4050','Selected Topics in Spanish',1,'SPAN'),('4050','Selected Topics in Spanish',2,'SPAN'),('4050','Selected Topics in Spanish',3,'SPAN'),('4051','Topics in English – Writing Intensive',3,'ENGL'),('4051','Computer Exploration and Generation of Data',3,'MATH'),('4052','Topics in English – Oral Communication',3,'ENGL'),('4053','Topics in English – Writing Intensive & Oral Communication',3,'ENGL'),('4060','Topics in Algebra',2,'MATH'),('4060','Topics in Algebra',3,'MATH'),('4073','Special Topics – Construction Management',1,'CMET'),('4073','Special Topics – Construction Management',2,'CMET'),('4073','Special Topics – Construction Management',3,'CMET'),('4073','Special Topics – Construction Management',4,'CMET'),('4073','Special Topics – Civil Engineering Technology',1,'ETCE'),('4073','Special Topics – Civil Engineering Technology',2,'ETCE'),('4073','Special Topics – Civil Engineering Technology',3,'ETCE'),('4073','Special Topics – Civil Engineering Technology',4,'ETCE'),('4080','Topics in Geometry and Topology',3,'MATH'),('4090','Topics in Anthropology',1,'ANTH'),('4090','Topics in Anthropology',2,'ANTH'),('4090','Topics in Anthropology',3,'ANTH'),('4090','Special Topics in Civil Engineering',1,'CEGR'),('4090','Special Topics in Civil Engineering',2,'CEGR'),('4090','Special Topics in Civil Engineering',3,'CEGR'),('4090','Special Topics in Civil Engineering',4,'CEGR'),('4090','Special Topics in Chemistry',1,'CHEM'),('4090','Special Topics in Chemistry',2,'CHEM'),('4090','Special Topics in Chemistry',3,'CHEM'),('4090','Special Topics in Chemistry',4,'CHEM'),('4090','Major Authors',3,'ENGL'),('4090','International Comparative Health Systems: Western Europe',3,'HLTH'),('4090','International Comparative Health Systems: Western Europe',3,'NURS'),('4090','Special Topics',1,'SEGR'),('4090','Special Topics',2,'SEGR'),('4090','Special Topics',3,'SEGR'),('4090','Special Topics',4,'SEGR'),('4090','Special Topics',5,'SEGR'),('4090','Special Topics',6,'SEGR'),('4090','Topics in Sociology',1,'SOCY'),('4090','Topics in Sociology',2,'SOCY'),('4090','Topics in Sociology',3,'SOCY'),('4091','Topics in Sociology – Writing Intensive',1,'SOCY'),('4091','Topics in Sociology – Writing Intensive',2,'SOCY'),('4091','Topics in Sociology – Writing Intensive',3,'SOCY'),('4095','Topics for Teachers',1,'CHEM'),('4095','Topics for Teachers',2,'CHEM'),('4095','Topics for Teachers',3,'CHEM'),('4095','Topics for Teachers',4,'CHEM'),('4100','Mathematical Economics',3,'ECON'),('4100','Computer Applications in Education',3,'EIST'),('4100','Igneous and Metamorphic Petrology',4,'GEOL'),('4100','Introduction to Music Business',2,'MUSC'),('4100','Nursing Care of the Aging Adult',3,'NURS'),('4100','Ethnicity and Aging',3,'SOWK'),('4101','Modern African Literature in English',3,'AFRS'),('4101','Topical Architectural Studio',5,'ARCH'),('4101','Drugs, Crime and the Criminal Justice System',3,'CJUS'),('4101','Media and the Law',3,'COMM'),('4101','Religion and Modern Thought',3,'RELS'),('4101','Program Design, Implementation, and Outcomes Evaluation',3,'RESP'),('4101','Social Work Practice with Older Adults',3,'SOWK'),('4101L','Developing Adaptive Leaders Lab',1,'MSCI'),('4102','Topical Architectural Studio',5,'ARCH'),('4102','Federal Interpretation of the First Amendment',3,'COMM'),('4102','Classics in British Children’s Literature',3,'ENGL'),('4102','Cartographic Design and Map Construction',3,'GEOG'),('4102','Healthcare Administration',3,'HLTH'),('4102','Programming Languages',3,'ITCS'),('4102','Program Administration',3,'RESP'),('4103','Project Document',6,'ARCH'),('4103','International Criminal Justice',3,'CJUS'),('4103','Classics in American Children’s Literature',3,'ENGL'),('4103','Computer Programming for GIS Applications',3,'GEOG'),('4103','Environmental Health: A Global Perspective',3,'HLTH'),('4103','Evidence Based Practice in Respiratory Care',3,'RESP'),('4104','Thesis Studio',6,'ARCH'),('4104','Multiculturalism and Children’s Literature',3,'ENGL'),('4104','Epidemiology',3,'HLTH'),('4104','Advanced Cardiopulmonary Physiology',3,'RESP'),('4105','African International Relations',3,'AFRS'),('4105','Geomorphology',3,'GEOL'),('4105','Program Planning and Evaluation',3,'HLTH'),('4105','Geometry in the Secondary School Mathematics Curriculum',3,'MAED'),('4105L','Gemorphology Laboratory',1,'GEOL'),('4105L','Program Planning and Evaluation LAB',1,'HLTH'),('4106','Skill Set III – Complex',1,'NURS'),('4107','Formal Languages and Automata',3,'ITCS'),('4107','Early Judaism',3,'RELS'),('4108','Finite Element Analysis and Applications',3,'CEGR'),('4108','Sport, Place, and Development',3,'GEOG'),('4108','Medieval Judaism',3,'RELS'),('4109','History of Mathematical Thought',3,'MATH'),('4109','Modern Judaism',3,'RELS'),('4110','American Ethnic Cultures',3,'ANTH'),('4110','Writing for Dance',3,'DANC'),('4110','Stratigraphy',4,'GEOL'),('4110','Sociology of Aging',3,'GRNT'),('4110','Introduction to Biomedical Optics',3,'PHYS'),('4110','North Carolina Student Legislature',3,'POLS'),('4110','Contemporary Jewish Thought',3,'RELS'),('4110','Sociology of Aging',3,'SOCY'),('4111','Evolution',3,'BIOL'),('4111','Instrumental Analysis',4,'CHEM'),('4111','Ancient World Literature',3,'ENGL'),('4111','Practicum',9,'RESP'),('4111','Social Inequality',3,'SOCY'),('4111','Issues in Early Intervention for Children with Disabilities',3,'SPED'),('4112','Professional Practice',3,'ARCH'),('4112','Econometrics II',3,'ECON'),('4112','Modern World Literature',3,'ENGL'),('4112','Intermediate Fluid Mechanics and Vehicle Aerodynamics',3,'MEGR'),('4112','Sociology of Work',3,'SOCY'),('4112','Assessment of Young Children with Disabilities: B-K',3,'SPED'),('4113','Energy Conversion I',3,'MEGR'),('4113','Game Theory',3,'OPRS'),('4114','Milton',3,'ENGL'),('4114','Dynamic Programming',3,'OPRS'),('4115','Seminar in Health Communication',3,'COMM'),('4115','Applied Geophysics',4,'GEOL'),('4116','Public Finance',3,'ECON'),('4116','Culture and Conflict in the Amazon',3,'LTAM'),('4116','Statistical Computing',3,'STAT'),('4117','Business and Economic Forecasting',3,'ECON'),('4118','British Renaissance Literature',3,'ENGL'),('4120','Intercultural Communications',3,'ANTH'),('4120','Romantic British Literature, 1785- 1832',3,'ENGL'),('4120','Advanced Business French I',3,'FREN'),('4120','Fundamentals of Geographic Information Systems',4,'GEOG'),('4120','Geologic Mapping and Interpretation',4,'GEOL'),('4120','Advanced Business German I',3,'GERM'),('4120','Introduction to Computer Graphics',3,'ITCS'),('4120','Psychiatric Mental Health Nursing',3,'NURS'),('4120','Advanced Business Spanish I',3,'SPAN'),('4121','Elementary Art Methods',3,'ARTE'),('4121','Pharmacology for the Physically Active',3,'ATRN'),('4121','Biometry',4,'BIOL'),('4121','Prestressed Concrete Design',3,'CEGR'),('4121','Advanced Inorganic Chemistry',4,'CHEM'),('4121','Measuring and Evaluating Learning in the Elementary School Curriculum',3,'ELED'),('4121','British Literature of the Restoration and 18th Century',3,'ENGL'),('4121','Pharmacology for the Physically Active',3,'EXER'),('4121','Advanced Business French II',3,'FREN'),('4121','Advanced Business German II',3,'GERM'),('4121','Information Visualization',3,'ITCS'),('4121','Advanced Business Spanish II',3,'LTAM'),('4121','Medieval and Reformation Christianity',3,'RELS'),('4121','Advanced Business Spanish II',3,'SPAN'),('4122','Ethnographic Methods',3,'ANTH'),('4122','Secondary Art Methods',3,'ARTE'),('4122','Research and Analysis of Teaching Elementary School Learners',3,'ELED'),('4122','British Victorian Literature',3,'ENGL'),('4122','Visual Analytics',3,'ITCS'),('4122','Probability and Stochastic Models',3,'MATH'),('4122','Studies in Advanced Business Spanish',3,'SPAN'),('4123','Bridge Design',3,'CEGR'),('4123','Modern British Literature',3,'ENGL'),('4123','Command and Control of Major Disasters',3,'ETFS'),('4123','Visualization and Visual Communication',3,'ITCS'),('4123','Applied Statistics I',3,'STAT'),('4124','Masonry Design',3,'CEGR'),('4124','Sociology of the Community',3,'SOCY'),('4124','Applied Statistics II',3,'STAT'),('4125','Construction Codes and Contract Documents',2,'CMET'),('4125','Geologic Summer Field Camp',6,'GEOL'),('4125','Urban Sociology',3,'SOCY'),('4126','Project Scheduling and Control',3,'ETCE'),('4126L','Construction Practices Laboratory',1,'ETCE'),('4127','Construction Law and Regulatory Issues',3,'CMET'),('4127','Introduction to Robotics',3,'MEGR'),('4127','Material Christianity',3,'RELS'),('4128','Matrix Methods of Structural Analysis',3,'CEGR'),('4128','Programming Languages and Compilers',3,'ITCS'),('4128','Risk Theory',3,'MATH'),('4130','Applied Nutrition',3,'EXER'),('4130','Advanced Geographic Information Systems',4,'GEOG'),('4130','Optical Mineralogy',4,'GEOL'),('4130','Complex Illness and Disease Management',3,'NURS'),('4130','Sociology of Health and Illness',3,'SOCY'),('4131','Culture, Pregnancy and Birth',3,'ANTH'),('4131','Environmental Modeling with GIS',4,'GEOG'),('4131','Simulation',3,'ITCS'),('4131','Solid State Transformations',3,'MEGR'),('4131','Product and Process Design',3,'SEGR'),('4131','Family Policy',3,'SOCY'),('4132','Lifetime Weight Management',3,'ATRN'),('4132','British Drama to 1642, Excluding Shakespeare',3,'ENGL'),('4132','Lifetime Weight Management',3,'EXER'),('4132','Spatial Modeling for Social and Economical Applications',4,'GEOG'),('4132','Guitar Pedagogy and Materials',3,'MUSC'),('4132','Automation & Systems Design',3,'SEGR'),('4133','Methods of Organic Structure Determination',2,'CHEM'),('4133','Embedded Systems',3,'ELET'),('4133','Numerical Computation Methods and Analysis',3,'ITCS'),('4133','Wind Pedagogy and Materials',3,'MUSC'),('4133','Lean Manufacturing Systems',3,'SEGR'),('4134','Organic Reaction Mechanisms',2,'CHEM'),('4134','Assessment and Development of Physical Fitness',3,'EXER'),('4134','Families and Aging',3,'GRNT'),('4134','String Pedagogy and Materials',3,'MUSC'),('4134','Families and Aging',3,'SOCY'),('4135','Concepts and Techniques in Organic Synthesis',2,'CHEM'),('4135','Economics of Growth and Development',3,'ECON'),('4135','Audiovisual Communications',3,'EIST'),('4135','Tectonics',4,'GEOL'),('4135','Percussion Pedagogy and Materials',3,'MUSC'),('4135','Sociology of Education',3,'SOCY'),('4136','Keyboard Pedagogy and Materials',3,'MUSC'),('4137','Vocal Pedagogy and Materials',3,'MUSC'),('4138','Jazz Pedagogy and Materials',3,'MUSC'),('4139','Early American Literature',3,'ENGL'),('4140','Field Biology of the Primates',3,'ANTH'),('4140','Community Oriented Policing and Problem Solving',3,'CJUS'),('4140','Educational Television',3,'EIST'),('4140','American Literature of the Romantic Period',3,'ENGL'),('4140','Hydrologic Processes',4,'ESCI'),('4140','Geographic Information Techniques for Community Planning',4,'GEOG'),('4140','Coastal Geology',3,'GEOL'),('4140','Nuclear Physics',3,'PHYS'),('4140','Tests and Measurements',3,'PSYC'),('4140','Adolescence and Secondary Schools',3,'SECD'),('4140','Performance Theory',3,'THEA'),('4141','Process Engineering',3,'CEGR'),('4141','Advanced Organizational Communication',3,'COMM'),('4141','American Literature of the Realist and Naturalist Periods',3,'ENGL'),('4141','Computer Organization and Architecture',3,'ITCS'),('4141','Music Development and Learning',2,'MUED'),('4142','Water/Wastewater Engineering',3,'CEGR'),('4142','Power Electronics/Networks',3,'ELET'),('4142','Modern American Literature',3,'ENGL'),('4142','Reliability Management',3,'SEGR'),('4143','Solid Waste Management',3,'CEGR'),('4143','Water and Wastewater Systems',3,'ETCE'),('4143','Discrete Mechanical Vibrating Systems',3,'MEGR'),('4143L','Environmental Laboratory',1,'ETCE'),('4144','Advanced Ecology',4,'BIOL'),('4144','Engineering Hydrology',3,'CEGR'),('4144','Intermediate Dynamics',3,'MEGR'),('4145','Groundwater Resources Engineering',3,'CEGR'),('4145','Communication Campaigns',3,'COMM'),('4145','Literature of the American South',3,'ENGL'),('4145','Fundamentals of Hydrogeology',4,'GEOL'),('4145','Parallel Computing',3,'ITCS'),('4145','Orchestration and Arranging',3,'MUSC'),('4146','Advanced Engineering Hydraulics',3,'CEGR'),('4146','Grid Computing',3,'ITCS'),('4147','International Public Relations',3,'COMM'),('4149','Limnology and Oceanography',4,'BIOL'),('4150','Urban and Regional Economics',3,'ECON'),('4150','Poetry',3,'ENGL'),('4150','Older Individual and Society',3,'GRNT'),('4150','Assessment, Reflection, and Management Practices',3,'MDSK'),('4150','Applied Climatology',3,'METR'),('4150','Older Individual and Society',3,'SOCY'),('4151','Communication Systems',3,'ELET'),('4151','Drama',3,'ENGL'),('4151','Intelligent Robotics',3,'ITCS'),('4151L','Communication Systems Laboratory',1,'ELET'),('4152','Digital Signal Processing',3,'ELET'),('4152','Computer Vision',3,'ITCS'),('4152','Psychology of Exceptional Children',3,'PSYC'),('4153','Fiction',3,'ENGL'),('4154','Contemporary Social Theory',3,'SOCY'),('4155','Pan-African Literature',3,'ENGL'),('4155','Fluvial Processes',4,'ESCI'),('4155','Retail Location',3,'GEOG'),('4155','Software Development Projects',3,'ITCS'),('4155','Sociological Research Methods',4,'SOCY'),('4155L','Sociological Research Methods Laboratory',0,'SOCY'),('4156L','Quantitative Analysis Laboratory',0,'SOCY'),('4157','Computer-Aided Instruction',3,'ITCS'),('4158','Student Managed Investment Fund I',3,'FINN'),('4159','Student Managed Investment Fund II',3,'FINN'),('4160','Economics of Transportation',3,'ECON'),('4160','Contaminant Transport',3,'ESCI'),('4160','The Geography of Transportation Systems',3,'GEOG'),('4160','Theatre for Youth',3,'THEA'),('4161','Advanced Traffic Engineering',3,'CEGR'),('4161','Violence and the Violent Offender',3,'CJUS'),('4161','Modern English Grammar',3,'ENGL'),('4161','Intellectual Property Aspects of Computing',3,'ITCS'),('4161','Number Theory',3,'MATH'),('4162','Environmental Biotechnology I',3,'BIOL'),('4162','Transportation Planning',3,'CEGR'),('4162','Seminar on Sexual Assault',3,'CJUS'),('4162','Materials Production and Process',3,'MEGR'),('4163','Environmental Biotechnology II',3,'BIOL'),('4163','Modern Algebra',3,'MATH'),('4163','Advanced Model United Nations',3,'POLS'),('4164','Abstract Linear Algebra',3,'MATH'),('4165','Principles of Biochemistry I',3,'CHEM'),('4165','Language and Culture',3,'ENGL'),('4165','Structural Steel Design',3,'ETCE'),('4165','Aqueous Geochemistry',4,'GEOL'),('4165','Introduction to Nondestructive Evaluation Methods',3,'MEGR'),('4165','Methods of Facilitating Learning in Theatre Arts',3,'THEA'),('4165L','Principles of Biochemistry I Laboratory',1,'CHEM'),('4166','Principles of Biochemistry II',3,'CHEM'),('4166','Network-Based Application Development',3,'ITIS'),('4167','Medical Genetics',3,'BIOL'),('4167','Structure and Mechanism in Protein Chemistry',3,'CHEM'),('4167','The Mind and Language',3,'ENGL'),('4168','Recombinant DNA Techniques',4,'BIOL'),('4168','Sociology of Mental Health and Illness',3,'SOCY'),('4170','Fundamentals of Remote Sensing',4,'ESCI'),('4170','Advanced Client Applications',3,'ITIS'),('4170','Special Education: Consultation and Collaboration',3,'SPED'),('4171','Cell Physiology',3,'BIOL'),('4171','Urban Public Transportation',3,'CEGR'),('4171','Biochemical Instrumentation',4,'CHEM'),('4171','Economics of International Trade',3,'ECON'),('4172','Economics of International Finance',3,'ECON'),('4172','Sociology of Deviant Behavior',3,'SOCY'),('4173','Sociology of Deviant Behavior – Writing Intensive',3,'SOCY'),('4175','Ceramics 5',3,'ARTC'),('4175','Physical Biochemistry',3,'CHEM'),('4177','History of Economic Thought',3,'ECON'),('4180','Print Production',3,'ARTG'),('4180','Industrial Organization and Public Policy',3,'ECON'),('4180','Theories of Technical Communication',3,'ENGL'),('4180','Digital Image Processing in Remote Sensing',4,'ESCI'),('4181','Communications Design',3,'ARTG'),('4181','Human Factors in Traffic Engineering',3,'CEGR'),('4181','Energy and Environmental Economics',3,'ECON'),('4181','Writing and Designing User Documents',3,'ENGL'),('4181','Microcomputer Interfacing',3,'ITCS'),('4181','Introduction to Topology',3,'MATH'),('4181','Solid State and Semiconductor Physics Laboratory',3,'PHYS'),('4182','Transportation Environmental Assessment',3,'CEGR'),('4182','Information Design and Digital Publishing',3,'ENGL'),('4183','Traffic Engineering Studies',3,'CEGR'),('4183','Editing Technical Documents',3,'ENGL'),('4184','Plant Biotechnology',3,'BIOL'),('4184','Highway Safety',3,'CEGR'),('4185','Geometric Design of Highways',3,'CEGR'),('4185','Chemical Fate of Pollutants',3,'CHEM'),('4185','Mineralogy, Economics, and the Environment',3,'GEOL'),('4189','Mechanisms in Development',3,'BIOL'),('4190','Secondary Choral Methods',2,'MUED'),('4190L','Choral Methods Lab',1,'MUED'),('4191','Medium & Large Format Camera',1,'ARTT'),('4191','Medium & Large Format Camera',2,'ARTT'),('4191','Medium & Large Format Camera',3,'ARTT'),('4191','Applied Project Management',2,'ELET'),('4192','Senior Project I',2,'ELET'),('4192','General Music Methods and Materials K-12',3,'MUED'),('4192','Enhancing Clinical Judgment',3,'NURS'),('4193','Professional Communication: Clinical Decision Making and Ethical Reasoning',3,'NURS'),('4194','Elementary Instrumental Methods',2,'MUED'),('4194','Building Community Response to Domestic Violence',3,'NURS'),('4195','Secondary Instrumental Methods',2,'MUED'),('4199','Molecular Biology',3,'BIOL'),('4200','Computational Chemistry',4,'CHEM'),('4200','Engineering Technology Interdisciplinary Industrial Senior Design Project II',2,'ETGR'),('4200','Secondary Methods – Foreign Languages',3,'MDSK'),('4201','Survey of French Literature I',3,'FREN'),('4201','Elementary Methods – Foreign Languages',3,'MDSK'),('4201','Information Technology: Applications in Health Care',2,'NURN'),('4201','Religion, Morality, and Justice',3,'RELS'),('4201','Nineteenth-Century Spanish Literature',3,'SPAN'),('4201-4202','Professional Training Certificate in Dance',8,'DANC'),('4202','Writing Poetry',3,'ENGL'),('4202','Survey of French Literature II',3,'FREN'),('4202','Twentieth-Century Spanish Literature',3,'SPAN'),('4203','Writing Fiction',3,'ENGL'),('4203','Survey of German Literature I',3,'GERM'),('4203','Leadership in Nursing Practice',2,'NURN'),('4203','Leadership and Informatics for Nursing Practice',3,'NURS'),('4204','Expository Writing',3,'ENGL'),('4204','Perceptual Motor Development',3,'EXER'),('4204','Survey of German Literature II',3,'GERM'),('4205','Advanced Horticulture',3,'BIOL'),('4205','Perceptual Motor Learning',3,'EXER'),('4205','Novel of the Golden Age',3,'SPAN'),('4206','Theater of the Golden Age',3,'SPAN'),('4208','Poetry Writing Workshop',3,'ENGL'),('4208','Perceptual Motor Therapy',3,'EXER'),('4209','Fiction Writing Workshop',3,'ENGL'),('4209','Small Town Planning',3,'GEOG'),('4210','Soil Science',4,'ESCI'),('4210','Perceptual Motor Therapy Laboratory',1,'EXER'),('4210','Urban Planning Methods',3,'GEOG'),('4210','Health Promotion and Risk Reduction',3,'HLTH'),('4210','Studies in Spanish American Poetry',3,'SPAN'),('4210','Instructional Methods and Materials: BK',3,'SPED'),('4210','Acting IV',3,'THEA'),('4211','Architectural History 1',3,'ARCH'),('4211','Chaucer and Medieval Literature',3,'ENGL'),('4211','Perceptual Motor Therapy Laboratory',2,'EXER'),('4211','Studies in Spanish American Prose Fiction',3,'SPAN'),('4211','Nature and Needs of Gifted Children',3,'SPED'),('4212','Architectural History 2',3,'ARCH'),('4212','Contemporary Art Theory & Criticism',3,'ARTH'),('4212','Perceptual Motor Therapy Laboratory',3,'EXER'),('4212','Studies in Spanish American Theater',3,'SPAN'),('4213','Architectural History Elective',3,'ARCH'),('4213','Cervantes',3,'SPAN'),('4214','Architectural History Elective',3,'ARCH'),('4214','Studies in Hispanic Children’s Literature',3,'SPAN'),('4215','Studies in Regional Literature of the Americas',3,'SPAN'),('4216','Social, Political, Cultural, Economic Issues in Hispanic Literature',3,'SPAN'),('4217','Topics in Hispanic Culture and Civilization',3,'SPAN'),('4220','Income Tax',3,'ACCT'),('4220','Integrating Curriculum for Elementary School Learners',3,'ELED'),('4220','Housing Policy',3,'GEOG'),('4220','Mental and Emotional Well-being',3,'HLTH'),('4220','Vulnerability Assessment and Systems Assurance',3,'ITIS'),('4221','Secure Programming and Penetration Testing',3,'ITIS'),('4221','Directing II',3,'THEA'),('4222','Structural Steel Design II',3,'CEGR'),('4222','Watershed Science',3,'ESCI'),('4222','Classical Mechanics II',3,'PHYS'),('4223','Mycology',3,'BIOL'),('4223','Active Filters',3,'ELET'),('4223L','Mycology Laboratory',1,'BIOL'),('4224','Advanced Structural Analysis',3,'CEGR'),('4226','Reinforced Concrete Design II',3,'CEGR'),('4227L','Elementary Clinical Experience',1,'DANC'),('4228','Construction Office Operations',2,'CMET'),('4229','Dendrology',4,'BIOL'),('4230','Advanced Income Tax',3,'ACCT'),('4230','Drugs and Society',3,'HLTH'),('4230','Introduction to Game Design and Development',3,'ITCS'),('4230','Form and Analysis',3,'MUSC'),('4230','Scenic Design II',3,'THEA'),('4231','Advanced Game Design and Development',3,'ITCS'),('4231','Post-tonal Processes',3,'MUSC'),('4231','Electromagnetic Theory I',3,'PHYS'),('4231','Spanish Phonetics',3,'SPAN'),('4232','Game Design and Development Studio',3,'ITCS'),('4232','Teaching Mathematics to Middle School Learners',3,'MAED'),('4232','Electromagnetic Theory II',3,'PHYS'),('4232','Spanish Linguistics',3,'SPAN'),('4233','Parasitology',3,'BIOL'),('4233','Geoenvironmental Site Characterization',4,'ESCI'),('4233','History of the Spanish Language',3,'SPAN'),('4233','Scenic Painting',3,'THEA'),('4233L','Parasitology Laboratory',1,'BIOL'),('4234','Wildlife Biology',3,'BIOL'),('4234L','Wildlife Biology Laboratory',1,'BIOL'),('4235','Mammalogy',4,'BIOL'),('4235','Game Engine Construction',3,'ITCS'),('4236','Artificial Intelligence for Computer Games',3,'ITCS'),('4237','Audio Processing for Entertainment Computing',3,'ITCS'),('4240','Injury Prevention through the Life Span',3,'HLTH'),('4240','Population Focused Nursing',3,'NURS'),('4241','Chemical Processes in Water and Wastewater Treatment',3,'CEGR'),('4241','Quantum Mechanics I',3,'PHYS'),('4242','The Biology of Birds',3,'BIOL'),('4242','Control Systems',3,'ELET'),('4242','Quantum Mechanics II',3,'PHYS'),('4242L','The Biology of Birds Lab',1,'BIOL'),('4243','Animal Behavior',3,'BIOL'),('4243L','Animal Behavior Laboratory',1,'BIOL'),('4244','Conservation Biology',3,'BIOL'),('4244L','Conservation Biology Laboratory',1,'BIOL'),('4245','Energy Management',3,'ETME'),('4245','Advanced Synoptic Meteorology',3,'METR'),('4250','Microbiology',3,'BIOL'),('4250','Aging Programs and Services',3,'GRNT'),('4250','Adolescent Health and Sexuality',3,'HLTH'),('4250','Computer Forensics',3,'ITIS'),('4250','Advanced Dynamic Meteorology',3,'METR'),('4250','Lighting Design II',3,'THEA'),('4250L','Microbiology Laboratory',1,'BIOL'),('4251','Immunology',3,'BIOL'),('4251','Highway Design and Construction',3,'ETCE'),('4251','Teaching Science to Middle and Secondary School Learners',3,'MDSK'),('4251L','Immunology Laboratory',1,'BIOL'),('4251L','Asphalt Mixtures Laboratory',1,'ETCE'),('4252','Teaching Mathematics to Secondary School Learners',3,'MAED'),('4253','Marine Microbiology',4,'BIOL'),('4253','Teaching Social Studies to Middle and Secondary School Learners',3,'MDSK'),('4254','Epidemiology',3,'BIOL'),('4254','Teaching English/Communication Skills to Middle and Secondary School Learners',3,'ENGL'),('4255','Bacterial Genetics',3,'BIOL'),('4255','CAMMP: Computer Applications and Manipulative Mathematics Programs',3,'ELED'),('4255','Applied Population Analysis',3,'GEOG'),('4256','Pathogenic Bacteriology',3,'BIOL'),('4256L','Pathogenic Bacteriology Laboratory',1,'BIOL'),('4257','Microbial Physiology and Metabolism',3,'BIOL'),('4257','Dance Education Methods II',3,'DANC'),('4257L','Microbial Physiology and Metabolism Lab',1,'BIOL'),('4257L','Secondary Clinical Experience',1,'DANC'),('4259','Virology',3,'BIOL'),('4260','Population Genetics',3,'BIOL'),('4260','History of the English Language',3,'ENGL'),('4260','Transportation Policy Formulation',3,'GEOG'),('4260','Women: Middle Age and Beyond',3,'GRNT'),('4260','Women: Middle Age and Beyond',3,'HLTH'),('4262','Traffic Engineering',3,'CEGR'),('4263','Linguistics and Language Learning',3,'ENGL'),('4263','Sociology of Small Groups',3,'SOCY'),('4265','Transportation Analysis Methods',3,'GEOG'),('4266','Reinforced Concrete Design',3,'ETCE'),('4270','Earth Pressures and Retaining Structures',3,'CEGR'),('4270','Evaluation of Transportation Impacts',3,'GEOG'),('4270','Intergenerational Relationships & Programs',3,'GRNT'),('4270','Health Consumerism',3,'HLTH'),('4270','Teaching Discipline: Assessment & Behavior in the Music Classroom',2,'MUED'),('4270','Classroom Management',3,'SPED'),('4270','Costume Design II',3,'THEA'),('4271','Pavement Design',3,'CEGR'),('4271','Waves and Optics',3,'PHYS'),('4271','Systematic Instruction in the Adapted Curriculum',3,'SPED'),('4272','Capstone Project',2,'CMET'),('4272','Capstone Project',2,'ETCE'),('4272','Teaching Mathematics to Learners with Special Needs',3,'SPED'),('4273','Life Skills',3,'SPED'),('4274','General Curriculum Access and Adaptations',3,'SPED'),('4275','Teaching Reading to Learners with Special Needs',3,'SPED'),('4277','Endocrinology',3,'BIOL'),('4277','Teaching Written Expression to Learners with Special Needs',3,'SPED'),('4277L','Endocrinology Laboratory',1,'BIOL'),('4278','Geotechnical Engineering II',3,'CEGR'),('4279','Neurobiology',3,'BIOL'),('4279L','Neurobiology Laboratory',1,'BIOL'),('4280','Global Health Issues',3,'HLTH'),('4281','Advanced Laboratory in Modern Optics',3,'PHYS'),('4282','Developmental Plant Anatomy',3,'BIOL'),('4282L','Developmental Plant Anatomy Laboratory',1,'BIOL'),('4283','Animal Development',3,'BIOL'),('4283L','Animal Development Laboratory',1,'BIOL'),('4286','Exercise Prescription',3,'ATRN'),('4290','Therapeutic Exercise',3,'ATRN'),('4290','Modifying Instruction for Learners with Diverse Needs in the Elementary School',3,'EDUC'),('4290','Advanced Creative Project',3,'ENGL'),('4290','Health Management Information Systems',3,'HLTH'),('4291','Advanced Photographic Media',3,'ARTT'),('4291','Therapeutic Exercise Laboratory',1,'ATRN'),('4291','Histology',4,'BIOL'),('4291','Modifying Instruction for Learners with Diverse Needs in Middle/Secondary Schools',3,'EDUC'),('4292','Organization and Administration of Athletic Training',3,'ATRN'),('4292','Advances in Immunology',3,'BIOL'),('4293','Biomechanics',3,'ATRN'),('4293','Comparative Vertebrate Anatomy',4,'BIOL'),('4293','Senior Project II',2,'ELET'),('4293','Biomechanics',3,'EXER'),('4294','Biomechanics Lab',1,'ATRN'),('4294','Biomechanics Lab',1,'EXER'),('4300','Introduction to Public History',3,'HIST'),('4302','Caribbean Literature in English',3,'LTAM'),('4310','Urban Social Geography',3,'GEOG'),('4310','Studies in Spanish American Poetry',3,'LTAM'),('4311','Studies in Spanish American Prose Fiction',3,'LTAM'),('4312','Architectural Materials',3,'ARCH'),('4312','Studies in Spanish American Theater',3,'LTAM'),('4313','Structures 1',3,'ARCH'),('4314','Structures 2',3,'ARCH'),('4314','Studies in Hispanic Children’s Literature',3,'LTAM'),('4315','Environmental Control Systems',3,'ARCH'),('4315','Studies in Regional Literature of the Americas',3,'LTAM'),('4316','Social, Political, Cultural, Economic Issues in Hispanic Literature',3,'LTAM'),('4316','Transition Planning and Service Delivery',3,'SPED'),('4317','Building Systems Integration',3,'ARCH'),('4317','Topics in Hispanic Culture and Civilization',3,'LTAM'),('4318','Cuban Literature',3,'LTAM'),('4320','Tropical Meteorology',3,'METR'),('4322','Studies in Advanced Business Spanish',3,'LTAM'),('4344','Applied Hydrology and Storm Water Management',3,'ETCE'),('4350','Studies in Latin American Literature',3,'LTAM'),('4350','Mesoscale Meteorology',3,'METR'),('4350','Teaching and Learning Physics',3,'PHYS'),('4400','Athletic Training Clinical III',2,'ATRN'),('4400','Research Practicum',3,'CJUS'),('4400','Internship in Dance',3,'DANC'),('4400','Internship in Dance',4,'DANC'),('4400','Internship in Dance',5,'DANC'),('4400','Internship in Dance',6,'DANC'),('4400','English Composition Practicum',1,'ENGL'),('4400','English Composition Practicum',2,'ENGL'),('4400','English Composition Practicum',3,'ENGL'),('4400','Internship in Earth Sciences',3,'ESCI'),('4400','Internship in Earth Sciences',4,'ESCI'),('4400','Internship in Earth Sciences',5,'ESCI'),('4400','Internship in Earth Sciences',6,'ESCI'),('4400','Internship in Geography',3,'GEOG'),('4400','Internship in Geography',4,'GEOG'),('4400','Internship in Geography',5,'GEOG'),('4400','Internship in Geography',6,'GEOG'),('4400','Internship in Geology',3,'GEOL'),('4400','Internship in Geology',4,'GEOL'),('4400','Internship in Geology',5,'GEOL'),('4400','Internship in Geology',6,'GEOL'),('4400','Internship',3,'HLTH'),('4400','Internship in Meteorology',3,'METR'),('4400','Internship in Meteorology',4,'METR'),('4400','Internship in Meteorology',5,'METR'),('4400','Internship in Meteorology',6,'METR'),('4400','Honor’s Thesis',3,'SPAN'),('4400','Internship in Theatre',3,'THEA'),('4400','Internship in Theatre',4,'THEA'),('4400','Internship in Theatre',5,'THEA'),('4400','Internship in Theatre',6,'THEA'),('4401','Professional Internship in Africana Studies',3,'AFRS'),('4401','Athletic Training Clinical IV',2,'ATRN'),('4401','Internship in Urban Studies',3,'URBS'),('4402-F','Practicum in Translating I – French',3,'TRAN'),('4402-G','Practicum in Translating I – German',3,'TRAN'),('4402-R','Practicum in Translating I – Russian',3,'TRAN'),('4402-S','Practicum in Translating I – Spanish',3,'TRAN'),('4403-F','Practicum in Translating II – French',3,'TRAN'),('4403-G','Practicum in Translating II – German',3,'TRAN'),('4403-R','Practicum in Translating II – Russian',3,'TRAN'),('4403-S','Practicum in Translating II – Spanish',3,'TRAN'),('4404-F','Practicum in Translating III – French',3,'TRAN'),('4404-G','Practicum in Translating III – German',3,'TRAN'),('4404-R','Practicum in Translating III – Russian',3,'TRAN'),('4404-S','Practicum in Translating III – Spanish',3,'TRAN'),('4405','Internship/Laboratory Research',1,'BIOL'),('4405','Internship/Laboratory Research',2,'BIOL'),('4405','Internship/Laboratory Research',3,'BIOL'),('4405','Urban Field Geography',3,'GEOG'),('4409','Internship in Photography',3,'ARTT'),('4410','Student Teaching/Seminar: B-K Child and Family Development',15,'CHFD'),('4410','Professional Internship',3,'COMM'),('4410','Professional Internship',4,'COMM'),('4410','Professional Internship',5,'COMM'),('4410','Professional Internship',6,'COMM'),('4410','Professional Internship',3,'ENGL'),('4410','Professional Internship in French',1,'FREN'),('4410','Professional Internship in French',2,'FREN'),('4410','Professional Internship in French',3,'FREN'),('4410','Professional Internship in French',4,'FREN'),('4410','Professional Internship in French',5,'FREN'),('4410','Professional Internship in French',6,'FREN'),('4410','Applied Soil Science',4,'GEOL'),('4410','Professional Internship in German',1,'GERM'),('4410','Professional Internship in German',2,'GERM'),('4410','Professional Internship in German',3,'GERM'),('4410','Professional Internship in German',4,'GERM'),('4410','Professional Internship in German',5,'GERM'),('4410','Professional Internship in German',6,'GERM'),('4410','Professional Internship in Japanese',1,'JAPN'),('4410','Professional Internship in Japanese',2,'JAPN'),('4410','Professional Internship in Japanese',3,'JAPN'),('4410','Professional Internship in Japanese',4,'JAPN'),('4410','Professional Internship in Japanese',5,'JAPN'),('4410','Professional Internship in Japanese',6,'JAPN'),('4410','Professional Internship in Spanish',1,'SPAN'),('4410','Professional Internship in Spanish',2,'SPAN'),('4410','Professional Internship in Spanish',3,'SPAN'),('4410','Professional Internship in Spanish',4,'SPAN'),('4410','Professional Internship in Spanish',5,'SPAN'),('4410','Professional Internship in Spanish',6,'SPAN'),('4420','Student Teaching/Seminar: K-6 Elementary Education',15,'ELED'),('4420','Practicum in Psychiatric Mental Health Nursing',3,'NURS'),('4430','Student Teaching/Seminar: 6-9 Middle Grades Education',15,'MDLG'),('4430','Practicum in Complex Illness & Disease Management',3,'NURS'),('4440','Community Health Nursing',6,'NURN'),('4440','Practicum in Population Focused Nursing',2,'NURS'),('4450','Design and Coordination of Care',6,'NURN'),('4450','Design and Coordination of Care',3,'NURS'),('4453','Field Project in Archaeology',1,'ANTH'),('4453','Field Project in Archaeology',2,'ANTH'),('4453','Field Project in Archaeology',3,'ANTH'),('4453','Field Project in Archaeology',4,'ANTH'),('4460','Practicum in Secondary School Play Production: 9-12',3,'THEA'),('4467','Student Teaching in Art',15,'ARTE'),('4467','Student Teaching/Seminar: K-12 Fine and Performing Arts: Dance',15,'DANC'),('4467','Student Teaching/Seminar: K-12 Music',15,'MUED'),('4467','Student Teaching/Seminar: K-12 Fine and Performing Arts: Theatre',15,'THEA'),('4469','Student Teaching/Seminar: K-12 Foreign Language',15,'MDSK'),('4471','Middle Grades Clinical Experience',3,'MLDG'),('4475','Student Teaching/Seminar: Special Education K-12: General Curriculum',15,'SPED'),('4476','Student Teaching/Seminar: Special Education K-12: Adapted Curriculum',15,'SPED'),('4480','Internship in Sociology',3,'SOCY'),('4480','Internship in Sociology',4,'SOCY'),('4480','Internship in Sociology',5,'SOCY'),('4480','Internship in Sociology',6,'SOCY'),('4490','Exercise Science Senior Internship',6,'EXER'),('4490','Exercise Science Senior Internship',7,'EXER'),('4490','Exercise Science Senior Internship',8,'EXER'),('4490','Exercise Science Senior Internship',9,'EXER'),('4490','Exercise Science Senior Internship',10,'EXER'),('4490','Exercise Science Senior Internship',11,'EXER'),('4490','Exercise Science Senior Internship',12,'EXER'),('4490','Exercise Science Senior Internship',13,'EXER'),('4490','Exercise Science Senior Internship',14,'EXER'),('4490','Exercise Science Senior Internship',15,'EXER'),('4600','Senior Seminar',3,'ARTA'),('4600','Senior Seminar',1,'BIOL'),('4600','Earth Sciences Seminar',1,'ESCI'),('4600','Capstone',3,'HLTH'),('4600','Seminar in Latin American Studies',3,'LTAM'),('4600','Seminar in Professional Licensure',1,'NURS'),('4600','Senior Seminar',3,'POLS'),('4600','Senior Seminar',3,'RELS'),('4600','Senior Seminar in Theatre',1,'THEA'),('4601','Seminar in General Anthropology',3,'ANTH'),('4601','BFA Senior Exhibit',1,'ARTA'),('4601','Problems in Pre-Columbian Art History',3,'ARTH'),('4601','Honors Seminar',2,'BIOL'),('4601','Individual Project',1,'DANC'),('4601','Individual Project',2,'DANC'),('4601','Individual Project',3,'DANC'),('4601','Individual Project',4,'DANC'),('4601','Individual Project',5,'DANC'),('4601','Individual Project',6,'DANC'),('4601','International Studies Seminar',3,'INTL'),('4601','Individual Project',1,'THEA'),('4601','Individual Project',2,'THEA'),('4601','Individual Project',3,'THEA'),('4601','Individual Project',4,'THEA'),('4601','Individual Project',5,'THEA'),('4601','Individual Project',6,'THEA'),('4603','Problems in Ancient Art History',3,'ARTH'),('4603','History and Systems of Psychology',3,'PSYC'),('4605','Problems in Renaissance Art History',3,'ARTH'),('4606','Advanced Topics in Psychology',3,'PSYC'),('4609','Problems in Recent Art History',3,'ARTH'),('4610','Advanced Design, Technology, & Management',2,'THEA'),('4610','Advanced Design, Technology, & Management',3,'THEA'),('4612','Seminar in Behavior Modification',3,'PSYC'),('4613','Seminar in Physiological Psychology',3,'PSYC'),('4615','Readings in Middle East Ethnography',3,'ANTH'),('4616','Culture and Conflict in the Amazon',3,'ANTH'),('4619','Seminar in Experimental Psychology',3,'PSYC'),('4622','Readings in the Anthropology of Religion',3,'ANTH'),('4625','Seminar in Developmental Psychology',3,'PSYC'),('4630','Seminar in Social Psychology',3,'PSYC'),('4640','Financial Services Informatics Industry Foundations Capstone I',3,'ITCS'),('4640','Financial Services Informatics Industry Foundations Capstone I',3,'ITIS'),('4641','Financial Services Informatics Industry Foundations Capstone II',3,'ITCS'),('4641','Financial Services Informatics Industry Foundations Capstone II',3,'ITIS'),('4650','Senior Project',3,'ITCS'),('4650','Seminar in Human Adaptation and Behavior',3,'PSYC'),('4651','Senior Project',3,'ITCS'),('4655','Seminar in Community Psychology',3,'PSYC'),('4660','Practitioner Seminar',3,'ATRN'),('4660','Practitioner Seminar',3,'EXER'),('4660','Seminar in Health Psychology',3,'PSYC'),('4670','Seminar in Industrial Psychology',3,'PSYC'),('4680','Professional Development IV',1,'CMET'),('4681','Senior Design I',3,'ITCS'),('4682','Senior Design II',3,'ITCS'),('4690','Senior Seminar',1,'LACS'),('4690','Honors Thesis I',3,'PSYC'),('4691','Seminar',1,'MATH'),('4691','Seminar',2,'MATH'),('4691','Seminar',3,'MATH'),('4691','Seminar',4,'MATH'),('4691','Seminar',5,'MATH'),('4691','Seminar',6,'MATH'),('4691','Honors Thesis II',3,'PSYC'),('4692','Seminar',1,'MATH'),('4692','Seminar',2,'MATH'),('4692','Seminar',3,'MATH'),('4692','Seminar',4,'MATH'),('4692','Seminar',5,'MATH'),('4692','Seminar',6,'MATH'),('4695','Chemistry Seminar',1,'CHEM'),('4696','Chemistry Seminar',1,'CHEM'),('4700','Art History Honors Thesis',3,'ARTH'),('4700','Honors Research I',3,'BIOL'),('4700','Senior Honors Thesis',3,'LTAM'),('4700','Senior Honors Thesis',4,'LTAM'),('4700','Senior Honors Thesis',5,'LTAM'),('4700','Senior Honors Thesis',6,'LTAM'),('4701','Honors Research in Anthropology',3,'ANTH'),('4701','Honors Research II',3,'BIOL'),('4800','Individual Study in Earth Sciences',1,'ESCI'),('4800','Individual Study in Earth Sciences',2,'ESCI'),('4800','Individual Study in Earth Sciences',3,'ESCI'),('4800','Individual Study in Earth Sciences',4,'ESCI'),('4800','Directed Individual Study',1,'FREN'),('4800','Directed Individual Study',2,'FREN'),('4800','Directed Individual Study',3,'FREN'),('4800','Individual Study in Geography',1,'GEOG'),('4800','Individual Study in Geography',2,'GEOG'),('4800','Individual Study in Geography',3,'GEOG'),('4800','Individual Study in Geography',4,'GEOG'),('4800','Individual Study in Geology',1,'GEOL'),('4800','Individual Study in Geology',2,'GEOL'),('4800','Individual Study in Geology',3,'GEOL'),('4800','Individual Study in Geology',4,'GEOL'),('4800','Directed Individual Study',1,'GERM'),('4800','Directed Individual Study',2,'GERM'),('4800','Directed Individual Study',3,'GERM'),('4800','Independent Study',1,'HLTH'),('4800','Independent Study',2,'HLTH'),('4800','Independent Study',3,'HLTH'),('4800','Independent Study',4,'HLTH'),('4800','Independent Study',5,'HLTH'),('4800','Independent Study',6,'HLTH'),('4800','Individual Study in Meteorology',1,'METR'),('4800','Individual Study in Meteorology',2,'METR'),('4800','Individual Study in Meteorology',3,'METR'),('4800','Individual Study in Meteorology',4,'METR'),('4800','Investigations',1,'PHYS'),('4800','Investigations',2,'PHYS'),('4800','Independent Studies',1,'RELS'),('4800','Independent Studies',2,'RELS'),('4800','Independent Studies',3,'RELS'),('4800','Directed Individual Study',1,'SPAN'),('4800','Directed Individual Study',2,'SPAN'),('4800','Directed Individual Study',3,'SPAN'),('4800','Directed Independent Study',1,'THEA'),('4800','Directed Independent Study',2,'THEA'),('4800','Directed Independent Study',3,'THEA'),('4852','Independent Study',1,'ENGL'),('4852','Independent Study',2,'ENGL'),('4852','Independent Study',3,'ENGL'),('4890','Directed Independent Study',1,'ARCH'),('4890','Directed Independent Study',2,'ARCH'),('4890','Directed Independent Study',3,'ARCH'),('4892','Individualized Study and Projects',1,'CEGR'),('4892','Individualized Study and Projects',2,'CEGR'),('4892','Individualized Study and Projects',3,'CEGR'),('4892','Individualized Study and Projects',4,'CEGR'),('4892','Individualized Study and Projects',5,'CEGR'),('4892','Individualized Study and Projects',6,'CEGR'),('4900','Directed Undergraduate Research',1,'CHEM'),('4900','Directed Undergraduate Research',2,'CHEM'),('4900','Directed Undergraduate Research',3,'CHEM'),('4900','Directed Undergraduate Research',4,'CHEM'),('4900','Undergraduate Research',1,'HLTH'),('4900','Undergraduate Research',2,'HLTH'),('4900','Undergraduate Research',3,'HLTH'),('4900','Undergraduate Research',4,'HLTH'),('4900','Senior Project',3,'MUSC'),('4900','Research in Nursing Practice',2,'NURN'),('4900','Research in Nursing Practice',2,'NURS'),('4901','Digital Media Projects 1',3,'ARTM'),('4902','Digital Media Projects 2',3,'ARTM'),('4931','Painting Projects 1',3,'ARTP'),('4932','Painting Projects 2',3,'ARTP'),('4933','Painting Projects 3',3,'ARTP'),('4941','Sculpture Projects 1',3,'ARTZ'),('4942','Sculpture Projects 2',3,'ARTZ'),('4943','Sculpture Projects 3',3,'ARTZ'),('4951','Fibers Projects 1',3,'ARTF'),('4952','Fibers Projects 2',3,'ARTF'),('4952','Engineering System Optimization',3,'SEGR'),('4961','Print Media Projects 1',3,'ARTR'),('4962','Print Media Projects 2',3,'ARTR'),('4963','Print Media Projects 3',3,'ARTR'),('4971','Ceramics Projects 1',3,'ARTC'),('4972','Ceramics Projects 2',3,'ARTC'),('4981','Illustration Projects',3,'ARTL'),('4982','Graphic Design Projects',3,'ARTG'),('4990','Undergraduate Research',3,'ITCS'),('4990','Undergraduate Research',3,'ITIS'),('4990','Senior Thesis',3,'POLS'),('4991','Photography Projects 1',3,'ARTT'),('4991','Undergraduate Thesis',3,'ITCS'),('4992','Photography Projects 2',3,'ARTT');
/*!40000 ALTER TABLE `course_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_planning`
--

DROP TABLE IF EXISTS `courses_planning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_planning` (
  `student_id` varchar(9) NOT NULL,
  `course_id` varchar(11) NOT NULL,
  `dept_id` varchar(4) NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`,`dept_id`),
  KEY `student_id_idx` (`student_id`),
  CONSTRAINT `courses_planning_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_planning`
--

LOCK TABLES `courses_planning` WRITE;
/*!40000 ALTER TABLE `courses_planning` DISABLE KEYS */;
INSERT INTO `courses_planning` VALUES ('800726001','1101','PSYC'),('800726001','1101L','PSYC'),('800726001','2116','ENGL'),('800726001','2223','STAT'),('800726015','1101','PSYC'),('800726015','1101L','PSYC');
/*!40000 ALTER TABLE `courses_planning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_taken`
--

DROP TABLE IF EXISTS `courses_taken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_taken` (
  `student_id` varchar(9) NOT NULL,
  `course_id` varchar(11) NOT NULL,
  `letter_grade` enum('A','B','C','D','F','I','W','P','N','TP','TA','TB','TC','QF','QD','RF') NOT NULL,
  `semester_id` varchar(6) NOT NULL,
  `exemption_for_course` varchar(6) DEFAULT NULL,
  `exemption_for_dept` varchar(4) DEFAULT NULL,
  `dept_id` varchar(4) NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`,`semester_id`,`dept_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `course_id_idx` (`course_id`),
  CONSTRAINT `courses_taken_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_taken`
--

LOCK TABLES `courses_taken` WRITE;
/*!40000 ALTER TABLE `courses_taken` DISABLE KEYS */;
INSERT INTO `courses_taken` VALUES ('800726001','1101','C','201280',NULL,NULL,'PHYS'),('800726001','1101','A','201380',NULL,NULL,'UWRT'),('800726001','1101','TP','T',NULL,NULL,'ESCI'),('800726001','1101L','C','201280',NULL,NULL,'PHYS'),('800726001','1101L','TP','T',NULL,NULL,'ESCI'),('800726001','1102','A','201280',NULL,NULL,'ENGL'),('800726001','1105','B','201180',NULL,NULL,'PHIL'),('800726001','1105','TP','T',NULL,NULL,'LBST'),('800726001','1110','TP','T',NULL,NULL,'POLS'),('800726001','1120','TP','T','2101','LBST','HIST'),('800726001','1121','TP','T','2102','LBST','HIST'),('800726001','1160','TP','T','2101','LBST','HIST'),('800726001','1161','TP','T','2101','LBST','HIST'),('800726001','1212','C','201210',NULL,NULL,'ITCS'),('800726001','1212L','P','201180',NULL,NULL,'ITCS'),('800726001','1213','C','201280',NULL,NULL,'ITCS'),('800726001','1213L','P','201280',NULL,NULL,'ITCS'),('800726001','1220','D','201210',NULL,NULL,'STAT'),('800726001','2101','A','201280',NULL,NULL,'LBST'),('800726001','2101','C','201380',NULL,NULL,'LBST'),('800726001','2101','B','201470',NULL,NULL,'ECON'),('800726001','2102','C','201470',NULL,NULL,'LBST'),('800726001','2110','P','201280',NULL,NULL,'ITIS'),('800726001','2110L','B','201380',NULL,NULL,'ITIS'),('800726001','2164','D','201280',NULL,NULL,'MATH'),('800726001','2175','B','201380',NULL,NULL,'ITCS'),('800726001','2214','B','201410',NULL,NULL,'ITCS'),('800726001','2215','A','301450',NULL,NULL,'ITCS'),('800726001','2300','B','201310',NULL,NULL,'ITIS'),('800726001','3146','B','201470',NULL,NULL,'ITCS'),('800726001','3153','A','201380',NULL,NULL,'ITCS'),('800726001','3153','A','201380',NULL,NULL,'ITIS'),('800726001','3160','B','201310',NULL,NULL,'ITCS'),('800726001','3200','B','201410',NULL,NULL,'ITIS'),('800726001','3300','A','301450',NULL,NULL,'ITIS'),('800726001','3310','B','201470',NULL,NULL,'ITIS'),('800726002','0001','TA','T',NULL,NULL,'TRNF'),('800726002','0003','TA','T',NULL,NULL,'TRNF'),('800726002','1101','TB','T',NULL,NULL,'ENGL'),('800726002','1101','TB','T',NULL,NULL,'SOCY'),('800726002','1102','TC','T',NULL,NULL,'ENGL'),('800726002','1110','TB','T',NULL,NULL,'BIOL'),('800726002','1110L','TB','T',NULL,NULL,'BIOL'),('800726002','2111','TC','T','2212','LBST','ENGL'),('800726002','2130','TB','T',NULL,NULL,'INFO'),('800726002','3180','','T',NULL,NULL,'ENGL'),('800726003','0001','TC','T',NULL,NULL,'TRNF'),('800726003','0003','TC','T',NULL,NULL,'HIST'),('800726003','0003','TB','T',NULL,NULL,'ITCS'),('800726003','0003','TC','T',NULL,NULL,'PHIL'),('800726003','0003','TB','T',NULL,NULL,'TRNF'),('800726003','0004','TC','T',NULL,NULL,'GEOL'),('800726003','1101','TB','T',NULL,NULL,'ENGL'),('800726003','1101','TB','T',NULL,NULL,'PSYC'),('800726003','1105','TB','T',NULL,NULL,'LBST'),('800726003','1120','TC','T',NULL,NULL,'MATH'),('800726004','0001','TA','T',NULL,NULL,'TRNF'),('800726004','1100','TB','T',NULL,NULL,'CJUS'),('800726004','1101','TA','T',NULL,NULL,'ENGL'),('800726004','1101','TB','T',NULL,NULL,'PSYC'),('800726004','1101','TB','T',NULL,NULL,'SOCY'),('800726004','1102','TC','T',NULL,NULL,'ENGL'),('800726004','1105','TB','T',NULL,NULL,'LBST'),('800726004','1110','TC','T',NULL,NULL,'BIOL'),('800726004','1110L','TC','T',NULL,NULL,'BIOL'),('800726004','1160','TB','T','2101','LBST','HIST'),('800726004','1202','TB','T',NULL,NULL,'SPAN'),('800726004','2101','TB','T','2212','LBST','ENGL'),('800726004','2130','TB','T',NULL,NULL,'INFO'),('800726004','2213','TB','T',NULL,NULL,'LBST'),('800726006','1101','TA','T',NULL,NULL,'ENGL'),('800726006','1101','TB','T',NULL,NULL,'PSYC'),('800726006','1101','TA','T',NULL,NULL,'SOCY'),('800726006','1102','TA','T',NULL,NULL,'ENGL'),('800726006','2101','TB','T',NULL,NULL,'ECON'),('800726007','0001','TC','T',NULL,NULL,'TRNF'),('800726007','0003','TB','T','2102','LBST','ANTH'),('800726007','0003','TC','T',NULL,NULL,'MATH'),('800726007','1101','TB','T',NULL,NULL,'COMM'),('800726007','1101','TC','T',NULL,NULL,'ENGL'),('800726007','1101','TB','T',NULL,NULL,'PSYC'),('800726007','1110','TC','T',NULL,NULL,'BIOL'),('800726007','1110L','TC','T',NULL,NULL,'BIOL'),('800726007','1111','TP','T',NULL,NULL,'INST'),('800726007','1115','TC','T',NULL,NULL,'BIOL'),('800726007','1201','TB','T',NULL,NULL,'JAPN'),('800726007','1202','TB','T',NULL,NULL,'JAPN'),('800726007','1211','TA','T','1105','LBST','ARTH'),('800726007','1212','TB','T','1105','LBST','ARTH'),('800726007','1220','TC','T',NULL,NULL,'STAT'),('800726007','1241','TC','T',NULL,NULL,'MATH'),('800726007','1242','TC','T',NULL,NULL,'MATH'),('800726007','1251','TC','T',NULL,NULL,'CHEM'),('800726007','1251L','TC','T',NULL,NULL,'CHEM'),('800726007','1252','TC','T',NULL,NULL,'CHEM'),('800726007','1252L','TC','T',NULL,NULL,'CHEM'),('800726007','2107','TB','T',NULL,NULL,'COMM'),('800726007','2116','TC','T',NULL,NULL,'ENGL'),('800726007','2141','TB','T',NULL,NULL,'ANTH'),('800726007','2211','TC','T',NULL,NULL,'LBST'),('800726010','0003','TA','T',NULL,NULL,'ITCS'),('800726010','0003','TC','T',NULL,NULL,'TRNF'),('800726010','1100','TA','T',NULL,NULL,'MATH'),('800726010','1101','TA','T',NULL,NULL,'COMM'),('800726010','1101','TB','T',NULL,NULL,'ENGL'),('800726010','1102','TB','T',NULL,NULL,'ENGL'),('800726010','1102','TC','T',NULL,NULL,'MATH'),('800726010','1110','TC','T',NULL,NULL,'POLS'),('800726010','1212','TA','T',NULL,NULL,'ITCS'),('800726010','1212L','TA','T',NULL,NULL,'ITCS'),('800726010','2105','TA','T',NULL,NULL,'PHIL'),('800726010','2130','TA','T',NULL,NULL,'INFO'),('800726015','1100','TA','T',NULL,NULL,'MATH'),('800726015','1101','TB','T',NULL,NULL,'ENGL'),('800726015','1101','TA','T',NULL,NULL,'GEOG'),('800726015','1101','TC','T',NULL,NULL,'PSYC'),('800726015','1103','TA','T',NULL,NULL,'LBST'),('800726015','1110','TB','T',NULL,NULL,'BIOL'),('800726015','1110L','TB','T',NULL,NULL,'BIOL'),('800726015','2130','TA','T',NULL,NULL,'INFO');
/*!40000 ALTER TABLE `courses_taken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_taking_now`
--

DROP TABLE IF EXISTS `courses_taking_now`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_taking_now` (
  `student_id` varchar(9) NOT NULL,
  `course_id` varchar(11) NOT NULL,
  `dept_id` varchar(4) NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`,`dept_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `course_id_idx` (`course_id`),
  KEY `courses_taking_now_ibfk_3_idx` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_taking_now`
--

LOCK TABLES `courses_taking_now` WRITE;
/*!40000 ALTER TABLE `courses_taking_now` DISABLE KEYS */;
INSERT INTO `courses_taking_now` VALUES ('800726001','2105','COMM'),('800726001','4170','ITIS'),('800726001','4221','ITIS'),('800726001','1120','MATH'),('800726001','1102','UWRT'),('800726001','1103','UWRT');
/*!40000 ALTER TABLE `courses_taking_now` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cross_list`
--

DROP TABLE IF EXISTS `cross_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cross_list` (
  `course_id` varchar(11) NOT NULL,
  `cross_listed_as_dept` varchar(4) NOT NULL,
  `dept_id` varchar(4) NOT NULL,
  `cross_listed_as_course` varchar(11) NOT NULL,
  PRIMARY KEY (`course_id`,`dept_id`),
  KEY `crosslist_course_id_idx` (`course_id`),
  KEY `cross_listed_as_id_idx` (`cross_listed_as_dept`),
  KEY `cross_list_ibfk_3_idx` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cross_list`
--

LOCK TABLES `cross_list` WRITE;
/*!40000 ALTER TABLE `cross_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cross_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree_program`
--

DROP TABLE IF EXISTS `degree_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degree_program` (
  `program_id` varchar(100) NOT NULL,
  `concentration_id` varchar(100) NOT NULL,
  `focus_id` varchar(100) NOT NULL DEFAULT '',
  `IT_elective_hours` tinyint(4) unsigned DEFAULT NULL,
  `free_elective_hours` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`program_id`,`concentration_id`,`focus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_program`
--

LOCK TABLES `degree_program` WRITE;
/*!40000 ALTER TABLE `degree_program` DISABLE KEYS */;
INSERT INTO `degree_program` VALUES ('Bachelor of Arts','Cyber Security',' ',6,'0-2'),('Bachelor of Arts','Information Technology',' ',9,'1-4'),('Bachelor of Arts','Software Engineering',' ',6,'1-4'),('Bachelor of Arts','Software Information Systems',' ',9,'4-7'),('Bachelor of Arts','Web Development',' ',6,'1-4');
/*!40000 ALTER TABLE `degree_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `hours_now`
--

DROP TABLE IF EXISTS `hours_now`;
/*!50001 DROP VIEW IF EXISTS `hours_now`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `hours_now` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `hours_taken`
--

DROP TABLE IF EXISTS `hours_taken`;
/*!50001 DROP VIEW IF EXISTS `hours_taken`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `hours_taken` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `liberal_hours`
--

DROP TABLE IF EXISTS `liberal_hours`;
/*!50001 DROP VIEW IF EXISTS `liberal_hours`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `liberal_hours` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `liberal_now`
--

DROP TABLE IF EXISTS `liberal_now`;
/*!50001 DROP VIEW IF EXISTS `liberal_now`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `liberal_now` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `liberal_plan`
--

DROP TABLE IF EXISTS `liberal_plan`;
/*!50001 DROP VIEW IF EXISTS `liberal_plan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `liberal_plan` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `major_hours`
--

DROP TABLE IF EXISTS `major_hours`;
/*!50001 DROP VIEW IF EXISTS `major_hours`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `major_hours` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `major_hours_now`
--

DROP TABLE IF EXISTS `major_hours_now`;
/*!50001 DROP VIEW IF EXISTS `major_hours_now`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `major_hours_now` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `major_now`
--

DROP TABLE IF EXISTS `major_now`;
/*!50001 DROP VIEW IF EXISTS `major_now`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `major_now` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `major_plan`
--

DROP TABLE IF EXISTS `major_plan`;
/*!50001 DROP VIEW IF EXISTS `major_plan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `major_plan` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `major_taken`
--

DROP TABLE IF EXISTS `major_taken`;
/*!50001 DROP VIEW IF EXISTS `major_taken`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `major_taken` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `math1_hours`
--

DROP TABLE IF EXISTS `math1_hours`;
/*!50001 DROP VIEW IF EXISTS `math1_hours`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `math1_hours` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `math2_hours`
--

DROP TABLE IF EXISTS `math2_hours`;
/*!50001 DROP VIEW IF EXISTS `math2_hours`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `math2_hours` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `math_option`
--

DROP TABLE IF EXISTS `math_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `math_option` (
  `student_id` varchar(9) NOT NULL,
  `option_number` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `student_id_idx` (`student_id`),
  CONSTRAINT `math_option_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `math_option`
--

LOCK TABLES `math_option` WRITE;
/*!40000 ALTER TABLE `math_option` DISABLE KEYS */;
INSERT INTO `math_option` VALUES ('800726001',1),('800726002',2),('800726003',1),('800726004',1),('800726005',2),('800726006',1),('800726007',1),('800726008',2),('800726009',1),('800726010',2),('800726015',1);
/*!40000 ALTER TABLE `math_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outside_concentration`
--

DROP TABLE IF EXISTS `outside_concentration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outside_concentration` (
  `student_id` varchar(9) NOT NULL,
  `course_id` varchar(11) NOT NULL,
  `outside_concentration_id` varchar(100) NOT NULL,
  `dept_id` varchar(4) NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `course_id_idx` (`course_id`),
  KEY `outside_concentration_ibfk_3_idx` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outside_concentration`
--

LOCK TABLES `outside_concentration` WRITE;
/*!40000 ALTER TABLE `outside_concentration` DISABLE KEYS */;
/*!40000 ALTER TABLE `outside_concentration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_or_corequisites`
--

DROP TABLE IF EXISTS `pre_or_corequisites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre_or_corequisites` (
  `course_id` varchar(11) NOT NULL,
  `pre_or_coreq_list` varchar(100) NOT NULL,
  `dept_id` varchar(4) NOT NULL,
  PRIMARY KEY (`course_id`,`dept_id`),
  KEY `course_id_idx` (`course_id`),
  KEY `pre_or_corequisites_ibfk_2_idx` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_or_corequisites`
--

LOCK TABLES `pre_or_corequisites` WRITE;
/*!40000 ALTER TABLE `pre_or_corequisites` DISABLE KEYS */;
/*!40000 ALTER TABLE `pre_or_corequisites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prerequisites`
--

DROP TABLE IF EXISTS `prerequisites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prerequisites` (
  `course_id` varchar(11) NOT NULL,
  `prereq_list` varchar(100) NOT NULL,
  `required_grade` enum('A','B','C') DEFAULT NULL,
  `dept_id` varchar(4) NOT NULL,
  PRIMARY KEY (`course_id`,`dept_id`),
  KEY `course_id_idx` (`course_id`),
  KEY `prerequisites_ibfk_2_idx` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerequisites`
--

LOCK TABLES `prerequisites` WRITE;
/*!40000 ALTER TABLE `prerequisites` DISABLE KEYS */;
/*!40000 ALTER TABLE `prerequisites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_courses`
--

DROP TABLE IF EXISTS `program_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_courses` (
  `program_id` varchar(100) NOT NULL,
  `concentration_id` varchar(100) NOT NULL,
  `course_id` varchar(11) NOT NULL,
  `fulfills_major` tinyint(1) unsigned NOT NULL,
  `fulfills_writing` tinyint(1) unsigned NOT NULL,
  `fulfills_math1` tinyint(1) unsigned NOT NULL,
  `fulfills_math2` tinyint(1) unsigned NOT NULL,
  `fulfills_science` tinyint(1) unsigned NOT NULL,
  `fulfills_social_science` tinyint(1) unsigned NOT NULL,
  `fulfills_liberalEd` tinyint(1) unsigned NOT NULL,
  `fulfills_communications` tinyint(1) unsigned NOT NULL,
  `dept_id` varchar(4) NOT NULL,
  PRIMARY KEY (`program_id`,`concentration_id`,`course_id`,`dept_id`),
  KEY `progam_id_idx` (`program_id`),
  KEY `concentration_id_idx` (`concentration_id`),
  KEY `course_id_idx` (`course_id`),
  KEY `program_courses_ibfk_3_idx` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_courses`
--

LOCK TABLES `program_courses` WRITE;
/*!40000 ALTER TABLE `program_courses` DISABLE KEYS */;
INSERT INTO `program_courses` VALUES ('Bachelor of Arts','Cyber Security','1101',0,0,0,0,0,1,0,0,'ANTH'),('Bachelor of Arts','Cyber Security','1101',0,0,0,0,0,1,0,0,'BINF'),('Bachelor of Arts','Cyber Security','1101',0,0,0,0,0,1,0,0,'ECON'),('Bachelor of Arts','Cyber Security','1101',0,0,0,0,1,0,0,0,'ESCI'),('Bachelor of Arts','Cyber Security','1101',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Cyber Security','1101',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Cyber Security','1101',0,0,0,0,1,0,0,0,'PSYC'),('Bachelor of Arts','Cyber Security','1101',0,0,0,0,0,1,0,0,'SOCY'),('Bachelor of Arts','Cyber Security','1101',0,1,0,0,0,0,0,0,'UWRT'),('Bachelor of Arts','Cyber Security','1101L',0,0,0,0,1,0,0,0,'BINF'),('Bachelor of Arts','Cyber Security','1101L',0,0,0,0,1,0,0,0,'ESCI'),('Bachelor of Arts','Cyber Security','1101L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Cyber Security','1101L',0,0,0,0,1,0,0,0,'PSYC'),('Bachelor of Arts','Cyber Security','1102',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Cyber Security','1102',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Cyber Security','1102',0,1,0,0,0,0,0,0,'UWRT'),('Bachelor of Arts','Cyber Security','1102L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Cyber Security','1103',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Cyber Security','1103',0,1,0,0,0,0,0,0,'UWRT'),('Bachelor of Arts','Cyber Security','1104',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Cyber Security','1105',0,0,0,0,0,1,0,0,'GEOG'),('Bachelor of Arts','Cyber Security','1105',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Cyber Security','1105',1,0,0,0,0,0,0,0,'PHIL'),('Bachelor of Arts','Cyber Security','1106',1,0,0,0,0,0,0,0,'PHIL'),('Bachelor of Arts','Cyber Security','1110',0,0,0,0,1,0,0,0,'BIOL'),('Bachelor of Arts','Cyber Security','1110',0,0,0,0,0,1,0,0,'POLS'),('Bachelor of Arts','Cyber Security','1110L',0,0,0,0,1,0,0,0,'BIOL'),('Bachelor of Arts','Cyber Security','1111',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Cyber Security','1111L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Cyber Security','1112',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Cyber Security','1112L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Cyber Security','1115',0,0,0,0,1,0,0,0,'BIOL'),('Bachelor of Arts','Cyber Security','1120',0,0,1,0,0,0,0,0,'MATH'),('Bachelor of Arts','Cyber Security','1130',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Cyber Security','1130L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Cyber Security','1200',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Cyber Security','1200',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Cyber Security','1200L',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Cyber Security','1201',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Cyber Security','1201L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Cyber Security','1202',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Cyber Security','1203',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Cyber Security','1203',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Cyber Security','1203L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Cyber Security','1203L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Cyber Security','1204',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Cyber Security','1204L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Cyber Security','1210',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Cyber Security','1210L',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Cyber Security','1212',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','1212L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','1213',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','1213L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','1220',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Cyber Security','1221',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Cyber Security','1222',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Cyber Security','1241',0,0,0,1,0,0,0,0,'MATH'),('Bachelor of Arts','Cyber Security','1242',0,0,0,1,0,0,0,0,'MATH'),('Bachelor of Arts','Cyber Security','1251',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Cyber Security','1251L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Cyber Security','1252',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Cyber Security','1252L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Cyber Security','1600',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','2101',0,0,0,0,0,1,0,0,'ECON'),('Bachelor of Arts','Cyber Security','2101',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Cyber Security','2101',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Cyber Security','2101L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Cyber Security','2102',0,0,0,0,0,1,0,0,'ECON'),('Bachelor of Arts','Cyber Security','2102',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Cyber Security','2102',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Cyber Security','2102L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Cyber Security','2105',0,1,0,0,0,0,0,0,'COMM'),('Bachelor of Arts','Cyber Security','2110',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','2110L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','2116',0,1,0,0,0,0,0,0,'ENGL'),('Bachelor of Arts','Cyber Security','2141',0,0,0,0,1,0,0,0,'ANTH'),('Bachelor of Arts','Cyber Security','2141L',0,0,0,0,1,0,0,0,'ANTH'),('Bachelor of Arts','Cyber Security','2164',0,0,1,1,0,0,0,0,'MATH'),('Bachelor of Arts','Cyber Security','2175',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Cyber Security','2211',1,0,0,0,0,0,1,0,'ITIS'),('Bachelor of Arts','Cyber Security','2211',1,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Cyber Security','2214',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Cyber Security','2215',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Cyber Security','2223',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Cyber Security','2300',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','2600',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','3110',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','3110L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','3130',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','3160',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Cyber Security','3200',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','3300',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','3688',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Cyber Security','4166',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','4221',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Cyber Security','4250',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Information Technology','1101',0,0,0,0,0,1,0,0,'ANTH'),('Bachelor of Arts','Information Technology','1101',0,0,0,0,0,1,0,0,'BINF'),('Bachelor of Arts','Information Technology','1101',0,0,0,0,0,1,0,0,'ECON'),('Bachelor of Arts','Information Technology','1101',0,0,0,0,1,0,0,0,'ESCI'),('Bachelor of Arts','Information Technology','1101',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Information Technology','1101',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Information Technology','1101',0,0,0,0,1,0,0,0,'PSYC'),('Bachelor of Arts','Information Technology','1101',0,0,0,0,0,1,0,0,'SOCY'),('Bachelor of Arts','Information Technology','1101',0,1,0,0,0,0,0,0,'UWRT'),('Bachelor of Arts','Information Technology','1101L',0,0,0,0,1,0,0,0,'BINF'),('Bachelor of Arts','Information Technology','1101L',0,0,0,0,1,0,0,0,'ESCI'),('Bachelor of Arts','Information Technology','1101L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Information Technology','1101L',0,0,0,0,1,0,0,0,'PSYC'),('Bachelor of Arts','Information Technology','1102',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Information Technology','1102',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Information Technology','1102',0,1,0,0,0,0,0,0,'UWRT'),('Bachelor of Arts','Information Technology','1102L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Information Technology','1103',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Information Technology','1103',0,1,0,0,0,0,0,0,'UWRT'),('Bachelor of Arts','Information Technology','1104',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Information Technology','1105',0,0,0,0,0,1,0,0,'GEOG'),('Bachelor of Arts','Information Technology','1105',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Information Technology','1105',1,0,0,0,0,0,0,0,'PHIL'),('Bachelor of Arts','Information Technology','1106',1,0,0,0,0,0,0,0,'PHIL'),('Bachelor of Arts','Information Technology','1110',0,0,0,0,1,0,0,0,'BIOL'),('Bachelor of Arts','Information Technology','1110',0,0,0,0,0,1,0,0,'POLS'),('Bachelor of Arts','Information Technology','1110L',0,0,0,0,1,0,0,0,'BIOL'),('Bachelor of Arts','Information Technology','1111',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Information Technology','1111L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Information Technology','1112',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Information Technology','1112L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Information Technology','1115',0,0,0,0,1,0,0,0,'BIOL'),('Bachelor of Arts','Information Technology','1120',0,0,1,0,0,0,0,0,'MATH'),('Bachelor of Arts','Information Technology','1130',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Information Technology','1130L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Information Technology','1200',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Information Technology','1200',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Information Technology','1200L',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Information Technology','1201',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Information Technology','1201L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Information Technology','1202',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Information Technology','1203',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Information Technology','1203',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Information Technology','1203L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Information Technology','1203L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Information Technology','1204',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Information Technology','1204L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Information Technology','1210',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Information Technology','1210L',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Information Technology','1212',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Information Technology','1213',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Information Technology','1220',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Information Technology','1221',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Information Technology','1222',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Information Technology','1241',0,0,0,1,0,0,0,0,'MATH'),('Bachelor of Arts','Information Technology','1242',0,0,0,1,0,0,0,0,'MATH'),('Bachelor of Arts','Information Technology','1251',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Information Technology','1251L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Information Technology','1252',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Information Technology','1252L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Information Technology','1600',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Information Technology','2101',0,0,0,0,0,1,0,0,'ECON'),('Bachelor of Arts','Information Technology','2101',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Information Technology','2101',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Information Technology','2101L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Information Technology','2102',0,0,0,0,0,1,0,0,'ECON'),('Bachelor of Arts','Information Technology','2102',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Information Technology','2102',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Information Technology','2102L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Information Technology','2105',0,1,0,0,0,0,0,0,'COMM'),('Bachelor of Arts','Information Technology','2110',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Information Technology','2110L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Information Technology','2116',0,1,0,0,0,0,0,0,'ENGL'),('Bachelor of Arts','Information Technology','2141',0,0,0,0,1,0,0,0,'ANTH'),('Bachelor of Arts','Information Technology','2141L',0,0,0,0,1,0,0,0,'ANTH'),('Bachelor of Arts','Information Technology','2164',0,0,1,1,0,0,0,0,'MATH'),('Bachelor of Arts','Information Technology','2175',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Information Technology','2211',1,0,0,0,0,0,1,0,'ITIS'),('Bachelor of Arts','Information Technology','2211',1,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Information Technology','2214',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Information Technology','2215',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Information Technology','2223',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Information Technology','2300',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Information Technology','2600',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Information Technology','3110',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Information Technology','3110L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Information Technology','3130',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Information Technology','3160',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Information Technology','3200',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Information Technology','3211',1,0,0,0,0,0,0,0,'INFO'),('Bachelor of Arts','Information Technology','3300',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Information Technology','3320',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Information Technology','3688',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Software Engineering','1101',0,0,0,0,0,1,0,0,'ANTH'),('Bachelor of Arts','Software Engineering','1101',0,0,0,0,0,1,0,0,'BINF'),('Bachelor of Arts','Software Engineering','1101',0,0,0,0,0,1,0,0,'ECON'),('Bachelor of Arts','Software Engineering','1101',0,0,0,0,1,0,0,0,'ESCI'),('Bachelor of Arts','Software Engineering','1101',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Engineering','1101',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Engineering','1101',0,0,0,0,1,0,0,0,'PSYC'),('Bachelor of Arts','Software Engineering','1101',0,0,0,0,0,1,0,0,'SOCY'),('Bachelor of Arts','Software Engineering','1101',0,1,0,0,0,0,0,0,'UWRT'),('Bachelor of Arts','Software Engineering','1101L',0,0,0,0,1,0,0,0,'BINF'),('Bachelor of Arts','Software Engineering','1101L',0,0,0,0,1,0,0,0,'ESCI'),('Bachelor of Arts','Software Engineering','1101L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Engineering','1101L',0,0,0,0,1,0,0,0,'PSYC'),('Bachelor of Arts','Software Engineering','1102',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Engineering','1102',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Engineering','1102',0,1,0,0,0,0,0,0,'UWRT'),('Bachelor of Arts','Software Engineering','1102L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Engineering','1103',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Engineering','1103',0,1,0,0,0,0,0,0,'UWRT'),('Bachelor of Arts','Software Engineering','1104',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Engineering','1105',0,0,0,0,0,1,0,0,'GEOG'),('Bachelor of Arts','Software Engineering','1105',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Engineering','1105',1,0,0,0,0,0,0,0,'PHIL'),('Bachelor of Arts','Software Engineering','1106',1,0,0,0,0,0,0,0,'PHIL'),('Bachelor of Arts','Software Engineering','1110',0,0,0,0,1,0,0,0,'BIOL'),('Bachelor of Arts','Software Engineering','1110',0,0,0,0,0,1,0,0,'POLS'),('Bachelor of Arts','Software Engineering','1110L',0,0,0,0,1,0,0,0,'BIOL'),('Bachelor of Arts','Software Engineering','1111',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Engineering','1111L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Engineering','1112',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Engineering','1112L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Engineering','1115',0,0,0,0,1,0,0,0,'BIOL'),('Bachelor of Arts','Software Engineering','1120',0,0,1,0,0,0,0,0,'MATH'),('Bachelor of Arts','Software Engineering','1130',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Engineering','1130L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Engineering','1200',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Engineering','1200',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Software Engineering','1200L',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Software Engineering','1201',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Engineering','1201L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Engineering','1202',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Engineering','1203',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Engineering','1203',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Engineering','1203L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Engineering','1203L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Engineering','1204',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Engineering','1204L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Engineering','1210',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Software Engineering','1210L',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Software Engineering','1212',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Engineering','1212L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Engineering','1213',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Engineering','1213L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Engineering','1220',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Software Engineering','1221',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Software Engineering','1222',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Software Engineering','1241',0,0,0,1,0,0,0,0,'MATH'),('Bachelor of Arts','Software Engineering','1242',0,0,0,1,0,0,0,0,'MATH'),('Bachelor of Arts','Software Engineering','1251',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Engineering','1251L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Engineering','1252',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Engineering','1252L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Engineering','1600',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Engineering','2101',0,0,0,0,0,1,0,0,'ECON'),('Bachelor of Arts','Software Engineering','2101',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Engineering','2101',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Engineering','2101L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Engineering','2102',0,0,0,0,0,1,0,0,'ECON'),('Bachelor of Arts','Software Engineering','2102',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Engineering','2102',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Engineering','2102L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Engineering','2105',0,1,0,0,0,0,0,0,'COMM'),('Bachelor of Arts','Software Engineering','2110',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Engineering','2110L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Engineering','2116',0,1,0,0,0,0,0,0,'ENGL'),('Bachelor of Arts','Software Engineering','2141',0,0,0,0,1,0,0,0,'ANTH'),('Bachelor of Arts','Software Engineering','2141L',0,0,0,0,1,0,0,0,'ANTH'),('Bachelor of Arts','Software Engineering','2175',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Software Engineering','2211',1,0,0,0,0,0,1,0,'ITIS'),('Bachelor of Arts','Software Engineering','2211',1,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Engineering','2214',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Software Engineering','2215',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Software Engineering','2223',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Software Engineering','2300',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Engineering','2600',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Engineering','3130',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Engineering','3150',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Engineering','3160',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Software Engineering','3200',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Engineering','3300',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Engineering','3310',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Engineering','3320',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Engineering','3688',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Software Engineering','4155',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Software Information Systems','1101',0,0,0,0,0,1,0,0,'ANTH'),('Bachelor of Arts','Software Information Systems','1101',0,0,0,0,0,1,0,0,'BINF'),('Bachelor of Arts','Software Information Systems','1101',0,0,0,0,0,1,0,0,'ECON'),('Bachelor of Arts','Software Information Systems','1101',0,0,0,0,1,0,0,0,'ESCI'),('Bachelor of Arts','Software Information Systems','1101',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Information Systems','1101',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Information Systems','1101',0,0,0,0,1,0,0,0,'PSYC'),('Bachelor of Arts','Software Information Systems','1101',0,0,0,0,0,1,0,0,'SOCY'),('Bachelor of Arts','Software Information Systems','1101',0,1,0,0,0,0,0,0,'UWRT'),('Bachelor of Arts','Software Information Systems','1101L',0,0,0,0,1,0,0,0,'BINF'),('Bachelor of Arts','Software Information Systems','1101L',0,0,0,0,1,0,0,0,'ESCI'),('Bachelor of Arts','Software Information Systems','1101L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Information Systems','1101L',0,0,0,0,1,0,0,0,'PSYC'),('Bachelor of Arts','Software Information Systems','1102',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Information Systems','1102',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Information Systems','1102',0,1,0,0,0,0,0,0,'UWRT'),('Bachelor of Arts','Software Information Systems','1102L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Information Systems','1103',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Information Systems','1103',0,1,0,0,0,0,0,0,'UWRT'),('Bachelor of Arts','Software Information Systems','1104',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Information Systems','1105',0,0,0,0,0,1,0,0,'GEOG'),('Bachelor of Arts','Software Information Systems','1105',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Information Systems','1105',1,0,0,0,0,0,0,0,'PHIL'),('Bachelor of Arts','Software Information Systems','1106',1,0,0,0,0,0,0,0,'PHIL'),('Bachelor of Arts','Software Information Systems','1110',0,0,0,0,1,0,0,0,'BIOL'),('Bachelor of Arts','Software Information Systems','1110',0,0,0,0,0,1,0,0,'POLS'),('Bachelor of Arts','Software Information Systems','1110L',0,0,0,0,1,0,0,0,'BIOL'),('Bachelor of Arts','Software Information Systems','1111',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Information Systems','1111L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Information Systems','1112',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Information Systems','1112L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Information Systems','1115',0,0,0,0,1,0,0,0,'BIOL'),('Bachelor of Arts','Software Information Systems','1120',0,0,1,0,0,0,0,0,'MATH'),('Bachelor of Arts','Software Information Systems','1130',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Information Systems','1130L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Information Systems','1200',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Information Systems','1200',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Software Information Systems','1200L',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Software Information Systems','1201',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Information Systems','1201L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Information Systems','1202',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Information Systems','1203',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Information Systems','1203',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Information Systems','1203L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Information Systems','1203L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Information Systems','1204',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Information Systems','1204L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Information Systems','1210',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Software Information Systems','1210L',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Software Information Systems','1212',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','1212L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','1213',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','1213L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','1220',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Software Information Systems','1221',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Software Information Systems','1222',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Software Information Systems','1241',0,0,0,1,0,0,0,0,'MATH'),('Bachelor of Arts','Software Information Systems','1242',0,0,0,1,0,0,0,0,'MATH'),('Bachelor of Arts','Software Information Systems','1251',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Information Systems','1251L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Information Systems','1252',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Information Systems','1252L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Software Information Systems','1600',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','2101',0,0,0,0,0,1,0,0,'ECON'),('Bachelor of Arts','Software Information Systems','2101',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Information Systems','2101',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Information Systems','2101L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Information Systems','2102',0,0,0,0,0,1,0,0,'ECON'),('Bachelor of Arts','Software Information Systems','2102',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Information Systems','2102',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Information Systems','2102L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Software Information Systems','2105',0,1,0,0,0,0,0,0,'COMM'),('Bachelor of Arts','Software Information Systems','2110',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','2110L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','2116',0,1,0,0,0,0,0,0,'ENGL'),('Bachelor of Arts','Software Information Systems','2141',0,0,0,0,1,0,0,0,'ANTH'),('Bachelor of Arts','Software Information Systems','2141L',0,0,0,0,1,0,0,0,'ANTH'),('Bachelor of Arts','Software Information Systems','2164',0,0,1,1,0,0,0,0,'MATH'),('Bachelor of Arts','Software Information Systems','2175',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Software Information Systems','2211',1,0,0,0,0,0,1,0,'ITIS'),('Bachelor of Arts','Software Information Systems','2211',1,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Software Information Systems','2214',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Software Information Systems','2215',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Software Information Systems','2223',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Software Information Systems','2300',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','2600',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','3105',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','3110',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','3110L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','3130',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','3160',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Software Information Systems','3200',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','3300',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','3310',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','3320',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Software Information Systems','3688',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Software Information Systems','4166',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','1101',0,0,0,0,0,1,0,0,'ANTH'),('Bachelor of Arts','Web Development','1101',0,0,0,0,0,1,0,0,'BINF'),('Bachelor of Arts','Web Development','1101',0,0,0,0,0,1,0,0,'ECON'),('Bachelor of Arts','Web Development','1101',0,0,0,0,1,0,0,0,'ESCI'),('Bachelor of Arts','Web Development','1101',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Web Development','1101',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Web Development','1101',0,0,0,0,1,0,0,0,'PSYC'),('Bachelor of Arts','Web Development','1101',0,0,0,0,0,1,0,0,'SOCY'),('Bachelor of Arts','Web Development','1101',0,1,0,0,0,0,0,0,'UWRT'),('Bachelor of Arts','Web Development','1101L',0,0,0,0,1,0,0,0,'BINF'),('Bachelor of Arts','Web Development','1101L',0,0,0,0,1,0,0,0,'ESCI'),('Bachelor of Arts','Web Development','1101L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Web Development','1101L',0,0,0,0,1,0,0,0,'PSYC'),('Bachelor of Arts','Web Development','1102',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Web Development','1102',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Web Development','1102',0,1,0,0,0,0,0,0,'UWRT'),('Bachelor of Arts','Web Development','1102L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Web Development','1103',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Web Development','1103',0,1,0,0,0,0,0,0,'UWRT'),('Bachelor of Arts','Web Development','1104',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Web Development','1105',0,0,0,0,0,1,0,0,'GEOG'),('Bachelor of Arts','Web Development','1105',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Web Development','1105',1,0,0,0,0,0,0,0,'PHIL'),('Bachelor of Arts','Web Development','1106',1,0,0,0,0,0,0,0,'PHIL'),('Bachelor of Arts','Web Development','1110',0,0,0,0,1,0,0,0,'BIOL'),('Bachelor of Arts','Web Development','1110',0,0,0,0,0,1,0,0,'POLS'),('Bachelor of Arts','Web Development','1110L',0,0,0,0,1,0,0,0,'BIOL'),('Bachelor of Arts','Web Development','1111',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Web Development','1111L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Web Development','1112',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Web Development','1112L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Web Development','1115',0,0,0,0,1,0,0,0,'BIOL'),('Bachelor of Arts','Web Development','1120',0,0,1,0,0,0,0,0,'MATH'),('Bachelor of Arts','Web Development','1130',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Web Development','1130L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Web Development','1200',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Web Development','1200',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Web Development','1200L',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Web Development','1201',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Web Development','1201L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Web Development','1202',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Web Development','1203',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Web Development','1203',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Web Development','1203L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Web Development','1203L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Web Development','1204',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Web Development','1204L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Web Development','1210',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Web Development','1210L',0,0,0,0,1,0,0,0,'GEOL'),('Bachelor of Arts','Web Development','1212',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','1212L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','1213',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','1213L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','1220',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Web Development','1221',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Web Development','1222',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Web Development','1241',0,0,0,1,0,0,0,0,'MATH'),('Bachelor of Arts','Web Development','1242',0,0,0,1,0,0,0,0,'MATH'),('Bachelor of Arts','Web Development','1251',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Web Development','1251L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Web Development','1252',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Web Development','1252L',0,0,0,0,1,0,0,0,'CHEM'),('Bachelor of Arts','Web Development','1600',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','2101',0,0,0,0,0,1,0,0,'ECON'),('Bachelor of Arts','Web Development','2101',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Web Development','2101',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Web Development','2101L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Web Development','2102',0,0,0,0,0,1,0,0,'ECON'),('Bachelor of Arts','Web Development','2102',0,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Web Development','2102',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Web Development','2102L',0,0,0,0,1,0,0,0,'PHYS'),('Bachelor of Arts','Web Development','2105',0,1,0,0,0,0,0,0,'COMM'),('Bachelor of Arts','Web Development','2110',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','2110L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','2116',0,1,0,0,0,0,0,0,'ENGL'),('Bachelor of Arts','Web Development','2141',0,0,0,0,1,0,0,0,'ANTH'),('Bachelor of Arts','Web Development','2141L',0,0,0,0,1,0,0,0,'ANTH'),('Bachelor of Arts','Web Development','2164',0,0,1,1,0,0,0,0,'MATH'),('Bachelor of Arts','Web Development','2175',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Web Development','2211',1,0,0,0,0,0,1,0,'ITIS'),('Bachelor of Arts','Web Development','2211',1,0,0,0,0,0,1,0,'LBST'),('Bachelor of Arts','Web Development','2214',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Web Development','2215',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Web Development','2223',0,0,1,0,0,0,0,0,'STAT'),('Bachelor of Arts','Web Development','2300',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','2600',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','3105',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','3110',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','3110L',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','3130',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','3150',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','3160',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Web Development','3200',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','3300',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','3320',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','3688',1,0,0,0,0,0,0,0,'ITCS'),('Bachelor of Arts','Web Development','4166',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','4170',1,0,0,0,0,0,0,0,'ITIS'),('Bachelor of Arts','Web Development','4221',1,0,0,0,0,0,0,0,'ITIS');
/*!40000 ALTER TABLE `program_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `science_hours`
--

DROP TABLE IF EXISTS `science_hours`;
/*!50001 DROP VIEW IF EXISTS `science_hours`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `science_hours` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `science_now`
--

DROP TABLE IF EXISTS `science_now`;
/*!50001 DROP VIEW IF EXISTS `science_now`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `science_now` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `science_plan`
--

DROP TABLE IF EXISTS `science_plan`;
/*!50001 DROP VIEW IF EXISTS `science_plan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `science_plan` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `social_now`
--

DROP TABLE IF EXISTS `social_now`;
/*!50001 DROP VIEW IF EXISTS `social_now`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `social_now` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `social_plan`
--

DROP TABLE IF EXISTS `social_plan`;
/*!50001 DROP VIEW IF EXISTS `social_plan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `social_plan` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `social_science_hours`
--

DROP TABLE IF EXISTS `social_science_hours`;
/*!50001 DROP VIEW IF EXISTS `social_science_hours`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `social_science_hours` (
  `dept_id` tinyint NOT NULL,
  `course_id` tinyint NOT NULL,
  `credit_hours` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `student_id` varchar(9) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_initial` varchar(3) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `adviser_id` varchar(9) NOT NULL,
  `program_id` varchar(100) NOT NULL,
  `concentration_id` varchar(100) NOT NULL,
  `outside_concentration_id` varchar(100) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `program_id_idx` (`program_id`),
  KEY `concentration_id_idx` (`concentration_id`),
  KEY `outside_concentration_id_idx` (`outside_concentration_id`),
  KEY `adviser_id` (`adviser_id`),
  KEY `program_id` (`program_id`,`concentration_id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`adviser_id`) REFERENCES `advisers` (`adviser_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`program_id`, `concentration_id`) REFERENCES `degree_program` (`program_id`, `concentration_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('800726001','Edith',NULL,'Piaf','epiaf@uncc.edu','800000000','Bachelor of Arts','Web Development',NULL,'epiaf','laVieEnRose1947!'),('800726002','George',NULL,'Jetson','gjetson@uncc.edu','800000001','Bachelor of Arts','Information Technology',NULL,'gjetson','Astro2147!'),('800726003','Ernest','T.','Bass','ebass@uncc.edu','800000002','Bachelor of Arts','Software Engineering',NULL,'ebass','Whiskey1956!'),('800726004','Steve',NULL,'Jobs','sjobs@uncc.edu','800000001','Bachelor of Arts','Web Development',NULL,'sjobs','KillBilGates%78%'),('800726005','Camilla',NULL,'Parker-Bowles','cpbowles@uncc.edu','800000001','Bachelor of Arts','Web Development',NULL,'cpbowles','SocialFlower78!'),('800726006','Uma',NULL,'Thurman','uthurman@uncc.edu','800000000','Bachelor of Arts','Information Technology',NULL,'uthurman','killBill8579!'),('800726007','Dolph',NULL,'Lundgren','dlund@uncc.edu','800000002','Bachelor of Arts','Information Technology',NULL,'dlund','SkinTrade2014)!'),('800726008','Laura','I.','Wilder','lwilder@uncc.edu','800000002','Bachelor of Arts','Information Technology',NULL,'lwilder','ILoveMyLittleHouse$1852'),('800726009','Lucy','N.','Disguise','lndis@uncc.edu','800000000','Bachelor of Arts','Software Information Systems',NULL,'lndis','WithDiamonds100*'),('800726010','Lou',NULL,'Grant','lgrant@uncc.edu','800000001','Bachelor of Arts','Software Information Systems',NULL,'lgrant','OhLou!1969'),('800726015','Grace',NULL,'Jones','gjones54@uncc.edu','800000000','Bachelor of Arts','Information Technology',NULL,'gjones','SlaveToRhythm^1985');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `substitutions`
--

DROP TABLE IF EXISTS `substitutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `substitutions` (
  `student_id` varchar(9) NOT NULL,
  `adviser_id` varchar(9) NOT NULL,
  `course_id` varchar(11) NOT NULL,
  `course_sub_dept_id` varchar(4) NOT NULL,
  `dept_id` varchar(4) DEFAULT NULL,
  `course_sub_course_id` varchar(11) NOT NULL,
  PRIMARY KEY (`student_id`,`course_sub_course_id`),
  KEY `course_id_idx` (`course_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `FK_course_sub_idx` (`course_sub_dept_id`),
  CONSTRAINT `substitutions_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `substitutions_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course_list` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `substitutions`
--

LOCK TABLES `substitutions` WRITE;
/*!40000 ALTER TABLE `substitutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `substitutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `comm_hours`
--

/*!50001 DROP TABLE IF EXISTS `comm_hours`*/;
/*!50001 DROP VIEW IF EXISTS `comm_hours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `comm_hours` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`c`.`credit_hours` AS `credit_hours` from (`course_list` `c` join `program_courses` `p` on(((`c`.`dept_id` = `p`.`dept_id`) and (`c`.`course_id` = `p`.`course_id`)))) where ((`p`.`program_id` = 'Bachelor of Arts') and (`p`.`concentration_id` = 'Web Development') and (`p`.`fulfills_writing` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `comm_now`
--

/*!50001 DROP TABLE IF EXISTS `comm_now`*/;
/*!50001 DROP VIEW IF EXISTS `comm_now`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `comm_now` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`p`.`credit_hours` AS `credit_hours` from (`courses_taking_now` `c` join `course_list` `p` on(((`p`.`dept_id` = `c`.`dept_id`) and (`p`.`course_id` = `c`.`course_id`)))) where (`c`.`student_id` = '800726001') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `comm_plan`
--

/*!50001 DROP TABLE IF EXISTS `comm_plan`*/;
/*!50001 DROP VIEW IF EXISTS `comm_plan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `comm_plan` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`p`.`credit_hours` AS `credit_hours` from (`courses_planning` `c` join `course_list` `p` on(((`p`.`dept_id` = `c`.`dept_id`) and (`p`.`course_id` = `c`.`course_id`)))) where (`c`.`student_id` = '800726001') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `communication_hours`
--

/*!50001 DROP TABLE IF EXISTS `communication_hours`*/;
/*!50001 DROP VIEW IF EXISTS `communication_hours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `communication_hours` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`c`.`credit_hours` AS `credit_hours` from (`course_list` `c` join `program_courses` `p` on(((`c`.`dept_id` = `p`.`dept_id`) and (`c`.`course_id` = `p`.`course_id`)))) where ((`p`.`program_id` = 'Bachelor of Arts') and (`p`.`concentration_id` = 'Web Development') and (`p`.`fulfills_writing` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `hours_now`
--

/*!50001 DROP TABLE IF EXISTS `hours_now`*/;
/*!50001 DROP VIEW IF EXISTS `hours_now`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hours_now` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`p`.`credit_hours` AS `credit_hours` from (`courses_taking_now` `c` join `course_list` `p` on(((`p`.`dept_id` = `c`.`dept_id`) and (`p`.`course_id` = `c`.`course_id`)))) where (`c`.`student_id` = '800726001') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `hours_taken`
--

/*!50001 DROP TABLE IF EXISTS `hours_taken`*/;
/*!50001 DROP VIEW IF EXISTS `hours_taken`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hours_taken` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`p`.`credit_hours` AS `credit_hours` from (`courses_taken` `c` join `course_list` `p` on(((`p`.`dept_id` = `c`.`dept_id`) and (`p`.`course_id` = `c`.`course_id`)))) where (`c`.`student_id` = '800726001') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `liberal_hours`
--

/*!50001 DROP TABLE IF EXISTS `liberal_hours`*/;
/*!50001 DROP VIEW IF EXISTS `liberal_hours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `liberal_hours` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`c`.`credit_hours` AS `credit_hours` from (`course_list` `c` join `program_courses` `p` on(((`c`.`dept_id` = `p`.`dept_id`) and (`c`.`course_id` = `p`.`course_id`)))) where ((`p`.`program_id` = 'Bachelor of Arts') and (`p`.`concentration_id` = 'Web Development') and (`p`.`fulfills_liberalEd` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `liberal_now`
--

/*!50001 DROP TABLE IF EXISTS `liberal_now`*/;
/*!50001 DROP VIEW IF EXISTS `liberal_now`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `liberal_now` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`p`.`credit_hours` AS `credit_hours` from (`courses_taking_now` `c` join `course_list` `p` on(((`p`.`dept_id` = `c`.`dept_id`) and (`p`.`course_id` = `c`.`course_id`)))) where (`c`.`student_id` = '800726001') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `liberal_plan`
--

/*!50001 DROP TABLE IF EXISTS `liberal_plan`*/;
/*!50001 DROP VIEW IF EXISTS `liberal_plan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `liberal_plan` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`p`.`credit_hours` AS `credit_hours` from (`courses_planning` `c` join `course_list` `p` on(((`p`.`dept_id` = `c`.`dept_id`) and (`p`.`course_id` = `c`.`course_id`)))) where (`c`.`student_id` = '800726001') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `major_hours`
--

/*!50001 DROP TABLE IF EXISTS `major_hours`*/;
/*!50001 DROP VIEW IF EXISTS `major_hours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `major_hours` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`c`.`credit_hours` AS `credit_hours` from (`course_list` `c` join `program_courses` `p` on(((`c`.`dept_id` = `p`.`dept_id`) and (`c`.`course_id` = `p`.`course_id`)))) where ((`p`.`program_id` = 'Bachelor of Arts') and (`p`.`concentration_id` = 'Web Development') and (`p`.`fulfills_major` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `major_hours_now`
--

/*!50001 DROP TABLE IF EXISTS `major_hours_now`*/;
/*!50001 DROP VIEW IF EXISTS `major_hours_now`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `major_hours_now` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`p`.`credit_hours` AS `credit_hours` from (`courses_taken` `c` join `course_list` `p` on(((`p`.`dept_id` = `c`.`dept_id`) and (`p`.`course_id` = `c`.`course_id`)))) where (`c`.`student_id` = '800726001') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `major_now`
--

/*!50001 DROP TABLE IF EXISTS `major_now`*/;
/*!50001 DROP VIEW IF EXISTS `major_now`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `major_now` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`p`.`credit_hours` AS `credit_hours` from (`courses_taking_now` `c` join `course_list` `p` on(((`p`.`dept_id` = `c`.`dept_id`) and (`p`.`course_id` = `c`.`course_id`)))) where (`c`.`student_id` = '800726001') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `major_plan`
--

/*!50001 DROP TABLE IF EXISTS `major_plan`*/;
/*!50001 DROP VIEW IF EXISTS `major_plan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `major_plan` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`p`.`credit_hours` AS `credit_hours` from (`courses_planning` `c` join `course_list` `p` on(((`p`.`dept_id` = `c`.`dept_id`) and (`p`.`course_id` = `c`.`course_id`)))) where (`c`.`student_id` = '800726001') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `major_taken`
--

/*!50001 DROP TABLE IF EXISTS `major_taken`*/;
/*!50001 DROP VIEW IF EXISTS `major_taken`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `major_taken` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`m`.`credit_hours` AS `credit_hours` from (`courses_taken` `c` join `major_hours` `m` on(((`m`.`dept_id` = `c`.`dept_id`) and (`m`.`course_id` = `c`.`course_id`)))) where (`c`.`student_id` = '800726001') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `math1_hours`
--

/*!50001 DROP TABLE IF EXISTS `math1_hours`*/;
/*!50001 DROP VIEW IF EXISTS `math1_hours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `math1_hours` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`c`.`credit_hours` AS `credit_hours` from (`course_list` `c` join `program_courses` `p` on(((`c`.`dept_id` = `p`.`dept_id`) and (`c`.`course_id` = `p`.`course_id`)))) where ((`p`.`program_id` = 'Bachelor of Arts') and (`p`.`concentration_id` = 'Web Development') and (`p`.`fulfills_math1` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `math2_hours`
--

/*!50001 DROP TABLE IF EXISTS `math2_hours`*/;
/*!50001 DROP VIEW IF EXISTS `math2_hours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `math2_hours` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`c`.`credit_hours` AS `credit_hours` from (`course_list` `c` join `program_courses` `p` on(((`c`.`dept_id` = `p`.`dept_id`) and (`c`.`course_id` = `p`.`course_id`)))) where ((`p`.`program_id` = 'Bachelor of Arts') and (`p`.`concentration_id` = 'Web Development') and (`p`.`fulfills_math2` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `science_hours`
--

/*!50001 DROP TABLE IF EXISTS `science_hours`*/;
/*!50001 DROP VIEW IF EXISTS `science_hours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `science_hours` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`c`.`credit_hours` AS `credit_hours` from (`course_list` `c` join `program_courses` `p` on(((`c`.`dept_id` = `p`.`dept_id`) and (`c`.`course_id` = `p`.`course_id`)))) where ((`p`.`program_id` = 'Bachelor of Arts') and (`p`.`concentration_id` = 'Web Development') and (`p`.`fulfills_science` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `science_now`
--

/*!50001 DROP TABLE IF EXISTS `science_now`*/;
/*!50001 DROP VIEW IF EXISTS `science_now`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `science_now` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`p`.`credit_hours` AS `credit_hours` from (`courses_taking_now` `c` join `course_list` `p` on(((`p`.`dept_id` = `c`.`dept_id`) and (`p`.`course_id` = `c`.`course_id`)))) where (`c`.`student_id` = '800726001') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `science_plan`
--

/*!50001 DROP TABLE IF EXISTS `science_plan`*/;
/*!50001 DROP VIEW IF EXISTS `science_plan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `science_plan` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`p`.`credit_hours` AS `credit_hours` from (`courses_planning` `c` join `course_list` `p` on(((`p`.`dept_id` = `c`.`dept_id`) and (`p`.`course_id` = `c`.`course_id`)))) where (`c`.`student_id` = '800726001') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `social_now`
--

/*!50001 DROP TABLE IF EXISTS `social_now`*/;
/*!50001 DROP VIEW IF EXISTS `social_now`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `social_now` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`p`.`credit_hours` AS `credit_hours` from (`courses_taking_now` `c` join `course_list` `p` on(((`p`.`dept_id` = `c`.`dept_id`) and (`p`.`course_id` = `c`.`course_id`)))) where (`c`.`student_id` = '800726001') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `social_plan`
--

/*!50001 DROP TABLE IF EXISTS `social_plan`*/;
/*!50001 DROP VIEW IF EXISTS `social_plan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `social_plan` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`p`.`credit_hours` AS `credit_hours` from (`courses_planning` `c` join `course_list` `p` on(((`p`.`dept_id` = `c`.`dept_id`) and (`p`.`course_id` = `c`.`course_id`)))) where (`c`.`student_id` = '800726001') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `social_science_hours`
--

/*!50001 DROP TABLE IF EXISTS `social_science_hours`*/;
/*!50001 DROP VIEW IF EXISTS `social_science_hours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `social_science_hours` AS select `c`.`dept_id` AS `dept_id`,`c`.`course_id` AS `course_id`,`c`.`credit_hours` AS `credit_hours` from (`course_list` `c` join `program_courses` `p` on(((`c`.`dept_id` = `p`.`dept_id`) and (`c`.`course_id` = `p`.`course_id`)))) where ((`p`.`program_id` = 'Bachelor of Arts') and (`p`.`concentration_id` = 'Web Development') and (`p`.`fulfills_social_science` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-28 17:53:49
