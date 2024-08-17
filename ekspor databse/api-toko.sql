-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jul 2024 pada 11.55
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api-toko`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_barang` varchar(25) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `kategori` varchar(25) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `nama_barang`, `stok`, `harga`, `kategori`, `keterangan`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Al-Nasr Home 2023-2024', 3, 175000, 'Jersey', 'Ukuran M, L, XL.', '1720934161_al-nassr jersey 2023-2024. Size, M,L,Xl. Price 175000.jpg', '2024-07-13 22:16:01', '2024-07-13 22:16:01'),
(2, 'Inter Miami Away', 3, 175000, 'Jersey', 'Ukuran M,L,XL', '1720934318_inter miami jersey away 2023-2024. Size, M,L,Xl. Price 175000.jpg', '2024-07-13 22:18:38', '2024-07-13 22:18:38'),
(3, 'AC Milan Retro Mota', 1, 400000, 'Jersey', 'Ukuran XL', '1720934362_Jersey ac milan Retro Home mota 1993-1994. Size, L. Price 400000.jpg', '2024-07-13 22:19:22', '2024-07-13 22:21:29'),
(4, 'Bayern Munich Home', 3, 175000, 'Jersey', 'Ukuran M,L,XL', '1720934393_Jersey Bayern Munic Home 2023-2024. Size, M,L,Xl. Price 175000.jpg', '2024-07-13 22:19:53', '2024-07-13 22:19:53'),
(5, 'Manchester United Retro', 1, 400000, 'Jersey', 'Ukuran M', '1720934467_Jersey Manchester United Retro HOME 1998-1999. Size, Xl. Price 400000.jpg', '2024-07-13 22:21:07', '2024-07-13 22:21:07'),
(6, 'Real Madrid Home', 3, 175000, 'Jersey', 'Ukuran M,L,XL', '1720934530_jersey real madrid home 23-24. Size, M,L,Xl. Price 175000.jpg', '2024-07-13 22:22:10', '2024-07-13 22:22:10'),
(7, 'Real Madrid Retro', 1, 400000, 'Jersey', 'Ukuran XL', '1720934583_Jersey Real Madrid Retro Home 2000 - 2001. Size, Xl. Price 400000.jpg', '2024-07-13 22:23:03', '2024-07-13 22:23:03'),
(8, 'Nike Running Shorts', 3, 160000, 'Celana Olahraga', 'Ukuran M, L, XL', '1720934667_Nike Running Shorts. Size, M,L,Xl. Price 160000.jpg', '2024-07-13 22:24:28', '2024-07-13 22:24:28'),
(9, 'Jogger Adidas Hitam', 3, 160000, 'Celana Olahraga', 'Ukuran M, L, XL', '1720934718_Celana Jogger Adidas Hitam. Size, M,L,Xl. Price 160000.jpg', '2024-07-13 22:25:18', '2024-07-13 22:25:18'),
(10, 'Mills Timnas Indonesia', 3, 200000, 'Jersey', 'Ukuran M,L,XL', '1720934782_Jersey TIMNAS INDONESIA AWAY Third Hitam 2023-2024. Size, M,L,Xl. Price 200000.jpg', '2024-07-13 22:26:22', '2024-07-13 22:26:22'),
(11, 'Liverpool Home  23/24', 3, 175000, 'Jersey', 'Ukuran M,L,XL', '1720934828_liverpool jersey home 2023-2024. Size, M,L,Xl. Price 175000.jpg', '2024-07-13 22:27:08', '2024-07-13 22:27:08'),
(12, 'Specs LS OMEGA', 2, 300000, 'Sepatu', 'Size :  39, 40, 41, 42', '1720934897_Sepatu Bola Specs Ls Omega. Size 39,40,41,42. Price 300000.jpg', '2024-07-13 22:28:18', '2024-07-13 22:28:18'),
(13, 'Specs VICTORY', 3, 300000, 'Jersey', 'Size :  39, 40, 41, 42', '1720934926_Sepatu Futsal SPECS VICTORY. Size 39,40,41,42. Price 300000.jpg', '2024-07-13 22:28:46', '2024-07-13 22:28:46'),
(14, 'Adidas Solar Glide 5', 3, 300000, 'Sepatu', 'Size :  39, 40, 41, 42', '1720935004_Sepatu Running Adidas Solar Glide 5 full black. Size 39,40,41,42. Price 300000.jpg', '2024-07-13 22:30:05', '2024-07-13 22:30:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(30, '2014_10_12_000000_create_users_table', 1),
(31, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(32, '2019_08_19_000000_create_failed_jobs_table', 1),
(33, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(34, '2024_06_26_042230_create_barang_table', 1),
(35, '2024_07_11_022156_create_pesanan_table', 1),
(36, '2024_07_11_120252_create_keranjang_table', 1),
(37, '2024_07_12_022059_create_pesanan_detail_table', 1),
(39, '2024_07_21_012854_create_pembayaran_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `pesanan_id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '10b6d6ef88ee28fbab2c5aaac7a08aeb83345a9c0e9680b0623c06d4c625734c', '[\"*\"]', '2024-07-13 22:14:21', NULL, '2024-07-13 22:14:21', '2024-07-13 22:14:21'),
(2, 'App\\Models\\User', 1, 'auth_token', 'e4d077c7f47a1ea2310ce95465fde4685b58bfc8ec9904633dc66c5b21d8f043', '[\"*\"]', '2024-07-13 22:14:43', NULL, '2024-07-13 22:14:43', '2024-07-13 22:14:43'),
(4, 'App\\Models\\User', 2, 'auth_token', 'fc9f69b2f95716ec5ec1817bbc95990344ca3f52b42a85b22f0ba124d3ed1650', '[\"*\"]', '2024-07-13 22:38:50', NULL, '2024-07-13 22:38:49', '2024-07-13 22:38:50'),
(11, 'App\\Models\\User', 2, 'auth_token', '54c4467c5227d0be1d3ade8b36fddcbff51afc5de783f38373c475566b4300f9', '[\"*\"]', '2024-07-14 20:17:04', NULL, '2024-07-14 20:17:03', '2024-07-14 20:17:04'),
(13, 'App\\Models\\User', 5, 'auth_token', 'df793ade4e07d6b6866984468b1a9476ec08527e2e73c5ef22dfed3dec4dcea2', '[\"*\"]', '2024-07-14 20:19:37', NULL, '2024-07-14 20:19:37', '2024-07-14 20:19:37'),
(14, 'App\\Models\\User', 5, 'auth_token', '2e01689556d4b76f91e79ed448f118ac10b7ec28edef9ba97ba7cefb9d039ada', '[\"*\"]', '2024-07-14 20:30:22', NULL, '2024-07-14 20:30:21', '2024-07-14 20:30:22'),
(15, 'App\\Models\\User', 5, 'auth_token', 'f23ccaae47653cb36da55dd8923a46468550174fc1fc9aa4f918443c9699d872', '[\"*\"]', NULL, NULL, '2024-07-14 21:09:40', '2024-07-14 21:09:40'),
(16, 'App\\Models\\User', 5, 'auth_token', '9c75a6f3341cf5b6036952e52b2732729488180bf7fea528b7721338483441bc', '[\"*\"]', NULL, NULL, '2024-07-14 21:10:03', '2024-07-14 21:10:03'),
(17, 'App\\Models\\User', 1, 'auth_token', '8a0cf91c3d3577e67c585b1ff1baa0cafa2436dcfcb46894091b1b10ff0df5ce', '[\"*\"]', NULL, NULL, '2024-07-14 21:10:23', '2024-07-14 21:10:23'),
(18, 'App\\Models\\User', 2, 'auth_token', '70a75e089ec60914c925d014e558b4ae2b5f61f9858b609bb815f0171c8f5317', '[\"*\"]', NULL, NULL, '2024-07-14 21:11:12', '2024-07-14 21:11:12'),
(19, 'App\\Models\\User', 6, 'auth_token', '8c7c03bc449263e18b3a6e1b861ec4da274e7b7d9d968bbf0b12d4219f4e593b', '[\"*\"]', NULL, NULL, '2024-07-14 21:12:34', '2024-07-14 21:12:34'),
(21, 'App\\Models\\User', 6, 'auth_token', '27196920df57b30230f7b8c7f86370b59f7a46043e69ab027a5520528df74132', '[\"*\"]', '2024-07-14 21:18:00', NULL, '2024-07-14 21:17:59', '2024-07-14 21:18:00'),
(22, 'App\\Models\\User', 5, 'auth_token', '719b3cc4219630b8fe89e96ff4f91513aa39e2c0754046a7d4aa4dfb490067e5', '[\"*\"]', '2024-07-14 21:24:15', NULL, '2024-07-14 21:24:14', '2024-07-14 21:24:15'),
(23, 'App\\Models\\User', 2, 'auth_token', 'cb3e7b5c63b9f54983c68eee798754be855eb1f1cb9566763a5e1809916ae57d', '[\"*\"]', '2024-07-14 21:24:56', NULL, '2024-07-14 21:24:55', '2024-07-14 21:24:56'),
(24, 'App\\Models\\User', 5, 'auth_token', '0aabe3ada2c1694a3b4e6d2b719d8d87c0295e2c1a8ee0a0584b705454ebd8fc', '[\"*\"]', '2024-07-14 21:25:13', NULL, '2024-07-14 21:25:13', '2024-07-14 21:25:13'),
(26, 'App\\Models\\User', 5, 'auth_token', '233eedd5fb916cef55390e82a8f2baf76a33ef2072ee6a10b08da15841b7d39f', '[\"*\"]', NULL, NULL, '2024-07-14 21:47:56', '2024-07-14 21:47:56'),
(27, 'App\\Models\\User', 5, 'auth_token', 'c4ad2676cb9c1eb9139a1c6b007a98d137fc842670463a627805981281a6f0bc', '[\"*\"]', NULL, NULL, '2024-07-14 21:50:57', '2024-07-14 21:50:57'),
(28, 'App\\Models\\User', 5, 'auth_token', '783c5cd691f01a7e8fbcf1acac1843ba9d68538f28db4138a4a89af8045cca05', '[\"*\"]', NULL, NULL, '2024-07-14 21:55:20', '2024-07-14 21:55:20'),
(29, 'App\\Models\\User', 5, 'auth_token', '410f0c81bb2e810cade427182a9fda3026f39e9953d53488f54a9eb417415e62', '[\"*\"]', NULL, NULL, '2024-07-14 21:58:10', '2024-07-14 21:58:10'),
(30, 'App\\Models\\User', 5, 'auth_token', '655e433b2d47ca0780d65489c0fa8db828f006e0fcb5d95eaf733fc7ea04fe37', '[\"*\"]', NULL, NULL, '2024-07-14 22:02:11', '2024-07-14 22:02:11'),
(31, 'App\\Models\\User', 5, 'auth_token', '5c3c86902326de20336b26493e4cde83d080a9c3b40a14818eca1d57af3cf94c', '[\"*\"]', '2024-07-14 22:02:53', NULL, '2024-07-14 22:02:52', '2024-07-14 22:02:53'),
(33, 'App\\Models\\User', 5, 'auth_token', '85e8f1e11b671cba22f5f3d5c507ead7fc5a2b092d5f3b96df44ce6267e4fc99', '[\"*\"]', '2024-07-14 22:17:01', NULL, '2024-07-14 22:17:00', '2024-07-14 22:17:01'),
(37, 'App\\Models\\User', 2, 'auth_token', 'cb12a9920f5699f53f38ff2614b7e3173d144bd238e3e0baa45daeeaf09c824d', '[\"*\"]', '2024-07-14 23:16:14', NULL, '2024-07-14 23:15:41', '2024-07-14 23:16:14'),
(40, 'App\\Models\\User', 3, 'auth_token', 'df77f7629027fe2c2ab05a15f91493051826a5b44017ae2b04480f2ac4e07be2', '[\"*\"]', '2024-07-14 23:30:56', NULL, '2024-07-14 23:30:56', '2024-07-14 23:30:56'),
(46, 'App\\Models\\User', 2, 'auth_token', '82c2a1572d8d10f784e0d509a44494455e019ff44356a1332d55ee1585832cc2', '[\"*\"]', NULL, NULL, '2024-07-20 21:22:29', '2024-07-20 21:22:29'),
(47, 'App\\Models\\User', 1, 'auth_token', 'cdd151b0c4be1dadec6b4d6531f55f5b8f0e3e3a9ad7db8f928cb678e134c593', '[\"*\"]', '2024-07-24 02:40:28', NULL, '2024-07-24 02:40:27', '2024-07-24 02:40:28'),
(48, 'App\\Models\\User', 3, 'auth_token', 'f1245b1c490dca4c6d44a900dac2c03aefcdd22735946dc018943fcc63887a34', '[\"*\"]', '2024-07-24 02:41:25', NULL, '2024-07-24 02:40:52', '2024-07-24 02:41:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `Total` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `user_id`, `username`, `tanggal`, `status`, `Total`, `created_at`, `updated_at`) VALUES
(1, 2, 'Aditya', '2024-07-14', 'belum dibayar', 525000, '2024-07-13 22:39:31', '2024-07-13 22:39:31'),
(8, 3, 'Riski', '2024-07-15', 'belum dibayar', 710000, '2024-07-15 07:36:49', '2024-07-15 07:36:49'),
(9, 3, 'Riski', '2024-07-24', 'belum dibayar', 885000, '2024-07-24 02:41:25', '2024-07-24 02:41:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan_details`
--

CREATE TABLE `pesanan_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `ukuran` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pesanan_details`
--

INSERT INTO `pesanan_details` (`id`, `user_id`, `barang_id`, `quantity`, `ukuran`, `total`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 2, 'XL', 350000, '2024-07-13 22:34:33', '2024-07-13 22:34:33'),
(2, 2, 4, 1, 'L', 175000, '2024-07-13 22:35:01', '2024-07-13 22:35:01'),
(3, 5, 3, 2, 'M', 800000, '2024-07-14 22:35:00', '2024-07-14 22:52:16'),
(4, 2, 1, 2, 'L', 350000, '2024-07-14 23:16:14', '2024-07-15 05:54:22'),
(5, 2, 5, 1, 'XL', 400000, '2024-07-15 05:59:08', '2024-07-15 05:59:08'),
(6, 3, 6, 3, 'M', 525000, '2024-07-15 05:59:25', '2024-07-24 02:41:15'),
(7, 3, 10, 1, 'XL', 200000, '2024-07-15 06:00:02', '2024-07-15 06:00:02'),
(10, 3, 8, 1, 'L', 160000, '2024-07-15 06:08:52', '2024-07-15 06:08:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$R15yi1gzfmKoKP5Ng6IfZOZRJ38PXexT/OMLxKGk43P.0aUyBsi3G', 'admin', NULL, '2024-07-13 22:14:08', '2024-07-13 22:14:08'),
(2, 'Aditya', 'aditya@gmail.com', '$2y$10$1P4QZ4exbst4XcTD5y1FKeGy.KYZ4vra7IMK1tC07N480ByU7jubS', 'user', NULL, '2024-07-13 22:31:33', '2024-07-13 22:31:33'),
(3, 'Riski', 'riski@gmail.com', '$2y$10$sIEHKNk1eh9IFwU7UjWXUOuxYa8Rcr/w7rOxnBpKN6hK8Zp2ng6ea', 'user', NULL, '2024-07-13 22:31:59', '2024-07-13 22:31:59'),
(4, 'Ari', 'ari@gmail.com', '$2y$10$e6Llk4NDRvY6oGw9.F.jdOdex45taRS8B435bw3772hkuf7HdYuLS', 'user', NULL, '2024-07-13 22:32:15', '2024-07-13 22:32:15'),
(5, 'abel', 'abel@gmail.com', '$2y$10$AynmSvK3BG3MhUxMTpx84eKlbF878C1HZg0FHIhEp7u69QBI7YYrW', 'user', NULL, '2024-07-13 22:32:48', '2024-07-13 22:32:48'),
(6, 'Nanda@gmail.com', 'nanda@gmail.com', '$2y$10$Kpr/NFtUp873TYj7WG6huOD3RtsKSkjbl.hbSSzyhAAf3/kZoWoWK', 'user', NULL, '2024-07-14 21:12:15', '2024-07-14 21:12:15');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keranjang_barang_id_foreign` (`barang_id`),
  ADD KEY `keranjang_user_id_foreign` (`user_id`);

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
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembayaran_user_id_foreign` (`user_id`),
  ADD KEY `pembayaran_pesanan_id_foreign` (`pesanan_id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pesanan_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `pesanan_details`
--
ALTER TABLE `pesanan_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pesanan_details_user_id_foreign` (`user_id`),
  ADD KEY `pesanan_details_barang_id_foreign` (`barang_id`);

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
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `pesanan_details`
--
ALTER TABLE `pesanan_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `keranjang_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_pesanan_id_foreign` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembayaran_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pesanan_details`
--
ALTER TABLE `pesanan_details`
  ADD CONSTRAINT `pesanan_details_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pesanan_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
