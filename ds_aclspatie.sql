# SQL Manager 2005 Lite for MySQL 3.7.7.1
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : ds_aclspatie


SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `ds_aclspatie`
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

USE `ds_aclspatie`;

#
# Structure for the `migrations` table : 
#

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Structure for the `permissions` table : 
#

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Structure for the `model_has_permissions` table : 
#

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Structure for the `roles` table : 
#

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Structure for the `model_has_roles` table : 
#

CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Structure for the `password_resets` table : 
#

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Structure for the `products` table : 
#

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Structure for the `role_has_permissions` table : 
#

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Structure for the `users` table : 
#

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for the `migrations` table  (LIMIT 0,500)
#

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES 
  (1,'2014_10_12_000000_create_users_table',1),
  (2,'2014_10_12_100000_create_password_resets_table',1),
  (3,'2018_06_23_235537_create_permission_tables',2),
  (4,'2018_06_23_235705_create_products_table',2);

COMMIT;

#
# Data for the `permissions` table  (LIMIT 0,500)
#

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES 
  (1,'role-list','web','2018-06-24 00:03:41','2018-06-24 00:03:41'),
  (2,'role-create','web','2018-06-24 00:03:41','2018-06-24 00:03:41'),
  (3,'role-edit','web','2018-06-24 00:03:41','2018-06-24 00:03:41'),
  (4,'role-delete','web','2018-06-24 00:03:41','2018-06-24 00:03:41'),
  (5,'product-list','web','2018-06-24 00:03:41','2018-06-24 00:03:41'),
  (6,'product-create','web','2018-06-24 00:03:41','2018-06-24 00:03:41'),
  (7,'product-edit','web','2018-06-24 00:03:41','2018-06-24 00:03:41'),
  (8,'product-delete','web','2018-06-24 00:03:41','2018-06-24 00:03:41');

COMMIT;

#
# Data for the `model_has_permissions` table  (LIMIT 0,500)
#

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES 
  (1,'App\\User','1'),
  (2,'App\\User','1'),
  (3,'App\\User','1'),
  (4,'App\\User','1'),
  (5,'App\\Product','2'),
  (6,'App\\Product','2'),
  (7,'App\\Product','2'),
  (8,'App\\Product','2');

COMMIT;

#
# Data for the `roles` table  (LIMIT 0,500)
#

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES 
  (1,'Admin','web','2018-06-24 08:14:38',NULL);

COMMIT;

#
# Data for the `model_has_roles` table  (LIMIT 0,500)
#

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES 
  (1,'App\\User','1'),
  (1,'App\\Product','2');

COMMIT;

#
# Data for the `products` table  (LIMIT 0,500)
#

INSERT INTO `products` (`id`, `name`, `detail`, `created_at`, `updated_at`) VALUES 
  (1,'AA','aa11','2018-06-24 08:19:10',NULL);

COMMIT;

#
# Data for the `role_has_permissions` table  (LIMIT 0,500)
#

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES 
  (1,1),
  (2,1),
  (3,1),
  (4,1),
  (5,1),
  (6,1),
  (7,1),
  (8,1);

COMMIT;

#
# Data for the `users` table  (LIMIT 0,500)
#

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES 
  (1,'Rudi Amirudin','rudi.amirudin@gmail.com','$2y$10$DVzMxYy5jFZS9p4WGPveauz/bciSbObrItxb2EEIDhGsbCQDtMv1S',NULL,'2018-06-24 01:05:30','2018-06-24 01:05:30');

COMMIT;

