-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: persuasive_userdb
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `persuasive_userdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `persuasive_userdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `persuasive_userdb`;

--
-- Table structure for table `AspNetRoleClaims`
--

DROP TABLE IF EXISTS `AspNetRoleClaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetRoleClaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetRoleClaims`
--

LOCK TABLES `AspNetRoleClaims` WRITE;
/*!40000 ALTER TABLE `AspNetRoleClaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetRoleClaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetRoles`
--

DROP TABLE IF EXISTS `AspNetRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetRoles` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetRoles`
--

LOCK TABLES `AspNetRoles` WRITE;
/*!40000 ALTER TABLE `AspNetRoles` DISABLE KEYS */;
INSERT INTO `AspNetRoles` VALUES ('6ef2928f-67e8-4e91-be69-2c427a33c24a','Admin','ADMIN',NULL),('99a7ca4d-4641-4e53-ad6c-117a723013ee','User','USER',NULL),('c12ec379-def3-42ae-8ff0-af3bb6eb4217','Employee','EMPLOYEE',NULL);
/*!40000 ALTER TABLE `AspNetRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserClaims`
--

DROP TABLE IF EXISTS `AspNetUserClaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserClaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserClaims`
--

LOCK TABLES `AspNetUserClaims` WRITE;
/*!40000 ALTER TABLE `AspNetUserClaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserClaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserLogins`
--

DROP TABLE IF EXISTS `AspNetUserLogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserLogins` (
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserLogins`
--

LOCK TABLES `AspNetUserLogins` WRITE;
/*!40000 ALTER TABLE `AspNetUserLogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserLogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserRoles`
--

DROP TABLE IF EXISTS `AspNetUserRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserRoles` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserRoles`
--

LOCK TABLES `AspNetUserRoles` WRITE;
/*!40000 ALTER TABLE `AspNetUserRoles` DISABLE KEYS */;
INSERT INTO `AspNetUserRoles` VALUES ('22c2dc13-4887-4557-a11d-fcf2996e7be1','6ef2928f-67e8-4e91-be69-2c427a33c24a'),('0dbb3ec4-8636-4958-b83f-b6c595438eaa','99a7ca4d-4641-4e53-ad6c-117a723013ee'),('22c2dc13-4887-4557-a11d-fcf2996e7be1','99a7ca4d-4641-4e53-ad6c-117a723013ee'),('4ebce0d4-9ff3-41b3-b141-a9af8e3d6f2e','99a7ca4d-4641-4e53-ad6c-117a723013ee'),('65a3a5ae-7ae3-4076-90ed-b22ff5ad2132','99a7ca4d-4641-4e53-ad6c-117a723013ee'),('66839276-ec2c-47d6-9440-fd4489c59070','99a7ca4d-4641-4e53-ad6c-117a723013ee'),('c7021dec-b16b-4e07-a11a-cfb1f6b40b30','99a7ca4d-4641-4e53-ad6c-117a723013ee'),('f9989694-eea1-4302-846a-82afc0db818b','99a7ca4d-4641-4e53-ad6c-117a723013ee'),('22c2dc13-4887-4557-a11d-fcf2996e7be1','c12ec379-def3-42ae-8ff0-af3bb6eb4217');
/*!40000 ALTER TABLE `AspNetUserRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserTokens`
--

DROP TABLE IF EXISTS `AspNetUserTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserTokens` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserTokens`
--

LOCK TABLES `AspNetUserTokens` WRITE;
/*!40000 ALTER TABLE `AspNetUserTokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserTokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUsers`
--

DROP TABLE IF EXISTS `AspNetUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUsers` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  `Address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `City` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Country` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PostalCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUsers`
--

LOCK TABLES `AspNetUsers` WRITE;
/*!40000 ALTER TABLE `AspNetUsers` DISABLE KEYS */;
INSERT INTO `AspNetUsers` VALUES ('0dbb3ec4-8636-4958-b83f-b6c595438eaa','redas','REDAS','redass95@gmail.com','REDASS95@GMAIL.COM',0,'AQAAAAIAAYagAAAAEEc0oIfwV8pVKXx0mqTjRrGqhvgFgXuTAGHe2cfzpS/epWATKGRepEwHfjFgYfJ/Pg==','WPPLV7MD7EGHS744C3ZJ4WLFUD4PH2FX','29a53397-1dce-49a4-8274-c1712141b737',NULL,0,0,NULL,1,0,NULL,NULL,NULL,NULL),('22c2dc13-4887-4557-a11d-fcf2996e7be1','admin','ADMIN','admin@admin.com','ADMIN@ADMIN.COM',0,'AQAAAAIAAYagAAAAEMynVKBjj4AYpw/bfiGmIqw/4HIUp4QpUhf6sDQwQ0Q8I1hfS/AIN8Hb8ECJTles5w==','EGJJ6D6YOPBFYH3IJZ7AFSLDD3JZN7FI','5666343f-29a2-43cb-80bf-1085e957de47',NULL,0,0,NULL,1,0,NULL,NULL,NULL,NULL),('4ebce0d4-9ff3-41b3-b141-a9af8e3d6f2e','redass95','REDASS95','redasss95@gmail.com','REDASSS95@GMAIL.COM',0,'AQAAAAIAAYagAAAAEDnLV5zid8pzX4BsL4XGB8nyOuZNiEsj56mDUSbiahGj+X3Ey5mbBUtAhIVYWAeHaQ==','GRE5ZUQKWJABHJMLMWV2WTO77IENQVAM','1bf5da72-ec38-4c61-9b99-5b27a16d36d0',NULL,0,0,NULL,1,0,NULL,NULL,NULL,NULL),('65a3a5ae-7ae3-4076-90ed-b22ff5ad2132','useris','USERIS','test@test.lt','TEST@TEST.LT',0,'AQAAAAIAAYagAAAAEHxIAEfRBI0wb9SkpSaKZFefQ+aXGS8Obm7xOae3ozz/WJZRuZmtSy/m2Nq3EdVkBw==','E72FXQUBNSOREEW5ZXWEEBHXIYT3L3PO','32af44bd-8c48-442f-995b-76c77ce3235b',NULL,0,0,NULL,1,0,NULL,NULL,NULL,NULL),('66839276-ec2c-47d6-9440-fd4489c59070','redst3','REDST3','redass95@googly.com','REDASS95@GOOGLY.COM',0,'AQAAAAIAAYagAAAAEGPP/JF2znvvhQvHOoezlIy96XaWc6s9GJDj4HiY2r8kU5GIWXNTRzsc1obPN4cY/A==','OGKV6FWFUU3VMUGERVFTWIHZK4B4SJG7','e6cb2a3e-7553-4c8c-9257-55706d0377ab',NULL,0,0,NULL,1,0,NULL,NULL,NULL,NULL),('c7021dec-b16b-4e07-a11a-cfb1f6b40b30','user','USER','user@user.com','USER@USER.COM',0,'AQAAAAIAAYagAAAAEGKJPSvb/jeE2dPUVhgjgVijB4u5fHPKcznTzuNiv+DKQCseqmTyIq8ayKMlrKaIYA==','SPGIH5AHKYCJRENIS5M3PCW244MLRUUF','93e7e18e-a209-4829-9c79-9c3a11620405',NULL,0,0,NULL,1,0,'Tylioji g','Mazeikiai','Lithuaniasss','39519'),('f9989694-eea1-4302-846a-82afc0db818b','test','TEST','test@test.lt','TEST@TEST.LT',0,'AQAAAAIAAYagAAAAELkNUzMpaUTn105qKiuvJlZGAY4JgP3r+1WyTPMlmyQ/YNML+1fHNAnjnWB6b2wRcQ==','YLEA7KTIVEKYTTIAKGHX7UQEUE2OG6WB','4a8ebbef-cc68-4306-a191-d1722998416d',NULL,0,0,NULL,1,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `AspNetUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BackgroundImages`
--

DROP TABLE IF EXISTS `BackgroundImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BackgroundImages` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ImageUrl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `px_to_cm` double NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BackgroundImages`
--

LOCK TABLES `BackgroundImages` WRITE;
/*!40000 ALTER TABLE `BackgroundImages` DISABLE KEYS */;
INSERT INTO `BackgroundImages` VALUES ('22c2dc13-4887-4557-a11d-fcf2996e7be1',NULL,100),('66839276-ec2c-47d6-9440-fd4489c59070','images/backgrounds/background_66839276-ec2c-47d6-9440-fd4489c59070.jpg',0.001),('c7021dec-b16b-4e07-a11a-cfb1f6b40b30','images/backgrounds/background_c7021dec-b16b-4e07-a11a-cfb1f6b40b30.jpg',0.422);
/*!40000 ALTER TABLE `BackgroundImages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wishlists`
--

DROP TABLE IF EXISTS `Wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Wishlists` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ProductIds` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wishlists`
--

LOCK TABLES `Wishlists` WRITE;
/*!40000 ALTER TABLE `Wishlists` DISABLE KEYS */;
INSERT INTO `Wishlists` VALUES (1,'[]','0dbb3ec4-8636-4958-b83f-b6c595438eaa'),(2,'[2,2121]','f9989694-eea1-4302-846a-82afc0db818b'),(3,'[1,10,23,17]','c7021dec-b16b-4e07-a11a-cfb1f6b40b30'),(4,'[]','4ebce0d4-9ff3-41b3-b141-a9af8e3d6f2e'),(5,'[]','65a3a5ae-7ae3-4076-90ed-b22ff5ad2132'),(6,'[1,4]','66839276-ec2c-47d6-9440-fd4489c59070'),(7,'[1]','22c2dc13-4887-4557-a11d-fcf2996e7be1');
/*!40000 ALTER TABLE `Wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `__EFMigrationsHistory`
--

DROP TABLE IF EXISTS `__EFMigrationsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__EFMigrationsHistory`
--

LOCK TABLES `__EFMigrationsHistory` WRITE;
/*!40000 ALTER TABLE `__EFMigrationsHistory` DISABLE KEYS */;
INSERT INTO `__EFMigrationsHistory` VALUES ('20230311165621_initialMigration','7.0.3'),('20230314081527_wishlists','7.0.3'),('20230325163024_backgrounds','7.0.3');
/*!40000 ALTER TABLE `__EFMigrationsHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `persuasivedb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `persuasivedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `persuasivedb`;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `conditions` json DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_permissions_created_by_id_fk` (`created_by_id`),
  KEY `admin_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'plugin::upload.read',NULL,'{}','[]','2023-03-07 10:22:53.403000','2023-03-07 10:22:53.403000',NULL,NULL),(2,'plugin::upload.configure-view',NULL,'{}','[]','2023-03-07 10:22:53.417000','2023-03-07 10:22:53.417000',NULL,NULL),(3,'plugin::upload.assets.create',NULL,'{}','[]','2023-03-07 10:22:53.433000','2023-03-07 10:22:53.433000',NULL,NULL),(4,'plugin::upload.assets.update',NULL,'{}','[]','2023-03-07 10:22:53.444000','2023-03-07 10:22:53.444000',NULL,NULL),(5,'plugin::upload.assets.download',NULL,'{}','[]','2023-03-07 10:22:53.455000','2023-03-07 10:22:53.455000',NULL,NULL),(6,'plugin::upload.assets.copy-link',NULL,'{}','[]','2023-03-07 10:22:53.467000','2023-03-07 10:22:53.467000',NULL,NULL),(7,'plugin::upload.read',NULL,'{}','[\"admin::is-creator\"]','2023-03-07 10:22:53.477000','2023-03-07 10:22:53.477000',NULL,NULL),(8,'plugin::upload.configure-view',NULL,'{}','[]','2023-03-07 10:22:53.491000','2023-03-07 10:22:53.491000',NULL,NULL),(9,'plugin::upload.assets.create',NULL,'{}','[]','2023-03-07 10:22:53.503000','2023-03-07 10:22:53.503000',NULL,NULL),(10,'plugin::upload.assets.update',NULL,'{}','[\"admin::is-creator\"]','2023-03-07 10:22:53.514000','2023-03-07 10:22:53.514000',NULL,NULL),(11,'plugin::upload.assets.download',NULL,'{}','[]','2023-03-07 10:22:53.526000','2023-03-07 10:22:53.526000',NULL,NULL),(12,'plugin::upload.assets.copy-link',NULL,'{}','[]','2023-03-07 10:22:53.537000','2023-03-07 10:22:53.537000',NULL,NULL),(13,'plugin::content-manager.explorer.create','plugin::users-permissions.user','{\"fields\": [\"username\", \"email\", \"provider\", \"password\", \"resetPasswordToken\", \"confirmationToken\", \"confirmed\", \"blocked\", \"role\"]}','[]','2023-03-07 10:22:53.580000','2023-03-07 10:22:53.580000',NULL,NULL),(14,'plugin::content-manager.explorer.read','plugin::users-permissions.user','{\"fields\": [\"username\", \"email\", \"provider\", \"password\", \"resetPasswordToken\", \"confirmationToken\", \"confirmed\", \"blocked\", \"role\"]}','[]','2023-03-07 10:22:53.591000','2023-03-07 10:22:53.591000',NULL,NULL),(15,'plugin::content-manager.explorer.update','plugin::users-permissions.user','{\"fields\": [\"username\", \"email\", \"provider\", \"password\", \"resetPasswordToken\", \"confirmationToken\", \"confirmed\", \"blocked\", \"role\"]}','[]','2023-03-07 10:22:53.603000','2023-03-07 10:22:53.603000',NULL,NULL),(16,'plugin::content-manager.explorer.delete','plugin::users-permissions.user','{}','[]','2023-03-07 10:22:53.615000','2023-03-07 10:22:53.615000',NULL,NULL),(17,'plugin::content-manager.single-types.configure-view',NULL,'{}','[]','2023-03-07 10:22:53.626000','2023-03-07 10:22:53.626000',NULL,NULL),(18,'plugin::content-manager.collection-types.configure-view',NULL,'{}','[]','2023-03-07 10:22:53.639000','2023-03-07 10:22:53.639000',NULL,NULL),(19,'plugin::content-manager.components.configure-layout',NULL,'{}','[]','2023-03-07 10:22:53.650000','2023-03-07 10:22:53.650000',NULL,NULL),(20,'plugin::content-type-builder.read',NULL,'{}','[]','2023-03-07 10:22:53.662000','2023-03-07 10:22:53.662000',NULL,NULL),(21,'plugin::email.settings.read',NULL,'{}','[]','2023-03-07 10:22:53.672000','2023-03-07 10:22:53.672000',NULL,NULL),(22,'plugin::upload.read',NULL,'{}','[]','2023-03-07 10:22:53.684000','2023-03-07 10:22:53.684000',NULL,NULL),(23,'plugin::upload.assets.create',NULL,'{}','[]','2023-03-07 10:22:53.695000','2023-03-07 10:22:53.695000',NULL,NULL),(24,'plugin::upload.assets.update',NULL,'{}','[]','2023-03-07 10:22:53.707000','2023-03-07 10:22:53.707000',NULL,NULL),(25,'plugin::upload.assets.download',NULL,'{}','[]','2023-03-07 10:22:53.718000','2023-03-07 10:22:53.718000',NULL,NULL),(26,'plugin::upload.assets.copy-link',NULL,'{}','[]','2023-03-07 10:22:53.730000','2023-03-07 10:22:53.730000',NULL,NULL),(27,'plugin::upload.configure-view',NULL,'{}','[]','2023-03-07 10:22:53.742000','2023-03-07 10:22:53.742000',NULL,NULL),(28,'plugin::upload.settings.read',NULL,'{}','[]','2023-03-07 10:22:53.753000','2023-03-07 10:22:53.753000',NULL,NULL),(29,'plugin::users-permissions.roles.create',NULL,'{}','[]','2023-03-07 10:22:53.765000','2023-03-07 10:22:53.765000',NULL,NULL),(30,'plugin::users-permissions.roles.read',NULL,'{}','[]','2023-03-07 10:22:53.776000','2023-03-07 10:22:53.776000',NULL,NULL),(31,'plugin::users-permissions.roles.update',NULL,'{}','[]','2023-03-07 10:22:53.788000','2023-03-07 10:22:53.788000',NULL,NULL),(32,'plugin::users-permissions.roles.delete',NULL,'{}','[]','2023-03-07 10:22:53.799000','2023-03-07 10:22:53.799000',NULL,NULL),(33,'plugin::users-permissions.providers.read',NULL,'{}','[]','2023-03-07 10:22:53.811000','2023-03-07 10:22:53.811000',NULL,NULL),(34,'plugin::users-permissions.providers.update',NULL,'{}','[]','2023-03-07 10:22:53.822000','2023-03-07 10:22:53.822000',NULL,NULL),(35,'plugin::users-permissions.email-templates.read',NULL,'{}','[]','2023-03-07 10:22:53.833000','2023-03-07 10:22:53.833000',NULL,NULL),(36,'plugin::users-permissions.email-templates.update',NULL,'{}','[]','2023-03-07 10:22:53.844000','2023-03-07 10:22:53.844000',NULL,NULL),(37,'plugin::users-permissions.advanced-settings.read',NULL,'{}','[]','2023-03-07 10:22:53.855000','2023-03-07 10:22:53.855000',NULL,NULL),(38,'plugin::users-permissions.advanced-settings.update',NULL,'{}','[]','2023-03-07 10:22:53.867000','2023-03-07 10:22:53.867000',NULL,NULL),(39,'plugin::i18n.locale.create',NULL,'{}','[]','2023-03-07 10:22:53.879000','2023-03-07 10:22:53.879000',NULL,NULL),(40,'plugin::i18n.locale.read',NULL,'{}','[]','2023-03-07 10:22:53.891000','2023-03-07 10:22:53.891000',NULL,NULL),(41,'plugin::i18n.locale.update',NULL,'{}','[]','2023-03-07 10:22:53.903000','2023-03-07 10:22:53.903000',NULL,NULL),(42,'plugin::i18n.locale.delete',NULL,'{}','[]','2023-03-07 10:22:53.914000','2023-03-07 10:22:53.914000',NULL,NULL),(43,'admin::marketplace.read',NULL,'{}','[]','2023-03-07 10:22:53.927000','2023-03-07 10:22:53.927000',NULL,NULL),(44,'admin::webhooks.create',NULL,'{}','[]','2023-03-07 10:22:53.938000','2023-03-07 10:22:53.938000',NULL,NULL),(45,'admin::webhooks.read',NULL,'{}','[]','2023-03-07 10:22:53.948000','2023-03-07 10:22:53.948000',NULL,NULL),(46,'admin::webhooks.update',NULL,'{}','[]','2023-03-07 10:22:53.959000','2023-03-07 10:22:53.959000',NULL,NULL),(47,'admin::webhooks.delete',NULL,'{}','[]','2023-03-07 10:22:53.974000','2023-03-07 10:22:53.974000',NULL,NULL),(48,'admin::users.create',NULL,'{}','[]','2023-03-07 10:22:53.993000','2023-03-07 10:22:53.993000',NULL,NULL),(49,'admin::users.read',NULL,'{}','[]','2023-03-07 10:22:54.010000','2023-03-07 10:22:54.010000',NULL,NULL),(50,'admin::users.update',NULL,'{}','[]','2023-03-07 10:22:54.023000','2023-03-07 10:22:54.023000',NULL,NULL),(51,'admin::users.delete',NULL,'{}','[]','2023-03-07 10:22:54.035000','2023-03-07 10:22:54.035000',NULL,NULL),(52,'admin::roles.create',NULL,'{}','[]','2023-03-07 10:22:54.047000','2023-03-07 10:22:54.047000',NULL,NULL),(53,'admin::roles.read',NULL,'{}','[]','2023-03-07 10:22:54.058000','2023-03-07 10:22:54.058000',NULL,NULL),(54,'admin::roles.update',NULL,'{}','[]','2023-03-07 10:22:54.068000','2023-03-07 10:22:54.068000',NULL,NULL),(55,'admin::roles.delete',NULL,'{}','[]','2023-03-07 10:22:54.079000','2023-03-07 10:22:54.079000',NULL,NULL),(56,'admin::api-tokens.access',NULL,'{}','[]','2023-03-07 10:22:54.091000','2023-03-07 10:22:54.091000',NULL,NULL),(57,'admin::api-tokens.create',NULL,'{}','[]','2023-03-07 10:22:54.100000','2023-03-07 10:22:54.100000',NULL,NULL),(58,'admin::api-tokens.read',NULL,'{}','[]','2023-03-07 10:22:54.112000','2023-03-07 10:22:54.112000',NULL,NULL),(59,'admin::api-tokens.update',NULL,'{}','[]','2023-03-07 10:22:54.123000','2023-03-07 10:22:54.123000',NULL,NULL),(60,'admin::api-tokens.regenerate',NULL,'{}','[]','2023-03-07 10:22:54.134000','2023-03-07 10:22:54.134000',NULL,NULL),(61,'admin::api-tokens.delete',NULL,'{}','[]','2023-03-07 10:22:54.144000','2023-03-07 10:22:54.144000',NULL,NULL),(62,'admin::project-settings.update',NULL,'{}','[]','2023-03-07 10:22:54.154000','2023-03-07 10:22:54.154000',NULL,NULL),(63,'admin::project-settings.read',NULL,'{}','[]','2023-03-07 10:22:54.166000','2023-03-07 10:22:54.166000',NULL,NULL),(64,'admin::transfer.tokens.access',NULL,'{}','[]','2023-03-07 10:22:54.177000','2023-03-07 10:22:54.177000',NULL,NULL),(65,'admin::transfer.tokens.create',NULL,'{}','[]','2023-03-07 10:22:54.188000','2023-03-07 10:22:54.188000',NULL,NULL),(66,'admin::transfer.tokens.read',NULL,'{}','[]','2023-03-07 10:22:54.199000','2023-03-07 10:22:54.199000',NULL,NULL),(67,'admin::transfer.tokens.update',NULL,'{}','[]','2023-03-07 10:22:54.217000','2023-03-07 10:22:54.217000',NULL,NULL),(68,'admin::transfer.tokens.regenerate',NULL,'{}','[]','2023-03-07 10:22:54.228000','2023-03-07 10:22:54.228000',NULL,NULL),(69,'admin::transfer.tokens.delete',NULL,'{}','[]','2023-03-07 10:22:54.239000','2023-03-07 10:22:54.239000',NULL,NULL),(73,'plugin::content-manager.explorer.delete','api::product.product','{}','[]','2023-03-07 10:29:03.066000','2023-03-07 10:29:03.066000',NULL,NULL),(74,'plugin::content-manager.explorer.publish','api::product.product','{}','[]','2023-03-07 10:29:03.079000','2023-03-07 10:29:03.079000',NULL,NULL),(78,'plugin::content-manager.explorer.delete','api::category.category','{}','[]','2023-03-07 10:31:13.144000','2023-03-07 10:31:13.144000',NULL,NULL),(79,'plugin::content-manager.explorer.publish','api::category.category','{}','[]','2023-03-07 10:31:13.157000','2023-03-07 10:31:13.157000',NULL,NULL),(89,'plugin::content-manager.explorer.create','api::category.category','{\"fields\": [\"title\", \"description\", \"img\", \"products\", \"sub_categories\"]}','[]','2023-03-07 10:48:08.740000','2023-03-07 10:48:08.740000',NULL,NULL),(91,'plugin::content-manager.explorer.create','api::sub-category.sub-category','{\"fields\": [\"title\", \"category\", \"products\"]}','[]','2023-03-07 10:48:08.783000','2023-03-07 10:48:08.783000',NULL,NULL),(92,'plugin::content-manager.explorer.read','api::category.category','{\"fields\": [\"title\", \"description\", \"img\", \"products\", \"sub_categories\"]}','[]','2023-03-07 10:48:08.805000','2023-03-07 10:48:08.805000',NULL,NULL),(94,'plugin::content-manager.explorer.read','api::sub-category.sub-category','{\"fields\": [\"title\", \"category\", \"products\"]}','[]','2023-03-07 10:48:08.856000','2023-03-07 10:48:08.856000',NULL,NULL),(95,'plugin::content-manager.explorer.update','api::category.category','{\"fields\": [\"title\", \"description\", \"img\", \"products\", \"sub_categories\"]}','[]','2023-03-07 10:48:08.878000','2023-03-07 10:48:08.878000',NULL,NULL),(97,'plugin::content-manager.explorer.update','api::sub-category.sub-category','{\"fields\": [\"title\", \"category\", \"products\"]}','[]','2023-03-07 10:48:08.920000','2023-03-07 10:48:08.920000',NULL,NULL),(98,'plugin::content-manager.explorer.delete','api::sub-category.sub-category','{}','[]','2023-03-07 10:48:08.935000','2023-03-07 10:48:08.935000',NULL,NULL),(99,'plugin::content-manager.explorer.publish','api::sub-category.sub-category','{}','[]','2023-03-07 10:48:08.947000','2023-03-07 10:48:08.947000',NULL,NULL),(137,'plugin::content-manager.explorer.delete','api::order.order','{}','[]','2023-04-04 10:29:58.614000','2023-04-04 10:29:58.614000',NULL,NULL),(138,'plugin::content-manager.explorer.publish','api::order.order','{}','[]','2023-04-04 10:29:58.625000','2023-04-04 10:29:58.625000',NULL,NULL),(166,'plugin::content-manager.explorer.create','api::order.order','{\"fields\": [\"OrderId\", \"userId\", \"products\", \"order_status\", \"total_cost\", \"shipping_address\", \"order_date\", \"email\", \"quantities\"]}','[]','2023-04-12 15:14:47.154000','2023-04-12 15:14:47.154000',NULL,NULL),(167,'plugin::content-manager.explorer.read','api::order.order','{\"fields\": [\"OrderId\", \"userId\", \"products\", \"order_status\", \"total_cost\", \"shipping_address\", \"order_date\", \"email\", \"quantities\"]}','[]','2023-04-12 15:14:47.166000','2023-04-12 15:14:47.166000',NULL,NULL),(168,'plugin::content-manager.explorer.update','api::order.order','{\"fields\": [\"OrderId\", \"userId\", \"products\", \"order_status\", \"total_cost\", \"shipping_address\", \"order_date\", \"email\", \"quantities\"]}','[]','2023-04-12 15:14:47.176000','2023-04-12 15:14:47.176000',NULL,NULL),(169,'plugin::content-manager.explorer.create','api::product.product','{\"fields\": [\"title\", \"description\", \"img\", \"price\", \"new\", \"category\", \"sub_category\", \"type\", \"author\", \"on_sale\", \"width\", \"height\", \"preview_img\"]}','[]','2023-04-17 08:58:53.608000','2023-04-17 08:58:53.608000',NULL,NULL),(170,'plugin::content-manager.explorer.read','api::product.product','{\"fields\": [\"title\", \"description\", \"img\", \"price\", \"new\", \"category\", \"sub_category\", \"type\", \"author\", \"on_sale\", \"width\", \"height\", \"preview_img\"]}','[]','2023-04-17 08:58:53.692000','2023-04-17 08:58:53.692000',NULL,NULL),(171,'plugin::content-manager.explorer.update','api::product.product','{\"fields\": [\"title\", \"description\", \"img\", \"price\", \"new\", \"category\", \"sub_category\", \"type\", \"author\", \"on_sale\", \"width\", \"height\", \"preview_img\"]}','[]','2023-04-17 08:58:53.706000','2023-04-17 08:58:53.706000',NULL,NULL);
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions_role_links`
--

DROP TABLE IF EXISTS `admin_permissions_role_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions_role_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_role_links_unique` (`permission_id`,`role_id`),
  KEY `admin_permissions_role_links_fk` (`permission_id`),
  KEY `admin_permissions_role_links_inv_fk` (`role_id`),
  KEY `admin_permissions_role_links_order_inv_fk` (`permission_order`),
  CONSTRAINT `admin_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions_role_links`
--

LOCK TABLES `admin_permissions_role_links` WRITE;
/*!40000 ALTER TABLE `admin_permissions_role_links` DISABLE KEYS */;
INSERT INTO `admin_permissions_role_links` VALUES (1,1,2,1),(2,2,2,2),(3,3,2,3),(4,4,2,4),(5,5,2,5),(6,6,2,6),(7,7,3,1),(8,8,3,2),(9,9,3,3),(10,10,3,4),(11,11,3,5),(12,12,3,6),(13,13,1,1),(14,14,1,2),(15,15,1,3),(16,16,1,4),(17,17,1,5),(18,18,1,6),(19,19,1,7),(20,20,1,8),(21,21,1,9),(22,22,1,10),(23,23,1,11),(24,24,1,12),(25,25,1,13),(26,26,1,14),(27,27,1,15),(28,28,1,16),(29,29,1,17),(30,30,1,18),(31,31,1,19),(32,32,1,20),(33,33,1,21),(34,34,1,22),(35,35,1,23),(36,36,1,24),(37,37,1,25),(38,38,1,26),(39,39,1,27),(40,40,1,28),(41,41,1,29),(42,42,1,30),(43,43,1,31),(44,44,1,32),(45,45,1,33),(46,46,1,34),(47,47,1,35),(48,48,1,36),(49,49,1,37),(50,50,1,38),(51,51,1,39),(52,52,1,40),(53,53,1,41),(54,54,1,42),(55,55,1,43),(56,56,1,44),(57,57,1,45),(58,58,1,46),(59,59,1,47),(60,60,1,48),(61,61,1,49),(62,62,1,50),(63,63,1,51),(64,64,1,52),(65,65,1,53),(66,66,1,54),(67,67,1,55),(68,68,1,56),(69,69,1,57),(73,73,1,61),(74,74,1,62),(78,78,1,66),(79,79,1,67),(89,89,1,68),(91,91,1,70),(92,92,1,71),(94,94,1,73),(95,95,1,74),(97,97,1,76),(98,98,1,77),(99,99,1,78),(137,137,1,85),(138,138,1,86),(166,166,1,93),(167,167,1,94),(168,168,1,95),(169,169,1,96),(170,170,1,97),(171,171,1,98);
/*!40000 ALTER TABLE `admin_permissions_role_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_roles_created_by_id_fk` (`created_by_id`),
  KEY `admin_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Super Admin','strapi-super-admin','Super Admins can access and manage all features and settings.','2023-03-07 10:22:53.376000','2023-03-07 10:22:53.376000',NULL,NULL),(2,'Editor','strapi-editor','Editors can manage and publish contents including those of other users.','2023-03-07 10:22:53.387000','2023-03-07 10:22:53.387000',NULL,NULL),(3,'Author','strapi-author','Authors can manage the content they have created.','2023-03-07 10:22:53.394000','2023-03-07 10:22:53.394000',NULL,NULL);
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `registration_token` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `prefered_language` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_users_created_by_id_fk` (`created_by_id`),
  KEY `admin_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'Redas','Steckys',NULL,'admin@admin.com','$2a$10$2kMi64Bl4.sHQt3ukbeJR.zZz7AoY2kQ00ImhFGfr24y7KXjbVfWy','e5f8565f4b1348d7c5bbcfe33bde429cc6016cdd',NULL,1,0,NULL,'2023-03-07 10:23:45.830000','2023-04-12 15:14:03.953000',NULL,NULL),(2,'Redas','Steckys',NULL,'steckysredas@gmail.com',NULL,NULL,'7ccea3ae50c2ffcd77936c8ee0b7a4b8c761bf6e',0,0,NULL,'2023-03-23 12:29:11.434000','2023-03-23 12:29:11.434000',NULL,NULL);
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users_roles_links`
--

DROP TABLE IF EXISTS `admin_users_roles_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users_roles_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `role_order` double unsigned DEFAULT NULL,
  `user_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_roles_links_unique` (`user_id`,`role_id`),
  KEY `admin_users_roles_links_fk` (`user_id`),
  KEY `admin_users_roles_links_inv_fk` (`role_id`),
  KEY `admin_users_roles_links_order_fk` (`role_order`),
  KEY `admin_users_roles_links_order_inv_fk` (`user_order`),
  CONSTRAINT `admin_users_roles_links_fk` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_users_roles_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users_roles_links`
--

LOCK TABLES `admin_users_roles_links` WRITE;
/*!40000 ALTER TABLE `admin_users_roles_links` DISABLE KEYS */;
INSERT INTO `admin_users_roles_links` VALUES (1,1,1,1,1),(2,2,1,1,2);
/*!40000 ALTER TABLE `admin_users_roles_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_created_by_id_fk` (`created_by_id`),
  KEY `categories_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `categories_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Painting','this is a category for paintings','2023-03-07 10:42:51.980000','2023-03-29 13:01:38.746000','2023-03-07 10:44:43.752000',1,1),(6,'Mirror','this is a mirror category','2023-03-29 12:59:58.709000','2023-03-29 12:59:59.715000','2023-03-29 12:59:59.712000',1,1),(7,'Neon sign','This is a category for neon sign products','2023-04-17 09:34:24.622000','2023-04-17 09:35:21.821000','2023-04-17 09:34:53.568000',1,1),(8,'Clock','this is clock category for products','2023-04-17 09:38:16.947000','2023-04-17 09:38:17.732000','2023-04-17 09:38:17.728000',1,1),(9,'Wall Sticker','this is wallsticker category for products','2023-04-17 09:40:45.888000','2023-04-17 09:41:06.155000','2023-04-17 09:41:06.152000',1,1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alternative_text` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `formats` json DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` decimal(10,2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `preview_url` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_metadata` json DEFAULT NULL,
  `folder_path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_files_folder_path_index` (`folder_path`),
  KEY `upload_files_created_at_index` (`created_at`),
  KEY `upload_files_updated_at_index` (`updated_at`),
  KEY `upload_files_name_index` (`name`),
  KEY `upload_files_size_index` (`size`),
  KEY `upload_files_ext_index` (`ext`),
  KEY `files_created_by_id_fk` (`created_by_id`),
  KEY `files_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `files_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `files_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (2,'49ee445617997a593ca86c6f9b.jpg',NULL,NULL,1000,1405,'{\"large\": {\"ext\": \".jpg\", \"url\": \"/uploads/large_49ee445617997a593ca86c6f9b_e43bb3e169.jpg\", \"hash\": \"large_49ee445617997a593ca86c6f9b_e43bb3e169\", \"mime\": \"image/jpeg\", \"name\": \"large_49ee445617997a593ca86c6f9b.jpg\", \"path\": null, \"size\": 164.22, \"width\": 712, \"height\": 1000}, \"small\": {\"ext\": \".jpg\", \"url\": \"/uploads/small_49ee445617997a593ca86c6f9b_e43bb3e169.jpg\", \"hash\": \"small_49ee445617997a593ca86c6f9b_e43bb3e169\", \"mime\": \"image/jpeg\", \"name\": \"small_49ee445617997a593ca86c6f9b.jpg\", \"path\": null, \"size\": 45.8, \"width\": 356, \"height\": 500}, \"medium\": {\"ext\": \".jpg\", \"url\": \"/uploads/medium_49ee445617997a593ca86c6f9b_e43bb3e169.jpg\", \"hash\": \"medium_49ee445617997a593ca86c6f9b_e43bb3e169\", \"mime\": \"image/jpeg\", \"name\": \"medium_49ee445617997a593ca86c6f9b.jpg\", \"path\": null, \"size\": 95.78, \"width\": 534, \"height\": 750}, \"thumbnail\": {\"ext\": \".jpg\", \"url\": \"/uploads/thumbnail_49ee445617997a593ca86c6f9b_e43bb3e169.jpg\", \"hash\": \"thumbnail_49ee445617997a593ca86c6f9b_e43bb3e169\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_49ee445617997a593ca86c6f9b.jpg\", \"path\": null, \"size\": 5.45, \"width\": 111, \"height\": 156}}','49ee445617997a593ca86c6f9b_e43bb3e169','.jpg','image/jpeg',323.40,'/uploads/49ee445617997a593ca86c6f9b_e43bb3e169.jpg',NULL,'local',NULL,'/','2023-03-07 10:38:21.277000','2023-03-07 10:38:21.277000',1,1),(4,'colorful-2468874_960_720.jpg',NULL,NULL,960,698,'{\"small\": {\"ext\": \".jpg\", \"url\": \"/uploads/small_colorful_2468874_960_720_8f3a18ca98.jpg\", \"hash\": \"small_colorful_2468874_960_720_8f3a18ca98\", \"mime\": \"image/jpeg\", \"name\": \"small_colorful-2468874_960_720.jpg\", \"path\": null, \"size\": 59.44, \"width\": 500, \"height\": 364}, \"medium\": {\"ext\": \".jpg\", \"url\": \"/uploads/medium_colorful_2468874_960_720_8f3a18ca98.jpg\", \"hash\": \"medium_colorful_2468874_960_720_8f3a18ca98\", \"mime\": \"image/jpeg\", \"name\": \"medium_colorful-2468874_960_720.jpg\", \"path\": null, \"size\": 121.87, \"width\": 750, \"height\": 545}, \"thumbnail\": {\"ext\": \".jpg\", \"url\": \"/uploads/thumbnail_colorful_2468874_960_720_8f3a18ca98.jpg\", \"hash\": \"thumbnail_colorful_2468874_960_720_8f3a18ca98\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_colorful-2468874_960_720.jpg\", \"path\": null, \"size\": 13.12, \"width\": 215, \"height\": 156}}','colorful_2468874_960_720_8f3a18ca98','.jpg','image/jpeg',189.96,'/uploads/colorful_2468874_960_720_8f3a18ca98.jpg',NULL,'local',NULL,'/','2023-03-07 10:42:40.541000','2023-03-07 10:42:40.541000',1,1),(6,'FY24Q1_CD_Mirrors_Under100_EH.jpg',NULL,NULL,1580,454,'{\"large\": {\"ext\": \".jpg\", \"url\": \"/uploads/large_FY_24_Q1_CD_Mirrors_Under100_EH_b4114aa65c.jpg\", \"hash\": \"large_FY_24_Q1_CD_Mirrors_Under100_EH_b4114aa65c\", \"mime\": \"image/jpeg\", \"name\": \"large_FY24Q1_CD_Mirrors_Under100_EH.jpg\", \"path\": null, \"size\": 53.01, \"width\": 1000, \"height\": 287}, \"small\": {\"ext\": \".jpg\", \"url\": \"/uploads/small_FY_24_Q1_CD_Mirrors_Under100_EH_b4114aa65c.jpg\", \"hash\": \"small_FY_24_Q1_CD_Mirrors_Under100_EH_b4114aa65c\", \"mime\": \"image/jpeg\", \"name\": \"small_FY24Q1_CD_Mirrors_Under100_EH.jpg\", \"path\": null, \"size\": 14.94, \"width\": 500, \"height\": 144}, \"medium\": {\"ext\": \".jpg\", \"url\": \"/uploads/medium_FY_24_Q1_CD_Mirrors_Under100_EH_b4114aa65c.jpg\", \"hash\": \"medium_FY_24_Q1_CD_Mirrors_Under100_EH_b4114aa65c\", \"mime\": \"image/jpeg\", \"name\": \"medium_FY24Q1_CD_Mirrors_Under100_EH.jpg\", \"path\": null, \"size\": 31.48, \"width\": 750, \"height\": 216}, \"thumbnail\": {\"ext\": \".jpg\", \"url\": \"/uploads/thumbnail_FY_24_Q1_CD_Mirrors_Under100_EH_b4114aa65c.jpg\", \"hash\": \"thumbnail_FY_24_Q1_CD_Mirrors_Under100_EH_b4114aa65c\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_FY24Q1_CD_Mirrors_Under100_EH.jpg\", \"path\": null, \"size\": 4.77, \"width\": 245, \"height\": 70}}','FY_24_Q1_CD_Mirrors_Under100_EH_b4114aa65c','.jpg','image/jpeg',119.71,'/uploads/FY_24_Q1_CD_Mirrors_Under100_EH_b4114aa65c.jpg',NULL,'local',NULL,'/','2023-03-29 12:56:30.761000','2023-03-29 12:56:30.761000',1,1),(7,'photo-1598103586054-c4b456cbddc4.jpeg',NULL,NULL,1000,750,'{\"small\": {\"ext\": \".jpeg\", \"url\": \"/uploads/small_photo_1598103586054_c4b456cbddc4_51f2c8a998.jpeg\", \"hash\": \"small_photo_1598103586054_c4b456cbddc4_51f2c8a998\", \"mime\": \"image/jpeg\", \"name\": \"small_photo-1598103586054-c4b456cbddc4.jpeg\", \"path\": null, \"size\": 19.29, \"width\": 500, \"height\": 375}, \"medium\": {\"ext\": \".jpeg\", \"url\": \"/uploads/medium_photo_1598103586054_c4b456cbddc4_51f2c8a998.jpeg\", \"hash\": \"medium_photo_1598103586054_c4b456cbddc4_51f2c8a998\", \"mime\": \"image/jpeg\", \"name\": \"medium_photo-1598103586054-c4b456cbddc4.jpeg\", \"path\": null, \"size\": 40.01, \"width\": 750, \"height\": 563}, \"thumbnail\": {\"ext\": \".jpeg\", \"url\": \"/uploads/thumbnail_photo_1598103586054_c4b456cbddc4_51f2c8a998.jpeg\", \"hash\": \"thumbnail_photo_1598103586054_c4b456cbddc4_51f2c8a998\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_photo-1598103586054-c4b456cbddc4.jpeg\", \"path\": null, \"size\": 4.67, \"width\": 208, \"height\": 156}}','photo_1598103586054_c4b456cbddc4_51f2c8a998','.jpeg','image/jpeg',70.42,'/uploads/photo_1598103586054_c4b456cbddc4_51f2c8a998.jpeg',NULL,'local',NULL,'/','2023-03-29 12:56:30.879000','2023-03-29 13:01:34.080000',1,1),(12,'2.jpg',NULL,NULL,752,703,'{\"small\": {\"ext\": \".jpg\", \"url\": \"/uploads/small_2_778dad1f73.jpg\", \"hash\": \"small_2_778dad1f73\", \"mime\": \"image/jpeg\", \"name\": \"small_2.jpg\", \"path\": null, \"size\": 28.03, \"width\": 500, \"height\": 467}, \"medium\": {\"ext\": \".jpg\", \"url\": \"/uploads/medium_2_778dad1f73.jpg\", \"hash\": \"medium_2_778dad1f73\", \"mime\": \"image/jpeg\", \"name\": \"medium_2.jpg\", \"path\": null, \"size\": 48.65, \"width\": 750, \"height\": 701}, \"thumbnail\": {\"ext\": \".jpg\", \"url\": \"/uploads/thumbnail_2_778dad1f73.jpg\", \"hash\": \"thumbnail_2_778dad1f73\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_2.jpg\", \"path\": null, \"size\": 5.48, \"width\": 167, \"height\": 156}}','2_778dad1f73','.jpg','image/jpeg',34.39,'/uploads/2_778dad1f73.jpg',NULL,'local',NULL,'/','2023-04-17 09:18:26.762000','2023-04-17 09:18:26.762000',1,1),(13,'old.jpg',NULL,NULL,1261,900,'{\"large\": {\"ext\": \".jpg\", \"url\": \"/uploads/large_old_945bbe7d3d.jpg\", \"hash\": \"large_old_945bbe7d3d\", \"mime\": \"image/jpeg\", \"name\": \"large_old.jpg\", \"path\": null, \"size\": 48.78, \"width\": 1000, \"height\": 714}, \"small\": {\"ext\": \".jpg\", \"url\": \"/uploads/small_old_945bbe7d3d.jpg\", \"hash\": \"small_old_945bbe7d3d\", \"mime\": \"image/jpeg\", \"name\": \"small_old.jpg\", \"path\": null, \"size\": 14.19, \"width\": 500, \"height\": 357}, \"medium\": {\"ext\": \".jpg\", \"url\": \"/uploads/medium_old_945bbe7d3d.jpg\", \"hash\": \"medium_old_945bbe7d3d\", \"mime\": \"image/jpeg\", \"name\": \"medium_old.jpg\", \"path\": null, \"size\": 28.27, \"width\": 750, \"height\": 535}, \"thumbnail\": {\"ext\": \".jpg\", \"url\": \"/uploads/thumbnail_old_945bbe7d3d.jpg\", \"hash\": \"thumbnail_old_945bbe7d3d\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_old.jpg\", \"path\": null, \"size\": 3.93, \"width\": 218, \"height\": 156}}','old_945bbe7d3d','.jpg','image/jpeg',77.74,'/uploads/old_945bbe7d3d.jpg',NULL,'local',NULL,'/','2023-04-17 09:18:26.938000','2023-04-17 09:18:26.938000',1,1),(14,'13668665_dsc01118.jpg',NULL,NULL,720,712,'{\"small\": {\"ext\": \".jpg\", \"url\": \"/uploads/small_13668665_dsc01118_5be71ae61f.jpg\", \"hash\": \"small_13668665_dsc01118_5be71ae61f\", \"mime\": \"image/jpeg\", \"name\": \"small_13668665_dsc01118.jpg\", \"path\": null, \"size\": 70.19, \"width\": 500, \"height\": 494}, \"thumbnail\": {\"ext\": \".jpg\", \"url\": \"/uploads/thumbnail_13668665_dsc01118_5be71ae61f.jpg\", \"hash\": \"thumbnail_13668665_dsc01118_5be71ae61f\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_13668665_dsc01118.jpg\", \"path\": null, \"size\": 8.73, \"width\": 158, \"height\": 156}}','13668665_dsc01118_5be71ae61f','.jpg','image/jpeg',136.56,'/uploads/13668665_dsc01118_5be71ae61f.jpg',NULL,'local',NULL,'/','2023-04-17 09:18:27.074000','2023-04-17 09:18:27.074000',1,1),(15,'il_1080xN.4110761857_4dso.jpg',NULL,NULL,1080,1620,'{\"large\": {\"ext\": \".jpg\", \"url\": \"/uploads/large_il_1080x_N_4110761857_4dso_720c6fe29b.jpg\", \"hash\": \"large_il_1080x_N_4110761857_4dso_720c6fe29b\", \"mime\": \"image/jpeg\", \"name\": \"large_il_1080xN.4110761857_4dso.jpg\", \"path\": null, \"size\": 51.07, \"width\": 667, \"height\": 1000}, \"small\": {\"ext\": \".jpg\", \"url\": \"/uploads/small_il_1080x_N_4110761857_4dso_720c6fe29b.jpg\", \"hash\": \"small_il_1080x_N_4110761857_4dso_720c6fe29b\", \"mime\": \"image/jpeg\", \"name\": \"small_il_1080xN.4110761857_4dso.jpg\", \"path\": null, \"size\": 18.05, \"width\": 333, \"height\": 500}, \"medium\": {\"ext\": \".jpg\", \"url\": \"/uploads/medium_il_1080x_N_4110761857_4dso_720c6fe29b.jpg\", \"hash\": \"medium_il_1080x_N_4110761857_4dso_720c6fe29b\", \"mime\": \"image/jpeg\", \"name\": \"medium_il_1080xN.4110761857_4dso.jpg\", \"path\": null, \"size\": 33.26, \"width\": 500, \"height\": 750}, \"thumbnail\": {\"ext\": \".jpg\", \"url\": \"/uploads/thumbnail_il_1080x_N_4110761857_4dso_720c6fe29b.jpg\", \"hash\": \"thumbnail_il_1080x_N_4110761857_4dso_720c6fe29b\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_il_1080xN.4110761857_4dso.jpg\", \"path\": null, \"size\": 3.56, \"width\": 104, \"height\": 156}}','il_1080x_N_4110761857_4dso_720c6fe29b','.jpg','image/jpeg',113.05,'/uploads/il_1080x_N_4110761857_4dso_720c6fe29b.jpg',NULL,'local',NULL,'/','2023-04-17 09:18:27.099000','2023-04-17 09:18:27.099000',1,1),(16,'wallsticker.jpg',NULL,NULL,650,650,'{\"small\": {\"ext\": \".jpg\", \"url\": \"/uploads/small_wallsticker_8952c78d1b.jpg\", \"hash\": \"small_wallsticker_8952c78d1b\", \"mime\": \"image/jpeg\", \"name\": \"small_wallsticker.jpg\", \"path\": null, \"size\": 45.4, \"width\": 500, \"height\": 500}, \"thumbnail\": {\"ext\": \".jpg\", \"url\": \"/uploads/thumbnail_wallsticker_8952c78d1b.jpg\", \"hash\": \"thumbnail_wallsticker_8952c78d1b\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_wallsticker.jpg\", \"path\": null, \"size\": 6.2, \"width\": 156, \"height\": 156}}','wallsticker_8952c78d1b','.jpg','image/jpeg',73.68,'/uploads/wallsticker_8952c78d1b.jpg',NULL,'local',NULL,'/','2023-04-17 09:18:27.456000','2023-04-17 09:18:27.456000',1,1),(17,'Screenshot from 2023-04-17 09-10-10.png',NULL,NULL,660,659,'{\"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_Screenshot_from_2023_04_17_09_10_10_6ada7240a4.png\", \"hash\": \"small_Screenshot_from_2023_04_17_09_10_10_6ada7240a4\", \"mime\": \"image/png\", \"name\": \"small_Screenshot from 2023-04-17 09-10-10.png\", \"path\": null, \"size\": 203.19, \"width\": 500, \"height\": 499}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_10_10_6ada7240a4.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_10_10_6ada7240a4\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot from 2023-04-17 09-10-10.png\", \"path\": null, \"size\": 21.63, \"width\": 156, \"height\": 156}}','Screenshot_from_2023_04_17_09_10_10_6ada7240a4','.png','image/png',80.49,'/uploads/Screenshot_from_2023_04_17_09_10_10_6ada7240a4.png',NULL,'local',NULL,'/','2023-04-17 09:18:28.323000','2023-04-17 09:18:28.323000',1,1),(18,'Screenshot from 2023-04-17 09-16-25.png',NULL,NULL,657,659,'{\"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_Screenshot_from_2023_04_17_09_16_25_802daf484e.png\", \"hash\": \"small_Screenshot_from_2023_04_17_09_16_25_802daf484e\", \"mime\": \"image/png\", \"name\": \"small_Screenshot from 2023-04-17 09-16-25.png\", \"path\": null, \"size\": 188.1, \"width\": 498, \"height\": 500}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_16_25_802daf484e.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_16_25_802daf484e\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot from 2023-04-17 09-16-25.png\", \"path\": null, \"size\": 23.68, \"width\": 156, \"height\": 156}}','Screenshot_from_2023_04_17_09_16_25_802daf484e','.png','image/png',75.59,'/uploads/Screenshot_from_2023_04_17_09_16_25_802daf484e.png',NULL,'local',NULL,'/','2023-04-17 09:18:28.330000','2023-04-17 09:18:28.330000',1,1),(19,'Screenshot from 2023-04-17 09-05-03.png',NULL,NULL,899,752,'{\"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_Screenshot_from_2023_04_17_09_05_03_04f99d4b65.png\", \"hash\": \"small_Screenshot_from_2023_04_17_09_05_03_04f99d4b65\", \"mime\": \"image/png\", \"name\": \"small_Screenshot from 2023-04-17 09-05-03.png\", \"path\": null, \"size\": 419.42, \"width\": 500, \"height\": 418}, \"medium\": {\"ext\": \".png\", \"url\": \"/uploads/medium_Screenshot_from_2023_04_17_09_05_03_04f99d4b65.png\", \"hash\": \"medium_Screenshot_from_2023_04_17_09_05_03_04f99d4b65\", \"mime\": \"image/png\", \"name\": \"medium_Screenshot from 2023-04-17 09-05-03.png\", \"path\": null, \"size\": 907.85, \"width\": 750, \"height\": 627}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_05_03_04f99d4b65.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_05_03_04f99d4b65\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot from 2023-04-17 09-05-03.png\", \"path\": null, \"size\": 63.86, \"width\": 186, \"height\": 156}}','Screenshot_from_2023_04_17_09_05_03_04f99d4b65','.png','image/png',299.13,'/uploads/Screenshot_from_2023_04_17_09_05_03_04f99d4b65.png',NULL,'local',NULL,'/','2023-04-17 09:18:28.823000','2023-04-17 09:18:28.823000',1,1),(20,'28.png',NULL,NULL,1024,1024,'{\"large\": {\"ext\": \".png\", \"url\": \"/uploads/large_28_0c3eb75881.png\", \"hash\": \"large_28_0c3eb75881\", \"mime\": \"image/png\", \"name\": \"large_28.png\", \"path\": null, \"size\": 1621.9, \"width\": 1000, \"height\": 1000}, \"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_28_0c3eb75881.png\", \"hash\": \"small_28_0c3eb75881\", \"mime\": \"image/png\", \"name\": \"small_28.png\", \"path\": null, \"size\": 463.91, \"width\": 500, \"height\": 500}, \"medium\": {\"ext\": \".png\", \"url\": \"/uploads/medium_28_0c3eb75881.png\", \"hash\": \"medium_28_0c3eb75881\", \"mime\": \"image/png\", \"name\": \"medium_28.png\", \"path\": null, \"size\": 986.7, \"width\": 750, \"height\": 750}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_28_0c3eb75881.png\", \"hash\": \"thumbnail_28_0c3eb75881\", \"mime\": \"image/png\", \"name\": \"thumbnail_28.png\", \"path\": null, \"size\": 54, \"width\": 156, \"height\": 156}}','28_0c3eb75881','.png','image/png',445.27,'/uploads/28_0c3eb75881.png',NULL,'local',NULL,'/','2023-04-17 09:18:29.055000','2023-04-17 09:18:29.055000',1,1),(21,'Screenshot from 2023-04-17 09-15-55.png',NULL,NULL,601,601,'{\"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_Screenshot_from_2023_04_17_09_15_55_8c2da05cf4.png\", \"hash\": \"small_Screenshot_from_2023_04_17_09_15_55_8c2da05cf4\", \"mime\": \"image/png\", \"name\": \"small_Screenshot from 2023-04-17 09-15-55.png\", \"path\": null, \"size\": 175.97, \"width\": 500, \"height\": 500}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_15_55_8c2da05cf4.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_15_55_8c2da05cf4\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot from 2023-04-17 09-15-55.png\", \"path\": null, \"size\": 23.25, \"width\": 156, \"height\": 156}}','Screenshot_from_2023_04_17_09_15_55_8c2da05cf4','.png','image/png',64.44,'/uploads/Screenshot_from_2023_04_17_09_15_55_8c2da05cf4.png',NULL,'local',NULL,'/','2023-04-17 09:18:29.164000','2023-04-17 09:18:29.164000',1,1),(22,'Screenshot from 2023-04-17 09-10-52.png',NULL,NULL,660,659,'{\"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_Screenshot_from_2023_04_17_09_10_52_f3c32c1afb.png\", \"hash\": \"small_Screenshot_from_2023_04_17_09_10_52_f3c32c1afb\", \"mime\": \"image/png\", \"name\": \"small_Screenshot from 2023-04-17 09-10-52.png\", \"path\": null, \"size\": 209.64, \"width\": 500, \"height\": 499}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_10_52_f3c32c1afb.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_10_52_f3c32c1afb\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot from 2023-04-17 09-10-52.png\", \"path\": null, \"size\": 23.94, \"width\": 156, \"height\": 156}}','Screenshot_from_2023_04_17_09_10_52_f3c32c1afb','.png','image/png',81.30,'/uploads/Screenshot_from_2023_04_17_09_10_52_f3c32c1afb.png',NULL,'local',NULL,'/','2023-04-17 09:18:29.167000','2023-04-17 09:18:29.167000',1,1),(23,'Screenshot from 2023-04-17 09-13-17.png',NULL,NULL,660,659,'{\"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_Screenshot_from_2023_04_17_09_13_17_630333ffd1.png\", \"hash\": \"small_Screenshot_from_2023_04_17_09_13_17_630333ffd1\", \"mime\": \"image/png\", \"name\": \"small_Screenshot from 2023-04-17 09-13-17.png\", \"path\": null, \"size\": 129.4, \"width\": 500, \"height\": 499}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_13_17_630333ffd1.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_13_17_630333ffd1\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot from 2023-04-17 09-13-17.png\", \"path\": null, \"size\": 19.68, \"width\": 156, \"height\": 156}}','Screenshot_from_2023_04_17_09_13_17_630333ffd1','.png','image/png',51.82,'/uploads/Screenshot_from_2023_04_17_09_13_17_630333ffd1.png',NULL,'local',NULL,'/','2023-04-17 09:18:29.236000','2023-04-17 09:18:29.236000',1,1),(24,'Half-In-Half-Out-10x10-1.jpeg',NULL,NULL,2504,2449,'{\"large\": {\"ext\": \".jpeg\", \"url\": \"/uploads/large_Half_In_Half_Out_10x10_1_deb1861f97.jpeg\", \"hash\": \"large_Half_In_Half_Out_10x10_1_deb1861f97\", \"mime\": \"image/jpeg\", \"name\": \"large_Half-In-Half-Out-10x10-1.jpeg\", \"path\": null, \"size\": 313.09, \"width\": 1000, \"height\": 978}, \"small\": {\"ext\": \".jpeg\", \"url\": \"/uploads/small_Half_In_Half_Out_10x10_1_deb1861f97.jpeg\", \"hash\": \"small_Half_In_Half_Out_10x10_1_deb1861f97\", \"mime\": \"image/jpeg\", \"name\": \"small_Half-In-Half-Out-10x10-1.jpeg\", \"path\": null, \"size\": 59.14, \"width\": 500, \"height\": 489}, \"medium\": {\"ext\": \".jpeg\", \"url\": \"/uploads/medium_Half_In_Half_Out_10x10_1_deb1861f97.jpeg\", \"hash\": \"medium_Half_In_Half_Out_10x10_1_deb1861f97\", \"mime\": \"image/jpeg\", \"name\": \"medium_Half-In-Half-Out-10x10-1.jpeg\", \"path\": null, \"size\": 163.89, \"width\": 750, \"height\": 733}, \"thumbnail\": {\"ext\": \".jpeg\", \"url\": \"/uploads/thumbnail_Half_In_Half_Out_10x10_1_deb1861f97.jpeg\", \"hash\": \"thumbnail_Half_In_Half_Out_10x10_1_deb1861f97\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_Half-In-Half-Out-10x10-1.jpeg\", \"path\": null, \"size\": 5.92, \"width\": 160, \"height\": 156}}','Half_In_Half_Out_10x10_1_deb1861f97','.jpeg','image/jpeg',1603.90,'/uploads/Half_In_Half_Out_10x10_1_deb1861f97.jpeg',NULL,'local',NULL,'/','2023-04-17 09:18:29.744000','2023-04-17 10:10:02.995000',1,1),(25,'Screenshot from 2023-04-17 09-15-21.png',NULL,NULL,664,660,'{\"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_Screenshot_from_2023_04_17_09_15_21_e0e481c648.png\", \"hash\": \"small_Screenshot_from_2023_04_17_09_15_21_e0e481c648\", \"mime\": \"image/png\", \"name\": \"small_Screenshot from 2023-04-17 09-15-21.png\", \"path\": null, \"size\": 213.84, \"width\": 500, \"height\": 497}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_15_21_e0e481c648.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_15_21_e0e481c648\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot from 2023-04-17 09-15-21.png\", \"path\": null, \"size\": 27.73, \"width\": 157, \"height\": 156}}','Screenshot_from_2023_04_17_09_15_21_e0e481c648','.png','image/png',92.56,'/uploads/Screenshot_from_2023_04_17_09_15_21_e0e481c648.png',NULL,'local',NULL,'/','2023-04-17 09:18:29.749000','2023-04-17 09:18:29.749000',1,1),(26,'Screenshot from 2023-04-17 09-14-37.png',NULL,NULL,633,634,'{\"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_Screenshot_from_2023_04_17_09_14_37_09d727edba.png\", \"hash\": \"small_Screenshot_from_2023_04_17_09_14_37_09d727edba\", \"mime\": \"image/png\", \"name\": \"small_Screenshot from 2023-04-17 09-14-37.png\", \"path\": null, \"size\": 254.91, \"width\": 499, \"height\": 500}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_14_37_09d727edba.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_14_37_09d727edba\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot from 2023-04-17 09-14-37.png\", \"path\": null, \"size\": 29.46, \"width\": 156, \"height\": 156}}','Screenshot_from_2023_04_17_09_14_37_09d727edba','.png','image/png',69.86,'/uploads/Screenshot_from_2023_04_17_09_14_37_09d727edba.png',NULL,'local',NULL,'/','2023-04-17 09:18:29.868000','2023-04-17 09:18:29.868000',1,1),(27,'22.png',NULL,NULL,1024,1024,'{\"large\": {\"ext\": \".png\", \"url\": \"/uploads/large_22_374175db90.png\", \"hash\": \"large_22_374175db90\", \"mime\": \"image/png\", \"name\": \"large_22.png\", \"path\": null, \"size\": 1722.22, \"width\": 1000, \"height\": 1000}, \"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_22_374175db90.png\", \"hash\": \"small_22_374175db90\", \"mime\": \"image/png\", \"name\": \"small_22.png\", \"path\": null, \"size\": 481.04, \"width\": 500, \"height\": 500}, \"medium\": {\"ext\": \".png\", \"url\": \"/uploads/medium_22_374175db90.png\", \"hash\": \"medium_22_374175db90\", \"mime\": \"image/png\", \"name\": \"medium_22.png\", \"path\": null, \"size\": 1040.4, \"width\": 750, \"height\": 750}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_22_374175db90.png\", \"hash\": \"thumbnail_22_374175db90\", \"mime\": \"image/png\", \"name\": \"thumbnail_22.png\", \"path\": null, \"size\": 57.87, \"width\": 156, \"height\": 156}}','22_374175db90','.png','image/png',366.64,'/uploads/22_374175db90.png',NULL,'local',NULL,'/','2023-04-17 09:18:29.921000','2023-04-17 09:18:29.921000',1,1),(28,'Screenshot from 2023-04-17 09-15-05.png',NULL,NULL,664,660,'{\"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_Screenshot_from_2023_04_17_09_15_05_615f118865.png\", \"hash\": \"small_Screenshot_from_2023_04_17_09_15_05_615f118865\", \"mime\": \"image/png\", \"name\": \"small_Screenshot from 2023-04-17 09-15-05.png\", \"path\": null, \"size\": 372.01, \"width\": 500, \"height\": 497}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_15_05_615f118865.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_15_05_615f118865\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot from 2023-04-17 09-15-05.png\", \"path\": null, \"size\": 45.92, \"width\": 157, \"height\": 156}}','Screenshot_from_2023_04_17_09_15_05_615f118865','.png','image/png',124.71,'/uploads/Screenshot_from_2023_04_17_09_15_05_615f118865.png',NULL,'local',NULL,'/','2023-04-17 09:18:30.258000','2023-04-17 09:18:30.258000',1,1),(29,'19.png',NULL,NULL,1024,1024,'{\"large\": {\"ext\": \".png\", \"url\": \"/uploads/large_19_8484643b08.png\", \"hash\": \"large_19_8484643b08\", \"mime\": \"image/png\", \"name\": \"large_19.png\", \"path\": null, \"size\": 2313.54, \"width\": 1000, \"height\": 1000}, \"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_19_8484643b08.png\", \"hash\": \"small_19_8484643b08\", \"mime\": \"image/png\", \"name\": \"small_19.png\", \"path\": null, \"size\": 634.97, \"width\": 500, \"height\": 500}, \"medium\": {\"ext\": \".png\", \"url\": \"/uploads/medium_19_8484643b08.png\", \"hash\": \"medium_19_8484643b08\", \"mime\": \"image/png\", \"name\": \"medium_19.png\", \"path\": null, \"size\": 1384.95, \"width\": 750, \"height\": 750}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_19_8484643b08.png\", \"hash\": \"thumbnail_19_8484643b08\", \"mime\": \"image/png\", \"name\": \"thumbnail_19.png\", \"path\": null, \"size\": 67.36, \"width\": 156, \"height\": 156}}','19_8484643b08','.png','image/png',565.43,'/uploads/19_8484643b08.png',NULL,'local',NULL,'/','2023-04-17 09:18:31.623000','2023-04-17 09:18:31.623000',1,1),(30,'Gregory-Mason-Maldives.png',NULL,NULL,1958,1464,'{\"large\": {\"ext\": \".png\", \"url\": \"/uploads/large_Gregory_Mason_Maldives_e0d32847af.png\", \"hash\": \"large_Gregory_Mason_Maldives_e0d32847af\", \"mime\": \"image/png\", \"name\": \"large_Gregory-Mason-Maldives.png\", \"path\": null, \"size\": 1667.42, \"width\": 1000, \"height\": 748}, \"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_Gregory_Mason_Maldives_e0d32847af.png\", \"hash\": \"small_Gregory_Mason_Maldives_e0d32847af\", \"mime\": \"image/png\", \"name\": \"small_Gregory-Mason-Maldives.png\", \"path\": null, \"size\": 398.59, \"width\": 500, \"height\": 374}, \"medium\": {\"ext\": \".png\", \"url\": \"/uploads/medium_Gregory_Mason_Maldives_e0d32847af.png\", \"hash\": \"medium_Gregory_Mason_Maldives_e0d32847af\", \"mime\": \"image/png\", \"name\": \"medium_Gregory-Mason-Maldives.png\", \"path\": null, \"size\": 910.5, \"width\": 750, \"height\": 561}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Gregory_Mason_Maldives_e0d32847af.png\", \"hash\": \"thumbnail_Gregory_Mason_Maldives_e0d32847af\", \"mime\": \"image/png\", \"name\": \"thumbnail_Gregory-Mason-Maldives.png\", \"path\": null, \"size\": 75.5, \"width\": 209, \"height\": 156}}','Gregory_Mason_Maldives_e0d32847af','.png','image/png',1847.05,'/uploads/Gregory_Mason_Maldives_e0d32847af.png',NULL,'local',NULL,'/','2023-04-17 09:18:32.532000','2023-04-17 09:18:32.532000',1,1),(43,'Screenshot_from_2023-04-17_09-13-17-removebg-preview.png',NULL,NULL,500,499,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_13_17_removebg_preview_6cb045de28.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_13_17_removebg_preview_6cb045de28\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot_from_2023-04-17_09-13-17-removebg-preview.png\", \"path\": null, \"size\": 31.28, \"width\": 156, \"height\": 156}}','Screenshot_from_2023_04_17_09_13_17_removebg_preview_6cb045de28','.png','image/png',30.71,'/uploads/Screenshot_from_2023_04_17_09_13_17_removebg_preview_6cb045de28.png',NULL,'local',NULL,'/','2023-04-17 09:31:38.002000','2023-04-17 09:31:38.002000',1,1),(53,'Untitled.jpeg',NULL,NULL,300,168,'{\"thumbnail\": {\"ext\": \".jpeg\", \"url\": \"/uploads/thumbnail_Untitled_ff48096c80.jpeg\", \"hash\": \"thumbnail_Untitled_ff48096c80\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_Untitled.jpeg\", \"path\": null, \"size\": 4.14, \"width\": 245, \"height\": 137}}','Untitled_ff48096c80','.jpeg','image/jpeg',4.37,'/uploads/Untitled_ff48096c80.jpeg',NULL,'local',NULL,'/','2023-04-17 09:34:17.327000','2023-04-17 09:34:17.327000',1,1),(54,'istockphoto-1206591582-640x640.jpg',NULL,NULL,640,360,'{\"small\": {\"ext\": \".jpg\", \"url\": \"/uploads/small_istockphoto_1206591582_640x640_7cd751455e.jpg\", \"hash\": \"small_istockphoto_1206591582_640x640_7cd751455e\", \"mime\": \"image/jpeg\", \"name\": \"small_istockphoto-1206591582-640x640.jpg\", \"path\": null, \"size\": 37.72, \"width\": 500, \"height\": 281}, \"thumbnail\": {\"ext\": \".jpg\", \"url\": \"/uploads/thumbnail_istockphoto_1206591582_640x640_7cd751455e.jpg\", \"hash\": \"thumbnail_istockphoto_1206591582_640x640_7cd751455e\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_istockphoto-1206591582-640x640.jpg\", \"path\": null, \"size\": 12.81, \"width\": 245, \"height\": 138}}','istockphoto_1206591582_640x640_7cd751455e','.jpg','image/jpeg',50.38,'/uploads/istockphoto_1206591582_640x640_7cd751455e.jpg',NULL,'local',NULL,'/','2023-04-17 09:38:13.850000','2023-04-17 09:38:13.850000',1,1),(55,'floral-wallpaper-south-africa.jpg',NULL,NULL,1683,738,'{\"large\": {\"ext\": \".jpg\", \"url\": \"/uploads/large_floral_wallpaper_south_africa_ee8ccb0919.jpg\", \"hash\": \"large_floral_wallpaper_south_africa_ee8ccb0919\", \"mime\": \"image/jpeg\", \"name\": \"large_floral-wallpaper-south-africa.jpg\", \"path\": null, \"size\": 100.03, \"width\": 1000, \"height\": 439}, \"small\": {\"ext\": \".jpg\", \"url\": \"/uploads/small_floral_wallpaper_south_africa_ee8ccb0919.jpg\", \"hash\": \"small_floral_wallpaper_south_africa_ee8ccb0919\", \"mime\": \"image/jpeg\", \"name\": \"small_floral-wallpaper-south-africa.jpg\", \"path\": null, \"size\": 25.8, \"width\": 500, \"height\": 219}, \"medium\": {\"ext\": \".jpg\", \"url\": \"/uploads/medium_floral_wallpaper_south_africa_ee8ccb0919.jpg\", \"hash\": \"medium_floral_wallpaper_south_africa_ee8ccb0919\", \"mime\": \"image/jpeg\", \"name\": \"medium_floral-wallpaper-south-africa.jpg\", \"path\": null, \"size\": 57.06, \"width\": 750, \"height\": 329}, \"thumbnail\": {\"ext\": \".jpg\", \"url\": \"/uploads/thumbnail_floral_wallpaper_south_africa_ee8ccb0919.jpg\", \"hash\": \"thumbnail_floral_wallpaper_south_africa_ee8ccb0919\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_floral-wallpaper-south-africa.jpg\", \"path\": null, \"size\": 7.41, \"width\": 245, \"height\": 107}}','floral_wallpaper_south_africa_ee8ccb0919','.jpg','image/jpeg',250.26,'/uploads/floral_wallpaper_south_africa_ee8ccb0919.jpg',NULL,'local',NULL,'/','2023-04-17 09:40:40.898000','2023-04-17 09:40:40.898000',1,1),(56,'Screenshot_from_2023-04-17_09-14-37-removebg-preview.png',NULL,NULL,247,293,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_14_37_removebg_preview_64b883a2a1.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_14_37_removebg_preview_64b883a2a1\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot_from_2023-04-17_09-14-37-removebg-preview.png\", \"path\": null, \"size\": 15.13, \"width\": 132, \"height\": 156}}','Screenshot_from_2023_04_17_09_14_37_removebg_preview_64b883a2a1','.png','image/png',5.12,'/uploads/Screenshot_from_2023_04_17_09_14_37_removebg_preview_64b883a2a1.png',NULL,'local',NULL,'/','2023-04-17 10:44:38.751000','2023-04-17 10:44:38.751000',1,1),(57,'Screenshot_from_2023-04-17_09-10-10-removebg-preview.png',NULL,NULL,299,405,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_10_10_removebg_preview_bfdad00daf.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_10_10_removebg_preview_bfdad00daf\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot_from_2023-04-17_09-10-10-removebg-preview.png\", \"path\": null, \"size\": 25.9, \"width\": 115, \"height\": 156}}','Screenshot_from_2023_04_17_09_10_10_removebg_preview_bfdad00daf','.png','image/png',34.63,'/uploads/Screenshot_from_2023_04_17_09_10_10_removebg_preview_bfdad00daf.png',NULL,'local',NULL,'/','2023-04-17 10:44:38.755000','2023-04-17 10:44:38.755000',1,1),(58,'Screenshot_from_2023-04-17_09-15-21-removebg-preview.png',NULL,NULL,177,147,NULL,'Screenshot_from_2023_04_17_09_15_21_removebg_preview_e785344d0d','.png','image/png',15.12,'/uploads/Screenshot_from_2023_04_17_09_15_21_removebg_preview_e785344d0d.png',NULL,'local',NULL,'/','2023-04-17 10:44:38.765000','2023-04-17 10:44:38.765000',1,1),(59,'old-removebg-preview.png',NULL,NULL,205,390,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_old_removebg_preview_ad9fcee5bb.png\", \"hash\": \"thumbnail_old_removebg_preview_ad9fcee5bb\", \"mime\": \"image/png\", \"name\": \"thumbnail_old-removebg-preview.png\", \"path\": null, \"size\": 29.7, \"width\": 82, \"height\": 156}}','old_removebg_preview_ad9fcee5bb','.png','image/png',37.84,'/uploads/old_removebg_preview_ad9fcee5bb.png',NULL,'local',NULL,'/','2023-04-17 10:44:38.766000','2023-04-17 10:44:38.766000',1,1),(60,'Screenshot_from_2023-04-17_09-10-52-removebg-preview.png',NULL,NULL,261,389,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_10_52_removebg_preview_15e7a894ee.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_10_52_removebg_preview_15e7a894ee\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot_from_2023-04-17_09-10-52-removebg-preview.png\", \"path\": null, \"size\": 24.98, \"width\": 105, \"height\": 156}}','Screenshot_from_2023_04_17_09_10_52_removebg_preview_15e7a894ee','.png','image/png',17.82,'/uploads/Screenshot_from_2023_04_17_09_10_52_removebg_preview_15e7a894ee.png',NULL,'local',NULL,'/','2023-04-17 10:44:38.798000','2023-04-17 10:44:38.798000',1,1),(62,'Screenshot_from_2023-04-17_09-15-55-removebg-preview.png',NULL,NULL,251,231,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_15_55_removebg_preview_fd73ecca4b.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_15_55_removebg_preview_fd73ecca4b\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot_from_2023-04-17_09-15-55-removebg-preview.png\", \"path\": null, \"size\": 56.92, \"width\": 170, \"height\": 156}}','Screenshot_from_2023_04_17_09_15_55_removebg_preview_fd73ecca4b','.png','image/png',36.43,'/uploads/Screenshot_from_2023_04_17_09_15_55_removebg_preview_fd73ecca4b.png',NULL,'local',NULL,'/','2023-04-17 10:44:38.829000','2023-04-17 10:44:38.829000',1,1),(63,'il_1080xN.4110761857_4dso-removebg-preview.png',NULL,NULL,304,571,'{\"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_il_1080x_N_4110761857_4dso_removebg_preview_5d09437303.png\", \"hash\": \"small_il_1080x_N_4110761857_4dso_removebg_preview_5d09437303\", \"mime\": \"image/png\", \"name\": \"small_il_1080xN.4110761857_4dso-removebg-preview.png\", \"path\": null, \"size\": 104.37, \"width\": 266, \"height\": 500}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_il_1080x_N_4110761857_4dso_removebg_preview_5d09437303.png\", \"hash\": \"thumbnail_il_1080x_N_4110761857_4dso_removebg_preview_5d09437303\", \"mime\": \"image/png\", \"name\": \"thumbnail_il_1080xN.4110761857_4dso-removebg-preview.png\", \"path\": null, \"size\": 19.64, \"width\": 83, \"height\": 156}}','il_1080x_N_4110761857_4dso_removebg_preview_5d09437303','.png','image/png',19.86,'/uploads/il_1080x_N_4110761857_4dso_removebg_preview_5d09437303.png',NULL,'local',NULL,'/','2023-04-17 10:44:38.855000','2023-04-17 10:44:38.855000',1,1),(64,'Screenshot_from_2023-04-17_09-15-05-removebg-preview.png',NULL,NULL,472,242,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_15_05_removebg_preview_8245e994a8.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_15_05_removebg_preview_8245e994a8\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot_from_2023-04-17_09-15-05-removebg-preview.png\", \"path\": null, \"size\": 67.21, \"width\": 245, \"height\": 126}}','Screenshot_from_2023_04_17_09_15_05_removebg_preview_8245e994a8','.png','image/png',57.05,'/uploads/Screenshot_from_2023_04_17_09_15_05_removebg_preview_8245e994a8.png',NULL,'local',NULL,'/','2023-04-17 10:44:38.968000','2023-04-17 10:44:38.968000',1,1),(65,'Screenshot_from_2023-04-17_09-16-25-removebg-preview.png',NULL,NULL,322,483,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_Screenshot_from_2023_04_17_09_16_25_removebg_preview_609afd58ab.png\", \"hash\": \"thumbnail_Screenshot_from_2023_04_17_09_16_25_removebg_preview_609afd58ab\", \"mime\": \"image/png\", \"name\": \"thumbnail_Screenshot_from_2023-04-17_09-16-25-removebg-preview.png\", \"path\": null, \"size\": 25.27, \"width\": 104, \"height\": 156}}','Screenshot_from_2023_04_17_09_16_25_removebg_preview_609afd58ab','.png','image/png',27.40,'/uploads/Screenshot_from_2023_04_17_09_16_25_removebg_preview_609afd58ab.png',NULL,'local',NULL,'/','2023-04-17 10:44:39.052000','2023-04-17 10:44:39.052000',1,1),(66,'wallsticker-removebg-preview.png',NULL,NULL,361,411,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_wallsticker_removebg_preview_93013bb4b0.png\", \"hash\": \"thumbnail_wallsticker_removebg_preview_93013bb4b0\", \"mime\": \"image/png\", \"name\": \"thumbnail_wallsticker-removebg-preview.png\", \"path\": null, \"size\": 58.52, \"width\": 137, \"height\": 156}}','wallsticker_removebg_preview_93013bb4b0','.png','image/png',64.82,'/uploads/wallsticker_removebg_preview_93013bb4b0.png',NULL,'local',NULL,'/','2023-04-17 10:44:39.495000','2023-04-17 10:44:39.495000',1,1);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_folder_links`
--

DROP TABLE IF EXISTS `files_folder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_folder_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int unsigned DEFAULT NULL,
  `folder_id` int unsigned DEFAULT NULL,
  `file_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_folder_links_unique` (`file_id`,`folder_id`),
  KEY `files_folder_links_fk` (`file_id`),
  KEY `files_folder_links_inv_fk` (`folder_id`),
  KEY `files_folder_links_order_inv_fk` (`file_order`),
  CONSTRAINT `files_folder_links_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_folder_links_inv_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_folder_links`
--

LOCK TABLES `files_folder_links` WRITE;
/*!40000 ALTER TABLE `files_folder_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `files_folder_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_related_morphs`
--

DROP TABLE IF EXISTS `files_related_morphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_related_morphs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int unsigned DEFAULT NULL,
  `related_id` int unsigned DEFAULT NULL,
  `related_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_related_morphs_fk` (`file_id`),
  CONSTRAINT `files_related_morphs_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_related_morphs`
--

LOCK TABLES `files_related_morphs` WRITE;
/*!40000 ALTER TABLE `files_related_morphs` DISABLE KEYS */;
INSERT INTO `files_related_morphs` VALUES (37,2,5,'api::product.product','img',2),(40,2,3,'api::product.product','img',2),(44,2,4,'api::product.product','img',2),(52,6,6,'api::category.category','img',1),(53,7,1,'api::category.category','img',1),(56,2,1,'api::product.product','img',2),(58,53,7,'api::category.category','img',1),(59,54,8,'api::category.category','img',1),(60,55,9,'api::category.category','img',1),(63,27,10,'api::product.product','img',1),(64,27,10,'api::product.product','preview_img',1),(67,20,11,'api::product.product','img',1),(68,20,11,'api::product.product','preview_img',1),(75,30,13,'api::product.product','img',1),(76,30,13,'api::product.product','preview_img',1),(77,24,14,'api::product.product','img',1),(78,24,14,'api::product.product','preview_img',1),(79,29,9,'api::product.product','img',1),(80,29,9,'api::product.product','preview_img',1),(81,14,12,'api::product.product','img',1),(82,14,12,'api::product.product','preview_img',1),(89,19,17,'api::product.product','img',1),(90,19,17,'api::product.product','preview_img',1),(107,22,19,'api::product.product','img',1),(108,60,19,'api::product.product','preview_img',1),(109,18,23,'api::product.product','img',1),(110,65,23,'api::product.product','preview_img',1),(111,25,22,'api::product.product','img',1),(112,58,22,'api::product.product','preview_img',1),(113,15,15,'api::product.product','img',1),(114,63,15,'api::product.product','preview_img',1),(115,28,21,'api::product.product','img',1),(116,64,21,'api::product.product','preview_img',1),(117,26,20,'api::product.product','img',1),(118,56,20,'api::product.product','preview_img',1),(119,17,18,'api::product.product','img',1),(120,57,18,'api::product.product','preview_img',1),(121,13,16,'api::product.product','img',1),(122,59,16,'api::product.product','preview_img',1),(123,16,24,'api::product.product','img',1),(124,66,24,'api::product.product','preview_img',1);
/*!40000 ALTER TABLE `files_related_morphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i18n_locale`
--

DROP TABLE IF EXISTS `i18n_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `i18n_locale` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i18n_locale_created_by_id_fk` (`created_by_id`),
  KEY `i18n_locale_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `i18n_locale_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `i18n_locale_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i18n_locale`
--

LOCK TABLES `i18n_locale` WRITE;
/*!40000 ALTER TABLE `i18n_locale` DISABLE KEYS */;
INSERT INTO `i18n_locale` VALUES (1,'English (en)','en','2023-03-07 10:22:53.309000','2023-03-07 10:22:53.309000',NULL,NULL);
/*!40000 ALTER TABLE `i18n_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `shipping_address` json DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `quantities` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_created_by_id_fk` (`created_by_id`),
  KEY `orders_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `orders_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (42,'pm_1Mw2hkIWtXPnuJo1xP40IKIv','2023-04-12 15:23:18.418000','2023-04-13 12:21:29.474000','2023-04-12 15:23:18.401000',NULL,NULL,'c7021dec-b16b-4e07-a11a-cfb1f6b40b30','completed',121.21,'{\"city\": \"Mazeikiai\", \"address\": \"Tylioji g\", \"country\": \"Lithuaniasss\", \"postal_code\": \"39519\"}','4/13/2023','user@user.com','[1,1,1,1]'),(43,'pm_1Mw2hvIWtXPnuJo18vQ9Wy5H','2023-04-12 15:23:29.518000','2023-04-13 12:22:07.433000','2023-04-12 15:23:29.498000',NULL,NULL,'c7021dec-b16b-4e07-a11a-cfb1f6b40b30','shipped',11.12,'{\"city\": \"Mazeikiai\", \"address\": \"Tylioji g\", \"country\": \"Lithuaniasss\", \"postal_code\": \"39519\"}','4/13/2023','user@user.com','[1]'),(44,'pm_1Mw2icIWtXPnuJo1uapn1BfM','2023-04-12 15:24:12.359000','2023-04-13 12:01:33.926000','2023-04-12 15:24:12.347000',NULL,NULL,'c7021dec-b16b-4e07-a11a-cfb1f6b40b30','completed',411.05,'{\"city\": \"Mazeikiai\", \"address\": \"Tylioji g\", \"country\": \"Lithuaniasss\", \"postal_code\": \"39519\"}','4/13/2023','user@user.com','[5,5,2,2,5]'),(45,'pm_1MwkXgIWtXPnuJo1MEKn5WRh','2023-04-14 14:11:50.479000','2023-04-17 11:12:11.173000','2023-04-14 14:11:50.462000',NULL,NULL,'c7021dec-b16b-4e07-a11a-cfb1f6b40b30','shipped',11.00,'{\"city\": \"Mazeikiai\", \"address\": \"Tylioji g\", \"country\": \"Lithuaniasss\", \"postal_code\": \"39519\"}','4/17/2023','user@user.com','[1]'),(46,'pm_1MwkXgIWtXPnuJo15zgDtLYX','2023-04-14 14:11:50.826000','2023-04-14 14:11:50.826000','2023-04-14 14:11:50.819000',NULL,NULL,'c7021dec-b16b-4e07-a11a-cfb1f6b40b30','created',11.00,'{\"city\": \"Mazeikiai\", \"address\": \"Tylioji g\", \"country\": \"Lithuaniasss\", \"postal_code\": \"39519\"}','4/14/2023','user@user.com','[1]'),(47,'pm_1Mxn2WIWtXPnuJo1Z64NiwXZ','2023-04-17 11:03:58.938000','2023-04-17 11:03:58.938000','2023-04-17 11:03:58.929000',NULL,NULL,'c7021dec-b16b-4e07-a11a-cfb1f6b40b30','created',150.00,'{\"city\": \"Mazeikiai\", \"address\": \"Tylioji g\", \"country\": \"Lithuaniasss\", \"postal_code\": \"39519\"}','4/17/2023','user@user.com','[1]');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products_links`
--

DROP TABLE IF EXISTS `orders_products_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_products_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `product_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_products_links_unique` (`order_id`,`product_id`),
  KEY `orders_products_links_fk` (`order_id`),
  KEY `orders_products_links_inv_fk` (`product_id`),
  KEY `orders_products_links_order_fk` (`product_order`),
  CONSTRAINT `orders_products_links_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orders_products_links_inv_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products_links`
--

LOCK TABLES `orders_products_links` WRITE;
/*!40000 ALTER TABLE `orders_products_links` DISABLE KEYS */;
INSERT INTO `orders_products_links` VALUES (73,47,12,1);
/*!40000 ALTER TABLE `orders_products_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `price` decimal(10,2) DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `on_sale` tinyint(1) DEFAULT NULL,
  `width` decimal(10,2) DEFAULT NULL,
  `height` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_created_by_id_fk` (`created_by_id`),
  KEY `products_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `products_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (9,'Dynamic Dribble','Capture the thrilling energy of soccer with \"Dynamic Dribble,\" a stunning digital painting that depicts a skilled player kicking a ball with precision and finesse. Created by renowned artist Artistic Expressions, this masterpiece showcases the fluidity of motion and the intensity of the game, making it a perfect addition to any sports lover\'s collection. With vivid colors, intricate details, and a sense of dynamic movement, this digital painting is sure to make a bold statement in any room. ',72.00,1,'2023-04-17 09:57:16.334000','2023-04-17 10:10:26.706000','2023-04-17 09:57:17.438000',1,1,'trending','Artistic Expressions',0,160.00,160.00),(10,'Cosmic Curiosity','gnite your imagination with \"Cosmic Curiosity,\" a captivating digital painting that portrays a young boy in awe as he gazes at a spaceship soaring through the stars. Created by renowned artist Stellar Artworks, this piece captures the wonder and curiosity of space exploration, blending vivid colors and intricate details to transport you to a realm of infinite possibilities. The boy\'s expression of amazement as he looks up at the majestic spaceship draws you into the scene and sparks your own sense of adventure. ',79.99,0,'2023-04-17 10:00:26.369000','2023-04-17 10:00:27.268000','2023-04-17 10:00:27.264000',1,1,'featured','Stellar Artworks',1,160.00,160.00),(11,'Galactic Explorer','mbark on an otherworldly adventure with \"Galactic Explorer,\" a breathtaking digital art piece that depicts an astronaut on a majestic horse traversing the vastness of the galaxy. Created by renowned artist Cosmic Creations, this captivating artwork combines the beauty of the cosmos with the mystery of exploration. The astronaut, clad in a futuristic spacesuit, rides fearlessly on a cosmic horse, symbolizing the boundless spirit of human curiosity and discovery. With its mesmerizing colors, stunning details, and surreal composition, \"Galactic Explorer\" transports you to a realm of cosmic wonder, where dreams and reality merge. ',123.00,0,'2023-04-17 10:02:41.511000','2023-04-17 10:03:15.581000','2023-04-17 10:02:59.613000',1,1,'normal','Cosmic Creations',0,200.00,200.00),(12,'Radiant Blooms','Experience the beauty of nature with \"Radiant Blooms,\" a stunning sunflower oil painting that bursts with vibrant colors and captures the essence of these iconic flowers. Created by the renowned artist Artistic Expressions, this masterpiece is a celebration of the sunflower\'s radiant hues and joyful spirit. The bold and vivid colors of the sunflowers stand out against the canvas, bringing warmth and energy to any space. The intricately painted petals and textured details add depth and dimension to the artwork, creating a visual feast for the eyes. ',150.00,1,'2023-04-17 10:05:18.448000','2023-04-17 10:10:33.728000','2023-04-17 10:05:33.407000',1,1,'normal','Artistic Expressions',0,100.00,100.00),(13,'Misty Serenity','Experience the tranquility of a misty sky with \"Misty Serenity,\" a captivating oil painting that depicts clouds swirling in a serene and ethereal gray sky. Created by the talented artist Skyward Brushstrokes, this artwork captures the beauty of nature\'s subtleties in a stunning display of oil on canvas. The varying shades of gray create a sense of depth and moodiness, evoking a sense of calm and stillness. The skillful brushstrokes and texture in the clouds add a sense of realism and bring the scene to life, as if you can almost feel the mist in the air. ',189.00,0,'2023-04-17 10:07:16.737000','2023-04-17 10:08:08.029000','2023-04-17 10:07:24.581000',1,1,'trending','Skyward Brushstrokes',0,120.00,120.00),(14,'Tangy Delights','Indulge in the simple pleasures of life with \"Tangy Delights,\" a captivating oil painting that captures the vibrant colors and juicy essence of an orange resting in a cup on a table. Created by the talented artist Citrus Artistry, this artwork is a celebration of the beauty of everyday objects and the joy they can bring. The rich and warm tones of the orange contrast against the neutral colors of the table, creating a captivating visual interplay. ',149.99,0,'2023-04-17 10:10:12.561000','2023-04-17 10:10:20.286000','2023-04-17 10:10:20.281000',1,1,'trending','Citrus Artistry',1,120.00,120.00),(15,'Industrial Elegance','Add a touch of industrial elegance to your home with our \"Metal Flower\" wall sticker by Modern Metallics. This unique and eye-catching wall sticker features a meticulously designed metal flower in a contemporary and minimalist style. The intricate details of the metal petals, stem, and leaves create a stunning visual effect that adds depth and dimension to any wall. The metallic finish of the sticker adds a touch of modernity and sophistication, making it a perfect addition to any room with a modern or industrial decor theme. The peel-and-stick design of the wall sticker makes it easy to apply and remove without leaving any residue, allowing you to effortlessly transform your space in minutes. ',25.00,0,'2023-04-17 10:12:17.267000','2023-04-17 10:47:23.208000','2023-04-17 10:12:19.911000',1,1,'normal','Modern Metallics',0,50.00,120.00),(16,'Vintage Charm','Add a touch of vintage charm to your home with our \"Wooden Wall Clock with Old School Style\" by Timeless Treasures. This classic and timeless wall clock features a wooden frame with a distressed finish, giving it an authentic vintage look and feel. The simple yet elegant design of the clock face with bold, easy-to-read numbers and classic black hands adds a touch of nostalgia and sophistication to any room. The reliable quartz movement ensures accurate timekeeping, while the silent sweeping motion of the clock hands eliminates any ticking noise, making it ideal for quiet spaces like bedrooms or libraries. The wooden frame is crafted with high-quality materials for durability and longevity, making it a functional and decorative piece that will stand the test of time.',89.00,0,'2023-04-17 10:14:49.995000','2023-04-17 10:48:10.149000','2023-04-17 10:14:50.846000',1,1,'featured','Timeless Treasures',1,120.00,240.00),(17,'Ethereal Flutter','Immerse yourself in the enchanting beauty of nature with \"Ethereal Flutter,\" a mesmerizing oil painting that captures the grace and delicacy of white butterflies in the dark. Created by the talented artist Mystical Brushstrokes, this artwork is a stunning depiction of the contrast between light and darkness, creating a sense of mystery and wonder. The white butterflies seem to dance in the air, their wings delicately rendered with intricate details, while the dark background adds depth and richness to the composition. The use of oil paints creates a luminous quality, with the butterflies appearing almost ethereal and glowing against the darkness. The composition evokes a sense of serenity and tranquility, inviting viewers to be captivated by the beauty of these winged creatures. \"Ethereal Flutter\" is a perfect addition to any art lover\'s collection, adding a touch of magic and mystery to your home or office. ',340.00,1,'2023-04-17 10:18:08.604000','2023-04-17 10:18:18.113000','2023-04-17 10:18:18.110000',1,1,'featured','Mystical Brushstrokes',0,200.00,200.00),(18,'Reflective Charm','Add a touch of elegance and functionality to any room with our \"Reflective Charm\" small mirror by Mirror Magic. This versatile and stylish mirror is designed to suit every space, from bedrooms to bathrooms, hallways to entryways. Its compact size makes it perfect for smaller areas where space may be limited, while its sleek and minimalist design complements any decor style. The mirror features a high-quality glass surface that provides clear and distortion-free reflection, allowing you to easily check your appearance or add a touch of brightness to your space. The frameless design of the mirror creates a seamless and modern look that seamlessly blends with any wall color or pattern. ',15.00,0,'2023-04-17 10:20:36.085000','2023-04-17 10:47:59.097000','2023-04-17 10:20:36.913000',1,1,'normal','Mirror Magic',1,50.00,50.00),(19,'Elegant Reflections','Make a bold statement with our \"Elegant Reflections\" large mirror by Mirror Masterpieces. This stunning mirror is designed to be the focal point of any room, adding a touch of elegance and grandeur to your space. With its generous size and striking design, this mirror is perfect for larger spaces such as living rooms, dining rooms, or entryways, where it can create a dramatic visual impact. The mirror features a high-quality glass surface that provides clear and distortion-free reflection, allowing you to check your appearance or enhance the brightness of your space. The ornate frame is meticulously crafted with intricate details, adding a touch of sophistication and luxury to the mirror. The frame is available in a variety of finishes, from classic gold to sleek silver or rich wood tones, allowing you to choose the perfect match for your decor style. ',130.00,0,'2023-04-17 10:21:57.367000','2023-04-17 10:46:52.981000','2023-04-17 10:22:14.444000',1,1,'normal','Mirror Masterpieces',0,150.00,240.00),(20,'Radiant Love','Add a burst of vibrant love to your space with our \"Radiant Love\" neon heart sign by Neon Nostalgia. This eye-catching and unique neon sign features a heart shape illuminated with bright, glowing neon tubing, creating a captivating display that instantly adds warmth and charm to any room. The neon heart emits a warm and inviting glow that creates a cozy and romantic ambiance, making it a perfect addition to bedrooms, living rooms, or even as a special touch for weddings, events, or parties. The sign is easy to install with its pre-drilled holes and included mounting hardware, allowing you to hang it on your wall, display it on a shelf, or even prop it up on a tabletop for a versatile display option. ',42.00,1,'2023-04-17 10:24:44.878000','2023-04-17 10:47:44.016000','2023-04-17 10:24:45.763000',1,1,'trending','Neon Nostalgia',0,120.00,120.00),(21,'Positive Energy','levate your space with positivity and good vibes with our \"Positive Energy\" neon sign by Neon Nirvana. This eye-catching and vibrant neon sign features the words \"Good Vibes\" illuminated with bright neon tubing, creating a captivating display that instantly adds a touch of positivity and optimism to any room. The neon sign emits a warm and inviting glow that creates a cheerful and uplifting ambiance, making it a perfect addition to bedrooms, living rooms, home offices, or even as a statement piece for events or parties. The sign is easy to install with its pre-drilled holes and included mounting hardware, allowing you to hang it on your wall, display it on a shelf, or even prop it up on a tabletop for a versatile display option. The neon tubing is energy-efficient and long-lasting, providing a lasting source of good vibes for years to come. ',66.00,0,'2023-04-17 10:26:26.230000','2023-04-17 10:47:31.073000','2023-04-17 10:26:27.038000',1,1,'normal','Neon Nirvana',1,200.00,150.00),(22,'Home Sweet Home','Create a warm and welcoming atmosphere with our \"Home Sweet Home: Let\'s Stay Home\" neon sign by Neon Nest. This charming and inviting neon sign features the words \"Let\'s Stay Home\" illuminated with bright neon tubing, creating a cozy and nostalgic display that instantly adds a touch of comfort and relaxation to any room. The warm glow of the neon sign creates a welcoming ambiance, making it a perfect addition to living rooms, bedrooms, or even as a focal point for home bars or entertainment areas. The sign is easy to install with its pre-drilled holes and included mounting hardware, allowing you to hang it on your wall, display it on a shelf, or even prop it up on a tabletop for a versatile display option. ',49.99,0,'2023-04-17 10:28:54.024000','2023-04-17 10:47:10.102000','2023-04-17 10:28:55.772000',1,1,'normal','Neon Nest',1,150.00,150.00),(23,'Ethereal Embrace','Add a touch of artistic intrigue to your space with our \"Ethereal Embrace\" metal wall sticker by Metal Marvels. This unique and captivating wall sticker features a stunning depiction of a woman\'s face being gently held by a pair of hands, creating a mesmerizing visual that exudes mystery and beauty. The metal material adds a modern and industrial touch to the design, giving it a unique and edgy look that stands out on any wall. The intricate details of the woman\'s face and the delicate positioning of the hands create a sense of intimacy and connection, making it a perfect focal point for bedrooms, living rooms, or even as a statement piece for art enthusiasts. The wall sticker is easy to apply with its adhesive backing, and it can be easily removed without leaving any residue, making it a convenient and flexible decor option. The metal material is durable and long-lasting, ensuring that the \"Ethereal Embrace\" wall sticker will adorn your walls for years to come.',75.00,1,'2023-04-17 10:31:34.403000','2023-04-17 10:47:01.219000','2023-04-17 10:31:35.183000',1,1,'featured','Metal Marvels',0,110.00,180.00),(24,'Whimsical Delight','Transform your walls into a vibrant and enchanting scene with our \"Whimsical Delight\" wall sticker by Artistic Accents. This delightful and colorful wall sticker features a beautifully painted tree adorned with playful birds and an array of colorful leaves, creating a whimsical and inviting atmosphere in any room. The intricate details and artistic design make this wall sticker a true work of art, adding a touch of charm and creativity to your walls. The vibrant colors of the leaves and birds add a pop of personality and liveliness to your space, making it a perfect addition to nurseries, playrooms, or any room in need of a touch of nature-inspired whimsy. The high-quality adhesive backing makes it easy to apply the wall sticker to any smooth surface, and it can be easily removed without leaving any residue, allowing you to update your decor with ease.',30.00,0,'2023-04-17 10:33:54.164000','2023-04-17 10:48:19.891000','2023-04-17 10:33:55.529000',1,1,'normal','Artistic Accents',0,250.00,250.00);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_category_links`
--

DROP TABLE IF EXISTS `products_category_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_category_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `product_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_category_links_unique` (`product_id`,`category_id`),
  KEY `products_category_links_fk` (`product_id`),
  KEY `products_category_links_inv_fk` (`category_id`),
  KEY `products_category_links_order_inv_fk` (`product_order`),
  CONSTRAINT `products_category_links_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_category_links_inv_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_category_links`
--

LOCK TABLES `products_category_links` WRITE;
/*!40000 ALTER TABLE `products_category_links` DISABLE KEYS */;
INSERT INTO `products_category_links` VALUES (10,9,1,1),(11,10,1,2),(12,11,1,3),(13,12,1,4),(14,13,1,5),(15,14,1,6),(16,15,9,1),(17,16,8,1),(18,17,1,7),(19,18,6,1),(20,19,6,2),(21,20,7,1),(22,21,7,2),(23,22,7,3),(24,23,9,2),(25,24,9,3);
/*!40000 ALTER TABLE `products_category_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_sub_category_links`
--

DROP TABLE IF EXISTS `products_sub_category_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_sub_category_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `sub_category_id` int unsigned DEFAULT NULL,
  `product_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sub_category_links_unique` (`product_id`,`sub_category_id`),
  KEY `products_sub_category_links_fk` (`product_id`),
  KEY `products_sub_category_links_inv_fk` (`sub_category_id`),
  KEY `products_sub_category_links_order_inv_fk` (`product_order`),
  CONSTRAINT `products_sub_category_links_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_sub_category_links_inv_fk` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_sub_category_links`
--

LOCK TABLES `products_sub_category_links` WRITE;
/*!40000 ALTER TABLE `products_sub_category_links` DISABLE KEYS */;
INSERT INTO `products_sub_category_links` VALUES (9,9,3,1),(10,10,3,2),(11,11,3,3),(12,12,1,1),(13,13,1,2),(14,14,1,3),(15,15,9,1),(16,16,8,1),(17,17,1,4),(18,18,5,1),(19,19,6,1),(20,20,4,1),(21,21,4,2),(22,22,4,3),(23,23,9,2),(24,24,10,1);
/*!40000 ALTER TABLE `products_sub_category_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_token_permissions`
--

DROP TABLE IF EXISTS `strapi_api_token_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_api_token_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_token_permissions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_token_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_token_permissions`
--

LOCK TABLES `strapi_api_token_permissions` WRITE;
/*!40000 ALTER TABLE `strapi_api_token_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_api_token_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_token_permissions_token_links`
--

DROP TABLE IF EXISTS `strapi_api_token_permissions_token_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_api_token_permissions_token_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `api_token_permission_id` int unsigned DEFAULT NULL,
  `api_token_id` int unsigned DEFAULT NULL,
  `api_token_permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_api_token_permissions_token_links_unique` (`api_token_permission_id`,`api_token_id`),
  KEY `strapi_api_token_permissions_token_links_fk` (`api_token_permission_id`),
  KEY `strapi_api_token_permissions_token_links_inv_fk` (`api_token_id`),
  KEY `strapi_api_token_permissions_token_links_order_inv_fk` (`api_token_permission_order`),
  CONSTRAINT `strapi_api_token_permissions_token_links_fk` FOREIGN KEY (`api_token_permission_id`) REFERENCES `strapi_api_token_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_api_token_permissions_token_links_inv_fk` FOREIGN KEY (`api_token_id`) REFERENCES `strapi_api_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_token_permissions_token_links`
--

LOCK TABLES `strapi_api_token_permissions_token_links` WRITE;
/*!40000 ALTER TABLE `strapi_api_token_permissions_token_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_api_token_permissions_token_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_tokens`
--

DROP TABLE IF EXISTS `strapi_api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_api_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_tokens`
--

LOCK TABLES `strapi_api_tokens` WRITE;
/*!40000 ALTER TABLE `strapi_api_tokens` DISABLE KEYS */;
INSERT INTO `strapi_api_tokens` VALUES (1,'persuasive-key','','full-access','302bb0aa8abfa436eca6cdd9ce70e6d96956447a3806f5e8acf6561239b5bea5ef1287838873621cd004fa42420f649015b342467d6b2957264b092e30c15f70','2023-04-17 11:18:10.458000',NULL,NULL,'2023-03-07 10:56:34.997000','2023-04-17 11:18:10.458000',NULL,NULL);
/*!40000 ALTER TABLE `strapi_api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_core_store_settings`
--

DROP TABLE IF EXISTS `strapi_core_store_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_core_store_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_core_store_settings`
--

LOCK TABLES `strapi_core_store_settings` WRITE;
/*!40000 ALTER TABLE `strapi_core_store_settings` DISABLE KEYS */;
INSERT INTO `strapi_core_store_settings` VALUES (1,'strapi_content_types_schema','{\"admin::permission\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"admin::permission\",\"plugin\":\"admin\",\"globalId\":\"AdminPermission\"},\"admin::user\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"admin::user\",\"plugin\":\"admin\",\"globalId\":\"AdminUser\"},\"admin::role\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"admin::role\",\"plugin\":\"admin\",\"globalId\":\"AdminRole\"},\"admin::api-token\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"api-token\",\"connection\":\"default\",\"uid\":\"admin::api-token\",\"plugin\":\"admin\",\"globalId\":\"AdminApiToken\"},\"admin::api-token-permission\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"api-token-permission\",\"connection\":\"default\",\"uid\":\"admin::api-token-permission\",\"plugin\":\"admin\",\"globalId\":\"AdminApiTokenPermission\"},\"admin::transfer-token\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"transfer-token\",\"connection\":\"default\",\"uid\":\"admin::transfer-token\",\"plugin\":\"admin\",\"globalId\":\"AdminTransferToken\"},\"admin::transfer-token-permission\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"transfer-token-permission\",\"connection\":\"default\",\"uid\":\"admin::transfer-token-permission\",\"plugin\":\"admin\",\"globalId\":\"AdminTransferTokenPermission\"},\"plugin::upload.file\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"min\":1,\"required\":true,\"private\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"indexes\":[{\"name\":\"upload_files_folder_path_index\",\"columns\":[\"folder_path\"],\"type\":null},{\"name\":\"upload_files_created_at_index\",\"columns\":[\"created_at\"],\"type\":null},{\"name\":\"upload_files_updated_at_index\",\"columns\":[\"updated_at\"],\"type\":null},{\"name\":\"upload_files_name_index\",\"columns\":[\"name\"],\"type\":null},{\"name\":\"upload_files_size_index\",\"columns\":[\"size\"],\"type\":null},{\"name\":\"upload_files_ext_index\",\"columns\":[\"ext\"],\"type\":null}],\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"min\":1,\"required\":true,\"private\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"file\",\"connection\":\"default\",\"uid\":\"plugin::upload.file\",\"plugin\":\"upload\",\"globalId\":\"UploadFile\"},\"plugin::upload.folder\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"min\":1,\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"indexes\":[{\"name\":\"upload_folders_path_id_index\",\"columns\":[\"path_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_path_index\",\"columns\":[\"path\"],\"type\":\"unique\"}],\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"min\":1,\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"folder\",\"connection\":\"default\",\"uid\":\"plugin::upload.folder\",\"plugin\":\"upload\",\"globalId\":\"UploadFolder\"},\"plugin::i18n.locale\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"locale\",\"connection\":\"default\",\"uid\":\"plugin::i18n.locale\",\"plugin\":\"i18n\",\"collectionName\":\"i18n_locale\",\"globalId\":\"I18NLocale\"},\"plugin::users-permissions.permission\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.permission\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsPermission\"},\"plugin::users-permissions.role\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.role\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsRole\"},\"plugin::users-permissions.user\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"confirmationToken\":{\"hidden\":true},\"provider\":{\"hidden\":true}}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.user\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsUser\"},\"api::category.category\":{\"kind\":\"collectionType\",\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"Category\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"description\":{\"type\":\"text\"},\"img\":{\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"],\"type\":\"media\",\"multiple\":false},\"products\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::product.product\",\"mappedBy\":\"category\"},\"sub_categories\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::sub-category.sub-category\",\"mappedBy\":\"category\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"Category\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"description\":{\"type\":\"text\"},\"img\":{\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"],\"type\":\"media\",\"multiple\":false},\"products\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::product.product\",\"mappedBy\":\"category\"},\"sub_categories\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::sub-category.sub-category\",\"mappedBy\":\"category\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"category\",\"connection\":\"default\",\"uid\":\"api::category.category\",\"apiName\":\"category\",\"globalId\":\"Category\",\"actions\":{},\"lifecycles\":{}},\"api::order.order\":{\"kind\":\"collectionType\",\"collectionName\":\"orders\",\"info\":{\"singularName\":\"order\",\"pluralName\":\"orders\",\"displayName\":\"Order\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"OrderId\":{\"type\":\"string\",\"unique\":true},\"userId\":{\"type\":\"string\"},\"products\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::product.product\"},\"order_status\":{\"type\":\"enumeration\",\"enum\":[\"created\",\"confirmed\",\"shipped\",\"canceled\",\"completed\"]},\"total_cost\":{\"type\":\"decimal\"},\"shipping_address\":{\"type\":\"json\"},\"order_date\":{\"type\":\"string\"},\"email\":{\"type\":\"string\"},\"quantities\":{\"type\":\"string\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"orders\",\"info\":{\"singularName\":\"order\",\"pluralName\":\"orders\",\"displayName\":\"Order\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"OrderId\":{\"type\":\"string\",\"unique\":true},\"userId\":{\"type\":\"string\"},\"products\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::product.product\"},\"order_status\":{\"type\":\"enumeration\",\"enum\":[\"created\",\"confirmed\",\"shipped\",\"canceled\",\"completed\"]},\"total_cost\":{\"type\":\"decimal\"},\"shipping_address\":{\"type\":\"json\"},\"order_date\":{\"type\":\"string\"},\"email\":{\"type\":\"string\"},\"quantities\":{\"type\":\"string\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"order\",\"connection\":\"default\",\"uid\":\"api::order.order\",\"apiName\":\"order\",\"globalId\":\"Order\",\"actions\":{},\"lifecycles\":{}},\"api::product.product\":{\"kind\":\"collectionType\",\"collectionName\":\"products\",\"info\":{\"singularName\":\"product\",\"pluralName\":\"products\",\"displayName\":\"Product\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"description\":{\"type\":\"text\"},\"img\":{\"type\":\"media\",\"multiple\":true,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"price\":{\"type\":\"decimal\"},\"new\":{\"type\":\"boolean\",\"default\":false},\"category\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::category.category\",\"inversedBy\":\"products\"},\"sub_category\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::sub-category.sub-category\",\"inversedBy\":\"products\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"normal\",\"trending\",\"featured\"],\"default\":\"normal\"},\"author\":{\"type\":\"string\"},\"on_sale\":{\"type\":\"boolean\",\"default\":false},\"width\":{\"type\":\"decimal\"},\"height\":{\"type\":\"decimal\"},\"preview_img\":{\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"],\"type\":\"media\",\"multiple\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"products\",\"info\":{\"singularName\":\"product\",\"pluralName\":\"products\",\"displayName\":\"Product\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"description\":{\"type\":\"text\"},\"img\":{\"type\":\"media\",\"multiple\":true,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"price\":{\"type\":\"decimal\"},\"new\":{\"type\":\"boolean\",\"default\":false},\"category\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::category.category\",\"inversedBy\":\"products\"},\"sub_category\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::sub-category.sub-category\",\"inversedBy\":\"products\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"normal\",\"trending\",\"featured\"],\"default\":\"normal\"},\"author\":{\"type\":\"string\"},\"on_sale\":{\"type\":\"boolean\",\"default\":false},\"width\":{\"type\":\"decimal\"},\"height\":{\"type\":\"decimal\"},\"preview_img\":{\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"],\"type\":\"media\",\"multiple\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"product\",\"connection\":\"default\",\"uid\":\"api::product.product\",\"apiName\":\"product\",\"globalId\":\"Product\",\"actions\":{},\"lifecycles\":{}},\"api::sub-category.sub-category\":{\"kind\":\"collectionType\",\"collectionName\":\"sub_categories\",\"info\":{\"singularName\":\"sub-category\",\"pluralName\":\"sub-categories\",\"displayName\":\"SubCategory\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"category\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::category.category\",\"inversedBy\":\"sub_categories\"},\"products\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::product.product\",\"mappedBy\":\"sub_category\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"sub_categories\",\"info\":{\"singularName\":\"sub-category\",\"pluralName\":\"sub-categories\",\"displayName\":\"SubCategory\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"category\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::category.category\",\"inversedBy\":\"sub_categories\"},\"products\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::product.product\",\"mappedBy\":\"sub_category\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"sub-category\",\"connection\":\"default\",\"uid\":\"api::sub-category.sub-category\",\"apiName\":\"sub-category\",\"globalId\":\"SubCategory\",\"actions\":{},\"lifecycles\":{}}}','object',NULL,NULL),(2,'plugin_content_manager_configuration_content_types::admin::permission','{\"uid\":\"admin::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"properties\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}],[{\"name\":\"role\",\"size\":6}]]}}','object',NULL,NULL),(3,'plugin_content_manager_configuration_content_types::admin::role','{\"uid\":\"admin::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6},{\"name\":\"users\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6}]]}}','object',NULL,NULL),(4,'plugin_content_manager_configuration_content_types::admin::api-token','{\"uid\":\"admin::api-token\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"accessKey\",\"size\":6}],[{\"name\":\"lastUsedAt\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"expiresAt\",\"size\":6},{\"name\":\"lifespan\",\"size\":4}]]}}','object',NULL,NULL),(5,'plugin_content_manager_configuration_content_types::admin::api-token-permission','{\"uid\":\"admin::api-token-permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]}}','object',NULL,NULL),(6,'plugin_content_manager_configuration_content_types::admin::transfer-token','{\"uid\":\"admin::transfer-token\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"accessKey\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"accessKey\",\"size\":6},{\"name\":\"lastUsedAt\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6},{\"name\":\"expiresAt\",\"size\":6}],[{\"name\":\"lifespan\",\"size\":4}]]}}','object',NULL,NULL),(7,'plugin_content_manager_configuration_content_types::admin::transfer-token-permission','{\"uid\":\"admin::transfer-token-permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]}}','object',NULL,NULL),(8,'plugin_content_manager_configuration_content_types::plugin::upload.file','{\"uid\":\"plugin::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"alternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"alternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"previewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"previewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider_metadata\",\"searchable\":false,\"sortable\":false}},\"folder\":{\"edit\":{\"label\":\"folder\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"folder\",\"searchable\":true,\"sortable\":true}},\"folderPath\":{\"edit\":{\"label\":\"folderPath\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"folderPath\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}],[{\"name\":\"folder\",\"size\":6},{\"name\":\"folderPath\",\"size\":6}]]}}','object',NULL,NULL),(9,'plugin_content_manager_configuration_content_types::plugin::upload.folder','{\"uid\":\"plugin::upload.folder\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"pathId\":{\"edit\":{\"label\":\"pathId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"pathId\",\"searchable\":true,\"sortable\":true}},\"parent\":{\"edit\":{\"label\":\"parent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"parent\",\"searchable\":true,\"sortable\":true}},\"children\":{\"edit\":{\"label\":\"children\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"children\",\"searchable\":false,\"sortable\":false}},\"files\":{\"edit\":{\"label\":\"files\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"files\",\"searchable\":false,\"sortable\":false}},\"path\":{\"edit\":{\"label\":\"path\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"path\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"pathId\",\"parent\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"pathId\",\"size\":4}],[{\"name\":\"parent\",\"size\":6},{\"name\":\"children\",\"size\":6}],[{\"name\":\"files\",\"size\":6},{\"name\":\"path\",\"size\":6}]]}}','object',NULL,NULL),(10,'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission','{\"uid\":\"plugin::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"role\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"role\",\"size\":6}]]}}','object',NULL,NULL),(11,'plugin_content_manager_configuration_content_types::plugin::users-permissions.user','{\"uid\":\"plugin::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"confirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"confirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"role\",\"size\":6}]]}}','object',NULL,NULL),(12,'plugin_content_manager_configuration_content_types::plugin::i18n.locale','{\"uid\":\"plugin::i18n.locale\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"createdAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]]}}','object',NULL,NULL),(13,'plugin_content_manager_configuration_content_types::plugin::users-permissions.role','{\"uid\":\"plugin::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"users\",\"size\":6}]]}}','object',NULL,NULL),(14,'plugin_content_manager_configuration_content_types::admin::user','{\"uid\":\"admin::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"registrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"registrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"isActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"preferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"preferedLanguage\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"registrationToken\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"roles\",\"size\":6},{\"name\":\"blocked\",\"size\":4}],[{\"name\":\"preferedLanguage\",\"size\":6}]]}}','object',NULL,NULL),(15,'plugin_upload_settings','{\"sizeOptimization\":true,\"responsiveDimensions\":true,\"autoOrientation\":false}','object',NULL,NULL),(16,'plugin_upload_view_configuration','{\"pageSize\":10,\"sort\":\"createdAt:DESC\"}','object',NULL,NULL),(17,'plugin_upload_metrics','{\"weeklySchedule\":\"15 7 12 * * 2\",\"lastWeeklyUpdate\":1681204035060}','object',NULL,NULL),(18,'plugin_users-permissions_grant','{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"api/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"enabled\":false,\"icon\":\"reddit\",\"key\":\"\",\"secret\":\"\",\"state\":true,\"callback\":\"api/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"api/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"enabled\":false,\"icon\":\"book\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"},\"patreon\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/patreon/callback\",\"scope\":[\"identity\",\"identity[email]\"]}}','object',NULL,NULL),(19,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}','object',NULL,NULL),(20,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"authenticated\"}','object',NULL,NULL),(21,'plugin_i18n_default_locale','\"en\"','string',NULL,NULL),(22,'core_admin_auth','{\"providers\":{\"autoRegister\":false,\"defaultRole\":null}}','object',NULL,NULL),(23,'plugin_content_manager_configuration_content_types::api::product.product','{\"uid\":\"api::product.product\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"img\":{\"edit\":{\"label\":\"img\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"img\",\"searchable\":false,\"sortable\":false}},\"price\":{\"edit\":{\"label\":\"price\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"price\",\"searchable\":true,\"sortable\":true}},\"new\":{\"edit\":{\"label\":\"new\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"new\",\"searchable\":true,\"sortable\":true}},\"category\":{\"edit\":{\"label\":\"category\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"category\",\"searchable\":true,\"sortable\":true}},\"sub_category\":{\"edit\":{\"label\":\"sub_category\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"sub_category\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"author\":{\"edit\":{\"label\":\"author\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"author\",\"searchable\":true,\"sortable\":true}},\"on_sale\":{\"edit\":{\"label\":\"on_sale\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"on_sale\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"height\",\"searchable\":true,\"sortable\":true}},\"preview_img\":{\"edit\":{\"label\":\"preview_img\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"preview_img\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"description\",\"img\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"img\",\"size\":6}],[{\"name\":\"price\",\"size\":4},{\"name\":\"new\",\"size\":4}],[{\"name\":\"category\",\"size\":6},{\"name\":\"sub_category\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"author\",\"size\":6}],[{\"name\":\"on_sale\",\"size\":4},{\"name\":\"width\",\"size\":4},{\"name\":\"height\",\"size\":4}],[{\"name\":\"preview_img\",\"size\":6}]]}}','object',NULL,NULL),(24,'plugin_content_manager_configuration_content_types::api::category.category','{\"uid\":\"api::category.category\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"img\":{\"edit\":{\"label\":\"img\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"img\",\"searchable\":false,\"sortable\":false}},\"products\":{\"edit\":{\"label\":\"products\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"products\",\"searchable\":false,\"sortable\":false}},\"sub_categories\":{\"edit\":{\"label\":\"sub_categories\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"sub_categories\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"description\",\"img\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"img\",\"size\":6},{\"name\":\"products\",\"size\":6}],[{\"name\":\"sub_categories\",\"size\":6}]]}}','object',NULL,NULL),(25,'plugin_content_manager_configuration_content_types::api::sub-category.sub-category','{\"uid\":\"api::sub-category.sub-category\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"category\":{\"edit\":{\"label\":\"category\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"category\",\"searchable\":true,\"sortable\":true}},\"products\":{\"edit\":{\"label\":\"products\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"products\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"category\",\"products\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"category\",\"size\":6}],[{\"name\":\"products\",\"size\":6}]]}}','object',NULL,NULL),(28,'plugin_content_manager_configuration_content_types::api::order.order','{\"uid\":\"api::order.order\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"OrderId\",\"defaultSortBy\":\"OrderId\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"OrderId\":{\"edit\":{\"label\":\"OrderId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"OrderId\",\"searchable\":true,\"sortable\":true}},\"userId\":{\"edit\":{\"label\":\"userId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"userId\",\"searchable\":true,\"sortable\":true}},\"products\":{\"edit\":{\"label\":\"products\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"products\",\"searchable\":false,\"sortable\":false}},\"order_status\":{\"edit\":{\"label\":\"order_status\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"order_status\",\"searchable\":true,\"sortable\":true}},\"total_cost\":{\"edit\":{\"label\":\"total_cost\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"total_cost\",\"searchable\":true,\"sortable\":true}},\"shipping_address\":{\"edit\":{\"label\":\"shipping_address\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"shipping_address\",\"searchable\":false,\"sortable\":false}},\"order_date\":{\"edit\":{\"label\":\"order_date\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"order_date\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"quantities\":{\"edit\":{\"label\":\"quantities\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"quantities\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"OrderId\",\"userId\",\"products\",\"order_status\",\"order_date\"],\"edit\":[[{\"name\":\"OrderId\",\"size\":6},{\"name\":\"userId\",\"size\":6}],[{\"name\":\"products\",\"size\":6},{\"name\":\"order_status\",\"size\":6}],[{\"name\":\"total_cost\",\"size\":4}],[{\"name\":\"shipping_address\",\"size\":12}],[{\"name\":\"order_date\",\"size\":4},{\"name\":\"email\",\"size\":6}],[{\"name\":\"quantities\",\"size\":6}]]}}','object',NULL,NULL);
/*!40000 ALTER TABLE `strapi_core_store_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_database_schema`
--

DROP TABLE IF EXISTS `strapi_database_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_database_schema` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `schema` json DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_database_schema`
--

LOCK TABLES `strapi_database_schema` WRITE;
/*!40000 ALTER TABLE `strapi_database_schema` DISABLE KEYS */;
INSERT INTO `strapi_database_schema` VALUES (25,'{\"tables\": [{\"name\": \"strapi_core_store_settings\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"value\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"environment\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"tag\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"strapi_webhooks\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"url\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"headers\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"events\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"enabled\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"admin_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"subject\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"properties\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"conditions\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"admin_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"admin_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_users\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"firstname\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"lastname\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"username\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"password\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"reset_password_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"registration_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"is_active\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"blocked\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"prefered_language\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_users_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"admin_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"admin_users_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_roles\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"code\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"admin_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"admin_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_api_tokens\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"access_key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"last_used_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"expires_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"lifespan\", \"type\": \"bigInteger\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_api_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_api_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_api_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_api_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_api_token_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_api_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_api_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_api_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_api_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_transfer_tokens\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"access_key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"last_used_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"expires_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"lifespan\", \"type\": \"bigInteger\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_transfer_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_transfer_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_transfer_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_transfer_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_transfer_token_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_transfer_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_transfer_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_transfer_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_transfer_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"files\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"alternative_text\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"caption\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"width\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"height\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"formats\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"hash\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"ext\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"mime\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [10, 2], \"name\": \"size\", \"type\": \"decimal\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"preview_url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"provider\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"provider_metadata\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"folder_path\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"upload_files_folder_path_index\", \"type\": null, \"columns\": [\"folder_path\"]}, {\"name\": \"upload_files_created_at_index\", \"type\": null, \"columns\": [\"created_at\"]}, {\"name\": \"upload_files_updated_at_index\", \"type\": null, \"columns\": [\"updated_at\"]}, {\"name\": \"upload_files_name_index\", \"type\": null, \"columns\": [\"name\"]}, {\"name\": \"upload_files_size_index\", \"type\": null, \"columns\": [\"size\"]}, {\"name\": \"upload_files_ext_index\", \"type\": null, \"columns\": [\"ext\"]}, {\"name\": \"files_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"files_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"files_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"files_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"upload_folders\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"path_id\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"path\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"upload_folders_path_id_index\", \"type\": \"unique\", \"columns\": [\"path_id\"]}, {\"name\": \"upload_folders_path_index\", \"type\": \"unique\", \"columns\": [\"path\"]}, {\"name\": \"upload_folders_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"upload_folders_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"upload_folders_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"upload_folders_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"i18n_locale\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"code\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"i18n_locale_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"i18n_locale_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"i18n_locale_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"i18n_locale_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"up_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"up_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_roles\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"up_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"up_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_users\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"username\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"provider\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"password\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"reset_password_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"confirmation_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"confirmed\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"blocked\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_users_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"up_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"up_users_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"categories\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"categories_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"categories_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"categories_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"categories_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"orders\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"order_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"user_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order_status\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [10, 2], \"name\": \"total_cost\", \"type\": \"decimal\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"shipping_address\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order_date\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"quantities\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"orders_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"orders_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"orders_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"orders_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"products\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [10, 2], \"name\": \"price\", \"type\": \"decimal\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"new\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"author\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"on_sale\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [10, 2], \"name\": \"width\", \"type\": \"decimal\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [10, 2], \"name\": \"height\", \"type\": \"decimal\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"products_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"products_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"products_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"products_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"sub_categories\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"sub_categories_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"sub_categories_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"sub_categories_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"sub_categories_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_permissions_role_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"permission_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_permissions_role_links_fk\", \"columns\": [\"permission_id\"]}, {\"name\": \"admin_permissions_role_links_inv_fk\", \"columns\": [\"role_id\"]}, {\"name\": \"admin_permissions_role_links_unique\", \"type\": \"unique\", \"columns\": [\"permission_id\", \"role_id\"]}, {\"name\": \"admin_permissions_role_links_order_inv_fk\", \"columns\": [\"permission_order\"]}], \"foreignKeys\": [{\"name\": \"admin_permissions_role_links_fk\", \"columns\": [\"permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_permissions_role_links_inv_fk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_users_roles_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"user_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"user_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_users_roles_links_fk\", \"columns\": [\"user_id\"]}, {\"name\": \"admin_users_roles_links_inv_fk\", \"columns\": [\"role_id\"]}, {\"name\": \"admin_users_roles_links_unique\", \"type\": \"unique\", \"columns\": [\"user_id\", \"role_id\"]}, {\"name\": \"admin_users_roles_links_order_fk\", \"columns\": [\"role_order\"]}, {\"name\": \"admin_users_roles_links_order_inv_fk\", \"columns\": [\"user_order\"]}], \"foreignKeys\": [{\"name\": \"admin_users_roles_links_fk\", \"columns\": [\"user_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_users_roles_links_inv_fk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_api_token_permissions_token_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"api_token_permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"api_token_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"api_token_permission_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_api_token_permissions_token_links_fk\", \"columns\": [\"api_token_permission_id\"]}, {\"name\": \"strapi_api_token_permissions_token_links_inv_fk\", \"columns\": [\"api_token_id\"]}, {\"name\": \"strapi_api_token_permissions_token_links_unique\", \"type\": \"unique\", \"columns\": [\"api_token_permission_id\", \"api_token_id\"]}, {\"name\": \"strapi_api_token_permissions_token_links_order_inv_fk\", \"columns\": [\"api_token_permission_order\"]}], \"foreignKeys\": [{\"name\": \"strapi_api_token_permissions_token_links_fk\", \"columns\": [\"api_token_permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_api_token_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_api_token_permissions_token_links_inv_fk\", \"columns\": [\"api_token_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_api_tokens\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_transfer_token_permissions_token_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"transfer_token_permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"transfer_token_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"transfer_token_permission_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_transfer_token_permissions_token_links_fk\", \"columns\": [\"transfer_token_permission_id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_links_inv_fk\", \"columns\": [\"transfer_token_id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_links_unique\", \"type\": \"unique\", \"columns\": [\"transfer_token_permission_id\", \"transfer_token_id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_links_order_inv_fk\", \"columns\": [\"transfer_token_permission_order\"]}], \"foreignKeys\": [{\"name\": \"strapi_transfer_token_permissions_token_links_fk\", \"columns\": [\"transfer_token_permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_transfer_token_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_links_inv_fk\", \"columns\": [\"transfer_token_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_transfer_tokens\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"files_related_morphs\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"file_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"related_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"related_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"files_related_morphs_fk\", \"columns\": [\"file_id\"]}], \"foreignKeys\": [{\"name\": \"files_related_morphs_fk\", \"columns\": [\"file_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"files\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"files_folder_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"file_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"folder_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"file_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"files_folder_links_fk\", \"columns\": [\"file_id\"]}, {\"name\": \"files_folder_links_inv_fk\", \"columns\": [\"folder_id\"]}, {\"name\": \"files_folder_links_unique\", \"type\": \"unique\", \"columns\": [\"file_id\", \"folder_id\"]}, {\"name\": \"files_folder_links_order_inv_fk\", \"columns\": [\"file_order\"]}], \"foreignKeys\": [{\"name\": \"files_folder_links_fk\", \"columns\": [\"file_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"files\", \"referencedColumns\": [\"id\"]}, {\"name\": \"files_folder_links_inv_fk\", \"columns\": [\"folder_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"upload_folders\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"upload_folders_parent_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"folder_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"inv_folder_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"folder_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"upload_folders_parent_links_fk\", \"columns\": [\"folder_id\"]}, {\"name\": \"upload_folders_parent_links_inv_fk\", \"columns\": [\"inv_folder_id\"]}, {\"name\": \"upload_folders_parent_links_unique\", \"type\": \"unique\", \"columns\": [\"folder_id\", \"inv_folder_id\"]}, {\"name\": \"upload_folders_parent_links_order_inv_fk\", \"columns\": [\"folder_order\"]}], \"foreignKeys\": [{\"name\": \"upload_folders_parent_links_fk\", \"columns\": [\"folder_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"upload_folders\", \"referencedColumns\": [\"id\"]}, {\"name\": \"upload_folders_parent_links_inv_fk\", \"columns\": [\"inv_folder_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"upload_folders\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_permissions_role_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"permission_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_permissions_role_links_fk\", \"columns\": [\"permission_id\"]}, {\"name\": \"up_permissions_role_links_inv_fk\", \"columns\": [\"role_id\"]}, {\"name\": \"up_permissions_role_links_unique\", \"type\": \"unique\", \"columns\": [\"permission_id\", \"role_id\"]}, {\"name\": \"up_permissions_role_links_order_inv_fk\", \"columns\": [\"permission_order\"]}], \"foreignKeys\": [{\"name\": \"up_permissions_role_links_fk\", \"columns\": [\"permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_permissions_role_links_inv_fk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_users_role_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"user_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"user_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_users_role_links_fk\", \"columns\": [\"user_id\"]}, {\"name\": \"up_users_role_links_inv_fk\", \"columns\": [\"role_id\"]}, {\"name\": \"up_users_role_links_unique\", \"type\": \"unique\", \"columns\": [\"user_id\", \"role_id\"]}, {\"name\": \"up_users_role_links_order_inv_fk\", \"columns\": [\"user_order\"]}], \"foreignKeys\": [{\"name\": \"up_users_role_links_fk\", \"columns\": [\"user_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_users_role_links_inv_fk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"orders_products_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"order_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"product_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"product_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"orders_products_links_fk\", \"columns\": [\"order_id\"]}, {\"name\": \"orders_products_links_inv_fk\", \"columns\": [\"product_id\"]}, {\"name\": \"orders_products_links_unique\", \"type\": \"unique\", \"columns\": [\"order_id\", \"product_id\"]}, {\"name\": \"orders_products_links_order_fk\", \"columns\": [\"product_order\"]}], \"foreignKeys\": [{\"name\": \"orders_products_links_fk\", \"columns\": [\"order_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"orders\", \"referencedColumns\": [\"id\"]}, {\"name\": \"orders_products_links_inv_fk\", \"columns\": [\"product_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"products\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"products_category_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"product_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"category_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"product_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"products_category_links_fk\", \"columns\": [\"product_id\"]}, {\"name\": \"products_category_links_inv_fk\", \"columns\": [\"category_id\"]}, {\"name\": \"products_category_links_unique\", \"type\": \"unique\", \"columns\": [\"product_id\", \"category_id\"]}, {\"name\": \"products_category_links_order_inv_fk\", \"columns\": [\"product_order\"]}], \"foreignKeys\": [{\"name\": \"products_category_links_fk\", \"columns\": [\"product_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"products\", \"referencedColumns\": [\"id\"]}, {\"name\": \"products_category_links_inv_fk\", \"columns\": [\"category_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"categories\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"products_sub_category_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"product_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"sub_category_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"product_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"products_sub_category_links_fk\", \"columns\": [\"product_id\"]}, {\"name\": \"products_sub_category_links_inv_fk\", \"columns\": [\"sub_category_id\"]}, {\"name\": \"products_sub_category_links_unique\", \"type\": \"unique\", \"columns\": [\"product_id\", \"sub_category_id\"]}, {\"name\": \"products_sub_category_links_order_inv_fk\", \"columns\": [\"product_order\"]}], \"foreignKeys\": [{\"name\": \"products_sub_category_links_fk\", \"columns\": [\"product_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"products\", \"referencedColumns\": [\"id\"]}, {\"name\": \"products_sub_category_links_inv_fk\", \"columns\": [\"sub_category_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"sub_categories\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"sub_categories_category_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"sub_category_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"category_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"sub_category_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"sub_categories_category_links_fk\", \"columns\": [\"sub_category_id\"]}, {\"name\": \"sub_categories_category_links_inv_fk\", \"columns\": [\"category_id\"]}, {\"name\": \"sub_categories_category_links_unique\", \"type\": \"unique\", \"columns\": [\"sub_category_id\", \"category_id\"]}, {\"name\": \"sub_categories_category_links_order_inv_fk\", \"columns\": [\"sub_category_order\"]}], \"foreignKeys\": [{\"name\": \"sub_categories_category_links_fk\", \"columns\": [\"sub_category_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"sub_categories\", \"referencedColumns\": [\"id\"]}, {\"name\": \"sub_categories_category_links_inv_fk\", \"columns\": [\"category_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"categories\", \"referencedColumns\": [\"id\"]}]}]}','2023-04-12 15:14:47','aa0e6b42b3a05af289f1b441c007bd58');
/*!40000 ALTER TABLE `strapi_database_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_migrations`
--

DROP TABLE IF EXISTS `strapi_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_migrations`
--

LOCK TABLES `strapi_migrations` WRITE;
/*!40000 ALTER TABLE `strapi_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_token_permissions`
--

DROP TABLE IF EXISTS `strapi_transfer_token_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_transfer_token_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_transfer_token_permissions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_transfer_token_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_transfer_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_transfer_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_token_permissions`
--

LOCK TABLES `strapi_transfer_token_permissions` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_token_permissions_token_links`
--

DROP TABLE IF EXISTS `strapi_transfer_token_permissions_token_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_transfer_token_permissions_token_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transfer_token_permission_id` int unsigned DEFAULT NULL,
  `transfer_token_id` int unsigned DEFAULT NULL,
  `transfer_token_permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_transfer_token_permissions_token_links_unique` (`transfer_token_permission_id`,`transfer_token_id`),
  KEY `strapi_transfer_token_permissions_token_links_fk` (`transfer_token_permission_id`),
  KEY `strapi_transfer_token_permissions_token_links_inv_fk` (`transfer_token_id`),
  KEY `strapi_transfer_token_permissions_token_links_order_inv_fk` (`transfer_token_permission_order`),
  CONSTRAINT `strapi_transfer_token_permissions_token_links_fk` FOREIGN KEY (`transfer_token_permission_id`) REFERENCES `strapi_transfer_token_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_transfer_token_permissions_token_links_inv_fk` FOREIGN KEY (`transfer_token_id`) REFERENCES `strapi_transfer_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_token_permissions_token_links`
--

LOCK TABLES `strapi_transfer_token_permissions_token_links` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions_token_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions_token_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_tokens`
--

DROP TABLE IF EXISTS `strapi_transfer_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_transfer_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_transfer_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_transfer_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_transfer_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_transfer_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_tokens`
--

LOCK TABLES `strapi_transfer_tokens` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_webhooks`
--

DROP TABLE IF EXISTS `strapi_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_webhooks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext,
  `headers` json DEFAULT NULL,
  `events` json DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_webhooks`
--

LOCK TABLES `strapi_webhooks` WRITE;
/*!40000 ALTER TABLE `strapi_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categories_created_by_id_fk` (`created_by_id`),
  KEY `sub_categories_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `sub_categories_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sub_categories_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'Oil','2023-03-07 10:48:34.918000','2023-03-07 10:48:39.941000','2023-03-07 10:48:39.937000',1,1),(3,'Digital','2023-03-07 12:43:45.201000','2023-03-07 12:43:47.084000','2023-03-07 12:43:47.081000',1,1),(4,'Neon','2023-04-17 09:34:42.209000','2023-04-17 09:34:46.310000','2023-04-17 09:34:46.306000',1,1),(5,'Small','2023-04-17 09:36:18.919000','2023-04-17 09:36:19.839000','2023-04-17 09:36:19.836000',1,1),(6,'Big','2023-04-17 09:36:29.208000','2023-04-17 09:36:30.325000','2023-04-17 09:36:30.322000',1,1),(7,'Modern','2023-04-17 09:38:32.732000','2023-04-17 09:38:34.076000','2023-04-17 09:38:34.073000',1,1),(8,'Old','2023-04-17 09:38:46.796000','2023-04-17 09:38:47.493000','2023-04-17 09:38:47.490000',1,1),(9,'Metal','2023-04-17 09:41:00.178000','2023-04-17 09:41:02.313000','2023-04-17 09:41:02.310000',1,1),(10,'Paper','2023-04-17 09:41:23.838000','2023-04-17 09:41:24.633000','2023-04-17 09:41:24.629000',1,1);
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories_category_links`
--

DROP TABLE IF EXISTS `sub_categories_category_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories_category_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sub_category_id` int unsigned DEFAULT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `sub_category_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub_categories_category_links_unique` (`sub_category_id`,`category_id`),
  KEY `sub_categories_category_links_fk` (`sub_category_id`),
  KEY `sub_categories_category_links_inv_fk` (`category_id`),
  KEY `sub_categories_category_links_order_inv_fk` (`sub_category_order`),
  CONSTRAINT `sub_categories_category_links_fk` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub_categories_category_links_inv_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories_category_links`
--

LOCK TABLES `sub_categories_category_links` WRITE;
/*!40000 ALTER TABLE `sub_categories_category_links` DISABLE KEYS */;
INSERT INTO `sub_categories_category_links` VALUES (1,1,1,1),(3,3,1,2),(4,4,7,1),(5,5,6,1),(6,6,6,2),(7,7,8,1),(8,8,8,2),(9,9,9,1),(10,10,9,2);
/*!40000 ALTER TABLE `sub_categories_category_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_permissions`
--

DROP TABLE IF EXISTS `up_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_permissions_created_by_id_fk` (`created_by_id`),
  KEY `up_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_permissions`
--

LOCK TABLES `up_permissions` WRITE;
/*!40000 ALTER TABLE `up_permissions` DISABLE KEYS */;
INSERT INTO `up_permissions` VALUES (1,'plugin::users-permissions.user.me','2023-03-07 10:22:53.259000','2023-03-07 10:22:53.259000',NULL,NULL),(2,'plugin::users-permissions.auth.changePassword','2023-03-07 10:22:53.259000','2023-03-07 10:22:53.259000',NULL,NULL),(3,'plugin::users-permissions.auth.callback','2023-03-07 10:22:53.275000','2023-03-07 10:22:53.275000',NULL,NULL),(4,'plugin::users-permissions.auth.connect','2023-03-07 10:22:53.275000','2023-03-07 10:22:53.275000',NULL,NULL),(5,'plugin::users-permissions.auth.forgotPassword','2023-03-07 10:22:53.275000','2023-03-07 10:22:53.275000',NULL,NULL),(6,'plugin::users-permissions.auth.resetPassword','2023-03-07 10:22:53.275000','2023-03-07 10:22:53.275000',NULL,NULL),(7,'plugin::users-permissions.auth.register','2023-03-07 10:22:53.275000','2023-03-07 10:22:53.275000',NULL,NULL),(8,'plugin::users-permissions.auth.emailConfirmation','2023-03-07 10:22:53.275000','2023-03-07 10:22:53.275000',NULL,NULL),(9,'plugin::users-permissions.auth.sendEmailConfirmation','2023-03-07 10:22:53.275000','2023-03-07 10:22:53.275000',NULL,NULL),(10,'api::order.order.CreateOrderOnSuccess','2023-04-05 09:49:28.568000','2023-04-05 09:49:28.568000',NULL,NULL),(11,'api::order.order.find','2023-04-05 09:49:28.568000','2023-04-05 09:49:28.568000',NULL,NULL),(12,'api::order.order.findOne','2023-04-05 09:49:28.568000','2023-04-05 09:49:28.568000',NULL,NULL),(13,'api::order.order.create','2023-04-05 09:49:28.568000','2023-04-05 09:49:28.568000',NULL,NULL),(14,'api::order.order.update','2023-04-05 09:49:28.568000','2023-04-05 09:49:28.568000',NULL,NULL),(15,'api::order.order.delete','2023-04-05 09:49:28.568000','2023-04-05 09:49:28.568000',NULL,NULL);
/*!40000 ALTER TABLE `up_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_permissions_role_links`
--

DROP TABLE IF EXISTS `up_permissions_role_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_permissions_role_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_permissions_role_links_unique` (`permission_id`,`role_id`),
  KEY `up_permissions_role_links_fk` (`permission_id`),
  KEY `up_permissions_role_links_inv_fk` (`role_id`),
  KEY `up_permissions_role_links_order_inv_fk` (`permission_order`),
  CONSTRAINT `up_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `up_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_permissions_role_links`
--

LOCK TABLES `up_permissions_role_links` WRITE;
/*!40000 ALTER TABLE `up_permissions_role_links` DISABLE KEYS */;
INSERT INTO `up_permissions_role_links` VALUES (1,1,1,1),(2,2,1,1),(3,3,2,1),(4,4,2,1),(5,5,2,1),(6,6,2,2),(7,8,2,2),(8,7,2,2),(9,9,2,2),(10,10,2,3),(11,13,2,3),(12,12,2,3),(13,11,2,3),(14,14,2,3),(15,15,2,3);
/*!40000 ALTER TABLE `up_permissions_role_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_roles`
--

DROP TABLE IF EXISTS `up_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_roles_created_by_id_fk` (`created_by_id`),
  KEY `up_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_roles`
--

LOCK TABLES `up_roles` WRITE;
/*!40000 ALTER TABLE `up_roles` DISABLE KEYS */;
INSERT INTO `up_roles` VALUES (1,'Authenticated','Default role given to authenticated user.','authenticated','2023-03-07 10:22:53.242000','2023-04-05 09:56:44.256000',NULL,NULL),(2,'Public','Default role given to unauthenticated user.','public','2023-03-07 10:22:53.249000','2023-04-05 09:49:41.432000',NULL,NULL);
/*!40000 ALTER TABLE `up_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_users`
--

DROP TABLE IF EXISTS `up_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_users_created_by_id_fk` (`created_by_id`),
  KEY `up_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_users`
--

LOCK TABLES `up_users` WRITE;
/*!40000 ALTER TABLE `up_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `up_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_users_role_links`
--

DROP TABLE IF EXISTS `up_users_role_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_users_role_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `user_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_users_role_links_unique` (`user_id`,`role_id`),
  KEY `up_users_role_links_fk` (`user_id`),
  KEY `up_users_role_links_inv_fk` (`role_id`),
  KEY `up_users_role_links_order_inv_fk` (`user_order`),
  CONSTRAINT `up_users_role_links_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_users_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_users_role_links`
--

LOCK TABLES `up_users_role_links` WRITE;
/*!40000 ALTER TABLE `up_users_role_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `up_users_role_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_folders`
--

DROP TABLE IF EXISTS `upload_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_folders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `path_id` int DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_path_id_index` (`path_id`),
  UNIQUE KEY `upload_folders_path_index` (`path`),
  KEY `upload_folders_created_by_id_fk` (`created_by_id`),
  KEY `upload_folders_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `upload_folders_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `upload_folders_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_folders`
--

LOCK TABLES `upload_folders` WRITE;
/*!40000 ALTER TABLE `upload_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_folders_parent_links`
--

DROP TABLE IF EXISTS `upload_folders_parent_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_folders_parent_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int unsigned DEFAULT NULL,
  `inv_folder_id` int unsigned DEFAULT NULL,
  `folder_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_parent_links_unique` (`folder_id`,`inv_folder_id`),
  KEY `upload_folders_parent_links_fk` (`folder_id`),
  KEY `upload_folders_parent_links_inv_fk` (`inv_folder_id`),
  KEY `upload_folders_parent_links_order_inv_fk` (`folder_order`),
  CONSTRAINT `upload_folders_parent_links_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_folders_parent_links_inv_fk` FOREIGN KEY (`inv_folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_folders_parent_links`
--

LOCK TABLES `upload_folders_parent_links` WRITE;
/*!40000 ALTER TABLE `upload_folders_parent_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_folders_parent_links` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-17 11:24:22
