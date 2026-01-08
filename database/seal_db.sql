-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Waktu pembuatan: 08 Jan 2026 pada 10.44
-- Versi server: 8.0.40
-- Versi PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seal_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `user_id`, `start_date`, `end_date`, `reason`, `attachment`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, '2026-08-01', '2026-08-03', 'Liburan Keluarga', 'attachments/aGgxUZG569FAu3CvzzC0qx2IXjgl6TEJUSzSD9cb.jpg', 'pending', '2026-01-07 20:25:14', '2026-01-07 20:25:14'),
(2, 2, '2026-09-01', '2026-09-20', 'Tes Kuota', 'attachments/wC05uV7nsMIG58IH58mb4uqyluR626Ayze9FADxX.jpg', 'pending', '2026-01-07 20:35:00', '2026-01-07 20:35:00'),
(3, 2, '2026-09-01', '2026-09-20', 'Tes Kuota', 'attachments/t3Cnt1USszOMlv3cDoXTzIqwU745UM5N92gGkjmt.jpg', 'pending', '2026-01-07 20:44:11', '2026-01-07 20:44:11'),
(4, 2, '2026-09-01', '2026-09-20', 'Tes Kuota', 'attachments/igKqc7A3JgOEAajSWqsptLtmmEy1JpS42ag7rzVV.jpg', 'pending', '2026-01-07 20:49:12', '2026-01-07 20:49:12'),
(5, 2, '2026-09-01', '2026-09-12', 'Tes Kuota', 'attachments/HtRjrIEkXcrGil4EdNWMEeg49pahbLpdWPqgeelD.jpg', 'approved', '2026-01-07 20:57:53', '2026-01-07 21:08:07'),
(6, 2, '2026-10-01', '2026-10-12', 'Tes Kuota', 'attachments/Iq5WjPPeTGjfktPrLnQBrbU4ZaKYvi2uCV3CXhyW.jpg', 'pending', '2026-01-07 21:01:30', '2026-01-07 21:01:30'),
(7, 2, '2026-10-01', '2026-10-12', 'Tes Kuota', 'attachments/bFaHz3eKq2ih1YKhFwBiqfWBz0vV02uGyUZCXswc.jpg', 'pending', '2026-01-07 21:11:16', '2026-01-07 21:11:16'),
(8, 2, '2027-01-01', '2027-01-03', 'Liburan Keluarga', 'attachments/RK9Qo0HPQpeKIEGGY0mpwbiOpdPu707NUhX0lFYX.jpg', 'approved', '2026-01-07 21:14:01', '2026-01-07 21:14:37'),
(9, 2, '2027-10-01', '2027-10-12', 'Tes Kuota', 'attachments/Mg2TRhI5Bzwndk6kxArBAcEkN1F6YBXMmQPyVRGL.jpg', 'rejected', '2026-01-07 21:14:18', '2026-01-08 03:42:02'),
(10, 2, '2028-01-01', '2028-01-12', 'Liburan Keluarga', 'attachments/0zEowhHKoWOCkc6NitUBCwJKkaLJi7j4TbUaZM4Y.jpg', 'approved', '2026-01-08 03:39:43', '2026-01-08 03:40:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_12_27_023109_create_personal_access_tokens_table', 1),
(5, '2025_12_27_023229_create_leave_requests_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'a5e10cd98beee5e19d0d620eca2e38c5ea6bde13d85176642f67c8ccd85e0b87', '[\"*\"]', NULL, NULL, '2025-12-27 21:53:28', '2025-12-27 21:53:28'),
(2, 'App\\Models\\User', 3, 'google_token', 'c4357cbe413fc43c5e5a31ebbf2c01f1cf58bc24d34d4e7b68733d1b566c258b', '[\"*\"]', NULL, NULL, '2025-12-27 22:03:43', '2025-12-27 22:03:43'),
(3, 'App\\Models\\User', 1, 'auth_token', 'a524f1fee84a880b421d13284f9beee06596ab4542dc6ef9b6507d38be289623', '[\"*\"]', NULL, NULL, '2026-01-07 20:10:48', '2026-01-07 20:10:48'),
(4, 'App\\Models\\User', 2, 'auth_token', 'cff658dfc730066ed81c678655de8568a89bbcf70285d3ef411b1e106fe0298d', '[\"*\"]', NULL, NULL, '2026-01-07 20:11:32', '2026-01-07 20:11:32'),
(5, 'App\\Models\\User', 1, 'auth_token', '302dc0c0a6dd70ac94dcc36a90ffddd669ab6ce2a788402923b2b56a7effd3d4', '[\"*\"]', NULL, NULL, '2026-01-07 20:11:37', '2026-01-07 20:11:37'),
(6, 'App\\Models\\User', 2, 'auth_token', '21752221ae68a57f585a2bccf0c40c5a53f0ff5df9b125266b43f30c6bc85f8c', '[\"*\"]', '2026-01-08 03:39:43', NULL, '2026-01-07 20:11:52', '2026-01-08 03:39:43'),
(7, 'App\\Models\\User', 2, 'auth_token', 'cf50d87d49d196b3725f23ff136f6be498baad9b5c1f82fb790f7276edd5f956', '[\"*\"]', '2026-01-08 03:40:17', NULL, '2026-01-07 20:34:50', '2026-01-08 03:40:17'),
(8, 'App\\Models\\User', 1, 'auth_token', '6626c94bb79c1a42edd1ecd152d3576f78bc2cb4d9012e14f812dc725dc1aa0c', '[\"*\"]', '2026-01-08 03:42:02', NULL, '2026-01-07 21:06:36', '2026-01-08 03:42:02'),
(9, 'App\\Models\\User', 1, 'auth_token', '9974afcc411234eae8fac9fb66ce5b907d02a45178f1742aaf76f93f79436f36', '[\"*\"]', NULL, NULL, '2026-01-08 03:39:11', '2026-01-08 03:39:11'),
(10, 'App\\Models\\User', 2, 'auth_token', '1600477c6115b341ccbd6bb3c40fddc46113cbc47bb98e3f5e2dec652e5d6cdf', '[\"*\"]', NULL, NULL, '2026-01-08 03:39:17', '2026-01-08 03:39:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('15UFM2uMXSdcjZZNmCAjClfYHMjwio9bDu4VxPu2', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmJVNmtzM0w1UTltVzZYWTloZHFZVmF1d3Uwc0pNd3NSeTBzSWpEbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90ZXN0LWxvZ2luIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767839551),
('7HvJGvTqUThTBqZ7iocEHjvKXdKpwNfz9C8KRWsN', NULL, '127.0.0.1', 'PostmanRuntime/7.51.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzdwbXNLaGI0WmdVSkRSQTZwY2lpdTlHZWUxdzdBOXV4UDVSTk1aYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767845263),
('mqTw0yJuj2RuIFqVURjNdKDcXxHaGAfGMIYoJXvd', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTF1RHNjdVVTdU1EVXhOR002T1ZlYklMcWx3QjBJUk5PNzY5c2RxUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90ZXN0LWxvZ2luIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766898006),
('TgDmQDlEK6CTkJ4DvstjCxDxtzK6KJZu5g5TGs15', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienpvN2p0RjF2WVdVY0FTeDdaRkp4NGkzVlZuS1luRkU1YmZvNnJrYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTk6Imh0dHA6Ly8wLjAuMC4wOjgwMDAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766803028);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','employee') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'employee',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `google_id`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin SEAL', 'admin@seal.com', NULL, '$2y$12$/L03Eo5.MzqzKF2ZGJp0wevCdBxmbndWQAIkb3X5aOOHMCbY8umSe', NULL, 'admin', NULL, '2025-12-26 19:55:33', '2025-12-26 19:55:33'),
(2, 'Edwin Employee', 'employee@seal.com', NULL, '$2y$12$gvmMthdvQqHxCkO2t/scOexkYQPTphwFDNdFGg0NWrvxJeeHSv4JC', NULL, 'employee', NULL, '2025-12-26 19:55:33', '2025-12-26 19:55:33'),
(3, 'Edwin', 'edwiniqbalsantoso@gmail.com', NULL, NULL, '110626297281273145179', 'employee', NULL, '2025-12-27 22:03:43', '2025-12-27 22:03:43');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_requests_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
