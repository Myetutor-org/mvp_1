CREATE DATABASE  IF NOT EXISTS `myetutor` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `myetutor`;
-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: localhost    Database: myetutor
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(2048) NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `visual_type_value` tinyint(1) DEFAULT NULL,
  `aural_type_value` tinyint(1) DEFAULT NULL,
  `linguistic_type_value` tinyint(1) DEFAULT NULL,
  `physical_type_value` tinyint(1) DEFAULT NULL,
  `mathematical_type_value` varchar(45) DEFAULT NULL,
  `question_section_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_question_section1_idx` (`question_section_id`),
  CONSTRAINT `fk_question_question_section1` FOREIGN KEY (`question_section_id`) REFERENCES `question_section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'Τα 3/5 της τιμής μιας μπλούζας είναι 60 ευρώ, πόσο κάνει η μπλούζα?','2015-05-06 00:00:00',NULL,NULL,1,-2,1,0,'2',1);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_correct_solution`
--

DROP TABLE IF EXISTS `question_correct_solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_correct_solution` (
  `question_id` int(11) NOT NULL,
  `solution_id` int(11) NOT NULL,
  PRIMARY KEY (`question_id`,`solution_id`),
  KEY `fk_question_has_solution_solution2_idx` (`solution_id`),
  KEY `fk_question_has_solution_question1_idx` (`question_id`),
  CONSTRAINT `fk_question_has_solution_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_has_solution_solution2` FOREIGN KEY (`solution_id`) REFERENCES `solution` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_correct_solution`
--

LOCK TABLES `question_correct_solution` WRITE;
/*!40000 ALTER TABLE `question_correct_solution` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_correct_solution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_section`
--

DROP TABLE IF EXISTS `question_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `question_subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_section_question_subject1_idx` (`question_subject_id`),
  CONSTRAINT `fk_question_section_question_subject1` FOREIGN KEY (`question_subject_id`) REFERENCES `question_subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_section`
--

LOCK TABLES `question_section` WRITE;
/*!40000 ALTER TABLE `question_section` DISABLE KEYS */;
INSERT INTO `question_section` VALUES (1,'Chapter 1',NULL);
/*!40000 ALTER TABLE `question_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_solution`
--

DROP TABLE IF EXISTS `question_solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_solution` (
  `id` varchar(45) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `solution_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question_id_UNIQUE` (`question_id`),
  UNIQUE KEY `solution_id_UNIQUE` (`solution_id`),
  KEY `fk_question_has_solution_solution1_idx` (`solution_id`),
  KEY `fk_question_has_solution_question_idx` (`question_id`),
  CONSTRAINT `fk_question_has_solution_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_has_solution_solution1` FOREIGN KEY (`solution_id`) REFERENCES `solution` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_solution`
--

LOCK TABLES `question_solution` WRITE;
/*!40000 ALTER TABLE `question_solution` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_solution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_subject`
--

DROP TABLE IF EXISTS `question_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_subject`
--

LOCK TABLES `question_subject` WRITE;
/*!40000 ALTER TABLE `question_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_version`
--

DROP TABLE IF EXISTS `schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `author` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_version`
--

LOCK TABLES `schema_version` WRITE;
/*!40000 ALTER TABLE `schema_version` DISABLE KEYS */;
INSERT INTO `schema_version` VALUES (1,0,'Inital Script','Hristijan and Stefan','2015-05-03 16:42:37');
/*!40000 ALTER TABLE `schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solution`
--

DROP TABLE IF EXISTS `solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solution`
--

LOCK TABLES `solution` WRITE;
/*!40000 ALTER TABLE `solution` DISABLE KEYS */;
/*!40000 ALTER TABLE `solution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_answer`
--

DROP TABLE IF EXISTS `tutor_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor_answer` (
  `answerID` int(11) NOT NULL AUTO_INCREMENT,
  `answerText` varchar(255) NOT NULL,
  `questionID` int(11) NOT NULL,
  PRIMARY KEY (`answerID`,`questionID`),
  KEY `fk_answer_question1_idx` (`questionID`),
  CONSTRAINT `fk_answer_question1` FOREIGN KEY (`questionID`) REFERENCES `tutor_question` (`questionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_answer`
--

LOCK TABLES `tutor_answer` WRITE;
/*!40000 ALTER TABLE `tutor_answer` DISABLE KEYS */;
INSERT INTO `tutor_answer` VALUES (1,'25',1),(2,'85.5',2),(3,'??',3),(4,'63',4),(5,'27.7',5),(6,'50',6),(7,'73.3',7),(8,'P(P U B) = 1, P(A U\' B) = 0',8),(9,'-1',9),(10,'1/2^20',10),(11,'0.5, 0.5',11),(12,'12.5 14.6 15 14.8 17',12);
/*!40000 ALTER TABLE `tutor_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_question`
--

DROP TABLE IF EXISTS `tutor_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor_question` (
  `questionID` int(11) NOT NULL AUTO_INCREMENT,
  `questionText` varchar(255) NOT NULL,
  `questionWeight` tinyint(4) NOT NULL,
  `questionExplanationFlag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`questionID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_question`
--

LOCK TABLES `tutor_question` WRITE;
/*!40000 ALTER TABLE `tutor_question` DISABLE KEYS */;
INSERT INTO `tutor_question` VALUES (1,'Σε μια εταιρία εργάζονται 40 άτομα με μέση ηλικία 38,5 χρόνια. Αν η μέση ηλικία των αντρών είναι 40 χρόνια και των γυναικών 36 χρόνια να βρεθεί πόσοι είναι οι άνδρες εργαζόμενοι',2,0),(2,'Σε κανονική κατανομή με μέση τιμή  18 και τυπική απόκλιση 3 να βρεθεί το ποσοστό των παρατηρήσεων που βρίσκεται ανάμεσα στους αριθμούς 12 και 21',1,0),(3,'Σε κανονική κατανομή με μέση τιμή  25 και συντελεστή μεταβολής 20%  να βρεθεί το ποσοστό των παρατηρήσεων που βρίσκεται κάτω από 15',1,0),(4,'Στην Αθήνα βρέχει σε ποσοστό 35% των ημερών του χειμώνα. Ενας ποδοσφαιριστής έχει ποσοστό επιτυχίας στα φάουλ 70% αν δεν βρέχει και  50% εάν βρέχει. Να βρεθεί η πιθανότητα να σκοράρει μια τυχαία μέρα',2,0),(5,'Στην Αθήνα βρέχει σε ποσοστό 35% των ημερών του χειμώνα. Ενας ποδοσφαιριστής έχει ποσοστό επιτυχίας στα φάουλ 70% αν δεν βρέχει και  50% εάν βρέχει. Να βρεθεί η πιθανότητα να βρέχει δεδομένου ότι σκόραρε μια τυχαία μέρα',3,0),(6,'Οι πελάτες σε ένα μαγαζί έχουν πιστωτική κάρτα Α σε ποσοστό 60% και Β σε ποσοστό 50%, και η πιθανότητα να έχουν και τις 2 κάρτες είναι 30%. Να βρεθεί η πιθανότητα ένας πελάτης να έχει ακριβώς μια κάρτα',2,0),(7,'Σε μια κληρωτίδα υπάρχουν 3 κόκινες μπάλες , 4 πράσινες και 3 άσπρες. Τραβάμε 2 μπάλες χωρίς επανατοποθέτηση. Να βρεθεί η πιθανότητα οι μπάλες να έιναι διαφορετικού χρώματος',2,0),(8,'Έστω Α, Β ενδεχόμενα ενός πεπερασμένου δειγματικού χώρου Ω ενός πειράματος τύχης. Αν ισχύει :   να αποδειχτεί ότι τα ενδεχόμενα Α, Β είναι συμπληρωματικά',3,1),(9,'Έστω ο δειγματικός χώρος Ω και Α ενδεχόμενο του .Να βρεθούν οι τιμές     του  για τις οποίες ισχύει :   ',2,1),(10,'Εστω ο δειγματικός χώρος Ω ={0,1, 2, 3, …, 20} και ν θετικός ακέραιος.       Δίνονται οι πιθανότητες   Να βρεθεί η  Ρ(0)',3,0),(11,'Να βρεθούν η μέση τιμή και η διάμεσος των ενδεχομένων:  ',2,1),(12,'Ένας μαθητής έχει μέσο όρο 14 στα 9 πρώτα διαγωνίσματα. Ο πιο μεγάλος βαθμός που μπορεί να ελπίζει μετά το 10ο είναι ',1,0);
/*!40000 ALTER TABLE `tutor_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_question_has_questionpicture`
--

DROP TABLE IF EXISTS `tutor_question_has_questionpicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor_question_has_questionpicture` (
  `questionID` int(11) NOT NULL,
  `questionPictureID` int(11) NOT NULL,
  PRIMARY KEY (`questionID`,`questionPictureID`),
  KEY `fk_question_has_questionpicture_questionpicture1_idx` (`questionPictureID`),
  KEY `fk_question_has_questionpicture_question1_idx` (`questionID`),
  CONSTRAINT `fk_question_has_questionpicture_question1` FOREIGN KEY (`questionID`) REFERENCES `tutor_question` (`questionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_has_questionpicture_questionpicture1` FOREIGN KEY (`questionPictureID`) REFERENCES `tutor_questionpicture` (`questionPictureID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_question_has_questionpicture`
--

LOCK TABLES `tutor_question_has_questionpicture` WRITE;
/*!40000 ALTER TABLE `tutor_question_has_questionpicture` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutor_question_has_questionpicture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_questionpicture`
--

DROP TABLE IF EXISTS `tutor_questionpicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor_questionpicture` (
  `questionPictureID` int(11) NOT NULL AUTO_INCREMENT,
  `questionPicturePath` varchar(255) NOT NULL,
  PRIMARY KEY (`questionPictureID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_questionpicture`
--

LOCK TABLES `tutor_questionpicture` WRITE;
/*!40000 ALTER TABLE `tutor_questionpicture` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutor_questionpicture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_user`
--

DROP TABLE IF EXISTS `tutor_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor_user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userEmail` varchar(45) NOT NULL,
  `userName` varchar(45) NOT NULL,
  `userSurname` varchar(45) NOT NULL,
  `userTelNo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userEmail_UNIQUE` (`userEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_user`
--

LOCK TABLES `tutor_user` WRITE;
/*!40000 ALTER TABLE `tutor_user` DISABLE KEYS */;
INSERT INTO `tutor_user` VALUES (46,'a','a','a','a'),(47,'m','m','m','4'),(49,'r','r','r','r');
/*!40000 ALTER TABLE `tutor_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor_useranswer`
--

DROP TABLE IF EXISTS `tutor_useranswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor_useranswer` (
  `useranswerText` varchar(255) NOT NULL,
  `useranswerExplanation` varchar(1023) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  PRIMARY KEY (`userID`,`questionID`),
  KEY `fk_useranswer_user1_idx` (`userID`),
  KEY `fk_useranswer_question1_idx` (`questionID`),
  CONSTRAINT `fk_useranswer_question1` FOREIGN KEY (`questionID`) REFERENCES `tutor_question` (`questionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_useranswer_user1` FOREIGN KEY (`userID`) REFERENCES `tutor_user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor_useranswer`
--

LOCK TABLES `tutor_useranswer` WRITE;
/*!40000 ALTER TABLE `tutor_useranswer` DISABLE KEYS */;
INSERT INTO `tutor_useranswer` VALUES ('a1','',46,1),('a2','',46,2),('a3','',46,3),('a4','',46,4),('a5','',46,5),('a6','',46,6),('a7','',46,7),('a8','a8e',46,8),('a9','a9e',46,9),('a10','',46,10),('a11','a11e',46,11),('a12','',46,12),('as','',49,1),('dasd','',49,2);
/*!40000 ALTER TABLE `tutor_useranswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_question_solution`
--

DROP TABLE IF EXISTS `user_has_question_solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_question_solution` (
  `user_id` int(11) NOT NULL,
  `question_solution_id` varchar(45) NOT NULL,
  `value` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`question_solution_id`),
  KEY `fk_user_has_question_solution_question_solution1_idx` (`question_solution_id`),
  KEY `fk_user_has_question_solution_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_question_solution_question_solution1` FOREIGN KEY (`question_solution_id`) REFERENCES `question_solution` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_question_solution_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_question_solution`
--

LOCK TABLES `user_has_question_solution` WRITE;
/*!40000 ALTER TABLE `user_has_question_solution` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_question_solution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'myetutor'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-06  0:27:28
