CREATE DATABASE  IF NOT EXISTS `myetutordb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `myetutordb`;
-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (i686)
--
-- Host: 127.0.0.1    Database: myetutordb
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `answerID` int(11) NOT NULL AUTO_INCREMENT,
  `answerText` varchar(255) NOT NULL,
  `questionID` int(11) NOT NULL,
  PRIMARY KEY (`answerID`,`questionID`),
  KEY `fk_answer_question1_idx` (`questionID`),
  CONSTRAINT `fk_answer_question1` FOREIGN KEY (`questionID`) REFERENCES `question` (`questionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,'25',1),(2,'85.5',2),(3,'??',3),(4,'63',4),(5,'27.7',5),(6,'50',6),(7,'73.3',7),(8,'P(P U B) = 1, P(A U\' B) = 0',8),(9,'-1',9),(10,'1/2^20',10),(11,'0.5, 0.5',11),(12,'12.5 14.6 15 14.8 17',12);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `questionID` int(11) NOT NULL AUTO_INCREMENT,
  `questionText` varchar(255) NOT NULL,
  `questionWeight` tinyint(4) NOT NULL,
  `questionExplanationFlag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`questionID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'Σε μια εταιρία εργάζονται 40 άτομα με μέση ηλικία 38,5 χρόνια. Αν η μέση ηλικία των αντρών είναι 40 χρόνια και των γυναικών 36 χρόνια να βρεθεί πόσοι είναι οι άνδρες εργαζόμενοι',2,0),(2,'Σε κανονική κατανομή με μέση τιμή  18 και τυπική απόκλιση 3 να βρεθεί το ποσοστό των παρατηρήσεων που βρίσκεται ανάμεσα στους αριθμούς 12 και 21',1,0),(3,'Σε κανονική κατανομή με μέση τιμή  25 και συντελεστή μεταβολής 20%  να βρεθεί το ποσοστό των παρατηρήσεων που βρίσκεται κάτω από 15',1,0),(4,'Στην Αθήνα βρέχει σε ποσοστό 35% των ημερών του χειμώνα. Ενας ποδοσφαιριστής έχει ποσοστό επιτυχίας στα φάουλ 70% αν δεν βρέχει και  50% εάν βρέχει. Να βρεθεί η πιθανότητα να σκοράρει μια τυχαία μέρα',2,0),(5,'Στην Αθήνα βρέχει σε ποσοστό 35% των ημερών του χειμώνα. Ενας ποδοσφαιριστής έχει ποσοστό επιτυχίας στα φάουλ 70% αν δεν βρέχει και  50% εάν βρέχει. Να βρεθεί η πιθανότητα να βρέχει δεδομένου ότι σκόραρε μια τυχαία μέρα',3,0),(6,'Οι πελάτες σε ένα μαγαζί έχουν πιστωτική κάρτα Α σε ποσοστό 60% και Β σε ποσοστό 50%, και η πιθανότητα να έχουν και τις 2 κάρτες είναι 30%. Να βρεθεί η πιθανότητα ένας πελάτης να έχει ακριβώς μια κάρτα',2,0),(7,'Σε μια κληρωτίδα υπάρχουν 3 κόκινες μπάλες , 4 πράσινες και 3 άσπρες. Τραβάμε 2 μπάλες χωρίς επανατοποθέτηση. Να βρεθεί η πιθανότητα οι μπάλες να έιναι διαφορετικού χρώματος',2,0),(8,'Έστω Α, Β ενδεχόμενα ενός πεπερασμένου δειγματικού χώρου Ω ενός πειράματος τύχης. Αν ισχύει :   να αποδειχτεί ότι τα ενδεχόμενα Α, Β είναι συμπληρωματικά',3,1),(9,'Έστω ο δειγματικός χώρος Ω και Α ενδεχόμενο του .Να βρεθούν οι τιμές     του  για τις οποίες ισχύει :   ',2,1),(10,'Εστω ο δειγματικός χώρος Ω ={0,1, 2, 3, …, 20} και ν θετικός ακέραιος.       Δίνονται οι πιθανότητες   Να βρεθεί η  Ρ(0)',3,0),(11,'Να βρεθούν η μέση τιμή και η διάμεσος των ενδεχομένων:  ',2,1),(12,'Ένας μαθητής έχει μέσο όρο 14 στα 9 πρώτα διαγωνίσματα. Ο πιο μεγάλος βαθμός που μπορεί να ελπίζει μετά το 10ο είναι ',1,0);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_has_questionpicture`
--

DROP TABLE IF EXISTS `question_has_questionpicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_has_questionpicture` (
  `questionID` int(11) NOT NULL,
  `questionPictureID` int(11) NOT NULL,
  PRIMARY KEY (`questionID`,`questionPictureID`),
  KEY `fk_question_has_questionpicture_questionpicture1_idx` (`questionPictureID`),
  KEY `fk_question_has_questionpicture_question1_idx` (`questionID`),
  CONSTRAINT `fk_question_has_questionpicture_question1` FOREIGN KEY (`questionID`) REFERENCES `question` (`questionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_has_questionpicture_questionpicture1` FOREIGN KEY (`questionPictureID`) REFERENCES `questionpicture` (`questionPictureID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_has_questionpicture`
--

LOCK TABLES `question_has_questionpicture` WRITE;
/*!40000 ALTER TABLE `question_has_questionpicture` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_has_questionpicture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionpicture`
--

DROP TABLE IF EXISTS `questionpicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionpicture` (
  `questionPictureID` int(11) NOT NULL AUTO_INCREMENT,
  `questionPicturePath` varchar(255) NOT NULL,
  PRIMARY KEY (`questionPictureID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionpicture`
--

LOCK TABLES `questionpicture` WRITE;
/*!40000 ALTER TABLE `questionpicture` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionpicture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userEmail` varchar(45) NOT NULL,
  `userName` varchar(45) NOT NULL,
  `userSurname` varchar(45) NOT NULL,
  `userTelNo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userEmail_UNIQUE` (`userEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (46,'a','a','a','a');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useranswer`
--

DROP TABLE IF EXISTS `useranswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useranswer` (
  `useranswerText` varchar(255) NOT NULL,
  `useranswerExplanation` varchar(1023) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  PRIMARY KEY (`userID`,`questionID`),
  KEY `fk_useranswer_user1_idx` (`userID`),
  KEY `fk_useranswer_question1_idx` (`questionID`),
  CONSTRAINT `fk_useranswer_question1` FOREIGN KEY (`questionID`) REFERENCES `question` (`questionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_useranswer_user1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useranswer`
--

LOCK TABLES `useranswer` WRITE;
/*!40000 ALTER TABLE `useranswer` DISABLE KEYS */;
INSERT INTO `useranswer` VALUES ('a1','',46,1),('a2','',46,2),('a3','',46,3),('a4','',46,4),('a5','',46,5),('a6','',46,6),('a7','',46,7),('a8','a8e',46,8),('a9','a9e',46,9),('a10','',46,10),('a11','a11e',46,11),('a12','',46,12);
/*!40000 ALTER TABLE `useranswer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-09 16:20:50
