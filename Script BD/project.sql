-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 26-05-2024 a las 03:21:41
-- Versión del servidor: 5.7.39
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `project`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Protein', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(2, 'Creatine', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(3, 'PreWorkout', '2024-05-23 01:02:42', '2024-05-23 01:02:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(417, '2014_10_12_000000_create_users_table', 1),
(418, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(419, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(420, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(421, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(422, '2016_06_01_000004_create_oauth_clients_table', 1),
(423, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(424, '2019_08_19_000000_create_failed_jobs_table', 1),
(425, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(426, '2023_11_23_033651_create_categories_table', 1),
(427, '2023_11_23_172458_create_products_table', 1),
(428, '2024_01_22_191517_create_order_statuses_table', 1),
(429, '2024_02_20_154337_create_orders_table', 1),
(430, '2024_02_20_164619_create_order_products_table', 1),
(431, '2024_02_22_205628_add_admin_column_to_users_table', 1),
(432, '2024_03_06_010228_create_product_images_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('570de91535805a12468fc6540629e5d6ef10851dfabab93df56239f22725eb15dd8e3b3ff2579db7', 1, 1, 'appToken', '[]', 0, '2024-05-23 01:03:47', '2024-05-23 01:03:47', '2025-05-22 19:03:47'),
('7c0f6d00095004f7c3955d8ebd1a0f3079a1d2c42a393e5ad7bbf0fe90a960f3db907efcad93a74c', 2, 1, 'appToken', '[]', 1, '2024-05-26 08:55:51', '2024-05-26 09:04:38', '2025-05-26 02:55:51'),
('898d5f8fca4d5b8bdfea781e7722a670cbe409a64e747b9bee2013a7667de575427b06a26c29a366', 1, 1, 'appToken', '[]', 1, '2024-05-26 09:04:47', '2024-05-26 09:10:54', '2025-05-26 03:04:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'qeX9yAkxJh4SNwqy3LLxx4OfyBb0tbEArhkfUs43', NULL, 'http://localhost', 1, 0, 0, '2024-05-23 01:03:19', '2024-05-23 01:03:19'),
(2, NULL, 'Laravel Password Grant Client', 'dxkmLtSkZGhzhdQERy8hq8ZwSKterrPDyHn6nnDD', 'users', 'http://localhost', 0, 1, 0, '2024-05-23 01:03:19', '2024-05-23 01:03:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-05-23 01:03:19', '2024-05-23 01:03:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total` double NOT NULL,
  `order_statuses_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Process', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(2, 'Shipped', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(3, 'Completed', '2024-05-23 01:02:42', '2024-05-23 01:02:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `categories_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `categories_id`, `created_at`, `updated_at`) VALUES
(1, 'Protein Enim.', 'Quas voluptatem praesentium nihil suscipit alias et enim. Sed dolorem quo est. Sit voluptatibus id illo accusantium. Dolor rerum et velit.', 256.48, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(2, 'Protein Quia.', 'Inventore consequatur at excepturi sed a. Qui unde veniam eos itaque corporis aut beatae rerum. Odio et quia animi dolore rerum quisquam praesentium. Eos eius iure optio atque fugiat deleniti voluptatem.', 455.89, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(3, 'Protein Sit.', 'Ut assumenda sunt suscipit. Enim dolores asperiores provident qui dolore quisquam numquam. Possimus nulla dolor sit amet nisi voluptas nesciunt quidem. Nobis omnis aliquam velit est quia voluptas. Voluptas aspernatur explicabo illum.', 208.14, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(4, 'Protein Nam.', 'Commodi explicabo tenetur harum perferendis at. Dolorem voluptatibus autem omnis hic dolorum et culpa sunt. Dolorem eligendi neque facere excepturi. Aliquam veritatis quasi enim provident eum voluptates deserunt.', 190.14, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(5, 'Protein Et.', 'Qui nisi blanditiis dignissimos distinctio corporis laudantium aut eos. Aut eum commodi non molestiae nisi sapiente. Est quod ut consequatur quis placeat. Molestiae tempora id velit minus. Similique architecto quia adipisci doloremque.', 675.31, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(6, 'Protein Dolores.', 'Aliquam dolor sequi quas iste officia aut maxime. Ea sunt sunt est veniam.', 538.22, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(7, 'Protein Voluptas.', 'Maiores natus consectetur enim hic rerum. Qui dicta rem aliquam quod distinctio. Et rerum omnis sapiente iusto velit neque molestiae.', 870.77, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(8, 'Protein Porro.', 'Ut qui est incidunt voluptatibus voluptas. Qui iure quisquam quisquam quidem asperiores vel esse. Rerum molestiae id id suscipit quos dolorum. Et cum consectetur numquam deserunt sint. In et aut ipsa ullam doloremque qui.', 733.96, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(9, 'Protein Possimus.', 'Sunt expedita ab rerum tempora aliquam voluptatem repudiandae. Necessitatibus eveniet quia occaecati veritatis corporis atque aliquid. Rem provident et ut quae ratione.', 886.27, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(10, 'Protein Doloribus.', 'In totam placeat perspiciatis. Quod at facilis perspiciatis necessitatibus suscipit eum molestiae possimus.', 932.99, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(11, 'Protein Ea.', 'Similique sunt iste sed qui iure quo fugiat. Maxime dolores mollitia eligendi voluptatem numquam iure at. Perspiciatis dolorem dolor iusto.', 417.71, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(12, 'Protein Magnam.', 'Aut minus laboriosam pariatur voluptatem officia. Aut doloribus molestias a expedita dolores assumenda. Placeat ipsum eum magni fugiat corrupti sapiente ut laudantium.', 574.39, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(13, 'Protein Sed.', 'Pariatur est modi sunt eligendi similique. Quia dicta vel molestias in quia omnis. Maiores consequatur molestiae at voluptatem commodi velit.', 649.06, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(14, 'Protein Tempora.', 'Possimus enim ratione esse voluptatem. Consequatur enim sapiente qui quod quia ex nam. Dolor et explicabo saepe vel dignissimos libero eum laborum. Qui voluptatem repudiandae vel tempore qui qui.', 548.07, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(15, 'Protein Molestiae.', 'Corporis sit id ut voluptatem dolores est quidem sapiente. Sunt ex doloremque perferendis itaque recusandae.', 537.41, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(16, 'Protein Totam.', 'Sit deleniti magnam sunt quis est corrupti. Voluptatem autem minima voluptatem perferendis est laudantium aut. Eos in quis praesentium dolor.', 463.18, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(17, 'Protein Quisquam.', 'Nam dolore officia tempora officia. Magni dicta suscipit soluta molestiae minima. Commodi amet id ut quae molestias. Quibusdam cumque autem amet est sint et. Voluptate ex accusantium pariatur.', 822.64, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(18, 'Protein Nostrum.', 'Sed unde suscipit delectus accusantium voluptatibus eum. Debitis magnam ducimus adipisci voluptate velit eligendi provident. Natus totam debitis illo pariatur.', 843.56, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(19, 'Protein Et.', 'Qui quia modi molestiae nisi aliquid perspiciatis. Fugiat et officia nemo nisi quos. Ut facilis fugit qui neque.', 404.59, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(20, 'Protein Explicabo.', 'Nihil consequatur recusandae ut culpa. Sint non aperiam quia. Molestiae temporibus et itaque molestiae blanditiis delectus. Nulla et consectetur repellat quidem quis non nesciunt.', 442.38, 1, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(21, 'Creatine Eos.', 'Ipsa ducimus nostrum ut eveniet. Laudantium impedit quod incidunt. Vitae adipisci aut officia tempore quasi. Ut veniam nihil porro officia consequatur. Amet voluptatem aut ut sed.', 720.09, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(22, 'Creatine Est.', 'Debitis distinctio est et maiores accusantium tempore. Voluptatem magnam eum iusto. Veniam voluptatem eveniet necessitatibus et optio unde et illo. Nulla ad asperiores aliquid illo et porro.', 694.16, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(23, 'Creatine Inventore.', 'Ratione aperiam hic ipsa modi iure dolores eos rerum. Adipisci numquam non et quae dolor. Ea dolorem porro ea atque incidunt necessitatibus.', 674.58, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(24, 'Creatine Rerum aut.', 'Dolorem in ducimus suscipit et aut. Corporis molestiae accusamus reprehenderit libero pariatur. Magnam ad ipsam quo reprehenderit quod voluptas.', 933.35, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(25, 'Creatine Et eos.', 'Ut harum dolorem omnis aperiam accusantium. Ex est debitis hic unde atque qui.', 859.68, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(26, 'Creatine Ab dolor.', 'Cum nam eveniet sint aut dolorem. At eius quasi quod quas recusandae consequatur. Ex commodi ab a nesciunt dolorem et sit. Est nihil quaerat quia doloremque libero doloribus id eaque.', 937.29, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(27, 'Creatine Deleniti.', 'Reprehenderit iusto ullam qui voluptatibus ad tempora. Voluptatum est velit accusamus non repellat harum in. Et voluptas vero tempore non ut ea explicabo. Labore sit sunt non aut aliquam.', 807.41, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(28, 'Creatine Et ad.', 'Sit ut omnis omnis tenetur. Placeat cupiditate voluptatibus vel nostrum.', 545.26, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(29, 'Creatine Qui a.', 'Qui perferendis accusantium libero quia qui omnis. Magnam consequatur unde nam deserunt tenetur facilis. Qui nihil ex perferendis.', 285.54, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(30, 'Creatine Sed.', 'Nulla placeat molestiae itaque mollitia ratione. Nostrum omnis amet fugiat autem. Qui totam et quasi in mollitia quae et voluptatem. Exercitationem sed tempore corporis deserunt occaecati. Maiores eum inventore qui commodi incidunt placeat id.', 916.86, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(31, 'Creatine Veniam.', 'Provident quas tenetur incidunt aut libero. Facere autem et dicta velit quibusdam odit. Occaecati sed tempora beatae hic sit omnis. Qui nulla quae quia non.', 317.41, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(32, 'Creatine Nulla.', 'Officiis velit ut voluptatem placeat impedit voluptatem voluptas. Voluptatem non assumenda consequatur aut voluptas. Omnis dolorem neque eligendi dolores rerum. Et nobis perspiciatis nostrum est qui. Rerum beatae corrupti modi.', 867.86, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(33, 'Creatine Optio quo.', 'Aut maxime nisi nihil omnis. Ipsa eveniet quia non quaerat. Delectus provident pariatur omnis ut. Eveniet sunt dolorem reprehenderit amet.', 121.12, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(34, 'Creatine Hic nemo.', 'Dolores et rerum ipsam eius dolorem. Quod officia mollitia et et est. Eum ut ipsum mollitia occaecati.', 181.51, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(35, 'Creatine Ad natus.', 'Itaque accusamus et optio sequi. Aut consequuntur autem quos consequatur et ratione. Cupiditate sequi dolore tempore et.', 803.31, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(36, 'Creatine In rerum.', 'Explicabo nulla veniam velit animi sed. Et dolorum et porro nostrum adipisci quo voluptatibus. Ex quasi sed ipsa fugiat.', 602.28, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(37, 'Creatine Magni.', 'Asperiores possimus voluptatem assumenda aliquid. Ut unde aut voluptate repudiandae velit reiciendis. Laudantium itaque esse quia vero blanditiis consequatur saepe. Qui sapiente ut corporis unde. Commodi est pariatur fugiat voluptatem ut.', 653.91, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(38, 'Creatine Qui.', 'Quo aliquid necessitatibus dolor iusto quo. Fuga voluptate incidunt perferendis temporibus. Ea sunt est quisquam accusamus qui deleniti soluta.', 504.42, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(39, 'Creatine Rerum.', 'Nam sapiente fugit ea dolorem et dolores nihil. Libero dolores ea non. Aut repudiandae aut eos eos amet inventore id.', 531.11, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(40, 'Creatine Sapiente.', 'Quas repellendus velit alias nihil corrupti vel neque. Consectetur minima sunt quia architecto. Illo autem placeat totam.', 629.92, 2, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(41, 'PreWorkout Ut aut.', 'Nobis omnis quod ullam tempore quas similique quidem dolore. Quisquam ducimus voluptate est omnis minus. Aperiam temporibus numquam quaerat placeat odio praesentium reprehenderit. Sint autem eos placeat odit quaerat quos impedit. Autem aut reiciendis ad magnam et eveniet ipsa ullam.', 289.99, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(42, 'PreWorkout Ab qui.', 'Odit et nisi doloribus accusamus autem optio praesentium. Dicta quasi dolore error repudiandae rem reprehenderit est. Ut id sunt qui ex. Aliquid vero molestias quia est autem voluptates.', 296.46, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(43, 'PreWorkout Eum qui.', 'Dolores harum sed qui aut repellendus veritatis. Et odit cumque ut optio et. Consequatur porro voluptate soluta velit numquam assumenda.', 524.29, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(44, 'PreWorkout Magnam.', 'Laudantium similique voluptas voluptas animi rerum sed deleniti. Consequatur perferendis impedit sunt vel quas quisquam. Officiis sed aut dolores enim fuga sit eum. Ex rem est est et occaecati provident optio aut.', 702.98, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(45, 'PreWorkout Rem.', 'Facere et eligendi architecto quo quisquam. Aut et beatae voluptatem laudantium ut. Sit veniam consequuntur consequatur consequatur voluptates.', 221.09, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(46, 'PreWorkout Dolores.', 'Pariatur in possimus nostrum iusto quaerat sit voluptatem quos. Culpa asperiores quo voluptatibus. Neque hic saepe reprehenderit libero incidunt quas earum ut.', 742.93, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(47, 'PreWorkout Et eos.', 'Voluptates facere qui corporis est blanditiis mollitia totam. Laudantium nihil exercitationem fugiat earum. Id quam voluptate eligendi. Et eos eius aut et quidem.', 562.84, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(48, 'PreWorkout Minima.', 'Et quaerat ex porro quia eum aut beatae voluptatibus. Deleniti delectus nostrum qui similique ducimus. Possimus officiis consequuntur repellendus mollitia nam voluptatibus officia.', 708.45, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(49, 'PreWorkout Beatae.', 'Fugiat cumque odit a et. Assumenda laboriosam quasi dignissimos veniam autem rerum numquam ipsum. Iste est vel culpa pariatur saepe. Eos non debitis et eaque. Eum enim aut ut veniam ea.', 184.95, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(50, 'PreWorkout Iusto.', 'Sint eligendi aperiam aut ex. Repellendus blanditiis dignissimos quia et laudantium accusantium quos. Laudantium voluptas aut sunt culpa.', 456.27, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(51, 'PreWorkout Dolor.', 'Illo omnis libero veritatis. Et distinctio ab quam recusandae quam voluptas. Vero quo perspiciatis expedita omnis omnis.', 245.93, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(52, 'PreWorkout Qui.', 'Reiciendis consequatur voluptatum commodi illum et aut non. Recusandae a quae veritatis deserunt ducimus consequatur suscipit. Maiores repudiandae pariatur minima accusamus quasi id.', 279.61, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(53, 'PreWorkout Quis.', 'Voluptate quia non sint et. Quis enim fuga excepturi tenetur itaque a sit. Nobis sapiente ab sunt hic.', 501.23, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(54, 'PreWorkout Dolorem.', 'Incidunt dicta voluptas eum et ullam cum. Sed explicabo ab rerum accusamus. Eaque fugiat dolore culpa incidunt doloremque saepe. Dolore dolorem soluta dolor dolore alias occaecati.', 593.92, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(55, 'PreWorkout Cum.', 'Ut sed maxime reiciendis quis quo numquam. Expedita voluptatem eum molestiae blanditiis libero quia. Vero repellat distinctio harum soluta enim laborum.', 338.74, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(56, 'PreWorkout Non.', 'Aliquam dolorum dignissimos ratione et. Praesentium aut sunt accusantium vel corrupti quod. Rerum molestiae esse soluta et debitis rerum eos et. Dolorum odit nisi cupiditate maiores aperiam.', 637.99, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(57, 'PreWorkout Aut omnis.', 'Qui et reprehenderit nam sit recusandae. Mollitia iusto inventore voluptatem fugiat laborum distinctio ipsam sed. Quia distinctio consequuntur et ratione et. Minus quasi voluptatem ea repudiandae et explicabo autem atque.', 921.86, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(58, 'PreWorkout Rem.', 'Repellendus quia suscipit amet possimus nihil. Asperiores eum aut accusamus nulla eum a. Ut saepe ratione non.', 287.75, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(59, 'PreWorkout Et in.', 'Commodi perferendis eos ea ut aut in. Beatae eos aut sit harum et voluptates.', 689.59, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(60, 'PreWorkout Sed.', 'Nesciunt officia ducimus sequi cupiditate ea rerum omnis. Modi rerum adipisci delectus dolor voluptas delectus eligendi. Molestiae qui ipsa sint vel est aliquid sequi.', 218.23, 3, '2024-05-23 01:02:42', '2024-05-23 01:02:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 1, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(2, 1, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(3, 2, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(4, 2, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(5, 3, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(6, 3, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(7, 4, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(8, 4, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(9, 5, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(10, 5, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(11, 6, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(12, 6, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(13, 7, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(14, 7, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(15, 8, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(16, 8, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(17, 9, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(18, 9, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(19, 10, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(20, 10, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(21, 11, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(22, 11, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(23, 12, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(24, 12, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(25, 13, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(26, 13, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(27, 14, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(28, 14, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(29, 15, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(30, 15, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(31, 16, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(32, 16, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(33, 17, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(34, 17, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(35, 18, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(36, 18, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(37, 19, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(38, 19, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(39, 20, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(40, 20, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/protein.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(41, 21, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(42, 21, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(43, 22, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(44, 22, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(45, 23, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(46, 23, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(47, 24, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(48, 24, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(49, 25, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(50, 25, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(51, 26, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(52, 26, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(53, 27, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(54, 27, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(55, 28, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(56, 28, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(57, 29, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(58, 29, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(59, 30, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(60, 30, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(61, 31, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(62, 31, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(63, 32, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(64, 32, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(65, 33, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(66, 33, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(67, 34, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(68, 34, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(69, 35, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(70, 35, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(71, 36, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(72, 36, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(73, 37, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(74, 37, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(75, 38, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(76, 38, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(77, 39, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(78, 39, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(79, 40, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(80, 40, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/creatine.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(81, 41, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(82, 41, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(83, 42, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(84, 42, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(85, 43, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(86, 43, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(87, 44, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(88, 44, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(89, 45, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(90, 45, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(91, 46, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(92, 46, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(93, 47, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(94, 47, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(95, 48, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(96, 48, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(97, 49, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(98, 49, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(99, 50, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(100, 50, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(101, 51, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(102, 51, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(103, 52, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(104, 52, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(105, 53, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(106, 53, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(107, 54, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(108, 54, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(109, 55, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(110, 55, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(111, 56, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(112, 56, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(113, 57, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(114, 57, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(115, 58, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(116, 58, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(117, 59, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(118, 59, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(119, 60, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42'),
(120, 60, 'http://localhost:8888/BACKEND-SUBSTANCETWINS/public/storage/images/preworkout.jpeg', '2024-05-23 01:02:42', '2024-05-23 01:02:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `admin`) VALUES
(1, 'Gabrielle Hodkiewicz', 'admin@example.com', '2024-05-23 01:02:43', '$2y$12$AfQVOj/rc9vUK/NUD7l6NuuC6Uh7qMyLbr5xmZsD3pB/HQNW3f8uW', 'iq6McsusqZ', '2024-05-23 01:02:43', '2024-05-23 01:02:43', 1),
(2, 'Prof. Henderson Abshire', 'client@example.com', '2024-05-23 01:02:43', '$2y$12$T8S5aTCyX88E/riBM9p3qeMYJPcZNjTRL3XoyB0l/BPhieGg5rrgG', 'hnsdZfAKSG', '2024-05-23 01:02:43', '2024-05-23 01:02:43', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_order_statuses_id_foreign` (`order_statuses_id`);

--
-- Indices de la tabla `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`),
  ADD KEY `order_products_product_id_foreign` (`product_id`);

--
-- Indices de la tabla `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_categories_id_foreign` (`categories_id`);

--
-- Indices de la tabla `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;

--
-- AUTO_INCREMENT de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_order_statuses_id_foreign` FOREIGN KEY (`order_statuses_id`) REFERENCES `order_statuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_categories_id_foreign` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
