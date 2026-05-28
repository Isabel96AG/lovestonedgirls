-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for osx10.10 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce_2024
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `type_attribute` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '1 es activo y 2 inactivo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'Talla',3,1,'2026-05-27 12:04:28','2026-05-27 12:04:28',NULL);
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price_unit` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `variations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`variations`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_product_id_foreign` (`product_id`),
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,9,1,1,15.00,15.00,NULL,'2026-05-09 18:30:10','2026-05-09 18:30:10');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `icon` text DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `categorie_second_id` bigint(20) unsigned DEFAULT NULL,
  `categorie_third_id` bigint(20) unsigned DEFAULT NULL,
  `position` double unsigned NOT NULL DEFAULT 1,
  `type_categorie` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '1 es departmeto 2 es categoria y 3 subcategoria',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (5,'Ropa','','categories/iR7MHhq1gTHMBCUQLwyPhYiE27cdF6HlYGc8S4al.webp',NULL,NULL,1,1,'2026-05-08 19:25:28','2026-05-09 09:02:35',NULL),(6,'Tops','','categories/fNBy56RyKZ0LHF6UdT17Fa8Cy6arARZDmydotxt3.webp',5,NULL,1,2,'2026-05-08 19:25:57','2026-05-08 19:25:57',NULL),(7,'Camisetas','','categories/MqA9Am6Tqvn01KWB7kKNOiiifSKf1jZ7iAQPBx22.webp',6,5,1,3,'2026-05-08 19:26:24','2026-05-09 07:29:57','2026-05-09 07:29:57'),(9,'Camisetas','','categories/MqA9Am6Tqvn01KWB7kKNOiiifSKf1jZ7iAQPBx22.webp',6,5,1,3,'2026-05-08 19:26:24','2026-05-09 07:29:57','2026-05-09 07:29:57'),(10,'Accesorios','','categories/DNLdu9VfYXR0Lv8yUDyPQzDCYZRqyBlVAtlgboWt.webp',NULL,NULL,1,1,'2026-05-09 19:15:19','2026-05-09 19:15:19',NULL),(11,'Vestidos','','categories/AvDUEUuTVq6jf7m6HCtmrz0D7abg8Ox87vniJ99j.webp',5,NULL,1,2,'2026-05-09 19:16:05','2026-05-09 19:16:05',NULL),(12,'Faldas','','categories/McyaSU9bW3RyL1Z79DdWyHIfNiySzWRruD1vYLd6.webp',5,NULL,1,2,'2026-05-09 19:17:07','2026-05-09 19:17:07',NULL),(13,'Camisetas','','categories/AbasXLkvK03Mt4gghuzD10amTNGYMPpQqBzEp92m.webp',6,5,1,3,'2026-05-09 19:18:13','2026-05-09 19:18:13',NULL),(14,'Blusas','','categories/KEqWZXm48llGy6ZL9tbA3jASxeAKJ4QwlTh8lX3r.webp',6,5,1,3,'2026-05-09 19:28:37','2026-05-09 19:28:37',NULL),(15,'Largos','','categories/u8MfPdA2Ug4BCtBuAPNT9a40RgmvDVj2zvicDGeE.webp',11,5,1,3,'2026-05-27 13:17:48','2026-05-27 13:17:48',NULL),(16,'Corto','','categories/pdc77SFa7CoW41kNaC8jA37VoDoapgyucnorwTVw.webp',11,5,2,3,'2026-05-27 14:37:37','2026-05-27 14:37:37',NULL),(17,'Larga','','categories/OE5trmk540kAS1kRGhWauqJL49Au5wI7dRQAN84w.webp',12,5,1,3,'2026-05-28 09:01:48','2026-05-28 09:01:48',NULL),(18,'Corta','','categories/eC6sw1jLc9zLPupyaQD5qxgrc1z339wsRr6r1CXk.webp',12,5,2,3,'2026-05-28 09:02:40','2026-05-28 09:02:40',NULL),(19,'Pantalones','','categories/4zakOgiPxlD9ycWsauO1duhmyWtg7kWMPwfCeORa.webp',5,NULL,1,2,'2026-05-28 09:03:50','2026-05-28 09:03:50',NULL),(20,'Largo','','categories/qSGYnGC0v4TgNOhzrwxa0SecEGvyswafjDiSWzfp.webp',19,5,1,3,'2026-05-28 09:04:19','2026-05-28 09:04:19',NULL),(21,'Cortos','','categories/Md3az5vYbXKrWINtZTmuFZa1Ig7QJJ3ImMr9tEDB.webp',19,5,1,3,'2026-05-28 09:05:50','2026-05-28 09:05:50',NULL),(22,'Bolsos','','categories/F5V3bJYfJi30SBuLDWmu0aW8nIXUJmUyaHVLqSep.webp',10,NULL,1,2,'2026-05-28 09:08:03','2026-05-28 09:08:03',NULL),(23,'Otros','','categories/CTq85cotE0wCpS6yAajDNg7YtAzk5P1JRrrkQgaR.webp',10,NULL,2,2,'2026-05-28 09:08:34','2026-05-28 09:08:34',NULL);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2024_01_01_000010_create_sliders_table',2),(5,'2024_01_01_000011_create_products_table',2),(6,'2024_01_01_000012_create_product_images_table',2),(7,'2024_01_01_000013_create_product_variations_table',2),(8,'2024_01_01_000014_create_carts_table',3),(9,'2024_01_01_000015_create_sales_table',4),(10,'2024_01_01_000016_create_sale_addresses_table',4),(11,'2024_01_01_000017_create_sale_details_table',4),(12,'2024_01_01_000020_create_newsletter_subscribers_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_subscribers`
--

DROP TABLE IF EXISTS `newsletter_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_subscribers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `newsletter_subscribers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_subscribers`
--

LOCK TABLES `newsletter_subscribers` WRITE;
/*!40000 ALTER TABLE `newsletter_subscribers` DISABLE KEYS */;
INSERT INTO `newsletter_subscribers` VALUES (1,'isabel@hotmail.com','2026-05-27 17:27:27','2026-05-27 17:27:27');
/*!40000 ALTER TABLE `newsletter_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variations`
--

DROP TABLE IF EXISTS `product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_variations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `attribute_id` bigint(20) unsigned NOT NULL,
  `propertie_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variations_product_id_foreign` (`product_id`),
  KEY `product_variations_attribute_id_foreign` (`attribute_id`),
  KEY `product_variations_propertie_id_foreign` (`propertie_id`),
  CONSTRAINT `product_variations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_variations_propertie_id_foreign` FOREIGN KEY (`propertie_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variations`
--

LOCK TABLES `product_variations` WRITE;
/*!40000 ALTER TABLE `product_variations` DISABLE KEYS */;
INSERT INTO `product_variations` VALUES (1,3,1,2,'2026-05-27 12:35:41','2026-05-27 12:43:45','2026-05-27 12:43:45'),(2,4,1,1,'2026-05-27 12:38:54','2026-05-27 12:43:33','2026-05-27 12:43:33'),(3,5,1,3,'2026-05-27 12:39:55','2026-05-27 12:39:55',NULL),(4,6,1,1,'2026-05-27 12:43:07','2026-05-27 12:43:21','2026-05-27 12:43:21'),(5,6,1,1,'2026-05-27 12:43:21','2026-05-27 12:43:21',NULL),(6,4,1,1,'2026-05-27 12:43:33','2026-05-27 12:43:33',NULL),(7,3,1,2,'2026-05-27 12:43:45','2026-05-27 12:43:45',NULL),(8,7,1,3,'2026-05-27 12:44:56','2026-05-27 12:44:56',NULL),(9,8,1,3,'2026-05-27 12:46:07','2026-05-27 12:46:07',NULL),(10,9,1,2,'2026-05-28 07:15:36','2026-05-28 07:15:36',NULL),(11,10,1,3,'2026-05-28 07:16:26','2026-05-28 07:16:26',NULL),(12,11,1,1,'2026-05-28 07:17:25','2026-05-28 07:17:25',NULL),(13,12,1,3,'2026-05-28 07:18:18','2026-05-28 07:18:18',NULL),(14,13,1,2,'2026-05-28 07:19:23','2026-05-28 07:20:45','2026-05-28 07:20:45'),(15,14,1,2,'2026-05-28 07:20:22','2026-05-28 07:20:22',NULL),(16,13,1,2,'2026-05-28 07:20:45','2026-05-28 07:20:45',NULL),(17,15,1,3,'2026-05-28 07:21:33','2026-05-28 07:21:33',NULL),(18,16,1,3,'2026-05-28 07:23:20','2026-05-28 07:23:20',NULL),(19,17,1,2,'2026-05-28 07:26:19','2026-05-28 07:26:19',NULL),(20,18,1,1,'2026-05-28 07:27:06','2026-05-28 07:27:06',NULL),(21,25,1,1,'2026-05-28 07:36:28','2026-05-28 07:36:28',NULL),(22,26,1,2,'2026-05-28 07:37:26','2026-05-28 07:37:26',NULL),(23,27,1,3,'2026-05-28 07:38:38','2026-05-28 07:38:38',NULL),(24,29,1,3,'2026-05-28 07:40:55','2026-05-28 07:40:55',NULL),(25,30,1,1,'2026-05-28 07:43:07','2026-05-28 07:43:07',NULL),(26,31,1,3,'2026-05-28 07:47:56','2026-05-28 07:47:56',NULL),(27,32,1,2,'2026-05-28 07:49:55','2026-05-28 07:49:55',NULL),(28,33,1,3,'2026-05-28 07:52:03','2026-05-28 07:52:03',NULL),(29,34,1,2,'2026-05-28 07:52:54','2026-05-28 07:52:54',NULL),(30,35,1,1,'2026-05-28 07:53:36','2026-05-28 07:53:36',NULL);
/*!40000 ALTER TABLE `product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `resumen` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `categorie_first_id` bigint(20) unsigned DEFAULT NULL,
  `categorie_second_id` bigint(20) unsigned DEFAULT NULL,
  `categorie_third_id` bigint(20) unsigned DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Marina camiseta','marina-t-shirt-69ff897fcc674',15.00,NULL,'Camiseta estampada con letras rojos, ideal para tus días casuales.','products/3D2o6reAHWQ1VtK7MYhijHo0d6HEwnEtCEtpcDtc.webp',NULL,5,6,13,2,'2026-05-09 17:22:39','2026-05-09 17:49:02',NULL),(2,'Leia blusa','leia-blusa-69ff8b1900201',25.00,NULL,'Blusa vintage con aire romántico.','products/pFbMnFv2KPW3U5nIgIUiicmQyDLrn5xIBIO6q1tB.webp',NULL,5,6,14,2,'2026-05-09 17:29:29','2026-05-09 17:47:55',NULL),(3,'Alegrias vestido','alegrias-vestido-6a17013d768d0',35.00,NULL,'Vestido vintage con espalda abierta estilo boho.','products/b0OkNf1vW1WKxrmqNHIsBPIklROowJ4VThQ5DGE6.webp',NULL,5,11,15,2,'2026-05-27 12:35:41','2026-05-27 12:43:45',NULL),(4,'Victoria vestido','victoria-vestido-6a1701fe0f861',30.00,NULL,'Vestido de fiesta vintage.','products/tLVCQ44NA6KnuKvWI7hovOg7fhuzJNv168vfo0J7.webp',NULL,5,11,15,2,'2026-05-27 12:38:54','2026-05-27 12:43:33',NULL),(5,'Marisa vestido','marisa-vestido-6a17023b00f2d',25.00,NULL,'Vestido de lycra vintage','products/DxHfErMJfIjAjItontFld0AlohxtwntCUdG53Vwl.webp',NULL,5,11,15,2,'2026-05-27 12:39:55','2026-05-27 12:39:55',NULL),(6,'Laila vestido','laila-vestido-6a1702fb5ef83',19.00,NULL,'Vestido estilo Y2K.','products/XB7zNhjl64Eeg9xwcYHfrZsVbJJMguFG5QFDIhjs.webp',NULL,5,11,16,3,'2026-05-27 12:43:07','2026-05-27 16:43:40',NULL),(7,'Luna vestido','luna-vestido-6a17036849b13',21.00,NULL,'Vestido playero reciclado','products/rhxDthbttvTaqCRMXFK7fHgizbhJdJxWgo8C0Gp0.webp',NULL,5,11,16,2,'2026-05-27 12:44:56','2026-05-27 12:44:56',NULL),(8,'Dana vestido','dana-vestido-6a1703af96784',22.00,NULL,'Vestido cocktail año 90s','products/L6CMLeZ2Ep01ZKI4bjyx3iPQG6OHO1XhuHevjK2N.webp',NULL,5,11,16,2,'2026-05-27 12:46:07','2026-05-27 12:46:07',NULL),(9,'Isabel camiseta','isabel-camiseta-6a1807b897c8e',17.00,NULL,'Camiseta halter vintage. Color menta.','products/TM5JnLCJZU8sILtjs2dQWg50fcB5SGAgkGbMRWzE.webp',NULL,5,6,13,2,'2026-05-28 07:15:36','2026-05-28 07:15:36',NULL),(10,'Leila camiseta','leila-camiseta-6a1807eaaa855',16.00,NULL,'Camiseta retro.','products/w9yenwkvkhADkb358ReLk8FCtBNTYccTpAd4EK2E.webp',NULL,5,6,13,2,'2026-05-28 07:16:26','2026-05-28 07:16:26',NULL),(11,'Lucilda camiseta','lucilda-camiseta-6a180825313dd',18.00,NULL,'Camiseta polka vintage.','products/IVWBJNepQ40aDaxTlm1BXHRrf3jjjsDrwuiC4TMB.webp',NULL,5,6,13,2,'2026-05-28 07:17:25','2026-05-28 07:17:25',NULL),(12,'Staycy camiseta','staycy-camiseta-6a18085ac9f60',18.00,NULL,'Camiseta vintage bicolor con doble posición.','products/FeaMfK76tJ87Pc831IPCmj42rrF0hGFT4a4tsPkA.webp',NULL,5,6,13,2,'2026-05-28 07:18:18','2026-05-28 07:18:18',NULL),(13,'Natalia blusa','natalia-camiseta-6a18089bbb5e5',21.00,NULL,'Blusa retro con adornos y tejido de lycra.','products/9xcfXxjyAcs8tJ4Q90L0r7GukWZIe1lLDynmM9kS.webp',NULL,5,6,14,2,'2026-05-28 07:19:23','2026-05-28 07:20:45',NULL),(14,'Susi blusa','susi-blusa-6a1808d6369f6',24.00,NULL,'Blusa vintage años 70.','products/6znFsVoyqYUDjkXzXtDIrI2jabfL34YI2oArnBoA.webp',NULL,5,6,14,2,'2026-05-28 07:20:22','2026-05-28 07:20:22',NULL),(15,'Luisa blusa','luisa-blusa-6a18091d88317',20.00,NULL,'Blusa vintage con nido de abeja.','products/zjQojYk2ps398ln7RluqPFQa1XiQcDasclG2mhHD.webp',NULL,5,6,14,2,'2026-05-28 07:21:33','2026-05-28 07:21:33',NULL),(16,'Magnolia pantalón','magnolia-pantalon-6a180988cd171',29.00,NULL,'Pantalon vintage con cuadros y goma en la cintura.','products/L9QFaQGAY7n2oCjyStpWvjfhv2r5vmN22iI0HtpN.webp',NULL,5,19,20,2,'2026-05-28 07:23:20','2026-05-28 07:23:20',NULL),(17,'Sol pantalón','sol-pantalon-6a180a3b07b56',29.00,NULL,'Pantalón color menta retro.','products/xxlbPjLoc9ywWJIRGJO8GARC5sSBjEayH4ChHprc.webp',NULL,5,19,20,2,'2026-05-28 07:26:19','2026-05-28 07:26:19',NULL),(18,'Lisa pantalón','lisa-pantalon-6a180a6ac950e',29.00,NULL,'Pantalón vintage vaquero.','products/f9jCpQ68EPPdFeTRos9FZRswTvXrdhO2rk5fGUrZ.webp',NULL,5,19,20,2,'2026-05-28 07:27:06','2026-05-28 07:27:06',NULL),(19,'Marta bolso','marta-bolso-6a180accae85d',30.00,NULL,'Bolsa de tela años 80.','products/5kYGGMC5HNRqbUCXleFuSpHficO6ivKCGj34hLbw.webp',NULL,10,22,NULL,2,'2026-05-28 07:28:44','2026-05-28 07:28:44',NULL),(20,'Alicia bolso','alicia-bolso-6a180afae8a58',30.00,NULL,'Bolso imitación piel años 70.','products/idKhX5cIsfhpn5mUQiAx4dPukqNgiwr7WfHEXFJ7.webp',NULL,10,22,NULL,2,'2026-05-28 07:29:30','2026-05-28 07:29:30',NULL),(21,'Nat bolso','nat-bolso-6a180b26884c2',30.00,NULL,'Bolso imitación piel años 90s.','products/AHw2Zozy24eh28Y35tO5bmQdR31ZDte6glLTLNV1.webp',NULL,10,22,NULL,2,'2026-05-28 07:30:14','2026-05-28 07:30:14',NULL),(22,'Anita crunchie','anita-crunchie-6a180b6b6ae31',10.00,NULL,'Cruchie hecho a mano.','products/aVUHJjY2vKAYxsgAAgzamjYFcE8ba7B5M77GkuCj.webp',NULL,10,23,NULL,2,'2026-05-28 07:31:23','2026-05-28 07:31:23',NULL),(23,'Thalia crunchie','thalia-crunchie-6a180ba746425',10.00,NULL,'Crunchie hecho a mano.','products/p27UgWfhluwpHojVfYaXfjHI3sxXSVGZaACZFDkt.webp',NULL,10,23,NULL,2,'2026-05-28 07:32:23','2026-05-28 07:32:23',NULL),(24,'Paula bandana','paula-bandana-6a180bd4b9df7',15.00,NULL,'Retro bandana años 90s.','products/a6cMuYZnO6OTTjCrLFaVmuoL92a8V0tUVBWyqjr9.webp',NULL,10,23,NULL,2,'2026-05-28 07:33:08','2026-05-28 07:33:08',NULL),(25,'Tati pantalón corto','tati-pantalon-corto-6a180c9c9f24d',23.00,NULL,'Pantalón corto años 70.','products/zmH8hS1reaLtbRCM2eYe9uguoZCiZ00Bj0x0fdPb.webp',NULL,5,19,21,2,'2026-05-28 07:36:28','2026-05-28 07:36:28',NULL),(26,'Beverly pantalón capri','beverly-pantalon-capri-6a180cd6a3bc8',25.00,NULL,'Pantalón retro años 60s.','products/DLdeh94qswm8Zl9Sh3OCQWPV8HCafKLsYVM7OBrL.webp',NULL,5,19,21,2,'2026-05-28 07:37:26','2026-05-28 07:37:26',NULL),(27,'Soledad pantalón corto','soledad-pantalon-corto-6a180d1e47272',22.00,NULL,'Pantalón corto a rayas vintage.','products/l5O8NJckOzTvNBVmw3TL60Pb0WFWgHsGmFdV9yru.webp',NULL,5,19,21,2,'2026-05-28 07:38:38','2026-05-28 07:38:38',NULL),(28,'Nina falfa corta','nina-falfa-corta-6a180d5aa69b3',22.00,NULL,'Falda lycra bicolor vintage.','products/W1utJAySd4zeKFxRuUjxAG8VhWPXHYddWVzQ7742.webp',NULL,5,12,18,2,'2026-05-28 07:39:38','2026-05-28 07:39:38',NULL),(29,'Lolita falfa corta','lolita-falfa-corta-6a180da7da391',22.00,NULL,'Falda vintage años 80.','products/RQxmp9tgaZXICpPlqYOHwgmLza0xNAfjopIDuO11.webp',NULL,5,12,18,2,'2026-05-28 07:40:55','2026-05-28 07:40:55',NULL),(30,'Tiana falda corta','tiana-falda-corta-6a180e2bd495d',22.00,NULL,'Falda vintage punto.','products/YT9WC7tlUAcgx1iDaYj1mFAwZMjCaAFfQPWNLUmj.webp',NULL,5,12,18,2,'2026-05-28 07:43:07','2026-05-28 07:43:07',NULL),(31,'Tania falda corta','tania-falda-corta-6a180f4ce1887',22.00,NULL,'Falda vintage pricipios años 2000','products/zoG91XFPUZP1qH4cChiS4v6YAdEfBTL4VWJnvsAC.webp',NULL,5,12,18,2,'2026-05-28 07:47:56','2026-05-28 07:47:56',NULL),(32,'Flora falda larga','flora-falda-larga-6a180fc34316e',27.00,NULL,'Falda larga vintage estilo boho.','products/zH2PbCqcI3Wr4N5gkrKmCbMZ6Z1ozqHTC1s8HibL.webp',NULL,5,12,17,2,'2026-05-28 07:49:55','2026-05-28 07:49:55',NULL),(33,'Mila falda larda','mila-falda-larda-6a18104362b9c',26.00,NULL,'Falda larga de punto y lycra años 2000.','products/tlC3ioMMHO16ko3uHzgV3cFYcv5mBgHiLTX2voDq.webp',NULL,5,12,17,2,'2026-05-28 07:52:03','2026-05-28 07:52:03',NULL),(34,'Lila falda larga','lila-falda-larga-6a1810768c826',28.00,NULL,'Falda larga años 80s.','products/YzqTb2KogmCv6i4HkFTAknwspfWOfVtddeFOUHjs.webp',NULL,5,12,17,2,'2026-05-28 07:52:54','2026-05-28 07:52:54',NULL),(35,'Rosario falda larga','rosario-falda-larga-6a1810a083db8',26.00,NULL,'Falda de flores vintage.','products/lxV6toNKuaSSZ0g0BRM1cem2mdZLVnmtgGALNAjL.webp',NULL,5,12,17,2,'2026-05-28 07:53:36','2026-05-28 07:53:36',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint(20) unsigned NOT NULL,
  `name` varchar(250) NOT NULL,
  `code` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,1,'S',NULL,'2026-05-27 12:27:15','2026-05-27 12:27:15',NULL),(2,1,'M',NULL,'2026-05-27 12:27:20','2026-05-27 12:27:20',NULL),(3,1,'L',NULL,'2026-05-27 12:27:24','2026-05-27 12:27:24',NULL);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_addresses`
--

DROP TABLE IF EXISTS `sale_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `province` varchar(255) DEFAULT NULL,
  `postal_code` varchar(10) NOT NULL,
  `country` varchar(255) NOT NULL DEFAULT 'España',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_addresses_sale_id_foreign` (`sale_id`),
  CONSTRAINT `sale_addresses_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_addresses`
--

LOCK TABLES `sale_addresses` WRITE;
/*!40000 ALTER TABLE `sale_addresses` DISABLE KEYS */;
INSERT INTO `sale_addresses` VALUES (1,1,'isabel','arca','535691886','av beniarda 4','benidorm','alicante','03502','España','','2026-05-10 12:36:25','2026-05-10 12:36:25'),(2,2,'isabel','gomez','666777888','av altea 6','altea','alicante','03503','España','','2026-05-10 13:44:06','2026-05-10 13:44:06'),(3,3,'Lola','Mateo','614567890','Av Palmeraas 2','Madrid','Madrid','28001','España','Entregar en portería','2026-05-27 16:05:29','2026-05-27 16:05:29'),(4,4,'Lali','Buire','676776899','av Malaga','Madrid','Madrid','28001','España','','2026-05-27 16:43:40','2026-05-27 16:43:40');
/*!40000 ALTER TABLE `sale_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_details`
--

DROP TABLE IF EXISTS `sale_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `type_discount` varchar(255) DEFAULT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL,
  `code_cupone` varchar(255) DEFAULT NULL,
  `code_discount` varchar(255) DEFAULT NULL,
  `price_unit` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_details_sale_id_foreign` (`sale_id`),
  KEY `sale_details_product_id_foreign` (`product_id`),
  CONSTRAINT `sale_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sale_details_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_details`
--

LOCK TABLES `sale_details` WRITE;
/*!40000 ALTER TABLE `sale_details` DISABLE KEYS */;
INSERT INTO `sale_details` VALUES (1,1,2,NULL,0.00,1,NULL,NULL,25.00,25.00,25.00,'2026-05-10 12:36:25','2026-05-10 12:36:25'),(2,2,1,NULL,0.00,1,NULL,NULL,15.00,15.00,15.00,'2026-05-10 13:44:06','2026-05-10 13:44:06'),(3,3,6,NULL,0.00,1,NULL,NULL,19.00,19.00,19.00,'2026-05-27 16:05:29','2026-05-27 16:05:29'),(4,4,6,NULL,0.00,1,NULL,NULL,19.00,19.00,19.00,'2026-05-27 16:43:40','2026-05-27 16:43:40');
/*!40000 ALTER TABLE `sale_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `method_payment` varchar(255) NOT NULL DEFAULT 'tarjeta',
  `currency_total` varchar(255) NOT NULL DEFAULT 'EUR',
  `currency_payment` varchar(255) NOT NULL DEFAULT 'EUR',
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `price_dolar` decimal(10,2) DEFAULT NULL,
  `n_transaccion` varchar(255) DEFAULT NULL,
  `state` varchar(255) NOT NULL DEFAULT 'pendiente',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_user_id_foreign` (`user_id`),
  CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,4,'tarjeta','EUR','EUR',0.00,25.00,25.00,NULL,NULL,'pendiente','2026-05-10 12:36:25','2026-05-10 12:36:25'),(2,4,'tarjeta','EUR','EUR',0.00,15.00,15.00,NULL,'pi_3TVZWTEPvGrMiyxD1OMky5C4','pendiente','2026-05-10 13:44:06','2026-05-10 13:44:06'),(3,4,'tarjeta','EUR','EUR',0.00,19.00,19.00,NULL,'pi_3TblpcEPvGrMiyxD0JUVxtxb','enviado','2026-05-27 16:05:29','2026-05-27 17:24:22'),(4,4,'tarjeta','EUR','EUR',0.00,19.00,19.00,NULL,'pi_3TbmQZEPvGrMiyxD0an9SLii','pendiente','2026-05-27 16:43:40','2026-05-27 16:43:40');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('JzG7lf9XMM2Tf7QEv5NjTOslJyEXsOPfeKx7LzNg',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:150.0) Gecko/20100101 Firefox/150.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGVEdE1NSHZXSmlFVEQwS1hoTVA5d3Ixb2NZYjVlS1VTbUlnTGtCQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1777734917),('VotkVEwnxtj0nEoOsMeF1K3pDMSF6fczqB7L9mTB',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:150.0) Gecko/20100101 Firefox/150.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoicGVmdjdXc0paWDhRRFd5ZzRjSDdKd2VoQ051d3ViYnhUZkZYc281RCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1777806693),('XOgEkw5Zy2ugQf6mOdb6D06m4yOww85mlKAeu2bF',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:150.0) Gecko/20100101 Firefox/150.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoibkZqQmxGT0xQTjZ3c1VkSDF1M2RlemJ4YVphUVVCVW9SZUt1RnRBRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1778254548);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `type_slider` int(11) NOT NULL DEFAULT 1,
  `state` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (1,'Vintage Summer','Disfruta de un verano único',NULL,'sliders/jpoPyXh82EoykAabwqO2HM5Nll2XtEhUXbWewYXG.webp','/shop',1,1,'2026-05-27 15:59:53','2026-05-27 15:59:53',NULL);
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(250) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  `type_user` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '1 administrador y 2 cliente tienda',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `uniqd` varchar(50) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Isa',NULL,NULL,'isa@test.com',NULL,1,NULL,'$2y$12$biRHxuUk7KJY95I9nKtquuut0vCPIv9CpAr83KbwbR63wdzV4Ihzu',NULL,NULL,'2026-04-26 14:58:38','2026-05-27 11:43:10',NULL),(2,'Isa',NULL,NULL,'isa2@test.com',NULL,1,NULL,'$2y$12$biRHxuUk7KJY95I9nKtquuut0vCPIv9CpAr83KbwbR63wdzV4Ihzu',NULL,NULL,'2026-04-26 14:59:20','2026-05-27 11:43:10',NULL),(3,'Maria','Lopez','600123456','maria@test.com',NULL,2,NULL,'$2y$12$DUfG1rl98aHMyrHIX8LYI.sxRzUJNFmjEI01ZyO7Ep/dDhkuTbrAC',NULL,NULL,'2026-05-01 16:24:49','2026-05-01 16:24:49',NULL),(4,'isabel','gomez','666555444','isabel@hotmail.com',NULL,2,NULL,'$2y$12$fUJSu/ElihSePZUORmH24OibxDj0XAMHfcSlUByLbi9cIzo9q0q8G',NULL,NULL,'2026-05-01 16:53:07','2026-05-01 16:53:07',NULL),(8,'pablo','arca','635691887','lovestonedproyecto@gmail.com',NULL,2,'2026-05-02 08:03:42','$2y$12$ajsyjynslgEIQUMmLUjXjudf1ZAFl2yl/zUbZcEh6ftLgSRExR38W','69f5cbef6339f',NULL,'2026-05-02 08:03:27','2026-05-02 08:03:42',NULL),(9,'Isabel','arca','635691886','isa@gmail.com',NULL,2,'2026-05-09 18:26:29','$2y$12$5yOPn73wSjMC65AbPPjkkeR2oP.o.PYCJIkckBz.jfLL3NnZtwxJe','69ff9875a9b0d',NULL,'2026-05-09 18:26:29','2026-05-09 18:26:29',NULL),(10,'Isabel','Arca','635691886','petitesabelle@hotmail.com',NULL,1,'2026-05-27 18:08:17','$2y$12$oeNKCOjcBxcWrNsFPsN4de2bTTDDaKl6NBi1Sc6.Uuo6BfEmTOKX.','6a174f31d2c33',NULL,'2026-05-27 18:08:17','2026-05-27 18:08:17',NULL),(11,'Lorenzo','Parui','666333444','admin@gmail.com',NULL,1,'2026-05-28 06:20:09','$2y$12$yBS83tklRYImT4gbpdbdUeFHS0QRJhm2jLP/U3NqonijvqWia5o/S','6a17fab92bafa',NULL,'2026-05-28 06:20:09','2026-05-28 06:20:09',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-28 16:58:03
