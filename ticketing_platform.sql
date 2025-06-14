-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2025 at 05:19 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticketing_platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `ticket_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `user_id`, `ticket_id`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 2, '2025-06-13 15:13:02', '2025-06-13 15:13:02', NULL),
(2, 1, 4, 1, '2025-06-13 15:13:02', '2025-06-13 15:13:02', NULL),
(3, 2, 2, 3, '2025-06-13 15:13:02', '2025-06-13 15:13:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Uncategorized', NULL, '2025-03-18 03:20:09', '2025-04-18 14:14:06', NULL),
(2, 'Musik', 'musik', '2025-06-13 15:11:14', '2025-06-13 15:11:14', NULL),
(3, 'Olahraga', 'olahraga', '2025-06-13 15:11:14', '2025-06-13 15:11:14', NULL),
(4, 'Wisata', 'wisata', '2025-06-13 15:11:14', '2025-06-13 15:11:14', NULL),
(5, 'Kuliner', 'kuliner', '2025-06-13 15:11:14', '2025-06-13 15:11:14', NULL),
(6, 'Teater', 'teater', '2025-06-13 15:11:14', '2025-06-13 15:11:14', NULL),
(7, 'Seminar', 'seminar', '2025-06-13 15:11:14', '2025-06-13 15:11:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` bigint(20) NOT NULL,
  `organizer_id` bigint(20) DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `event_date` datetime NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `location_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `venue` varchar(255) NOT NULL,
  `total_tickets` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `venue_id` bigint(20) DEFAULT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `organizer_id`, `event_name`, `slug`, `description`, `event_date`, `start_date`, `end_date`, `location_id`, `category_id`, `venue`, `total_tickets`, `created_at`, `updated_at`, `venue_id`, `thumbnail_url`, `is_published`, `deleted_at`) VALUES
(2, NULL, 'The Show Live On Tour 2025 Niall Horan', NULL, 'Ini deskripsi konser Niall Horan.', '2025-03-16 18:30:00', NULL, NULL, 1, 1, 'Beach City International Stadium', 0, '2025-04-16 18:06:15', '2025-04-18 14:13:01', NULL, NULL, 0, NULL),
(3, NULL, 'Konser Jazz Jakarta', NULL, 'Konser musik jazz tahunan di Jakarta', '2025-06-12 12:00:00', NULL, NULL, 1, 1, 'Jakarta Convention Center', 500, '2025-04-16 01:07:58', '2025-04-18 14:13:01', NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` bigint(20) NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `location_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Jakarta', '2025-03-18 03:20:09', '2025-04-16 15:55:18', NULL),
(2, 'Bandung', '2025-06-13 15:08:01', '2025-06-13 15:08:01', NULL),
(3, 'Semarang', '2025-06-13 15:08:01', '2025-06-13 15:08:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notifications_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notifications_id`, `user_id`, `title`, `message`, `is_read`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Pembayaran Berhasil', 'Pembayaran untuk konser Niall Horan telah berhasil.', 1, '2025-06-13 15:18:30', '2025-06-13 15:18:30', NULL),
(2, 2, 'Tiket Jazz Jakarta Dipesan', 'Pesanan Anda sedang menunggu pembayaran.', 0, '2025-06-13 15:18:30', '2025-06-13 15:18:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `event_id` bigint(20) NOT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payment_method` enum('credit_card','bank_transfer','ewallet') DEFAULT NULL,
  `payment_url` varchar(255) DEFAULT NULL,
  `payment_status` enum('pending','successful','failed') DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `order_status` enum('pending','paid','cancelled','refunded') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `event_id`, `total_price`, `payment_method`, `payment_url`, `payment_status`, `paid_at`, `expired_at`, `order_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, '2000000.00', 'ewallet', 'https://dummy-payment.com/pay1', 'successful', '2025-06-13 15:13:57', NULL, 'paid', '2025-06-13 15:13:57', '2025-06-13 15:13:57', NULL),
(2, 2, 3, '1500000.00', 'credit_card', 'https://dummy-payment.com/pay2', 'pending', NULL, '2025-06-14 15:13:57', 'pending', '2025-06-13 15:13:57', '2025-06-13 15:13:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_detail_id` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `ticket_id` bigint(20) DEFAULT NULL,
  `ticket_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `ticket_price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_detail_id`, `order_id`, `ticket_id`, `ticket_name`, `quantity`, `ticket_price`, `subtotal`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Early Bird Niall Horan', 2, '750000.00', '1500000.00', '2025-06-13 15:16:56', '2025-06-13 15:16:56', NULL),
(2, 1, 2, 'Regular Niall Horan', 1, '500000.00', '500000.00', '2025-06-13 15:16:56', '2025-06-13 15:16:56', NULL),
(3, 2, 4, 'Regular Jazz Jakarta', 3, '500000.00', '1500000.00', '2025-06-13 15:16:56', '2025-06-13 15:16:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_provider` varchar(50) DEFAULT NULL,
  `payment_code` varchar(100) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `status` enum('pending','paid','failed') DEFAULT 'pending',
  `paid_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_provider`, `payment_code`, `amount`, `status`, `paid_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'OVO', 'OVO-INV123', '2000000.00', 'paid', '2025-06-13 22:17:26', '2025-06-13 15:17:26', '2025-06-13 15:17:26', NULL),
(2, 2, 'BCA', 'BCA-INV456', '1500000.00', 'pending', NULL, '2025-06-13 15:17:26', '2025-06-13 15:17:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `promo_codes_id` bigint(20) NOT NULL,
  `code` varchar(50) NOT NULL,
  `discount_percentage` int(11) NOT NULL,
  `max_discount` decimal(12,2) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `quota` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `promo_codes`
--

INSERT INTO `promo_codes` (`promo_codes_id`, `code`, `discount_percentage`, `max_discount`, `start_date`, `end_date`, `quota`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'EARLY2025', 10, '100000.00', '2025-03-01 00:00:00', '2025-06-01 23:59:59', 100, '2025-06-13 15:17:57', '2025-06-13 15:17:57', NULL),
(2, 'VIPSPECIAL', 15, '200000.00', '2025-04-01 00:00:00', '2025-07-01 23:59:59', 50, '2025-06-13 15:17:57', '2025-06-13 15:17:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `event_id` bigint(20) NOT NULL,
  `ticket_type` enum('early_bird','regular','vip') DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `sold` int(11) DEFAULT 0,
  `version_number` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `name`, `event_id`, `ticket_type`, `price`, `stock`, `sold`, `version_number`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Early Bird Niall Horan', 2, 'early_bird', '750000.00', 100, 30, 1, '2025-06-13 15:12:07', '2025-06-13 15:12:07', NULL),
(2, 'Regular Niall Horan', 2, 'regular', '1000000.00', 300, 120, 1, '2025-06-13 15:12:07', '2025-06-13 15:12:07', NULL),
(3, 'VIP Niall Horan', 2, 'vip', '1500000.00', 100, 50, 1, '2025-06-13 15:12:07', '2025-06-13 15:12:07', NULL),
(4, 'Regular Jazz Jakarta', 3, 'regular', '500000.00', 500, 200, 1, '2025-06-13 15:12:07', '2025-06-13 15:12:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `role` enum('user','organizer','admin') DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password_hash`, `phone`, `avatar_url`, `role`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'mahira', 'email@gmail.com', 'mahirahira', '0123456789', NULL, 'admin', NULL, '2025-04-16 01:14:27', '2025-04-18 14:11:59', NULL),
(2, 'Mahira', 'email@example.com', '$2b$10$vqd9hUcOcZAjeLiC9FyhxuyaTx8g6KRbhYdKLiixuX9SJBAjBlPku', NULL, NULL, '', NULL, '2025-04-16 03:13:06', '2025-04-18 14:11:59', NULL),
(3, 'salma', 'salma@gmail.com', '$2b$10$Szkw77ft9z4MatXz52e0NebXQvIaENuo/WJqy7ndP3k2FPZz0LZ52', NULL, NULL, NULL, NULL, '2025-06-12 18:01:19', '2025-06-12 18:01:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `user_sessions_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `token` varchar(500) NOT NULL,
  `device` varchar(100) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE `venues` (
  `venue_id` bigint(20) NOT NULL,
  `location_id` bigint(20) NOT NULL,
  `venue_name` varchar(255) NOT NULL,
  `venue_city` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `html_embed` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `wishlist_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `event_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `fk_carts_user` (`user_id`),
  ADD KEY `fk_carts_ticket` (`ticket_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `fk_events_location` (`location_id`),
  ADD KEY `fk_events_category` (`category_id`),
  ADD KEY `venue_id` (`venue_id`),
  ADD KEY `fk_events_organizer` (`organizer_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notifications_id`),
  ADD KEY `fk_notifications_user` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_event` (`event_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `fk_order` (`order_id`),
  ADD KEY `fk_ticket` (`ticket_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_payments_order` (`order_id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`promo_codes_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`user_sessions_id`),
  ADD KEY `fk_user_sessions_user` (`user_id`);

--
-- Indexes for table `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`venue_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `fk_wishlists_user` (`user_id`),
  ADD KEY `fk_wishlists_event` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notifications_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `promo_codes_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `user_sessions_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
  MODIFY `venue_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `wishlist_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `fk_carts_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_carts_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`venue_id`),
  ADD CONSTRAINT `fk_events_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_events_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_events_organizer` FOREIGN KEY (`organizer_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `fk_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`),
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `fk_user_sessions_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `venues`
--
ALTER TABLE `venues`
  ADD CONSTRAINT `venues_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `fk_wishlists_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_wishlists_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
