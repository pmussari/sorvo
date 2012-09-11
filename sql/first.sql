CREATE DATABASE  IF NOT EXISTS `sorvo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sorvo`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: sorvo
-- ------------------------------------------------------
-- Server version	5.5.23

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
-- Table structure for table `sorvouser_cookies`
--

DROP TABLE IF EXISTS `sorvouser_cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorvouser_cookies` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(128) NOT NULL,
  `created_on` datetime NOT NULL,
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorvouser_cookies`
--

LOCK TABLES `sorvouser_cookies` WRITE;
/*!40000 ALTER TABLE `sorvouser_cookies` DISABLE KEYS */;
/*!40000 ALTER TABLE `sorvouser_cookies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorvoemail_queue`
--

DROP TABLE IF EXISTS `sorvoemail_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorvoemail_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_email` varchar(128) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `alt_message` text,
  `max_attempts` int(11) NOT NULL DEFAULT '3',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `success` tinyint(1) NOT NULL DEFAULT '0',
  `date_published` datetime DEFAULT NULL,
  `last_attempt` datetime DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorvoemail_queue`
--

LOCK TABLES `sorvoemail_queue` WRITE;
/*!40000 ALTER TABLE `sorvoemail_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `sorvoemail_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorvoactivities`
--

DROP TABLE IF EXISTS `sorvoactivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorvoactivities` (
  `activity_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `activity` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `deleted` tinyint(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorvoactivities`
--

LOCK TABLES `sorvoactivities` WRITE;
/*!40000 ALTER TABLE `sorvoactivities` DISABLE KEYS */;
INSERT INTO `sorvoactivities` VALUES (1,1,'logged in from: 127.0.0.1','users','2012-09-11 12:56:14',0);
/*!40000 ALTER TABLE `sorvoactivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorvouser_meta`
--

DROP TABLE IF EXISTS `sorvouser_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorvouser_meta` (
  `meta_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) NOT NULL DEFAULT '',
  `meta_value` text,
  PRIMARY KEY (`meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorvouser_meta`
--

LOCK TABLES `sorvouser_meta` WRITE;
/*!40000 ALTER TABLE `sorvouser_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `sorvouser_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorvopermissions`
--

DROP TABLE IF EXISTS `sorvopermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorvopermissions` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `status` enum('active','inactive','deleted') DEFAULT 'active',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorvopermissions`
--

LOCK TABLES `sorvopermissions` WRITE;
/*!40000 ALTER TABLE `sorvopermissions` DISABLE KEYS */;
INSERT INTO `sorvopermissions` VALUES (1,'Site.Signin.Allow','Allow users to login to the site','active'),(2,'Site.Content.View','Allow users to view the Content Context','active'),(3,'Site.Reports.View','Allow users to view the Reports Context','active'),(4,'Site.Settings.View','Allow users to view the Settings Context','active'),(5,'Site.Developer.View','Allow users to view the Developer Context','active'),(6,'Bonfire.Roles.Manage','Allow users to manage the user Roles','active'),(7,'Bonfire.Users.Manage','Allow users to manage the site Users','active'),(8,'Bonfire.Users.View','Allow users access to the User Settings','active'),(9,'Bonfire.Users.Add','Allow users to add new Users','active'),(10,'Bonfire.Database.Manage','Allow users to manage the Database settings','active'),(11,'Bonfire.Emailer.Manage','Allow users to manage the Emailer settings','active'),(12,'Bonfire.Logs.View','Allow users access to the Log details','active'),(13,'Bonfire.Logs.Manage','Allow users to manage the Log files','active'),(14,'Bonfire.Emailer.View','Allow users access to the Emailer settings','active'),(15,'Site.Signin.Offline','Allow users to login to the site when the site is offline','active'),(16,'Bonfire.Permissions.View','Allow access to view the Permissions menu unders Settings Context','active'),(17,'Bonfire.Permissions.Manage','Allow access to manage the Permissions in the system','active'),(18,'Bonfire.Roles.Delete','Allow users to delete user Roles','active'),(19,'Bonfire.Modules.Add','Allow creation of modules with the builder.','active'),(20,'Bonfire.Modules.Delete','Allow deletion of modules.','active'),(21,'Permissions.Administrator.Manage','To manage the access control permissions for the Administrator role.','active'),(22,'Permissions.Editor.Manage','To manage the access control permissions for the Editor role.','active'),(24,'Permissions.User.Manage','To manage the access control permissions for the User role.','active'),(25,'Permissions.Developer.Manage','To manage the access control permissions for the Developer role.','active'),(27,'Activities.Own.View','To view the users own activity logs','active'),(28,'Activities.Own.Delete','To delete the users own activity logs','active'),(29,'Activities.User.View','To view the user activity logs','active'),(30,'Activities.User.Delete','To delete the user activity logs, except own','active'),(31,'Activities.Module.View','To view the module activity logs','active'),(32,'Activities.Module.Delete','To delete the module activity logs','active'),(33,'Activities.Date.View','To view the users own activity logs','active'),(34,'Activities.Date.Delete','To delete the dated activity logs','active'),(35,'Bonfire.UI.Manage','Manage the Bonfire UI settings','active'),(36,'Bonfire.Settings.View','To view the site settings page.','active'),(37,'Bonfire.Settings.Manage','To manage the site settings.','active'),(38,'Bonfire.Activities.View','To view the Activities menu.','active'),(39,'Bonfire.Database.View','To view the Database menu.','active'),(40,'Bonfire.Migrations.View','To view the Migrations menu.','active'),(41,'Bonfire.Builder.View','To view the Modulebuilder menu.','active'),(42,'Bonfire.Roles.View','To view the Roles menu.','active'),(43,'Bonfire.Sysinfo.View','To view the System Information page.','active'),(44,'Bonfire.Translate.Manage','To manage the Language Translation.','active'),(45,'Bonfire.Translate.View','To view the Language Translate menu.','active'),(46,'Bonfire.UI.View','To view the UI/Keyboard Shortcut menu.','active'),(47,'Bonfire.Update.Manage','To manage the Bonfire Update.','active'),(48,'Bonfire.Update.View','To view the Developer Update menu.','active'),(49,'Bonfire.Profiler.View','To view the Console Profiler Bar.','active'),(50,'Bonfire.Roles.Add','To add New Roles','active');
/*!40000 ALTER TABLE `sorvopermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorvorole_permissions`
--

DROP TABLE IF EXISTS `sorvorole_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorvorole_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorvorole_permissions`
--

LOCK TABLES `sorvorole_permissions` WRITE;
/*!40000 ALTER TABLE `sorvorole_permissions` DISABLE KEYS */;
INSERT INTO `sorvorole_permissions` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,24),(1,25),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(2,1),(2,2),(2,3),(4,1),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(6,9),(6,10),(6,11),(6,12),(6,13),(6,49);
/*!40000 ALTER TABLE `sorvorole_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorvoschema_version`
--

DROP TABLE IF EXISTS `sorvoschema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorvoschema_version` (
  `type` varchar(40) NOT NULL,
  `version` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorvoschema_version`
--

LOCK TABLES `sorvoschema_version` WRITE;
/*!40000 ALTER TABLE `sorvoschema_version` DISABLE KEYS */;
INSERT INTO `sorvoschema_version` VALUES ('app_',0),('core',34);
/*!40000 ALTER TABLE `sorvoschema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorvousers`
--

DROP TABLE IF EXISTS `sorvousers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorvousers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '4',
  `email` varchar(120) NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `password_hash` varchar(40) NOT NULL,
  `reset_hash` varchar(40) DEFAULT NULL,
  `salt` varchar(7) NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_ip` varchar(40) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_message` varchar(255) DEFAULT NULL,
  `reset_by` int(10) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT '',
  `display_name_changed` date DEFAULT NULL,
  `timezone` char(4) NOT NULL DEFAULT 'UM6',
  `language` varchar(20) NOT NULL DEFAULT 'english',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activate_hash` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorvousers`
--

LOCK TABLES `sorvousers` WRITE;
/*!40000 ALTER TABLE `sorvousers` DISABLE KEYS */;
INSERT INTO `sorvousers` VALUES (1,1,'sorvo@gmail.com','sorvoadmin','199c5049b7c271947a1c92a852cd13ca6c2fb802',NULL,'p5D53LE','2012-09-11 12:56:13','127.0.0.1','0000-00-00 00:00:00',0,0,NULL,NULL,'',NULL,'UM6','english',1,'');
/*!40000 ALTER TABLE `sorvousers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorvologin_attempts`
--

DROP TABLE IF EXISTS `sorvologin_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorvologin_attempts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) NOT NULL,
  `login` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorvologin_attempts`
--

LOCK TABLES `sorvologin_attempts` WRITE;
/*!40000 ALTER TABLE `sorvologin_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sorvologin_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorvosettings`
--

DROP TABLE IF EXISTS `sorvosettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorvosettings` (
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `unique - name` (`name`),
  KEY `index - name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorvosettings`
--

LOCK TABLES `sorvosettings` WRITE;
/*!40000 ALTER TABLE `sorvosettings` DISABLE KEYS */;
INSERT INTO `sorvosettings` VALUES ('auth.allow_name_change','core','1'),('auth.allow_register','core','1'),('auth.allow_remember','core','1'),('auth.do_login_redirect','core','1'),('auth.login_type','core','email'),('auth.name_change_frequency','core','1'),('auth.name_change_limit','core','1'),('auth.password_force_mixed_case','core','0'),('auth.password_force_numbers','core','0'),('auth.password_force_symbols','core','0'),('auth.password_min_length','core','8'),('auth.password_show_labels','core','0'),('auth.remember_length','core','1209600'),('auth.use_extended_profile','core','0'),('auth.use_usernames','core','1'),('auth.user_activation_method','core','0'),('form_save','core.ui','ctrl+s/⌘+s'),('goto_content','core.ui','alt+c'),('mailpath','email','/usr/sbin/sendmail'),('mailtype','email','text'),('protocol','email','mail'),('sender_email','email','sorvo@gmail.com'),('site.languages','core','a:3:{i:0;s:7:\"english\";i:1;s:10:\"portuguese\";i:2;s:7:\"persian\";}'),('site.list_limit','core','25'),('site.show_front_profiler','core','1'),('site.show_profiler','core','1'),('site.status','core','1'),('site.system_email','core','sorvo@gmail.com'),('site.title','core','Sorvo Shop'),('smtp_host','email',''),('smtp_pass','email',''),('smtp_port','email',''),('smtp_timeout','email',''),('smtp_user','email',''),('updates.bleeding_edge','core','1'),('updates.do_check','core','1');
/*!40000 ALTER TABLE `sorvosettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorvoroles`
--

DROP TABLE IF EXISTS `sorvoroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorvoroles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  `login_destination` varchar(255) NOT NULL DEFAULT '/',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `default_context` varchar(255) NOT NULL DEFAULT 'content',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorvoroles`
--

LOCK TABLES `sorvoroles` WRITE;
/*!40000 ALTER TABLE `sorvoroles` DISABLE KEYS */;
INSERT INTO `sorvoroles` VALUES (1,'Administrator','Has full control over every aspect of the site.',0,0,'',0,'content'),(2,'Editor','Can handle day-to-day management, but does not have full power.',0,1,'',0,'content'),(4,'User','This is the default user with access to login.',1,0,'',0,'content'),(6,'Developer','Developers typically are the only ones that can access the developer tools. Otherwise identical to Administrators, at least until the site is handed off.',0,1,'',0,'content');
/*!40000 ALTER TABLE `sorvoroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorvosessions`
--

DROP TABLE IF EXISTS `sorvosessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorvosessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorvosessions`
--

LOCK TABLES `sorvosessions` WRITE;
/*!40000 ALTER TABLE `sorvosessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sorvosessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sorvo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-11 10:22:13
