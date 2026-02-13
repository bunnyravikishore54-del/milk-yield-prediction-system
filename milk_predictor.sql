-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2026 at 01:56 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `milk_predictor`
--

-- --------------------------------------------------------

--
-- Table structure for table `cattle_records`
--

CREATE TABLE `cattle_records` (
  `id` int(11) NOT NULL,
  `age` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `feed_intake` float DEFAULT NULL,
  `health_status` int(11) DEFAULT NULL,
  `predicted_yield` float DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cattle_records`
--

INSERT INTO `cattle_records` (`id`, `age`, `weight`, `feed_intake`, `health_status`, `predicted_yield`, `timestamp`) VALUES
(1, 23, 234, 7, 6, 24.13, '2026-02-09 15:37:49'),
(2, 23, 234, 7, 6, 24.13, '2026-02-09 15:56:50'),
(3, 12, 345, 8, 9, 24.13, '2026-02-09 15:57:14'),
(4, 12, 345, 8, 9, 24.13, '2026-02-09 16:02:35'),
(5, 12, 345, 8, 9, 24.13, '2026-02-09 16:05:00'),
(6, 11, 456, 9, 9, 24.13, '2026-02-09 16:06:07'),
(7, 11, 456, 9, 9, 24.13, '2026-02-09 16:12:53'),
(8, 12, 234, 7, 9, 24.13, '2026-02-09 16:18:45'),
(9, 12, 345, 7, 9, 24.13, '2026-02-09 16:23:36'),
(10, 12, 345, 7, 9, 24.13, '2026-02-10 03:32:36'),
(11, 12, 345, 7, 9, 24.13, '2026-02-10 03:40:36'),
(12, 12, 222, 34, 3, 27.36, '2026-02-10 03:40:50'),
(13, 12, 222, 34, 3, 27.36, '2026-02-10 03:41:36'),
(14, 12, 222, 34, 3, 27.36, '2026-02-10 03:48:00'),
(15, 12, 222, 34, 3, 27.36, '2026-02-10 03:54:32'),
(16, 12, 222, 34, 3, 27.36, '2026-02-10 03:58:42'),
(17, 12, 222, 34, 3, 27.36, '2026-02-10 04:04:36'),
(18, 3, 345, 7, 9, 21.03, '2026-02-10 04:04:52'),
(19, 3.4, 345, 7.8, 9, 21.39, '2026-02-10 04:05:08'),
(20, 3.4, 345, 7.8, 9, 21.39, '2026-02-10 04:10:29'),
(21, 4.5, 345, 9, 8, 23.01, '2026-02-10 04:10:43'),
(22, 0.6, 345, 12, 9, 21.45, '2026-02-10 04:11:21'),
(23, 0.6, 345, 12, 9, 21.45, '2026-02-10 04:14:45'),
(24, 3.5, 345, 7, 8, 21.44, '2026-02-10 04:14:58'),
(25, 3.4, 345, 9.7, 8, 21.4, '2026-02-10 04:15:13'),
(26, 3.4, 345, 9.7, 8, 21.4, '2026-02-10 04:18:02'),
(27, 3.4, 345, 9.7, 8, 21.4, '2026-02-10 04:35:37'),
(28, 3.4, 345, 9.7, 8, 21.4, '2026-02-10 04:36:41'),
(29, 3.4, 345, 9.7, 8, 21.4, '2026-02-10 04:37:02'),
(30, 3.4, 345, 9.7, 8, 21.4, '2026-02-10 04:45:35'),
(31, 2.3, 345, 7, 8, 20.33, '2026-02-10 04:45:57'),
(32, 2.3, 345, 7, 9, 20.33, '2026-02-10 06:30:54'),
(33, 12, 345, 7.8, 9, 24.13, '2026-02-12 05:51:07'),
(34, 12, 345, 7.8, 9, 24.13, '2026-02-12 05:52:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cattle_records`
--
ALTER TABLE `cattle_records`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cattle_records`
--
ALTER TABLE `cattle_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
