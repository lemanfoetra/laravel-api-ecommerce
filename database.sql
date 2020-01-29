-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.6-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for eapi
DROP DATABASE IF EXISTS `eapi`;
CREATE DATABASE IF NOT EXISTS `eapi` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `eapi`;

-- Dumping structure for table eapi.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eapi.migrations: ~4 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2020_01_29_123321_create_products_table', 1),
	(4, '2020_01_29_123426_create_reviews_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table eapi.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eapi.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table eapi.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eapi.products: ~5 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `price`, `stock`, `detail`, `discount`, `created_at`, `updated_at`) VALUES
	(1, 'at', 67535, 19, 'Quibusdam fugit et ad aut. Architecto cupiditate error voluptatem illo ut. Nulla nisi autem quia eum quod voluptatibus praesentium. Quos quia non est.', 75, '2020-01-29 13:38:15', '2020-01-29 13:38:15'),
	(2, 'doloribus', 85054, 84, 'Facere dolorem nam eveniet sit. Nam non consequatur nihil atque voluptatem.', 59, '2020-01-29 13:38:15', '2020-01-29 13:38:15'),
	(3, 'sed', 14942, 68, 'Et ducimus nam omnis quia optio id. Distinctio suscipit ad dignissimos incidunt eligendi. Eveniet voluptatum aspernatur non debitis fugit omnis dolorem rem. Et nihil odio minus sapiente.', 98, '2020-01-29 13:38:15', '2020-01-29 13:38:15'),
	(4, 'dolore', 1086, 14, 'Adipisci iste at porro aut. Aspernatur minima dolores itaque voluptatum impedit. Occaecati et cum saepe recusandae ab quia aut. Voluptas iure maiores modi et corporis vel dolorem pariatur. Fugiat autem commodi eum atque.', 87, '2020-01-29 13:38:16', '2020-01-29 13:38:16'),
	(5, 'voluptatibus', 46990, 10, 'Provident eos soluta non quo. Et temporibus quia non. Mollitia molestias aut similique et officia enim sint.', 77, '2020-01-29 13:38:16', '2020-01-29 13:38:16');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table eapi.reviews
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `products_id` bigint(20) unsigned NOT NULL,
  `customer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `star` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_products_id_index` (`products_id`),
  CONSTRAINT `reviews_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eapi.reviews: ~15 rows (approximately)
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` (`id`, `products_id`, `customer`, `review`, `star`, `created_at`, `updated_at`) VALUES
	(1, 5, 'Mrs. Larissa Kunde DVM', 'Soluta omnis aut quia reprehenderit explicabo quas. Omnis adipisci repudiandae molestiae modi ab. Dolore doloremque totam maxime unde deleniti ipsa impedit.', 4, '2020-01-29 13:38:16', '2020-01-29 13:38:16'),
	(2, 2, 'Dr. Kadin Nikolaus I', 'Qui ipsam est error omnis. Eius quaerat sint consequatur quia iure velit dolor. Molestiae reiciendis est omnis et. Neque sunt aperiam numquam occaecati ipsam.', 2, '2020-01-29 13:38:16', '2020-01-29 13:38:16'),
	(3, 5, 'Elsie Russel', 'Rerum praesentium sit non libero beatae consectetur. Sit eum odio culpa sint a consequuntur qui. Doloribus accusantium in error numquam accusantium. Sit dignissimos sequi iste ea quo.', 0, '2020-01-29 13:38:16', '2020-01-29 13:38:16'),
	(4, 3, 'Shakira Emard MD', 'Quisquam ea quasi omnis quia. Autem ipsam est ad eum ipsam. Voluptatibus et qui commodi ex eveniet suscipit aut tempore.', 2, '2020-01-29 13:38:16', '2020-01-29 13:38:16'),
	(5, 3, 'Jordyn Mayer', 'Tenetur quasi consequatur magni pariatur. Id quo delectus et cumque. Reiciendis laboriosam neque eum maiores tenetur est.', 0, '2020-01-29 13:38:16', '2020-01-29 13:38:16'),
	(6, 3, 'Amara Huels', 'Ducimus nihil omnis omnis nesciunt. Quis qui et totam ex eius. Velit quia dolorem aperiam reiciendis.', 4, '2020-01-29 13:38:16', '2020-01-29 13:38:16'),
	(7, 1, 'Bianka Kautzer MD', 'Est tenetur perferendis dolores aut facilis sint. Ad nobis quia quibusdam ipsam ea iste a. Aspernatur qui ea suscipit et minus nesciunt placeat consequatur. In occaecati facere sunt vero sunt vitae possimus reiciendis.', 1, '2020-01-29 13:38:17', '2020-01-29 13:38:17'),
	(8, 5, 'Miss Bria Emard Sr.', 'Ut quibusdam odio consequuntur. Occaecati modi aliquid a ea. Sapiente iste labore ipsa dicta.', 4, '2020-01-29 13:38:17', '2020-01-29 13:38:17'),
	(9, 5, 'Dr. Mohammad Homenick I', 'Harum laudantium quos excepturi corporis accusamus voluptatem et. Labore quis reprehenderit ut sit omnis aliquam explicabo. Qui et animi perferendis sed cumque praesentium.', 5, '2020-01-29 13:38:17', '2020-01-29 13:38:17'),
	(10, 2, 'Juanita Heidenreich', 'Ut est quia dolores sit. Quasi occaecati hic et expedita. Aliquam quo aliquid iste quasi eum dolore tempore.', 5, '2020-01-29 13:38:17', '2020-01-29 13:38:17'),
	(11, 1, 'Mr. Americo Kuphal DDS', 'Eum tempore et voluptate perspiciatis tempore. At eius sed ex quia et nemo delectus doloremque. Deserunt alias aspernatur cupiditate est nihil fugiat quaerat.', 4, '2020-01-29 13:38:17', '2020-01-29 13:38:17'),
	(12, 2, 'Jeromy Koepp DVM', 'Beatae impedit dolorum voluptatem. Vero aut quo consequatur vel quod quis ipsum. Error expedita quasi rerum veritatis facilis. Assumenda quo inventore vero alias.', 2, '2020-01-29 13:38:17', '2020-01-29 13:38:17'),
	(13, 4, 'Dedrick Witting', 'Dolores consequatur soluta et accusantium sint officia. Delectus vel est sunt ipsa eveniet.', 3, '2020-01-29 13:38:17', '2020-01-29 13:38:17'),
	(14, 1, 'Ms. Jeanne Stoltenberg PhD', 'Quo possimus et nisi suscipit est animi. Ut quo rem et est nisi qui animi. Accusantium quod aut repellendus cum.', 2, '2020-01-29 13:38:17', '2020-01-29 13:38:17'),
	(15, 2, 'Dawn Huel', 'Doloremque et eos nulla quos. Et culpa aut voluptatum sunt incidunt itaque. Quo saepe consequatur quod est eum alias.', 3, '2020-01-29 13:38:17', '2020-01-29 13:38:17');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;

-- Dumping structure for table eapi.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table eapi.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
