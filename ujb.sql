-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



-- Dumping structure for table ujb.aktifitas
CREATE TABLE IF NOT EXISTS `aktifitas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tgl_jam_kejadian` datetime NOT NULL,
  `catatan_patroli` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.aktifitas: ~1 rows (approximately)
/*!40000 ALTER TABLE `aktifitas` DISABLE KEYS */;
INSERT INTO `aktifitas` (`id`, `tgl_jam_kejadian`, `catatan_patroli`, `gambar`, `created_at`, `updated_at`) VALUES
	(1, '2022-06-23 10:22:33', 'asdasdasda', 'upload/gambar/1655352960.383185.png', '2022-06-23 10:22:43', '2022-06-23 10:22:44');
/*!40000 ALTER TABLE `aktifitas` ENABLE KEYS */;

-- Dumping structure for table ujb.atensi
CREATE TABLE IF NOT EXISTS `atensi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `atensi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL DEFAULT '0',
  `petugas_id` int(11) NOT NULL DEFAULT '0',
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `isi_atensi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.atensi: ~1 rows (approximately)
/*!40000 ALTER TABLE `atensi` DISABLE KEYS */;
INSERT INTO `atensi` (`id`, `atensi`, `site_id`, `petugas_id`, `tanggal_mulai`, `tanggal_selesai`, `isi_atensi`, `created_at`, `updated_at`) VALUES
	(1, 'asssssss', 1, 1, '2022-06-23', '2022-06-24', 'fgggggggggggggggggg', '2022-06-23 10:23:15', NULL);
/*!40000 ALTER TABLE `atensi` ENABLE KEYS */;

-- Dumping structure for table ujb.client
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reseller_id` int(11) NOT NULL,
  `provinsi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telp` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_client` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic_telp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic_email` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.client: ~0 rows (approximately)
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;

-- Dumping structure for table ujb.divisi
CREATE TABLE IF NOT EXISTS `divisi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reseller_id` int(11) DEFAULT NULL,
  `id_divisi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_divisi` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `divisi_id_divisi_unique` (`id_divisi`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.divisi: ~3 rows (approximately)
/*!40000 ALTER TABLE `divisi` DISABLE KEYS */;
INSERT INTO `divisi` (`id`, `reseller_id`, `id_divisi`, `nama_divisi`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Non voluptas cupidit', 'Nesciunt in et culp', '2022-06-17 04:10:17', '2022-06-17 04:10:36'),
	(2, NULL, 'Eius dignissimos dol', 'Nostrum reprehenderi', '2022-06-17 08:02:54', '2022-06-17 08:02:54'),
	(4, NULL, 'Repudiandae eum null', 'Ea non consequat Qu', '2022-06-17 08:03:02', '2022-06-17 08:03:02');
/*!40000 ALTER TABLE `divisi` ENABLE KEYS */;

-- Dumping structure for table ujb.domisili
CREATE TABLE IF NOT EXISTS `domisili` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reseller_id` int(11) DEFAULT NULL,
  `petugas_id` int(11) NOT NULL,
  `provinsi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelurahan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.domisili: ~1 rows (approximately)
/*!40000 ALTER TABLE `domisili` DISABLE KEYS */;
INSERT INTO `domisili` (`id`, `reseller_id`, `petugas_id`, `provinsi`, `kota`, `kecamatan`, `kelurahan`, `alamat`, `created_at`, `updated_at`) VALUES
	(2, NULL, 4, 'Banten', 'Kota Tangerang', 'Cibodas', 'Cibodas Baru', 'asdsadd', '2022-06-22 03:58:09', '2022-06-22 03:58:09');
/*!40000 ALTER TABLE `domisili` ENABLE KEYS */;

-- Dumping structure for table ujb.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table ujb.group
CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `group_id` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table ujb.group: ~3 rows (approximately)
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` (`id`, `site_id`, `group_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Jancuker', '2022-06-16 05:05:20', '2022-06-16 05:05:20'),
	(2, 1, 'Autem ad fuga Disti', '2022-06-17 08:02:25', '2022-06-17 08:02:25'),
	(3, 2, 'Architecto provident', '2022-06-17 08:02:41', '2022-06-20 06:55:58');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;

-- Dumping structure for table ujb.kehadiran
CREATE TABLE IF NOT EXISTS `kehadiran` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `petugas_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `gambar_masuk` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar_keluar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_keluar` time NOT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.kehadiran: ~1 rows (approximately)
/*!40000 ALTER TABLE `kehadiran` DISABLE KEYS */;
INSERT INTO `kehadiran` (`id`, `client_id`, `petugas_id`, `site_id`, `gambar_masuk`, `gambar_keluar`, `tanggal`, `status`, `jam_masuk`, `jam_keluar`, `catatan`, `created_at`, `updated_at`) VALUES
	(2, NULL, 3, 1, 'upload/gambar/1655352960.383185.png', 'upload/gambar/1655352960.383185.png', '2022-06-23', 'SDFDSFSDFSDFS', '10:27:18', '10:27:19', 'ASDSAFDFDSFDS', '2022-06-23 10:27:23', NULL);
/*!40000 ALTER TABLE `kehadiran` ENABLE KEYS */;

-- Dumping structure for table ujb.laporan_patroli
CREATE TABLE IF NOT EXISTS `laporan_patroli` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tgl_jam_kejadian` datetime NOT NULL,
  `pos_jaga_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `petugas_id` int(11) DEFAULT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci,
  `resolusi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gambar_satu` text COLLATE utf8mb4_unicode_ci,
  `gambar_dua` text COLLATE utf8mb4_unicode_ci,
  `gambar_tiga` text COLLATE utf8mb4_unicode_ci,
  `gambar_empat` text COLLATE utf8mb4_unicode_ci,
  `gambar_lima` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.laporan_patroli: ~1 rows (approximately)
/*!40000 ALTER TABLE `laporan_patroli` DISABLE KEYS */;
INSERT INTO `laporan_patroli` (`id`, `tgl_jam_kejadian`, `pos_jaga_id`, `site_id`, `petugas_id`, `catatan`, `resolusi`, `gambar_satu`, `gambar_dua`, `gambar_tiga`, `gambar_empat`, `gambar_lima`, `created_at`, `updated_at`) VALUES
	(1, '2022-06-23 10:23:28', 1, 1, 3, 'jsfkdshfjdshfkjds', 'LJSDLFJSLDFJlkjdsjflksd', 'upload/gambar/1655352960.383185.png', 'upload/gambar/1655352960.383185.png', 'upload/gambar/1655352960.383185.png', 'upload/gambar/1655352960.383185.png', 'upload/gambar/1655352960.383185.png', '2022-06-23 10:24:00', NULL);
/*!40000 ALTER TABLE `laporan_patroli` ENABLE KEYS */;

-- Dumping structure for table ujb.master_aktifitas
CREATE TABLE IF NOT EXISTS `master_aktifitas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pos_jaga_id` int(11) NOT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.master_aktifitas: ~0 rows (approximately)
/*!40000 ALTER TABLE `master_aktifitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_aktifitas` ENABLE KEYS */;

-- Dumping structure for table ujb.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.migrations: ~20 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2022_04_04_052634_create_site_table', 1),
	(6, '2022_04_04_052743_create_petugas_table', 1),
	(7, '2022_04_04_052812_create_divisi_table', 1),
	(8, '2022_04_04_052829_create_tingkatan_posisi_table', 1),
	(9, '2022_04_04_052846_create_rekrutmen_table', 1),
	(10, '2022_04_04_052857_create_domisili_table', 1),
	(11, '2022_04_04_052911_create_pos_jaga_table', 1),
	(12, '2022_04_04_052924_create_periode_penggajian_table', 1),
	(13, '2022_04_04_052935_create_peristiwa_table', 1),
	(14, '2022_04_04_052953_create_laporan_patroli_table', 1),
	(15, '2022_04_04_053009_create_master_aktifitas_table', 1),
	(16, '2022_04_04_053020_create_kehadiran_table', 1),
	(17, '2022_04_04_053031_create_atensi_table', 1),
	(18, '2022_06_02_040800_create_client_table', 1),
	(19, '2022_06_02_072506_create_reseller_table', 1),
	(20, '2022_06_22_065625_create_aktifitas_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table ujb.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table ujb.periode_penggajian
CREATE TABLE IF NOT EXISTS `periode_penggajian` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reseller_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `petugas_id` int(11) NOT NULL,
  `gaji_pokok` double(8,2) NOT NULL,
  `uang_saku` double(8,2) NOT NULL,
  `pengurangan` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.periode_penggajian: ~2 rows (approximately)
/*!40000 ALTER TABLE `periode_penggajian` DISABLE KEYS */;
INSERT INTO `periode_penggajian` (`id`, `reseller_id`, `site_id`, `petugas_id`, `gaji_pokok`, `uang_saku`, `pengurangan`, `created_at`, `updated_at`) VALUES
	(1, NULL, 3, 11, 13.00, 86.00, 43.00, '2022-06-22 06:47:50', '2022-06-22 06:47:50'),
	(3, NULL, 1, 4, 1.00, 3.00, 60.00, '2022-06-22 06:50:18', '2022-06-22 06:50:28');
/*!40000 ALTER TABLE `periode_penggajian` ENABLE KEYS */;

-- Dumping structure for table ujb.peristiwa
CREATE TABLE IF NOT EXISTS `peristiwa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `nama_peristiwa` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi_peristiwa` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.peristiwa: ~1 rows (approximately)
/*!40000 ALTER TABLE `peristiwa` DISABLE KEYS */;
INSERT INTO `peristiwa` (`id`, `client_id`, `site_id`, `nama_peristiwa`, `deskripsi_peristiwa`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 'ADSADADAS', 'ASDSADSAD', '2022-06-23 10:28:06', NULL);
/*!40000 ALTER TABLE `peristiwa` ENABLE KEYS */;

-- Dumping structure for table ujb.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.personal_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table ujb.petugas
CREATE TABLE IF NOT EXISTS `petugas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `id_petugas` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) DEFAULT NULL,
  `gambar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` text COLLATE utf8mb4_unicode_ci,
  `kta` text COLLATE utf8mb4_unicode_ci,
  `nama` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_lahir` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_sim` enum('A','C','B1','B2') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_sim` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `divisi_id` int(11) DEFAULT NULL,
  `tingkatan_posisi_id` int(11) DEFAULT NULL,
  `report_to` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.petugas: ~11 rows (approximately)
/*!40000 ALTER TABLE `petugas` DISABLE KEYS */;
INSERT INTO `petugas` (`id`, `client_id`, `id_petugas`, `is_active`, `gambar`, `tag`, `kta`, `nama`, `jenis_kelamin`, `pin`, `nik`, `tanggal_lahir`, `tempat_lahir`, `jenis_sim`, `nomor_sim`, `group_id`, `divisi_id`, `tingkatan_posisi_id`, `report_to`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Sed adipisicing cons', 0, 'upload/gambar/1655352960.383185.png', NULL, 'Fugiat aut eveniet', 'Tempor facere nesciu', 'P', '6', '44', '1972-01-20', 'Enim qui saepe incid', 'A', 'Occaecat qui veniam', 1, 2, 1, NULL, '2022-06-15 04:44:13', '2022-06-22 04:12:51'),
	(3, NULL, 'Consequat Libero ut', 1, 'upload/gambar/1655371920.a.jpeg', NULL, 'Non voluptas eu omni', 'Sit nobis quae susci', 'L', '66', '93', '1986-05-12', 'Ad autem esse excep', 'A', 'Occaecat a officiis', 2, 1, 1, NULL, '2022-06-15 04:48:07', '2022-06-17 03:26:44'),
	(4, NULL, 'Voluptatem accusamus', 1, '383185.png', NULL, 'Eveniet mollitia ac', 'Aperiam eligendi ut', 'L', '87', '71', '2013-01-18', 'Enim in labore conse', 'A', 'Mollit quis lorem id', 1, 2, 1, NULL, '2022-06-15 04:49:15', '2022-06-15 04:49:15'),
	(5, NULL, 'Laborum enim invento', 1, '383185.png', NULL, 'Consequatur architec', 'Voluptatem aliqua C', 'P', '2', '44', '2017-11-27', 'Nam accusamus eiusmo', 'A', 'Autem accusantium qu', 1, 2, 2, NULL, '2022-06-15 04:54:12', '2022-06-16 09:57:48'),
	(6, NULL, 'Blanditiis voluptate', 0, '383185.png', NULL, 'Quisquam ea dicta id', 'Tempor molestiae ali', 'P', '59', '22', '2002-08-15', 'In amet et duis tot', 'A', 'Unde libero totam eo', 1, 1, 1, NULL, '2022-06-15 04:55:33', '2022-06-16 09:57:27'),
	(8, NULL, 'Delectus perferendi', 0, 'upload/gambar/1655278865.wp6387997.jpg', NULL, 'Maiores dolore ut ne', 'Sit necessitatibus v', 'P', '45', '32', '2017-05-12', 'Rerum magna corporis', 'A', 'Iusto id consequatur', 1, 1, 1, NULL, '2022-06-15 04:59:16', '2022-06-15 07:41:05'),
	(9, NULL, 'In architecto est s', 1, 'upload/gambar/1655280922.Sonoma-California-wallpaper-desktop-wallpapers-hd.jpg', NULL, 'Autem ad et excepteu', 'Voluptatibus ad accu', 'L', '36', '50', '1973-08-25', 'Dolor corporis volup', 'A', 'Minim facere in in r', 2, 1, 1, NULL, '2022-06-15 05:02:20', '2022-06-16 03:37:34'),
	(10, NULL, 'Sed voluptatum fuga', 1, 'upload/gambar/1655436493.s.jpg', NULL, 'Non aut vitae conseq', 'Do veniam cum enim', 'P', '64', '66', '2018-12-15', 'Numquam dicta in ver', 'A', 'Inventore officia se', 1, 2, 1, 1, '2022-06-17 03:28:13', '2022-06-17 03:29:55'),
	(11, NULL, 'Delectus non saepe', 1, 'upload/gambar/1655453506.favicon.png', NULL, 'Perspiciatis quo do', 'Omnis aliqua Nihil', 'L', '9', '66', '1994-07-20', 'Ab ea aliqua Quod q', 'A', 'Autem temporibus ex', 3, 1, 2, 1, '2022-06-17 08:11:46', '2022-06-17 08:17:23'),
	(12, NULL, 'Provident maxime qu', NULL, 'upload/gambar/1655453902.tesla-roadster.jpg', NULL, 'Illo aut nulla eum e', 'Explicabo Quidem do', 'P', '67', '86', '1991-11-16', 'Similique voluptate', 'A', 'Aliquid sit eveniet', 2, 4, 1, 1, '2022-06-17 08:18:22', '2022-06-17 08:18:43'),
	(13, NULL, 'Aliquip recusandae', NULL, 'upload/gambar/1655455871.asd.jpg', NULL, 'Rerum velit cillum a', 'Officia et est amet', 'P', '27', '22', '2016-07-19', 'Lorem ab rerum possi', 'A', 'Sit labore voluptat', 1, 1, 1, 1, '2022-06-17 08:51:11', '2022-06-17 08:51:11');
/*!40000 ALTER TABLE `petugas` ENABLE KEYS */;

-- Dumping structure for table ujb.pos_jaga
CREATE TABLE IF NOT EXISTS `pos_jaga` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `id_pos` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pos_jaga` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_qode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pos_jaga_qr_qode_unique` (`qr_qode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.pos_jaga: ~2 rows (approximately)
/*!40000 ALTER TABLE `pos_jaga` DISABLE KEYS */;
INSERT INTO `pos_jaga` (`id`, `site_id`, `client_id`, `id_pos`, `nama_pos_jaga`, `longitude`, `latitude`, `deskripsi`, `qr_qode`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 'Ducimus perferendis', 'Accusamus asperiores', 'Tenetur quae volupta', 'Odio laborum ea cons', 'Sunt enim ullam dese', NULL, '2022-06-20 03:57:49', '2022-06-20 03:57:49'),
	(3, 2, NULL, 'Nisi est quasi beat', 'Ea earum cupidatat v', 'Veniam sunt debitis', 'Lorem commodi ipsum', 'Nostrum et in labore', NULL, '2022-06-20 04:39:01', '2022-06-20 04:39:01');
/*!40000 ALTER TABLE `pos_jaga` ENABLE KEYS */;

-- Dumping structure for table ujb.rekrutmen
CREATE TABLE IF NOT EXISTS `rekrutmen` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reseller_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `petugas_id` int(11) NOT NULL,
  `status_karyawan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periode` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lamaran` date NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.rekrutmen: ~1 rows (approximately)
/*!40000 ALTER TABLE `rekrutmen` DISABLE KEYS */;
INSERT INTO `rekrutmen` (`id`, `reseller_id`, `site_id`, `petugas_id`, `status_karyawan`, `periode`, `tanggal_lamaran`, `tanggal_mulai`, `tanggal_selesai`, `created_at`, `updated_at`) VALUES
	(1, NULL, 3, 12, 'Percobaan / Probation', '3', '1970-07-10', '2004-06-08', '2002-07-08', '2022-06-20 08:55:54', '2022-06-20 08:58:29');
/*!40000 ALTER TABLE `rekrutmen` ENABLE KEYS */;

-- Dumping structure for table ujb.reseller
CREATE TABLE IF NOT EXISTS `reseller` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telpon` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handphone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grup` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `kota` text COLLATE utf8mb4_unicode_ci,
  `kelurahan` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_pos` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit_site` int(11) NOT NULL DEFAULT '0',
  `limit_petugas_staff` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reseller_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.reseller: ~1 rows (approximately)
/*!40000 ALTER TABLE `reseller` DISABLE KEYS */;
INSERT INTO `reseller` (`id`, `nama`, `telpon`, `handphone`, `grup`, `alamat`, `kota`, `kelurahan`, `kode_pos`, `email`, `limit_site`, `limit_petugas_staff`, `created_at`, `updated_at`) VALUES
	(1, 'Wantafa', '0215728391', '082813839', 'In omnis tenetur vel', 'Maiores officia fugi', 'Eveniet ut omnis om', 'Qui necessitatibus i', '59', 'gygi@mailinator.com', 3, 3, '2022-06-14 07:22:55', '2022-06-27 07:59:54');
/*!40000 ALTER TABLE `reseller` ENABLE KEYS */;

-- Dumping structure for table ujb.site
CREATE TABLE IF NOT EXISTS `site` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `provinsi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kota` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `telpon` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelanggan` int(11) DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_site` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_telpon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.site: ~3 rows (approximately)
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` (`id`, `provinsi`, `kota`, `longitude`, `latitude`, `telpon`, `pelanggan`, `alamat`, `nama_site`, `pic`, `pic_telpon`, `pic_email`, `created_at`, `updated_at`) VALUES
	(1, 'Similique corrupti', 'Vero porro molestiae', 'Voluptas Nam et sed', 'Omnis totam sint au', '86', NULL, 'Qui asperiores magna', 'Ea veniam modi sapi', 'Totam non omnis debi', '4', 'ronux@mailinator.com', '2022-06-15 03:06:28', '2022-06-15 03:06:28'),
	(2, 'Quia minus praesenti', 'Doloribus et sint ma', 'Fugit aperiam minim', 'Aut tenetur voluptat', '90', NULL, 'Voluptate sed est Na', 'Sed nulla et atque a', 'Error saepe perferen', '87', 'xaxolo@mailinator.com', '2022-06-20 04:09:40', '2022-06-20 04:09:40'),
	(3, 'Dolorum debitis iure', 'Distinctio Tenetur', 'Veniam irure fuga', 'Sequi nisi delectus', '56', NULL, 'Ut omnis veniam dol', 'Anim a dolor omnis o', 'Culpa ea fugiat tene', '20', 'hajofot@mailinator.com', '2022-06-20 04:09:52', '2022-06-20 04:09:52');
/*!40000 ALTER TABLE `site` ENABLE KEYS */;

-- Dumping structure for table ujb.tingkatan_posisi
CREATE TABLE IF NOT EXISTS `tingkatan_posisi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `is_active` int(11) DEFAULT NULL,
  `reseller_id` int(11) DEFAULT NULL,
  `kode_tingkat` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tingkat` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_tingkatan` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tingkatan_posisi_id_tingkat_unique` (`id_tingkat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.tingkatan_posisi: ~3 rows (approximately)
/*!40000 ALTER TABLE `tingkatan_posisi` DISABLE KEYS */;
INSERT INTO `tingkatan_posisi` (`id`, `is_active`, `reseller_id`, `kode_tingkat`, `id_tingkat`, `nama_tingkatan`, `created_at`, `updated_at`) VALUES
	(1, NULL, NULL, 'Non itaque rem ullam', 'Commodi odit sit au', 'Dolor ullamco culpa', '2022-06-17 07:10:39', '2022-06-17 07:10:39'),
	(2, NULL, NULL, 'Est dolor fugiat qu', 'Itaque fugiat excep', 'Dolores ut est recus', '2022-06-17 08:03:13', '2022-06-17 08:03:13'),
	(4, NULL, NULL, 'Ipsum quia sit dolo', 'Repudiandae quam aut', 'Magnam ipsa soluta', '2022-06-17 08:03:34', '2022-06-17 08:03:34');
/*!40000 ALTER TABLE `tingkatan_posisi` ENABLE KEYS */;

-- Dumping structure for table ujb.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` enum('administrator','staff admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ujb.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `roles`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'HSEO', 'hseo@gmail.com', NULL, '$2y$10$wlWD9jhueXL1p8GUcVwItOuJ7scTMLPq9VTXSyxJpx92y5V0nN.HK', 'administrator', NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
