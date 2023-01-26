-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 14 Okt 2022 pada 13.52
-- Versi server: 5.7.36
-- Versi PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coba2_laravel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Web Programming', 'web-programming', '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(2, 'Web Design', 'web-design', '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(3, 'Personal', 'personal', '2022-10-11 23:42:40', '2022-10-11 23:42:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_09_02_023711_create_posts_table', 1),
(6, '2022_09_05_064424_create_categories_table', 1),
(7, '2022_10_14_133704_add_is_admin_to_users_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `title`, `slug`, `image`, `excerpt`, `body`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Rem nisi repellat ut quod iure.', 'facere-dolor-cupiditate-quia-voluptas', NULL, 'Nulla sit amet cumque accusantium quia hic aut. Dicta eos est sunt ut voluptatum. Laudantium exercitationem est sunt neque quos vero non.', '<p>Autem aut in dolores eius vel. Et asperiores delectus aut sequi. Est dolorem sint aut rerum. Iusto dicta dicta a est fugiat soluta.</p><p>Laborum nihil accusantium doloremque debitis odio corrupti porro. Rerum cum nihil ea ducimus laudantium amet. Magnam dolores et doloribus velit ullam non qui autem. Reiciendis nesciunt iusto aliquid et.</p><p>Numquam cumque minus consequatur fugiat sed dolorum eveniet. Labore quam quisquam optio asperiores commodi. Culpa et animi a. Recusandae earum eligendi sunt repellat voluptatibus ipsa iusto.</p><p>Deleniti molestiae ea harum et. Modi eum non consequatur necessitatibus et dolores. Dignissimos ipsam ipsam voluptas perspiciatis vel. Porro incidunt optio totam dolores ducimus.</p><p>Ut suscipit eum facilis quis sed et est itaque. Consequatur consectetur ut nulla pariatur labore veniam quod. Sint adipisci quo autem qui quia ut recusandae.</p><p>Animi repellendus sed omnis ad aut sint. Tempora dignissimos maxime quisquam distinctio amet. Dignissimos nihil perferendis sint. Rerum enim ipsam et distinctio.</p><p>Hic consectetur labore et earum. Expedita libero laboriosam inventore temporibus. Aut molestiae odit dolor unde.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(2, 1, 2, 'Nemo quibusdam quas praesentium rerum voluptate nemo laboriosam.', 'natus-molestiae-sit-ea-soluta', NULL, 'Quidem quis voluptates accusantium quas. Vitae ad sit officia vel. Consequuntur alias eligendi id sequi omnis aspernatur soluta.', '<p>Id in veniam est amet molestiae. Consequuntur dolorum veritatis commodi sunt ut. Non possimus aliquid iure non assumenda. Qui vel praesentium natus.</p><p>Quos voluptatem minus reprehenderit in illum molestiae cum. Perspiciatis rerum vel enim et quia. Similique numquam est quos eos commodi in. Consectetur totam et beatae et et ut.</p><p>Non suscipit rerum enim dolores non omnis neque. Voluptatem inventore voluptatum iusto ducimus quasi.</p><p>Architecto a soluta libero repudiandae qui. Est nihil mollitia eum. Sunt maiores eaque quia tempora error sed. Vitae amet est nihil similique id voluptas harum quibusdam.</p><p>Modi et modi molestias in in quam. Esse dolorem consectetur enim veritatis libero inventore fugiat. Voluptatem rerum iste nam nihil sit. Animi qui porro doloremque id qui.</p><p>Sit ut aut perferendis in quas eius possimus. Itaque qui consequatur eligendi animi aut. Veritatis doloribus sequi fugiat.</p><p>Alias quo odio nihil sed facere. Necessitatibus qui exercitationem modi possimus voluptatem quia consequatur. Rem numquam eum laboriosam voluptate ut vel.</p><p>Dolorem natus dignissimos ut eum laboriosam. Beatae quo recusandae soluta ullam nihil est. Mollitia quam est illo tenetur consequatur ut. Ipsam ab unde alias voluptate harum necessitatibus.</p><p>Minus rerum quaerat voluptas aut ab quia. Alias cum quos est id laborum. Quia eveniet vel esse. Hic sit aut et itaque quasi odit.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(3, 2, 1, 'Culpa quis.', 'et-quia-porro-ea-atque-earum-unde-ullam', NULL, 'Libero dolor fuga facilis earum. Hic ratione omnis nulla adipisci. Beatae nobis tempora ex modi aliquid tempora ipsam.', '<p>Unde amet culpa sit perferendis. Tempore non et eum maiores. Eius qui consequatur harum qui est.</p><p>Dolore non mollitia dolorum accusantium sit delectus. Tempora doloribus eos consectetur quasi excepturi eaque cupiditate.</p><p>Ipsa non laboriosam minus veniam id odio porro. Omnis et ut quod reiciendis dolor. Rerum assumenda quia nulla magnam quam aperiam est.</p><p>Maiores est consequatur pariatur aspernatur omnis odio placeat. Voluptatibus quis eum non pariatur. Distinctio hic id magnam dolorem autem dolores aliquam.</p><p>Vero cumque dignissimos et praesentium alias voluptas suscipit. Nemo nostrum rerum autem earum aut. Excepturi aspernatur nisi aut ducimus nihil ut. Eaque exercitationem exercitationem assumenda iusto dolores maxime.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(4, 2, 2, 'Esse sequi doloremque excepturi ullam.', 'et-similique-earum-incidunt-nam-ratione-voluptatibus-est', NULL, 'Necessitatibus velit sunt aperiam neque est et quo. Et aperiam ex et ab et similique. Dolor nulla cumque porro minima voluptate voluptates.', '<p>Dolorum sit consequuntur magnam incidunt neque porro. Dignissimos voluptatibus sapiente quia fuga sed enim laborum praesentium. Nobis dolor id quod quas sapiente et autem.</p><p>Placeat ut aut dolor eos labore. Tempore consequatur quo ut voluptatem quis. Unde harum ipsum eos officiis repudiandae molestiae.</p><p>Quibusdam perferendis facere voluptatem amet alias rerum ut. Doloribus tempora aliquam exercitationem rerum doloribus rerum placeat.</p><p>Similique est quidem vero numquam ut blanditiis. Quibusdam minima maiores optio sapiente. Rerum quae hic molestiae. Iste commodi adipisci consequatur vero.</p><p>Libero sunt eum quaerat aut. Nostrum quaerat eum et veniam. Voluptas perferendis distinctio harum omnis.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(5, 2, 2, 'Deleniti cumque possimus.', 'et-et-enim-omnis-consectetur-consequuntur-architecto-rerum', NULL, 'Quisquam id sint quis rerum. Fugit qui quisquam et dolores nisi dignissimos. Optio expedita sint iusto eos minima. Eum enim velit fugit beatae blanditiis amet numquam repudiandae.', '<p>Officiis quis et velit et sunt vero. Esse debitis omnis delectus. Sed molestiae accusamus ut asperiores voluptatem minima ut. Accusantium doloremque ut nihil.</p><p>Sint magnam qui et illo ab natus. Deserunt non aspernatur fugiat. Voluptate aut sed pariatur aliquam ea ad odit.</p><p>Distinctio a itaque est nemo hic. Iure hic assumenda ut sed molestiae aperiam. Corrupti maiores at tempore eius. Tenetur aut aut delectus maiores consequatur error pariatur.</p><p>Ex aut quo et ut voluptas explicabo harum. Velit consectetur qui non pariatur est voluptatem. Ratione hic autem enim voluptatem.</p><p>Quisquam voluptatem earum quibusdam. Vel sed commodi hic sed repellat facilis. Et delectus impedit ipsa in eos. Ad rerum repudiandae doloribus in.</p><p>Asperiores consequatur at laborum laborum molestiae. Et aut quisquam voluptatem voluptates soluta. Labore et voluptas iste eaque nihil consequuntur.</p><p>Assumenda fugiat consequatur fugiat rerum modi at. Vero aut nemo quia expedita ab adipisci tenetur. Facilis assumenda totam aut natus.</p><p>Sit eum quisquam unde qui laborum. Reiciendis hic fugiat id unde. Inventore et sint consequatur dolor eaque tenetur ut.</p><p>Eaque minus alias sint minus veniam. Voluptate nihil veniam et eligendi veritatis aspernatur sunt. Id ab labore iusto illum fugit expedita facilis.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(6, 1, 3, 'Est dicta quod.', 'minus-ad-laborum-ut-omnis-qui', NULL, 'Modi perspiciatis omnis placeat ullam consequatur et odit. Eaque consectetur quod et ea facere ab alias omnis. Nisi nobis et consequatur recusandae quibusdam.', '<p>Sed sed fuga assumenda laboriosam iure. Ipsum quo inventore nesciunt voluptatem repudiandae. Beatae sint et earum maiores. Consequuntur aut non odio quod labore est laborum.</p><p>Deleniti assumenda aperiam veritatis consequatur alias. Repellat est libero assumenda et quae ea occaecati voluptas. Praesentium mollitia aliquid et est.</p><p>Aliquid harum quis quibusdam assumenda numquam. Beatae et ut fuga. Autem sequi sit fuga architecto.</p><p>Autem error magnam eveniet et neque in aut. Quod expedita veritatis autem aut quidem. Et eum ut accusantium quia doloremque sint.</p><p>Minima architecto itaque facilis quis nihil et. Aut consectetur a sunt maiores. Ipsum reiciendis maxime fugit voluptatem. Odio quia qui maiores.</p><p>Cum voluptas sint laudantium et sint modi. Atque sint ipsa modi eum nulla maxime architecto. Qui quia pariatur accusamus ut ipsa distinctio molestiae. Molestiae illum rerum doloremque non temporibus.</p><p>Ducimus eos dolore nesciunt accusantium. Repudiandae totam fugit natus ex aperiam cum totam. Ut minus et non suscipit ut. Quibusdam et ut minus voluptatem rerum numquam neque.</p><p>Sunt atque voluptatum sit et sunt. Id illum ea blanditiis ut laboriosam aut architecto. Voluptatem vitae iusto sit architecto voluptate.</p><p>Adipisci assumenda esse et necessitatibus in animi. Corporis aspernatur quasi quasi. Quia vel consequatur quia fugit aut id.</p><p>Cum doloremque voluptate est deserunt quia quia. Quod incidunt qui dolorem a. Molestiae expedita pariatur cum et. Maiores autem nihil ea et hic aliquam.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(7, 1, 2, 'Molestiae ut nulla qui illo.', 'et-neque-qui-neque-facilis-saepe', NULL, 'In incidunt voluptatem maxime cum eveniet placeat consectetur. Qui quia iusto assumenda quia sunt dolorum sint. Quibusdam numquam quos alias nobis. Commodi tempore quibusdam et rerum a.', '<p>Et dolorem optio iusto rerum consectetur natus. Consequatur aperiam ex nostrum eos praesentium sed eos autem.</p><p>Aut veniam asperiores qui corrupti totam corrupti ut. Tenetur enim at quod sit sapiente nesciunt. Aperiam quisquam et ad velit corrupti ab placeat. Aperiam perferendis et neque temporibus libero vel temporibus.</p><p>Accusamus architecto placeat aut itaque sint adipisci distinctio quas. Ut facere vero necessitatibus mollitia. Perspiciatis ullam et et odio accusamus sint delectus. Facilis et delectus et optio qui non.</p><p>Occaecati est tempora hic et nemo iusto praesentium. Illo aperiam provident harum quae voluptatem. Dolore enim et praesentium id. Veniam a et est quo hic quo dolorem.</p><p>Cum minima sunt illum voluptate. Unde eveniet blanditiis quibusdam quas dolorem cum consequuntur nihil. Ipsam quia magni sunt.</p><p>Ut ipsam magni harum qui eligendi eos et. Aut facere ut sed eum tempora odio rerum. Voluptatem consectetur nesciunt quis porro corporis tenetur.</p><p>Quam voluptatem repudiandae nemo tenetur et molestiae. Voluptatibus molestias aut reprehenderit quia qui ullam. Voluptas aut assumenda quia recusandae ipsa.</p><p>Et fugiat maiores quam aut. Ratione perferendis non et officia esse illum. Officia eum libero porro amet ducimus. Rerum quibusdam et cumque itaque laudantium sapiente.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(8, 2, 2, 'Optio autem facilis labore quo.', 'provident-nam-reprehenderit-maiores', NULL, 'Voluptatem quia non sunt quos. Neque eveniet laboriosam corrupti. Molestias suscipit provident voluptatibus et enim fuga. Eum voluptas nulla nulla quae tempore. Enim sit beatae optio iste perferendis.', '<p>Et cumque et quia officia. Eos debitis aspernatur velit voluptatem. Velit sapiente qui non et. Unde et aliquid consequatur labore id.</p><p>Harum nisi laboriosam a dolorum eveniet. Rerum et quia provident accusantium.</p><p>Possimus officiis perspiciatis unde officiis omnis est omnis quas. Sit iste est minus vel eveniet ut. Voluptas nihil illo ab.</p><p>Tenetur sint delectus hic ut veniam rerum. Laborum rerum quidem suscipit fugiat suscipit totam fugit mollitia. Nemo fuga rerum mollitia explicabo porro. Alias totam modi accusamus tenetur quibusdam.</p><p>Dicta aut at et occaecati assumenda illum. Distinctio ut ea voluptas cumque. Cumque ut ut quos sint deleniti minus qui.</p><p>Eos praesentium officiis molestiae. Voluptatem quisquam pariatur delectus quia animi quia nemo. Eum ullam perspiciatis eveniet ratione.</p><p>Incidunt illo saepe dolorem magnam ut. Aut sed dolorem atque deleniti et non molestias. Labore dignissimos velit quia laboriosam dolorem quam dolor. Harum facilis consequatur doloribus ut nam nesciunt qui.</p><p>Aperiam quae ad velit non impedit. Ut vel qui fugiat. Praesentium dicta corporis qui eligendi recusandae doloribus consequuntur. Voluptatem placeat nam aut mollitia hic necessitatibus. Qui et quidem similique perferendis dignissimos minus et.</p><p>Voluptatum id deleniti facilis repellat. Perspiciatis rem facere incidunt eum. Sit inventore rerum deserunt corporis accusantium.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(9, 2, 2, 'Molestiae placeat ut inventore a.', 'aspernatur-sequi-debitis-officiis-totam-similique-iusto', NULL, 'Aliquid rem eius aut dicta deleniti officia temporibus exercitationem. Dolor odio id perspiciatis unde suscipit vitae laudantium. Eos cupiditate in vel dolor voluptas sint.', '<p>Ullam magni libero autem. Doloribus aliquam non error et ducimus quia. Occaecati non et quod magni.</p><p>Minus ut sapiente sunt est. Explicabo nobis et vero cupiditate quaerat voluptatem. Amet voluptas non quidem nobis qui aut. Minus blanditiis et dolores.</p><p>Sunt sunt sed velit eligendi iusto possimus dicta. Qui commodi minus ullam. Dolor et eos quos atque et voluptates autem inventore. Consequuntur tempore cum odio fuga ut qui sint harum. In omnis sit non libero sit.</p><p>Incidunt dolor a est quaerat cum voluptatibus. Aliquid sapiente corrupti est vitae temporibus et. Ipsum maxime quo nobis laboriosam dolorum sunt. Qui pariatur fugiat in voluptas.</p><p>Nulla doloremque placeat magnam hic voluptatem ipsa et. Veniam enim velit qui ipsam.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(10, 2, 2, 'Ut illum ipsa qui officiis temporibus.', 'provident-sunt-facilis-reiciendis-blanditiis-voluptate', NULL, 'Est nihil eos quia sed id nulla. Minus soluta quae ratione eum. Est sit aut voluptatem cumque repellat quasi consequatur.', '<p>Magnam eligendi rerum corporis enim asperiores. Recusandae labore cupiditate laborum sed saepe voluptatem laudantium sequi. Illum et cupiditate omnis ea.</p><p>Ut pariatur delectus tenetur voluptas nesciunt. Quo est necessitatibus sit repellat dolores consequuntur doloribus explicabo. Laborum recusandae aut omnis aperiam sint quibusdam. Omnis omnis et tempore voluptatem.</p><p>Rerum vitae qui sequi consequatur iste facere. Eum aliquid adipisci est. Cumque magnam animi aut distinctio sint cumque repellendus. Sint molestiae rerum sunt et odio veniam.</p><p>Omnis expedita quibusdam quis dicta. Vel et quis quo consequatur. Voluptatem ut earum est quo consequatur accusantium accusamus.</p><p>Tenetur sint nihil repellendus debitis. Aut non modi impedit consectetur. Eos facilis cum aut quaerat.</p><p>Omnis eius sed tempore et nemo commodi officiis. Rerum et distinctio voluptatem suscipit. Repudiandae impedit sit dolorem qui hic eos quibusdam.</p><p>Odio qui dolores sint error. Consectetur consequatur illo similique reiciendis rerum sint eum. Deserunt laudantium dolores ex et. Repellendus est earum odio occaecati deserunt. Sed non pariatur dolores et cum et autem.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(11, 2, 3, 'Quas sequi ut qui nihil et.', 'et-voluptates-aut-expedita-eveniet', NULL, 'Aut amet qui harum est. Sunt vero qui enim atque distinctio. Qui necessitatibus ut animi. Voluptatem consequatur magnam reiciendis.', '<p>Quia unde quasi aut fugit distinctio distinctio dolor. Et id error autem quia. Eius consequatur consequuntur est qui aut et in.</p><p>Corrupti omnis aut magnam incidunt quia quas quibusdam qui. Et voluptatibus sed pariatur pariatur quae. Et a sit distinctio accusantium assumenda. Dolorem ea id fugiat dolores.</p><p>Quas totam doloribus maiores culpa at. Ut ex alias vero. Sunt veniam nihil voluptas eaque pariatur sit est similique. Non tempore voluptas cum dolores.</p><p>Et sit iure magni deleniti et nihil. Quia voluptas quia qui est. Modi consequuntur dolores ullam corrupti odio. Rerum non et distinctio.</p><p>Consequatur ut error corporis. Dolorem fugiat commodi temporibus et non nobis. A officiis dolore quaerat sequi.</p><p>Repudiandae et dolorem aut corporis magnam delectus odit. Sint nemo repellendus dolorem sequi cupiditate. Reiciendis quia aliquam fugiat voluptatibus.</p><p>Labore tempore assumenda non. Quia et perferendis accusamus sit nemo officia error. Quia laudantium sapiente et ullam sed blanditiis qui. Dignissimos omnis vero error temporibus. Eos modi reprehenderit est veniam modi.</p><p>Ratione velit animi aperiam et. Quo accusamus veniam est dicta cumque rerum. Pariatur earum in tenetur non a. Molestiae omnis et facere voluptate ullam sed omnis alias. Autem autem ut aperiam quis eius enim.</p><p>Quia aut tempora rerum rerum nihil. Temporibus voluptatibus ratione suscipit temporibus voluptate rem. Deserunt eaque odit temporibus magnam. Sint quia repellat aliquam quo non quisquam porro quisquam.</p><p>Ipsum sunt omnis numquam ipsam. Qui quo enim qui tenetur ad quia debitis. Eveniet voluptatem et tempore molestiae minus repudiandae. Molestias quidem et ut est eum illo rerum.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(12, 2, 3, 'Nulla fugit repellat vitae sit eum repellat quidem.', 'rerum-cumque-et-quia-dolore-consequuntur-sunt-molestias', NULL, 'Tempore quidem in suscipit harum itaque et voluptatem. Officiis sed sed qui temporibus ullam ut et. Quia facere explicabo quaerat maiores sit impedit hic. Error vitae adipisci quod amet.', '<p>Nulla minus aperiam sunt perferendis. Dolorem ab laudantium est nemo dicta eaque ratione. Nam dolorem nobis architecto corporis quidem sed velit totam. Quod debitis repellendus minus ullam molestias omnis. Dicta qui officia quod sunt placeat voluptas quidem.</p><p>Odit rerum sed voluptas quia ut. Molestiae at voluptas officia ratione suscipit ut. Ullam repudiandae voluptatem quaerat cupiditate.</p><p>Dolorem sit laboriosam ut modi rerum placeat rerum repellendus. Corporis odit placeat delectus corrupti doloribus. Provident quisquam quidem hic quo est nostrum. Tenetur beatae vitae accusamus quia sunt exercitationem.</p><p>Necessitatibus ex quae alias in consequuntur. Minima repellendus eaque est. Aut sed mollitia perferendis quaerat.</p><p>Optio nostrum libero soluta officia reiciendis ut. Amet sint enim ut maxime unde. Animi provident ut ratione atque. Eaque error ut voluptatum ad itaque ullam expedita. Ab dolorum eius tenetur sed est et voluptatem.</p><p>Pariatur inventore maiores mollitia qui harum. Soluta aspernatur et nisi quibusdam incidunt rerum eos. Facilis ullam molestiae eos consequatur voluptatem omnis beatae.</p><p>Sed qui dolores voluptates quod autem necessitatibus. Tempore sint quas odio eos. Nemo corporis voluptatem placeat sit qui aut voluptate.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(13, 1, 3, 'Optio labore non minima voluptatum qui nisi.', 'ea-quas-sed-quod-ratione', NULL, 'Voluptatem voluptas omnis qui enim aut consectetur magnam excepturi. Praesentium ut eligendi iure. Nostrum velit sed earum in qui et. Aperiam ea cumque totam doloremque perspiciatis at modi quaerat.', '<p>Rerum aut aut qui qui libero blanditiis. Ipsum pariatur placeat officia ipsa aliquam. Facilis dignissimos in laborum deleniti.</p><p>Aut accusamus et perferendis qui necessitatibus facere ab. Mollitia veritatis tempore omnis. Deserunt et et omnis quis.</p><p>Voluptatem pariatur consectetur qui voluptatem quia id. Ratione id corporis tempora non accusantium cumque ab a. Aut veritatis quisquam molestias ipsam error. Beatae sit quidem possimus dignissimos.</p><p>Laborum repudiandae quam maxime repellendus. Ducimus exercitationem rerum aspernatur est facilis consectetur. Accusantium totam quos veritatis aliquid quia cupiditate. Aut assumenda velit porro quam voluptatem ducimus.</p><p>Et ipsum enim eius voluptatem tempora ut. Saepe et ad ipsa debitis nesciunt quaerat ex illo. Fugiat eum ipsa sit ut atque ut eum.</p><p>Temporibus magnam aliquid autem. Velit ullam qui recusandae id facere neque. Sunt quo nesciunt ut.</p><p>Sed et ab pariatur cum quisquam quis. Enim sequi repellendus dolorem quia. Fugiat fugit perspiciatis dolorem et veritatis aut ab cum.</p><p>Esse qui ut voluptatum aut corrupti recusandae vel repellat. Placeat incidunt cupiditate voluptas eos quo ut. Laudantium veritatis repudiandae dolorum.</p><p>Et consequatur amet ut voluptatem fugit. Eum ducimus eos odit nesciunt necessitatibus. Quo optio ullam sunt est minima temporibus corrupti. Maxime nihil veritatis molestias itaque nisi.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(14, 2, 1, 'Animi dolor et eveniet non numquam nihil et quo.', 'vel-nihil-maxime-exercitationem-eaque-similique-voluptate', NULL, 'Assumenda aliquam dolores quibusdam consectetur. Sed non sapiente aspernatur ea hic.', '<p>Laborum qui sed et quasi consequuntur recusandae corrupti qui. Voluptatibus dolorem eum provident architecto veritatis vitae qui. Illum iste iste ut temporibus quia beatae. Voluptatem inventore necessitatibus sed eos voluptatem et et.</p><p>Cumque quo quia voluptatem et. Corporis voluptatem rerum et numquam et placeat sunt consequatur. Fugit et voluptas eligendi ipsum ut aut.</p><p>Est iure labore neque qui quod et. Sed totam nesciunt et quaerat quas quia. Delectus voluptatem omnis quod ut qui illum totam. Quis et deleniti laudantium provident facilis.</p><p>Libero facere magni placeat debitis ut veritatis. Laboriosam aliquam dolorem omnis ut dolor aliquid. Animi esse consequatur non sed possimus eum. Quia nihil velit quisquam fuga.</p><p>Quo mollitia atque vel voluptas. Animi tempore dolore sint corporis. Quis nisi consequatur in quasi ducimus.</p><p>Porro consequatur animi quos libero dolores doloribus earum adipisci. Reprehenderit expedita beatae voluptatum pariatur quibusdam doloribus quaerat doloremque. Qui dolorem eum aut. Sunt culpa ut ipsam eos ut.</p><p>Omnis molestias qui unde est facere saepe sint. Eum ut rerum soluta repudiandae eos aperiam dicta. Cupiditate dolores dolor odit tempora perferendis modi. Ipsa ab dolor sint repellendus.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(15, 2, 3, 'Minus laborum delectus aut.', 'qui-delectus-commodi-quia-id-quidem', NULL, 'Reiciendis dignissimos autem fugiat dicta asperiores rem. Nobis quae qui et et ut dolorum quo quia. Nihil debitis repudiandae est.', '<p>Occaecati rerum ea modi et alias cumque voluptatem. Laudantium nisi illum itaque laudantium et qui. Cupiditate aut dolores perspiciatis sint veritatis dolores vitae numquam.</p><p>Ea quibusdam aut libero explicabo dolore. Facere deleniti provident dolor et cupiditate sint. Illo dolorem a sint omnis voluptatibus delectus. Aspernatur quasi id nihil.</p><p>Quidem non et rerum nihil laudantium. Eaque cumque fugiat ullam voluptates similique. Porro cum quia et eum veniam sit.</p><p>Qui et recusandae neque incidunt molestiae molestias. Quisquam nisi vel officiis dolore.</p><p>Aperiam facilis quo minima dolores nihil est. Molestias ducimus corporis sint nobis sunt maiores et. Corrupti quasi ut deleniti. Est voluptatem deleniti dignissimos. Molestiae neque quas repellendus architecto impedit laborum fugiat animi.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(16, 2, 1, 'Quia reprehenderit ipsa expedita necessitatibus.', 'ut-et-eum-perferendis-aut-natus', NULL, 'Aliquam vitae autem modi doloremque. Error dolorum voluptates modi consequatur eos consequatur quisquam. Laborum inventore earum eos neque expedita ipsum eaque. Et consectetur voluptatum architecto ut blanditiis facere.', '<p>In omnis nulla sint dolorum excepturi. Voluptas sit hic architecto dolores porro. Voluptates sit suscipit et eum.</p><p>Voluptates ea deserunt et est molestiae. Qui qui fugiat vitae. Quaerat sit est inventore voluptatem consectetur. Excepturi soluta est sequi quaerat nihil.</p><p>Aut sit quaerat voluptatibus dolorem molestiae fugiat. Ab excepturi nesciunt qui magni nulla porro. Soluta id ut dolor animi ipsa est.</p><p>Quam magni quasi quia et saepe nam. Molestiae nam maxime sint. Est quisquam ea beatae ipsam.</p><p>Voluptatum sunt assumenda veritatis adipisci perspiciatis voluptas saepe. Iusto aut voluptatem assumenda unde quae. Iure ratione qui aperiam recusandae. Rem ad error similique.</p><p>Dolores perspiciatis quis dolorem fuga explicabo sint. Fuga est expedita voluptatem. Iusto quae pariatur quam. Eum in repellendus porro nulla cumque accusamus in nesciunt.</p><p>Quo placeat voluptatem repudiandae et voluptate. Tenetur ut reprehenderit vel qui sequi enim. Et recusandae ex numquam qui ipsam.</p><p>Sapiente aut doloribus dolores labore dolores et in. Rerum minima sit tenetur aspernatur. Qui quia debitis nisi consequatur non.</p><p>Nihil praesentium tempora numquam dicta sed dolore ipsum. Praesentium id adipisci in molestias consequatur vitae officia mollitia. Culpa vitae consequatur incidunt iusto voluptatem magnam eum et.</p><p>Quibusdam sit quidem voluptates aspernatur mollitia totam. Magnam eius aliquam quo dolores et optio mollitia in. Ut nihil est id atque minima. Consequatur cumque voluptatibus praesentium vitae deserunt. Illo sit aut commodi.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(17, 1, 2, 'Similique et quos ut.', 'nam-dolore-maxime-aut-rem', NULL, 'Odit odit fuga perferendis omnis quo tenetur. Natus incidunt repellendus alias laborum exercitationem possimus modi. Omnis est ipsa dolorem veniam nam. Porro aliquid consequatur soluta est.', '<p>Sit ut cupiditate tempore qui ducimus. Ea voluptatem voluptas sunt dolorum voluptatem consequatur in. Non tenetur inventore ipsam.</p><p>Necessitatibus atque sed voluptatibus quae ducimus aut consequatur. Reiciendis fugit ab et laborum illo est consectetur autem. Et quae possimus quia nisi unde cumque. Quibusdam odit voluptates similique deleniti ratione non temporibus.</p><p>Sapiente officiis et et aut ullam quae nobis. Ut impedit vitae odit. Qui qui provident illo excepturi sit.</p><p>Et quaerat voluptatem officia veniam molestias sunt porro. Quis qui voluptatem temporibus rerum.</p><p>Et est exercitationem quia iste amet impedit sit. Aut quibusdam magni sapiente. Sit amet reiciendis voluptatem odit voluptas temporibus aut dolore. Maxime dolores consequatur quo est doloribus.</p><p>Omnis eos modi quia sit libero eum. Architecto culpa dolorem et rerum eligendi repellat. Voluptatem dolorem impedit facilis. Temporibus aut qui quos saepe voluptates ipsam ratione. Recusandae qui error nihil est deleniti aut.</p><p>Magnam quia facere culpa laborum distinctio eum. Repellendus est dolor eveniet quia laudantium. Libero adipisci distinctio esse sunt exercitationem itaque.</p><p>Quisquam aliquid deleniti cumque et. Ea labore atque voluptates iusto qui. Cumque quibusdam sit est sed error. Voluptatum ab laborum nostrum quae id animi tempore laudantium. Veniam vel non asperiores aut.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(18, 2, 1, 'Exercitationem id et assumenda.', 'dolorem-facilis-quia-rerum-ad-sint-excepturi', NULL, 'Aut asperiores error accusamus earum vitae nostrum maiores. Cum itaque et ut qui sint dolores libero. Et corporis at modi quasi. Consequatur voluptates et optio atque iure debitis pariatur.', '<p>Rerum repellat illo quis rerum incidunt fuga sit. Eos ab illo eaque dolores. Aut sunt consequuntur recusandae officiis asperiores. Nulla voluptatum dolorem commodi dolorem expedita autem. Magnam laudantium enim non necessitatibus provident non.</p><p>Asperiores earum dignissimos doloremque quia dolorum. Quo mollitia voluptatem ipsa tempore sapiente aspernatur. Qui unde dolore voluptas recusandae. Dolorem aut et ut debitis sint. Et ut voluptatibus repellat hic.</p><p>Et libero est ratione dolores sed ut. Rem quod et ullam vero laborum nulla sequi nam. Similique velit rerum pariatur dolorem id et perspiciatis.</p><p>Et nihil nihil qui perspiciatis ab non. Nihil soluta numquam dolores nam quibusdam. Impedit vel quis ratione eius non quia nihil. Quos minus ea est officia maxime.</p><p>Dolores fugit cupiditate perspiciatis sit non. Occaecati est odit odit neque est nulla hic. Hic nam ut iusto adipisci placeat ut labore.</p><p>At repellendus assumenda eum nostrum sint. Autem sapiente possimus tenetur excepturi. Rem vero accusamus unde expedita officiis voluptates quidem.</p><p>Saepe asperiores voluptas nisi deserunt consequatur minus. Sint voluptatem officia ut. Excepturi earum ut rerum aut.</p><p>Optio neque nam praesentium libero occaecati cumque molestiae. Aliquam aliquam est fugit et exercitationem. Culpa est sit ea at sequi ullam ipsum. Vero eos eveniet consequuntur sapiente nostrum amet aut.</p><p>Atque iste consequatur dolorem id. Ex eaque at voluptas porro. Molestiae sint ullam animi sunt officia ex officiis. Quis quaerat ut at reprehenderit.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(19, 1, 2, 'Impedit in corporis aut et cumque iure.', 'cupiditate-molestias-consequuntur-facere-accusantium-minus', NULL, 'Ut quia vitae eligendi aliquid ut. Quaerat et qui consectetur corrupti vero quis. Hic nostrum dolorum iure ut. Aspernatur aut iure vero qui accusamus et.', '<p>Perspiciatis aspernatur expedita dolores qui reprehenderit cumque. Neque modi illum aut quaerat ut odio quia. Tempore nesciunt voluptates laboriosam quaerat quod. Vero est ea recusandae voluptas amet maiores molestiae magni.</p><p>A impedit quo qui autem. Vero vitae quia dolorem assumenda quasi quis magni et. Exercitationem non molestiae iure assumenda blanditiis possimus.</p><p>Quia et error assumenda quia earum velit. Animi illo aperiam non et repellat.</p><p>Quidem et aut qui modi. Et consequatur sapiente quia. Dicta dolorum libero dolorem consectetur voluptatem. Tempore quia dolorem qui.</p><p>Similique totam veniam harum aut temporibus cum quia. In inventore et dolores id velit aut sit reiciendis. Eum est aut iusto et.</p><p>Dolorum incidunt eum enim consectetur nam non veniam qui. Et distinctio perspiciatis doloribus ut. Earum qui provident eos. Ipsa fugit occaecati repellat error.</p><p>Pariatur modi et velit quas. Deserunt explicabo atque dolor necessitatibus iusto non consequatur. Deleniti eos qui aut dolor qui velit rem. Cumque deserunt corporis consequatur aut quibusdam ea.</p><p>Praesentium accusamus omnis facere reprehenderit autem. Aliquid impedit eum pariatur debitis harum et soluta. Id neque eius aspernatur qui laudantium sequi. Ab illo ipsa soluta quas.</p><p>Placeat repellat est vel qui omnis sed. Rem autem eos recusandae aut dolore. Sunt a esse expedita eum saepe quibusdam. Aperiam explicabo maiores quia quibusdam sit.</p><p>Quidem nesciunt eos illo pariatur. Error praesentium necessitatibus facere voluptas reiciendis. Modi ut similique et qui nam repellendus nobis. Illum provident vel commodi inventore cum.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(20, 2, 3, 'At temporibus temporibus ipsum dolores natus dolore voluptatem quos.', 'quibusdam-et-odio-est-nam-commodi', NULL, 'Id iste modi consequatur quis. Voluptatem quis praesentium magni fuga dolor et. Dolor asperiores aspernatur exercitationem odio.', '<p>Dolorem aut similique distinctio sint quia voluptatem. Voluptatibus aut suscipit blanditiis fugiat deleniti. Voluptas est voluptatum ut repudiandae ullam.</p><p>Tenetur voluptas vitae quos dolorem qui perspiciatis sapiente molestias. Quibusdam nostrum quaerat eligendi facere neque. Saepe sunt accusamus eaque quod nemo adipisci. Illum aliquid incidunt nisi libero.</p><p>Sequi officiis blanditiis temporibus facere odio necessitatibus. Sapiente nesciunt animi dolor ipsa possimus ratione rem quis. Quasi fuga at modi et corrupti ipsam doloremque.</p><p>Sit perspiciatis aperiam consequatur deleniti consectetur culpa molestiae. Aliquid et delectus beatae aut. Dolor quas architecto hic ab ducimus dignissimos. Sunt quod ipsum dignissimos ea. Et asperiores ut facere at rem alias ipsum laudantium.</p><p>Explicabo sint suscipit quos maiores. Voluptate ab aut nisi dicta. Porro odio at accusantium cum eos unde quaerat rerum.</p><p>Neque nobis quis minus. Quis sit eveniet qui et.</p><p>Optio doloremque esse provident aut ducimus quo. Sit qui saepe sint dolorum. Sed corrupti quia a.</p><p>Eveniet quia nesciunt aut rerum ipsa quasi. Et explicabo ut corporis voluptatem optio. Necessitatibus pariatur non at optio. Aliquid velit maxime aut dolor sed ullam.</p>', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40'),
(21, 2, 1, 'New Post', 'new-post', 'post-images/DrNzozJENzOWMV6iBJyNH4AHgODecpZHl1xpMGZ3.jpg', 'isinya&nbsp;', '<div>isinya&nbsp;</div>', NULL, '2022-10-12 06:39:58', '2022-10-12 20:23:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'Iqbal Saimina', 'iqbalsaimina', 'iqbalsborneo@gmail.com', NULL, '$2y$10$oLcgQMZGGNWnUA3YsTjpaes1QdmyzsCEJ0eak2vauHuK8yv5WJV5C', NULL, '2022-10-11 23:42:40', '2022-10-11 23:42:40', 1),
(2, 'Danang Nashiruddin', 'esusanti', 'widiastuti.vera@example.net', '2022-10-11 23:42:40', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Tr6TowCGueRX9XoMapE3OkyOUVzEeTTyeKXH9KzLHipnqNpPDxb0mg2245G8', '2022-10-11 23:42:40', '2022-10-11 23:42:40', 1),
(3, 'Ganep Maryadi', 'laras02', 'hakim.viktor@example.net', '2022-10-11 23:42:40', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Rm7lUHVbvwFWimE4rZqPdtujROqftoK2Wr6RnKpOltL4NJJTtAWbVUB1C35G', '2022-10-11 23:42:40', '2022-10-11 23:42:40', 0),
(4, 'Ridwan Mangunsong', 'gmayasari', 'fwastuti@example.org', '2022-10-11 23:42:40', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Wz7cPtlGWe', '2022-10-11 23:42:40', '2022-10-11 23:42:40', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
