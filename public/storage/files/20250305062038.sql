-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2025 at 06:02 PM
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
-- Database: `earist_accreditation`
--

-- --------------------------------------------------------

--
-- Table structure for table `accreditations`
--

CREATE TABLE `accreditations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date_self_survey` datetime NOT NULL,
  `date_actual_survey` datetime NOT NULL,
  `restrict` tinyint(1) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `selfsurvey` tinyint(1) DEFAULT NULL,
  `instrumentId` bigint(20) UNSIGNED NOT NULL,
  `programId` bigint(20) UNSIGNED NOT NULL,
  `survey` tinyint(4) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accreditations`
--

INSERT INTO `accreditations` (`id`, `date_self_survey`, `date_actual_survey`, `restrict`, `status`, `selfsurvey`, `instrumentId`, `programId`, `survey`, `verified`, `created_at`, `updated_at`) VALUES
(34, '2024-11-26 00:00:00', '2025-03-26 00:00:00', NULL, NULL, NULL, 1582, 25, 2, NULL, '2025-01-26 05:19:27', '2025-01-26 06:38:17');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(1000) NOT NULL,
  `message` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `area_assigns`
--

CREATE TABLE `area_assigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `areaId` bigint(20) UNSIGNED NOT NULL,
  `levelId` bigint(20) UNSIGNED NOT NULL,
  `parent` varchar(30) DEFAULT NULL,
  `role` varchar(15) DEFAULT NULL,
  `action` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `area_assigns`
--

INSERT INTO `area_assigns` (`id`, `userId`, `areaId`, `levelId`, `parent`, `role`, `action`, `created_at`, `updated_at`) VALUES
(75, 1, 1615, 34, NULL, 'tfc', NULL, '2025-01-26 05:23:05', '2025-01-26 05:23:21'),
(76, 11, 1615, 34, '75', 'member', NULL, '2025-01-26 05:23:05', '2025-01-26 05:23:05');

-- --------------------------------------------------------

--
-- Table structure for table `area_self_accreditors`
--

CREATE TABLE `area_self_accreditors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `instrumentId` bigint(20) UNSIGNED NOT NULL,
  `accredlvl` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `area_self_accreditors`
--

INSERT INTO `area_self_accreditors` (`id`, `userId`, `instrumentId`, `accredlvl`, `created_at`, `updated_at`) VALUES
(26, 3, 1615, 34, '2025-01-26 06:38:07', '2025-01-26 06:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `attached_documents`
--

CREATE TABLE `attached_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `documentId` bigint(20) UNSIGNED NOT NULL,
  `instrumentId` bigint(20) UNSIGNED NOT NULL,
  `evidence` varchar(255) DEFAULT NULL,
  `accredlvl` bigint(20) UNSIGNED NOT NULL,
  `isRemoved` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender` bigint(20) UNSIGNED NOT NULL,
  `receiver` bigint(20) UNSIGNED NOT NULL,
  `seen` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_conversations`
--

CREATE TABLE `chat_conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `convoId` bigint(20) UNSIGNED NOT NULL,
  `sender` bigint(20) UNSIGNED NOT NULL,
  `message` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_comments`
--

CREATE TABLE `document_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `instrumentId` bigint(20) UNSIGNED NOT NULL,
  `accredId` bigint(20) UNSIGNED NOT NULL,
  `documentId` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_current_versions`
--

CREATE TABLE `document_current_versions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accredlvl` bigint(20) UNSIGNED NOT NULL,
  `instrumentId` bigint(20) UNSIGNED NOT NULL,
  `evidence` varchar(255) DEFAULT NULL,
  `documentId` bigint(20) UNSIGNED NOT NULL,
  `isRemoved` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_versions`
--

CREATE TABLE `document_versions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(500) NOT NULL,
  `type` varchar(10) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `parent` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `isCurrent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_versions`
--

INSERT INTO `document_versions` (`id`, `userId`, `file`, `type`, `title`, `description`, `parent`, `review`, `isCurrent`, `created_at`, `updated_at`) VALUES
(45, 11, '20250116034647.jpg', 'jpg', 'test1', 'test1', NULL, NULL, 1, '2025-01-15 19:46:50', '2025-01-15 19:46:50'),
(46, 11, '20250116034724.jpg', 'jpg', 'test 2', 'test 2', NULL, NULL, 1, '2025-01-15 19:47:24', '2025-01-15 19:47:24'),
(47, 11, '20250116034804.jpg', 'jpg', 'bg4', NULL, NULL, NULL, 1, '2025-01-15 19:48:07', '2025-01-15 19:48:07'),
(48, 11, '20250116035402.jpg', 'jpg', 'bg', NULL, NULL, NULL, 1, '2025-01-15 19:54:06', '2025-01-15 19:54:06'),
(49, 11, '20250116035445.xlsx', 'xlsx', 'OVERTIME AUTHORIZATION', NULL, NULL, NULL, 1, '2025-01-15 19:54:48', '2025-01-15 19:54:48');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_staff`
--

CREATE TABLE `faculty_staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` tinyint(4) NOT NULL,
  `programId` bigint(20) UNSIGNED DEFAULT NULL,
  `instituteId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `institutes`
--

CREATE TABLE `institutes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `abbreviation` varchar(255) NOT NULL,
  `institute_name` varchar(255) NOT NULL,
  `dean` varchar(255) DEFAULT NULL,
  `established` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `institutes`
--

INSERT INTO `institutes` (`id`, `abbreviation`, `institute_name`, `dean`, `established`, `created_at`, `updated_at`) VALUES
(1, 'EARIST', 'Eulogio \"Amang\" Rodriguez Institute of Science and Technology', NULL, NULL, '2024-02-14 17:12:25', '2024-02-14 17:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `instruments`
--

CREATE TABLE `instruments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `parent` varchar(50) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `indicator` varchar(1) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `exclude_rate` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `binst` varchar(50) DEFAULT NULL,
  `blevel` varchar(50) DEFAULT NULL,
  `barea` varchar(50) DEFAULT NULL,
  `bparam` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instruments`
--

INSERT INTO `instruments` (`id`, `title`, `description`, `attachment`, `parent`, `category`, `indicator`, `action`, `exclude_rate`, `created_at`, `updated_at`, `binst`, `blevel`, `barea`, `bparam`) VALUES
(1581, 'BSIT', NULL, NULL, NULL, 'inst', NULL, NULL, NULL, '2025-01-04 04:02:55', '2025-01-04 04:02:55', NULL, NULL, NULL, NULL),
(1582, 'Level 1', NULL, NULL, '1581', 'lvl', NULL, NULL, NULL, '2025-01-04 04:05:35', '2025-01-04 04:05:35', '1581', NULL, NULL, NULL),
(1583, 'Level 2', NULL, NULL, '1581', 'lvl', NULL, NULL, NULL, '2025-01-04 04:05:35', '2025-01-04 04:05:35', '1581', NULL, NULL, NULL),
(1584, 'Level 3', NULL, NULL, '1581', 'lvl', NULL, NULL, NULL, '2025-01-04 04:05:35', '2025-01-04 04:05:35', '1581', NULL, NULL, NULL),
(1585, 'Level 4', NULL, NULL, '1581', 'lvl', NULL, NULL, NULL, '2025-01-04 04:05:35', '2025-01-04 04:05:35', '1581', NULL, NULL, NULL),
(1586, 'Level 5', NULL, NULL, '1581', 'lvl', NULL, NULL, NULL, '2025-01-04 04:05:35', '2025-01-04 04:05:35', '1581', NULL, NULL, NULL),
(1588, 'area 1', 'area 1', NULL, '1583', 'area', NULL, NULL, NULL, '2025-01-04 04:05:52', '2025-01-04 04:05:52', '1581', '1582', NULL, NULL),
(1589, 'area 1', 'area 1', NULL, '1584', 'area', NULL, NULL, NULL, '2025-01-04 04:05:52', '2025-01-04 04:05:52', '1581', '1582', NULL, NULL),
(1590, 'area 1', 'area 1', NULL, '1585', 'area', NULL, NULL, NULL, '2025-01-04 04:05:52', '2025-01-04 04:05:52', '1581', '1582', NULL, NULL),
(1591, 'area 1', 'area 1', NULL, '1586', 'area', NULL, NULL, NULL, '2025-01-04 04:05:52', '2025-01-04 04:05:52', '1581', '1582', NULL, NULL),
(1596, 'param 1', 'param 1 label', NULL, '1588', 'param', NULL, NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', '1581', '1587', '1587', NULL),
(1597, 'System - Inputs and Processes', NULL, NULL, '1596', 'ind', '1', NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', NULL, NULL, NULL, '1596'),
(1598, 'Implementation', NULL, NULL, '1596', 'ind', '2', NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', NULL, NULL, NULL, '1596'),
(1599, 'Outcome/s', NULL, NULL, '1596', 'ind', '3', NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', NULL, NULL, NULL, '1596'),
(1600, 'param 1', 'param 1 label', NULL, '1589', 'param', NULL, NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', '1581', '1587', '1587', NULL),
(1601, 'System - Inputs and Processes', NULL, NULL, '1600', 'ind', '1', NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', NULL, NULL, NULL, '1600'),
(1602, 'Implementation', NULL, NULL, '1600', 'ind', '2', NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', NULL, NULL, NULL, '1600'),
(1603, 'Outcome/s', NULL, NULL, '1600', 'ind', '3', NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', NULL, NULL, NULL, '1600'),
(1604, 'param 1', 'param 1 label', NULL, '1590', 'param', NULL, NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', '1581', '1587', '1587', NULL),
(1605, 'System - Inputs and Processes', NULL, NULL, '1604', 'ind', '1', NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', NULL, NULL, NULL, '1604'),
(1606, 'Implementation', NULL, NULL, '1604', 'ind', '2', NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', NULL, NULL, NULL, '1604'),
(1607, 'Outcome/s', NULL, NULL, '1604', 'ind', '3', NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', NULL, NULL, NULL, '1604'),
(1608, 'param 1', 'param 1 label', NULL, '1591', 'param', NULL, NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', '1581', '1587', '1587', NULL),
(1609, 'System - Inputs and Processes', NULL, NULL, '1608', 'ind', '1', NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', NULL, NULL, NULL, '1608'),
(1610, 'Implementation', NULL, NULL, '1608', 'ind', '2', NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', NULL, NULL, NULL, '1608'),
(1611, 'Outcome/s', NULL, NULL, '1608', 'ind', '3', NULL, NULL, '2025-01-04 04:06:16', '2025-01-04 04:06:16', NULL, NULL, NULL, '1608'),
(1615, 'area 2', 'area 2', NULL, '1582', 'area', NULL, NULL, NULL, '2025-01-05 02:01:51', '2025-01-05 02:01:51', '1581', '1582', NULL, NULL),
(1616, 'area 2', 'area 2', NULL, '1583', 'area', NULL, NULL, NULL, '2025-01-05 02:01:51', '2025-01-05 02:01:51', '1581', '1582', NULL, NULL),
(1617, 'area 2', 'area 2', NULL, '1584', 'area', NULL, NULL, NULL, '2025-01-05 02:01:51', '2025-01-05 02:01:51', '1581', '1582', NULL, NULL),
(1618, 'area 2', 'area 2', NULL, '1585', 'area', NULL, NULL, NULL, '2025-01-05 02:01:51', '2025-01-05 02:01:51', '1581', '1582', NULL, NULL),
(1619, 'area 2', 'area 2', NULL, '1586', 'area', NULL, NULL, NULL, '2025-01-05 02:01:51', '2025-01-05 02:01:51', '1581', '1582', NULL, NULL),
(1620, 'area 3', 'area 3', NULL, '1582', 'area', NULL, NULL, NULL, '2025-01-05 02:01:57', '2025-01-05 02:01:57', '1581', '1582', NULL, NULL),
(1621, 'area 3', 'area 3', NULL, '1583', 'area', NULL, NULL, NULL, '2025-01-05 02:01:57', '2025-01-05 02:01:57', '1581', '1582', NULL, NULL),
(1622, 'area 3', 'area 3', NULL, '1584', 'area', NULL, NULL, NULL, '2025-01-05 02:01:57', '2025-01-05 02:01:57', '1581', '1582', NULL, NULL),
(1623, 'area 3', 'area 3', NULL, '1585', 'area', NULL, NULL, NULL, '2025-01-05 02:01:57', '2025-01-05 02:01:57', '1581', '1582', NULL, NULL),
(1624, 'area 3', 'area 3', NULL, '1586', 'area', NULL, NULL, NULL, '2025-01-05 02:01:57', '2025-01-05 02:01:57', '1581', '1582', NULL, NULL),
(1625, 'area 4', 'area 4', NULL, '1582', 'area', NULL, NULL, NULL, '2025-01-05 02:09:51', '2025-01-05 02:09:51', '1581', '1582', NULL, NULL),
(1626, 'area 4', 'area 4', NULL, '1583', 'area', NULL, NULL, NULL, '2025-01-05 02:09:51', '2025-01-05 02:09:51', '1581', '1582', NULL, NULL),
(1627, 'area 4', 'area 4', NULL, '1584', 'area', NULL, NULL, NULL, '2025-01-05 02:09:51', '2025-01-05 02:09:51', '1581', '1582', NULL, NULL),
(1628, 'area 4', 'area 4', NULL, '1585', 'area', NULL, NULL, NULL, '2025-01-05 02:09:51', '2025-01-05 02:09:51', '1581', '1582', NULL, NULL),
(1629, 'area 4', 'area 4', NULL, '1586', 'area', NULL, NULL, NULL, '2025-01-05 02:09:51', '2025-01-05 02:09:51', '1581', '1582', NULL, NULL),
(1630, 'BSCS', NULL, NULL, NULL, 'inst', NULL, NULL, NULL, '2025-01-05 03:59:01', '2025-01-05 03:59:01', NULL, NULL, NULL, NULL),
(1631, 'Level 1', NULL, NULL, '1630', 'lvl', NULL, NULL, NULL, '2025-01-05 03:59:05', '2025-01-05 03:59:05', '1630', NULL, NULL, NULL),
(1632, 'Level 2', NULL, NULL, '1630', 'lvl', NULL, NULL, NULL, '2025-01-05 03:59:05', '2025-01-05 03:59:05', '1630', NULL, NULL, NULL),
(1633, 'Level 3', NULL, NULL, '1630', 'lvl', NULL, NULL, NULL, '2025-01-05 03:59:05', '2025-01-05 03:59:05', '1630', NULL, NULL, NULL),
(1634, 'Level 4', NULL, NULL, '1630', 'lvl', NULL, NULL, NULL, '2025-01-05 03:59:05', '2025-01-05 03:59:05', '1630', NULL, NULL, NULL),
(1638, 'param 1', 'param 1', NULL, '1615', 'param', NULL, NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', '1581', '1615', '1615', NULL),
(1639, 'System - Inputs and Processes', NULL, NULL, '1638', 'ind', '1', NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', NULL, NULL, NULL, '1638'),
(1640, 'Implementation', NULL, NULL, '1638', 'ind', '2', NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', NULL, NULL, NULL, '1638'),
(1641, 'Outcome/s', NULL, NULL, '1638', 'ind', '3', NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', NULL, NULL, NULL, '1638'),
(1642, 'param 1', 'param 1', NULL, '1616', 'param', NULL, NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', '1581', '1615', '1615', NULL),
(1643, 'System - Inputs and Processes', NULL, NULL, '1642', 'ind', '1', NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', NULL, NULL, NULL, '1642'),
(1644, 'Implementation', NULL, NULL, '1642', 'ind', '2', NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', NULL, NULL, NULL, '1642'),
(1645, 'Outcome/s', NULL, NULL, '1642', 'ind', '3', NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', NULL, NULL, NULL, '1642'),
(1646, 'param 1', 'param 1', NULL, '1617', 'param', NULL, NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', '1581', '1615', '1615', NULL),
(1647, 'System - Inputs and Processes', NULL, NULL, '1646', 'ind', '1', NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', NULL, NULL, NULL, '1646'),
(1648, 'Implementation', NULL, NULL, '1646', 'ind', '2', NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', NULL, NULL, NULL, '1646'),
(1649, 'Outcome/s', NULL, NULL, '1646', 'ind', '3', NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', NULL, NULL, NULL, '1646'),
(1650, 'param 1', 'param 1', NULL, '1618', 'param', NULL, NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', '1581', '1615', '1615', NULL),
(1651, 'System - Inputs and Processes', NULL, NULL, '1650', 'ind', '1', NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', NULL, NULL, NULL, '1650'),
(1652, 'Implementation', NULL, NULL, '1650', 'ind', '2', NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', NULL, NULL, NULL, '1650'),
(1653, 'Outcome/s', NULL, NULL, '1650', 'ind', '3', NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', NULL, NULL, NULL, '1650'),
(1654, 'param 1', 'param 1', NULL, '1619', 'param', NULL, NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', '1581', '1615', '1615', NULL),
(1655, 'System - Inputs and Processes', NULL, NULL, '1654', 'ind', '1', NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', NULL, NULL, NULL, '1654'),
(1656, 'Implementation', NULL, NULL, '1654', 'ind', '2', NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', NULL, NULL, NULL, '1654'),
(1657, 'Outcome/s', NULL, NULL, '1654', 'ind', '3', NULL, NULL, '2025-01-05 04:36:59', '2025-01-05 04:36:59', NULL, NULL, NULL, '1654'),
(1658, 'S.1', 's1', '[{\"evidence\":\"s1\"}]', '1639', 'item', NULL, NULL, NULL, '2025-01-05 04:37:07', '2025-01-05 04:37:07', NULL, NULL, NULL, NULL),
(1659, 'S.1', 's1', '[{\"evidence\":\"s1\"}]', '1597', 'item', NULL, NULL, NULL, '2025-01-05 04:45:45', '2025-01-05 04:45:45', NULL, NULL, NULL, NULL),
(1660, 'I.1', 'i2', '[{\"evidence\":\"i2\"}]', '1640', 'item', NULL, NULL, NULL, '2025-01-05 05:26:38', '2025-01-05 05:26:38', NULL, NULL, NULL, NULL),
(1661, 'O.1', 'o2', '[{\"evidence\":\"o2\"}]', '1641', 'item', NULL, NULL, NULL, '2025-01-05 05:26:44', '2025-01-05 05:26:44', NULL, NULL, NULL, NULL),
(1662, 'S.1', 'test s1', '[{\"evidence\":\"test s1\"},{\"evidence\":\"test s.1\"}]', '1601', 'item', NULL, NULL, NULL, '2025-01-15 19:44:31', '2025-01-15 19:45:34', NULL, NULL, NULL, NULL),
(1663, 'BSCE', NULL, NULL, NULL, 'inst', NULL, NULL, NULL, '2025-01-25 21:01:18', '2025-01-25 21:01:18', NULL, NULL, NULL, NULL),
(1664, 'Level 1', NULL, NULL, '1663', 'lvl', NULL, NULL, NULL, '2025-01-25 21:01:24', '2025-01-25 21:01:24', '1663', NULL, NULL, NULL),
(1665, 'Level 2', NULL, NULL, '1663', 'lvl', NULL, NULL, NULL, '2025-01-25 21:01:24', '2025-01-25 21:01:24', '1663', NULL, NULL, NULL),
(1666, 'Level 3', NULL, NULL, '1663', 'lvl', NULL, NULL, NULL, '2025-01-25 21:01:24', '2025-01-25 21:01:24', '1663', NULL, NULL, NULL),
(1667, 'Level 4', NULL, NULL, '1663', 'lvl', NULL, NULL, NULL, '2025-01-25 21:01:24', '2025-01-25 21:01:24', '1663', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `instruments_component`
--

CREATE TABLE `instruments_component` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `parent` varchar(50) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `indicator` varchar(1) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `exclude_rate` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instruments_component`
--

INSERT INTO `instruments_component` (`id`, `title`, `description`, `attachment`, `parent`, `category`, `indicator`, `action`, `exclude_rate`, `created_at`, `updated_at`) VALUES
(1, 'BSCS', NULL, NULL, NULL, 'inst', NULL, NULL, NULL, '2024-12-26 18:49:56', '2024-12-26 18:51:43'),
(2, 'LEVEL 1', NULL, NULL, '1', 'lvl', NULL, NULL, NULL, '2024-02-14 17:14:04', '2024-02-14 17:14:04'),
(3, 'AREA VII:', 'LIBRARY', NULL, '2', 'area', NULL, NULL, NULL, '2024-02-14 17:14:40', '2024-02-14 18:07:34'),
(4, 'PARAMETER A:', 'ADMINISTRATION', NULL, '3', 'param', NULL, NULL, NULL, '2024-02-14 17:15:02', '2024-02-14 17:36:18'),
(5, 'System - Inputs and Processes', NULL, NULL, '4', 'ind', '1', NULL, NULL, '2024-02-14 17:15:02', '2024-02-14 17:15:02'),
(6, 'Implementation', NULL, NULL, '4', 'ind', '2', NULL, NULL, '2024-02-14 17:15:04', '2024-02-14 17:15:04'),
(7, 'Outcome/s', NULL, NULL, '4', 'ind', '3', NULL, NULL, '2024-02-14 17:15:04', '2024-02-14 17:15:04'),
(8, 'S.1', 'The organizational structure of the library is well defined.', '[{\"evidence\":\"S.1\"}]', '5', 'item', NULL, NULL, NULL, '2024-02-14 17:17:00', '2024-02-14 17:24:57'),
(9, 'S.2', 'The development of the library goals and objectives is the responsibility of the library head and staff with the approval of the Head of the institution.', '[{\"evidence\":\"S.2\"}]', '5', 'item', NULL, NULL, NULL, '2024-02-14 17:30:43', '2024-02-14 17:30:43'),
(10, 'S.3', 'There is a Library Board/Committee which sets library policies, rules and procedures and periodically reviews them.', '[{\"evidence\":\"S.3\"}]', '5', 'item', NULL, NULL, NULL, '2024-02-14 17:31:04', '2024-02-14 17:31:04'),
(11, 'S.4', 'There is a duly approved and widely disseminated Library Manual or written policies and procedures covering the library’s internal administration and operation.', '[{\"evidence\":\"S.4\"}]', '5', 'item', NULL, NULL, NULL, '2024-02-14 17:31:25', '2024-02-14 17:31:25'),
(12, 'I.1', 'The  library develops  an explicit  statement  of its goals and objectives in conformity with the mandate of the  institution.', '[{\"evidence\":\"I.1\"}]', '6', 'item', NULL, NULL, NULL, '2024-02-14 17:31:48', '2024-02-14 17:31:48'),
(13, 'I.2', 'The library is administered and supervised by:', '[{\"evidence\":\"I.2\"}]', '6', 'item', NULL, NULL, NULL, '2024-02-14 17:32:31', '2024-02-14 17:32:31'),
(14, 'I.2.1', 'a full-time professional licensed librarian; and', '[{\"evidence\":\"I.2.1\"}]', '13', 'item', NULL, NULL, NULL, '2024-02-14 17:32:52', '2024-02-14 17:32:52'),
(15, 'I.2.2', 'at least a master’s degree holder in MS Library and Information Science or MAEd/MA in Library Science.', '[{\"evidence\":\"I.2.2\"}]', '13', 'item', NULL, NULL, NULL, '2024-02-14 17:33:27', '2024-02-14 17:33:27'),
(16, 'I.3', 'The Head Librarian directs  and supervises the total operation of the library and is responsible for the administration  of its resources and services.', '[{\"evidence\":\"I.3\"}]', '6', 'item', NULL, NULL, NULL, '2024-02-14 17:33:52', '2024-02-14 17:33:52'),
(17, 'I.4', 'The Head Librarian,  preferably  with an academic rank, actively participates in the academic and  administrative activities of the institution.', '[{\"evidence\":\"I.4\"}]', '6', 'item', NULL, NULL, NULL, '2024-02-14 17:34:07', '2024-02-14 17:34:07'),
(18, 'I.5', 'The annual accomplishments and other reports of the library are promptly submitted to the higher offices concerned.', '[{\"evidence\":\"I.5\"}]', '6', 'item', NULL, NULL, NULL, '2024-02-14 17:34:19', '2024-02-14 17:34:19'),
(19, 'I.6', 'A library development plan is prepared in consultation with the institution’s officials and stakeholders.', '[{\"evidence\":\"I.6\"}]', '6', 'item', NULL, NULL, NULL, '2024-02-14 17:34:32', '2024-02-14 17:34:32'),
(20, 'O.1', 'The goals and objectives of the Library are satisfactorily attained.', '[{\"evidence\":\"O.1\"}]', '7', 'item', NULL, NULL, NULL, '2024-02-14 17:34:53', '2024-02-14 17:34:53'),
(21, 'O.2', 'The library organizational structure is well-designed and effectively implemented.', '[{\"evidence\":\"O.2\"}]', '7', 'item', NULL, NULL, NULL, '2024-02-14 17:35:06', '2024-02-14 17:35:06'),
(22, 'PARAMETER B:', 'ADMINISTRATIVE STAFF', NULL, '3', 'param', NULL, NULL, NULL, '2024-02-14 17:36:11', '2024-02-14 17:36:11'),
(23, 'System - Inputs and Processes', NULL, NULL, '22', 'ind', '1', NULL, NULL, '2024-02-14 17:36:11', '2024-02-14 17:36:11'),
(24, 'Implementation', NULL, NULL, '22', 'ind', '2', NULL, NULL, '2024-02-14 17:36:11', '2024-02-14 17:36:11'),
(25, 'Outcome/s', NULL, NULL, '22', 'ind', '3', NULL, NULL, '2024-02-14 17:36:11', '2024-02-14 17:36:11'),
(26, 'S.1', 'The library has staff with the following qualifications:', '[{\"evidence\":\"S.1\"}]', '23', 'item', NULL, NULL, NULL, '2024-02-14 17:36:41', '2024-02-14 17:36:41'),
(27, 'S.2', 'The library meets the required number of qualified and licensed librarians and staff to meet the needs of the school population with the ratio of:', '[{\"evidence\":\"S.2\"}]', '23', 'item', NULL, NULL, NULL, '2024-02-14 17:36:57', '2024-02-14 17:36:57'),
(28, 'S.1.1', 'BS in Library and Information Science for the College/Academic Unit Library; and', '[{\"evidence\":\"S.1.1\"}]', '26', 'item', NULL, NULL, NULL, '2024-02-14 17:37:15', '2024-02-14 17:37:15'),
(29, 'S.1.2', 'MS in Library and Information Science or MAED/MA in Library Science)  for the Institution.', '[{\"evidence\":\"S.1.2\"}]', '26', 'item', NULL, NULL, NULL, '2024-02-14 17:37:29', '2024-02-14 17:37:29'),
(30, 'S.2.1', 'one (1) Licensed Librarian with two (2) full time staff for the first   500 - student population; and', '[{\"evidence\":\"S.2.1\"}]', '27', 'item', NULL, NULL, NULL, '2024-02-14 17:37:43', '2024-02-14 17:37:43'),
(31, 'S.2.2', 'one (1) additional full time Professional  Librarian with  one (1) full time staff for every additional 1,000 students.', '[{\"evidence\":\"S.2.2\"}]', '27', 'item', NULL, NULL, NULL, '2024-02-14 17:37:56', '2024-02-14 17:37:56'),
(32, 'S.3', 'There is a continuing staff development program with the corresponding financial assistance from the institution.', '[{\"evidence\":\"S.3\"}]', '23', 'item', NULL, NULL, NULL, '2024-02-14 17:38:12', '2024-02-14 17:38:12'),
(33, 'I.1', 'The library staff compensation, retirement, and fringe benefits, as well as other privileges, are granted in accordance with existing government laws and institutional policies.', '[{\"evidence\":\"I.1\"}]', '24', 'item', NULL, NULL, NULL, '2024-02-14 17:38:37', '2024-02-14 17:38:37'),
(34, 'O.1', 'The librarians are qualified.', '[{\"evidence\":\"O.1\"}]', '25', 'item', NULL, NULL, NULL, '2024-02-14 17:38:49', '2024-02-14 17:38:49'),
(35, 'PARAMETER C:', 'COLLECTION DEVELOPMENT, ORGANIZATION AND PRESERVATION', NULL, '3', 'param', NULL, NULL, NULL, '2024-02-14 17:39:29', '2024-02-14 17:39:29'),
(36, 'System - Inputs and Processes', NULL, NULL, '35', 'ind', '1', NULL, NULL, '2024-02-14 17:39:29', '2024-02-14 17:39:29'),
(37, 'Implementation', NULL, NULL, '35', 'ind', '2', NULL, NULL, '2024-02-14 17:39:29', '2024-02-14 17:39:29'),
(38, 'Outcome/s', NULL, NULL, '35', 'ind', '3', NULL, NULL, '2024-02-14 17:39:29', '2024-02-14 17:39:29'),
(39, 'S.1', 'There is a written Collection Development Policy.', '[{\"evidence\":\"S.1\"}]', '36', 'item', NULL, NULL, NULL, '2024-02-14 17:39:45', '2024-02-14 17:39:45'),
(40, 'S.2', 'There is a core collection of at least:', '[{\"evidence\":\"S.2\"}]', '36', 'item', NULL, NULL, NULL, '2024-02-14 17:40:06', '2024-02-14 17:40:06'),
(41, 'S.2.1', '5,000 titles for the Academic Unit Library; or', '[{\"evidence\":\"S.2.1\"}]', '40', 'item', NULL, NULL, NULL, '2024-02-14 17:40:25', '2024-02-14 17:40:25'),
(42, 'S.2.2', '10,000 titles that support the instruction, research and other programs for an Institution Library.', '[{\"evidence\":\"S.2.2\"}]', '40', 'item', NULL, NULL, NULL, '2024-02-14 17:40:39', '2024-02-14 17:40:39'),
(43, 'S.3', 'Twenty percent (20%) of the library holdings are of current edition, i.e. with copyright within the last 5 years.', '[{\"evidence\":\"S.3\"}]', '36', 'item', NULL, NULL, NULL, '2024-02-14 17:40:53', '2024-02-14 17:40:53'),
(44, 'S.4', 'The Non-print, digital and electronic resources are available.', '[{\"evidence\":\"S.4\"}]', '36', 'item', NULL, NULL, NULL, '2024-02-14 17:41:05', '2024-02-14 17:41:05'),
(45, 'S.5', 'There is an integrated library system.', '[{\"evidence\":\"S.5\"}]', '36', 'item', NULL, NULL, NULL, '2024-02-14 17:41:18', '2024-02-14 17:41:18'),
(46, 'S.6', 'There are provisions for the preservation, general care, and upkeep of library resources.', '[{\"evidence\":\"S.6\"}]', '36', 'item', NULL, NULL, NULL, '2024-02-14 17:41:32', '2024-02-14 17:41:32'),
(47, 'I.1', 'The Collection Development Policy is regularly reviewed and evaluated by the Library Committee.', '[{\"evidence\":\"I.1\"}]', '37', 'item', NULL, NULL, NULL, '2024-02-14 17:41:59', '2024-02-14 17:41:59'),
(48, 'I.2', 'The library collection and services support the mission and vision of the Institution, goals of the Academic Unit and objectives of the Program.', '[{\"evidence\":\"I.2\"}]', '37', 'item', NULL, NULL, NULL, '2024-02-14 17:42:13', '2024-02-14 17:42:13'),
(49, 'I.3', 'The library provides sufficient research books and materials to supplement the clients’ curricular needs.', '[{\"evidence\":\"I.3\"}]', '37', 'item', NULL, NULL, NULL, '2024-02-14 17:42:26', '2024-02-14 17:42:26'),
(50, 'I.4', 'The library maintains an extensive (15% of the total) Filipiniana collection.', '[{\"evidence\":\"I.4\"}]', '37', 'item', NULL, NULL, NULL, '2024-02-14 17:42:44', '2024-02-14 17:42:44'),
(51, 'I.5', 'The library provides 3-5 book/journal titles for professional subjects in the major fields of specialization.', '[{\"evidence\":\"I.5\"}]', '37', 'item', NULL, NULL, NULL, '2024-02-14 17:42:58', '2024-02-14 17:42:58'),
(52, 'I.6', 'The library collection is organized according to an accepted scheme of classification and standard code of cataloging.', '[{\"evidence\":\"I.6\"}]', '37', 'item', NULL, NULL, NULL, '2024-02-14 17:43:11', '2024-02-14 17:43:11'),
(53, 'I.7', 'Regular weeding-out program is conducted to maintain a relevant and updated collection.', '[{\"evidence\":\"I.7\"}]', '37', 'item', NULL, NULL, NULL, '2024-02-14 17:43:22', '2024-02-14 17:43:22'),
(54, 'I.8', 'The quality and quantity of library materials and resources conform with the standards set for a particular academic program.', '[{\"evidence\":\"I.8\"}]', '37', 'item', NULL, NULL, NULL, '2024-02-14 17:43:35', '2024-02-14 17:43:35'),
(55, 'O.1', 'The library core collection is adequate, updated and well-balanced.', '[{\"evidence\":\"O.1\"}]', '38', 'item', NULL, NULL, NULL, '2024-02-14 17:43:48', '2024-02-14 17:43:48'),
(56, 'O.2', 'The professional books, journals and electronic resources for the program are sufficient.', '[{\"evidence\":\"O.2\"}]', '38', 'item', NULL, NULL, NULL, '2024-02-14 17:43:58', '2024-02-14 17:43:58'),
(57, 'PARAMETER D:', 'SERVICES AND UTILIZATION', NULL, '3', 'param', NULL, NULL, NULL, '2024-02-14 17:44:39', '2024-02-14 17:44:39'),
(58, 'System - Inputs and Processes', NULL, NULL, '57', 'ind', '1', NULL, NULL, '2024-02-14 17:44:39', '2024-02-14 17:44:39'),
(59, 'Implementation', NULL, NULL, '57', 'ind', '2', NULL, NULL, '2024-02-14 17:44:39', '2024-02-14 17:44:39'),
(60, 'Outcome/s', NULL, NULL, '57', 'ind', '3', NULL, NULL, '2024-02-14 17:44:39', '2024-02-14 17:44:39'),
(61, 'S.1', 'The Library has information services pertinent to the institution’s requirements.', '[{\"evidence\":\"S.1\"}]', '58', 'item', NULL, NULL, NULL, '2024-02-14 17:44:54', '2024-02-14 17:44:54'),
(62, 'I.1', 'The following services/programs are provided:', '[{\"evidence\":\"I.1\"}]', '59', 'item', NULL, NULL, NULL, '2024-02-14 17:45:07', '2024-02-14 17:45:07'),
(63, 'I.1.1', 'functional and interactive library web page;', '[{\"evidence\":\"I.1.1\"}]', '62', 'item', NULL, NULL, NULL, '2024-02-14 17:45:28', '2024-02-14 17:45:28'),
(64, 'I.1.2', 'integrated library system;', '[{\"evidence\":\"I.1.2\"}]', '62', 'item', NULL, NULL, NULL, '2024-02-14 17:45:48', '2024-02-14 17:45:48'),
(65, 'I.1.3', 'On-line public access (OPAC);', '[{\"evidence\":\"I.1.3\"}]', '62', 'item', NULL, NULL, NULL, '2024-02-14 17:46:01', '2024-02-14 17:46:01'),
(66, 'I.1.4', 'circulation on-line;', '[{\"evidence\":\"I.1.4\"}]', '62', 'item', NULL, NULL, NULL, '2024-02-14 17:46:17', '2024-02-14 17:46:17'),
(67, 'I.1.5', 'computerized cataloging;', '[{\"evidence\":\"I.1.5\"}]', '62', 'item', NULL, NULL, NULL, '2024-02-14 17:46:35', '2024-02-14 17:46:35'),
(68, 'I.1.6', 'inventory reporting;', '[{\"evidence\":\"I.1.6\"}]', '62', 'item', NULL, NULL, NULL, '2024-02-14 17:47:09', '2024-02-14 17:47:09'),
(69, 'I.1.7', 'serials control;', '[{\"evidence\":\"I.1.7\"}]', '62', 'item', NULL, NULL, NULL, '2024-02-14 17:47:30', '2024-02-14 17:47:30'),
(70, 'I.1.8', 'internet searching;', '[{\"evidence\":\"I.1.8\"}]', '62', 'item', NULL, NULL, NULL, '2024-02-14 17:47:45', '2024-02-14 17:47:45'),
(71, 'I.1.9', 'CD-ROM;', '[{\"evidence\":\"I.1.9\"}]', '62', 'item', NULL, NULL, NULL, '2024-02-14 17:47:56', '2024-02-14 17:47:56'),
(72, 'I.1.10', 'on-line database;', '[{\"evidence\":\"I.1.10\"}]', '62', 'item', NULL, NULL, NULL, '2024-02-14 17:48:09', '2024-02-14 17:48:09'),
(73, 'I.1.11', 'photocopying; and', '[{\"evidence\":\"I.1.11\"}]', '62', 'item', NULL, NULL, NULL, '2024-02-14 17:48:23', '2024-02-14 17:48:23'),
(74, 'I.1.12', 'bar coding.', '[{\"evidence\":\"I.1.12\"}]', '62', 'item', NULL, NULL, NULL, '2024-02-14 17:48:38', '2024-02-14 17:48:38'),
(75, 'I.2', 'The library opens  at least 54 hours per week for the Academic Unit or 60 hours per week for the Institution.', '[{\"evidence\":\"I.2\"}]', '59', 'item', NULL, NULL, NULL, '2024-02-14 17:48:58', '2024-02-14 17:48:58'),
(76, 'I.3', 'The library promotes and disseminates its program through a regular announcement of its new acquisitions of print materials (books, journals, magazines), resources, facilities, and services.', '[{\"evidence\":\"I.3\"}]', '59', 'item', NULL, NULL, NULL, '2024-02-14 17:49:13', '2024-02-14 17:49:13'),
(77, 'I.4', 'Librarians and staff are available during library hours to assist and provide library services.', '[{\"evidence\":\"I.4\"}]', '59', 'item', NULL, NULL, NULL, '2024-02-14 17:49:23', '2024-02-14 17:49:23'),
(78, 'I.5', 'Statistical data on the utilization of various resources and services are compiled and used to improve the library collection and operations.', '[{\"evidence\":\"I.5\"}]', '59', 'item', NULL, NULL, NULL, '2024-02-14 17:49:33', '2024-02-14 17:49:33'),
(79, 'O.1', 'The library services are efficiently and effectively provided.', '[{\"evidence\":\"O.1\"}]', '60', 'item', NULL, NULL, NULL, '2024-02-14 17:49:44', '2024-02-14 17:49:44'),
(80, 'O.2', 'The library users are satisfied with library services.', '[{\"evidence\":\"O.2\"}]', '60', 'item', NULL, NULL, NULL, '2024-02-14 17:49:56', '2024-02-14 17:49:56'),
(81, 'PARAMETER E:', 'PHYSICAL SET-UP AND FACILITIES', NULL, '3', 'param', NULL, NULL, NULL, '2024-02-14 17:50:28', '2024-02-14 17:50:28'),
(82, 'System - Inputs and Processes', NULL, NULL, '81', 'ind', '1', NULL, NULL, '2024-02-14 17:50:28', '2024-02-14 17:50:28'),
(83, 'Implementation', NULL, NULL, '81', 'ind', '2', NULL, NULL, '2024-02-14 17:50:28', '2024-02-14 17:50:28'),
(84, 'Outcome/s', NULL, NULL, '81', 'ind', '3', NULL, NULL, '2024-02-14 17:50:28', '2024-02-14 17:50:28'),
(85, 'S.1', 'The library is strategically located and accessible to students, faculty and other clientele.', '[{\"evidence\":\"S.1\"}]', '82', 'item', NULL, NULL, NULL, '2024-02-14 17:50:43', '2024-02-14 17:50:43'),
(86, 'S.2', 'The library is systematically planned to allow future expansion.', '[{\"evidence\":\"S.2\"}]', '82', 'item', NULL, NULL, NULL, '2024-02-14 17:51:08', '2024-02-14 17:51:08'),
(87, 'S.3', 'The size of the  library meets standard requirements considering present enrollment and future expansion.', '[{\"evidence\":\"S.3\"}]', '82', 'item', NULL, NULL, NULL, '2024-02-14 17:51:19', '2024-02-14 17:51:19'),
(88, 'S.4', 'The reading room can accommodate at least 10% of the school enrollment at any given time.', '[{\"evidence\":\"S.4\"}]', '82', 'item', NULL, NULL, NULL, '2024-02-14 17:51:29', '2024-02-14 17:51:29'),
(89, 'S.5', 'Space is provided for print resources as well as work stations for electronic resources.', '[{\"evidence\":\"S.5\"}]', '82', 'item', NULL, NULL, NULL, '2024-02-14 17:51:43', '2024-02-14 17:51:43'),
(90, 'S.6', 'Space is provided for the librarians’ office, staff room, technical room, etc.', '[{\"evidence\":\"S.6\"}]', '82', 'item', NULL, NULL, NULL, '2024-02-14 17:51:55', '2024-02-14 17:51:55'),
(91, 'S.7', 'Ramps for the physically disabled are provided.', '[{\"evidence\":\"S.7\"}]', '82', 'item', NULL, NULL, NULL, '2024-02-14 17:52:09', '2024-02-14 17:52:09'),
(92, 'S.8', 'The library meets the required and standard-sized furniture and equipment.', '[{\"evidence\":\"S.8\"}]', '82', 'item', NULL, NULL, NULL, '2024-02-14 17:52:23', '2024-02-14 17:52:23'),
(93, 'S.9', 'The following library furniture and equipment are available:', '[{\"evidence\":\"S.9\"}]', '82', 'item', NULL, NULL, NULL, '2024-02-14 17:52:37', '2024-02-14 17:52:37'),
(94, 'S.10', 'The library is well-lighted.', '[{\"evidence\":\"S.10\"}]', '82', 'item', NULL, NULL, NULL, '2024-02-14 17:52:53', '2024-02-14 17:52:53'),
(95, 'S.11', 'The library is well-ventilated', '[{\"evidence\":\"S.11\"}]', '82', 'item', NULL, NULL, NULL, '2024-02-14 17:53:06', '2024-02-14 17:53:06'),
(96, 'S.12', 'The atmosphere is conducive to learning.', '[{\"evidence\":\"S.12\"}]', '82', 'item', NULL, NULL, NULL, '2024-02-14 17:53:17', '2024-02-14 17:53:17'),
(97, 'S.13', 'Fire extinguishers and a local fire alarm system are available.', '[{\"evidence\":\"S.13\"}]', '82', 'item', NULL, NULL, NULL, '2024-02-14 17:53:33', '2024-02-14 17:54:03'),
(98, 'S.14', 'The library employs a system for security and control of library resources.', '[{\"evidence\":\"S.14\"}]', '82', 'item', NULL, NULL, NULL, '2024-02-14 17:54:21', '2024-02-14 17:54:21'),
(99, 'S.9.1', 'adjustable/movable shelves;', '[{\"evidence\":\"S.9.1\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:54:46', '2024-02-14 17:54:46'),
(100, 'S.9.2', 'magazine display shelves;', '[{\"evidence\":\"S.9.2\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:55:03', '2024-02-14 17:55:03'),
(101, 'S.9.3', 'newspaper racks;', '[{\"evidence\":\"S.9.3\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:55:15', '2024-02-14 17:55:15'),
(102, 'S.9.4', 'standard tables and chairs;', '[{\"evidence\":\"S.9.4\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:55:33', '2024-02-14 17:55:33'),
(103, 'S.9.5', 'carrels for individual study;', '[{\"evidence\":\"S.9.5\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:55:46', '2024-02-14 17:55:46'),
(104, 'S.9.6', 'desks and chairs for staff;', '[{\"evidence\":\"S.9.6\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:56:03', '2024-02-14 17:56:03'),
(105, 'S.9.7', 'charging desk;', '[{\"evidence\":\"S.9.7\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:56:13', '2024-02-14 17:56:13'),
(106, 'S.9.8', 'dictionary stand;', '[{\"evidence\":\"S.9.8\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:56:24', '2024-02-14 17:56:24'),
(107, 'S.9.9', 'atlas stand;', '[{\"evidence\":\"S.9.9\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:56:34', '2024-02-14 17:56:34'),
(108, 'S.9.10', 'bulletin boards and display cabinets;', '[{\"evidence\":\"S.9.10\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:56:45', '2024-02-14 17:56:45'),
(109, 'S.9.11', 'vertical file cabinets;', '[{\"evidence\":\"S.9.11\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:56:56', '2024-02-14 17:56:56'),
(110, 'S.9.12', 'book racks;', '[{\"evidence\":\"S.9.12\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:58:25', '2024-02-14 17:58:25'),
(111, 'S.9.13', 'map stands/cabinets;', '[{\"evidence\":\"S.9.13\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:58:38', '2024-02-14 17:58:38'),
(112, 'S.9.14', 'cardex/rotadex or any filing equipment for periodical records;', '[{\"evidence\":\"S.9.14\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:58:48', '2024-02-14 17:58:48'),
(113, 'S.9.15', 'typewriters;', '[{\"evidence\":\"S.9.15\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:58:59', '2024-02-14 17:58:59'),
(114, 'S.9.16', 'computers with printers; and', '[{\"evidence\":\"S.9.16\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:59:10', '2024-02-14 17:59:10'),
(115, 'S.9.17', 'others (please specify)', '[{\"evidence\":\"S.9.17\"}]', '93', 'item', NULL, NULL, NULL, '2024-02-14 17:59:22', '2024-02-14 17:59:22'),
(116, 'I.1', 'IT software and multi-media equipment are utilized.', '[{\"evidence\":\"I.1\"}]', '83', 'item', NULL, NULL, NULL, '2024-02-14 17:59:41', '2024-02-14 17:59:41'),
(117, 'O.1', 'The environment is conducive to learning.', '[{\"evidence\":\"O.1\"}]', '84', 'item', NULL, NULL, NULL, '2024-02-14 18:00:03', '2024-02-14 18:00:03'),
(118, 'O.2', 'The library facilities are well-maintained and aesthetically designed.', '[{\"evidence\":\"O.2\"}]', '84', 'item', NULL, NULL, NULL, '2024-02-14 18:00:14', '2024-02-14 18:00:14'),
(119, 'PARAMETER F:', 'FINANCIAL SUPPORT', NULL, '3', 'param', NULL, NULL, NULL, '2024-02-14 18:00:52', '2024-02-14 18:00:52'),
(120, 'System - Inputs and Processes', NULL, NULL, '119', 'ind', '1', NULL, NULL, '2024-02-14 18:00:52', '2024-02-14 18:00:52'),
(121, 'Implementation', NULL, NULL, '119', 'ind', '2', NULL, NULL, '2024-02-14 18:00:52', '2024-02-14 18:00:52'),
(122, 'Outcome/s', NULL, NULL, '119', 'ind', '3', NULL, NULL, '2024-02-14 18:00:52', '2024-02-14 18:00:52'),
(123, 'S.1', 'The Institution has a regular and realistic budget for the library.', '[{\"evidence\":\"S.1\"}]', '120', 'item', NULL, NULL, NULL, '2024-02-14 18:01:06', '2024-02-14 18:01:06'),
(124, 'I.1', 'The Head Librarian and staff, in coordination with other officials of the Institution, prepare and manage the annual library budget.', '[{\"evidence\":\"I.1\"}]', '121', 'item', NULL, NULL, NULL, '2024-02-14 18:01:27', '2024-02-14 18:01:27'),
(125, 'I.2', 'All fees and funds allocated for library resources and services are utilized solely for such purposes and are properly audited.', '[{\"evidence\":\"I.2\"}]', '121', 'item', NULL, NULL, NULL, '2024-02-14 18:01:43', '2024-02-14 18:01:43'),
(126, 'I.3', 'Other sources of financial assistance are sought.', '[{\"evidence\":\"I.3\"}]', '121', 'item', NULL, NULL, NULL, '2024-02-14 18:01:59', '2024-02-14 18:01:59'),
(127, 'O.1', 'The financial support from fiduciary, supplemental and external funds is adequate.', '[{\"evidence\":\"O.1\"}]', '122', 'item', NULL, NULL, NULL, '2024-02-14 18:02:10', '2024-02-14 18:02:10'),
(128, 'PARAMETER G:', 'LINKAGES', NULL, '3', 'param', NULL, NULL, NULL, '2024-02-14 18:02:40', '2024-02-14 18:02:40'),
(129, 'System - Inputs and Processes', NULL, NULL, '128', 'ind', '1', NULL, NULL, '2024-02-14 18:02:40', '2024-02-14 18:02:40'),
(130, 'Implementation', NULL, NULL, '128', 'ind', '2', NULL, NULL, '2024-02-14 18:02:40', '2024-02-14 18:02:40'),
(131, 'Outcome/s', NULL, NULL, '128', 'ind', '3', NULL, NULL, '2024-02-14 18:02:40', '2024-02-14 18:02:40'),
(132, 'S.1', 'The Library is on the mailing list of agencies, foundations, etc., for exchange of publications and other books and journals donations.', '[{\"evidence\":\"S.1\"}]', '129', 'item', NULL, NULL, NULL, '2024-02-14 18:03:00', '2024-02-14 18:03:00'),
(133, 'I.1', 'Linkages with other institutions and funding agencies are explored and established for purposes of enhancing library facilities and resources.', '[{\"evidence\":\"I.1\"}]', '130', 'item', NULL, NULL, NULL, '2024-02-14 18:03:12', '2024-02-14 18:03:12'),
(134, 'I.2', 'The library establishes consortia, networking and resource sharing with other institutions and library collaborative activities.', '[{\"evidence\":\"I.2\"}]', '130', 'item', NULL, NULL, NULL, '2024-02-14 18:03:22', '2024-02-14 18:03:22'),
(135, 'O.1', 'Library resource sharing and linkages are well-established.', '[{\"evidence\":\"O.1\"}]', '131', 'item', NULL, NULL, NULL, '2024-02-14 18:03:32', '2024-02-14 18:03:32'),
(136, 'AREA I:', 'VISSION, MISSION, GOALS OBJECTIVES', NULL, '2', 'area', NULL, NULL, NULL, '2024-02-16 10:01:26', '2024-02-16 10:01:41'),
(137, 'PARAMETER A:', 'STATEMENT OF VISION, MISSION, GOALS AND OBJECTIVES', NULL, '136', 'param', NULL, NULL, NULL, '2024-02-16 10:02:04', '2024-02-16 10:02:04'),
(138, 'System - Inputs and Processes', NULL, NULL, '137', 'ind', '1', NULL, NULL, '2024-02-16 10:02:04', '2024-02-16 10:02:04'),
(139, 'Implementation', NULL, NULL, '137', 'ind', '2', NULL, NULL, '2024-02-16 10:02:04', '2024-02-16 10:02:04'),
(140, 'Outcome/s', NULL, NULL, '137', 'ind', '3', NULL, NULL, '2024-02-16 10:02:04', '2024-02-16 10:02:04'),
(141, 'S.1', 'The institution has a system of determining the Vision and Mission', '[{\"evidence\":\"S.1\"}]', '138', 'item', NULL, NULL, NULL, '2024-02-16 10:03:05', '2024-02-16 10:03:05'),
(142, 'S.2', 'The Vision clearly reflects what the Institution hopes to become in the future', '[{\"evidence\":\"S.2\"}]', '138', 'item', NULL, NULL, NULL, '2024-02-16 10:03:29', '2024-02-16 10:03:29'),
(143, 'S.3', 'The Mission clearly reflects the Institution’s legal and the other statutory mandates', '[{\"evidence\":\"S.3\"}]', '138', 'item', NULL, NULL, NULL, '2024-02-16 10:03:46', '2024-02-16 10:03:46'),
(144, 'S.4', 'The Goals of the College / Academic unit are consistent with the Mission of the Institution', '[{\"evidence\":\"S.4\"}]', '138', 'item', NULL, NULL, NULL, '2024-02-16 10:04:04', '2024-02-16 10:04:04'),
(145, 'S.5', 'The Objectives of the Program have the expected outcomes in terms of competencies (skills\nand knowledge), values and other attributes of the graduates which include the development of', '[{\"evidence\":\"S.5\"}]', '138', 'item', NULL, NULL, NULL, '2024-02-16 10:04:42', '2024-02-16 10:04:42'),
(146, 'S.5.1', 'Technical/pedagogical skills.', '[{\"evidence\":\"S.5.1\"}]', '145', 'item', NULL, NULL, NULL, '2024-02-16 10:05:05', '2024-02-16 10:05:05'),
(147, 'S.5.2', 'Research and extension capabilities', '[{\"evidence\":\"S.5.2\"}]', '145', 'item', NULL, NULL, NULL, '2024-02-16 10:05:25', '2024-02-16 10:05:25'),
(148, 'S.5.3', 'Student’s own ideas, desirable, attitudes and personal discipline', '[{\"evidence\":\"S.5.3\"}]', '145', 'item', NULL, NULL, NULL, '2024-02-16 10:05:54', '2024-02-16 10:05:54'),
(149, 'S.5.4', 'Moral character', '[{\"evidence\":\"S.5.4\"}]', '145', 'item', NULL, NULL, NULL, '2024-02-16 10:06:15', '2024-02-16 10:06:15'),
(150, 'S.5.5', 'Critical, analytical, problem solving and other higher order thinking skills.', '[{\"evidence\":\"S.5.5\"}]', '145', 'item', NULL, NULL, NULL, '2024-02-16 10:06:30', '2024-02-16 10:06:30'),
(151, 'S.5.6', 'Aesthetic and cultural values', '[{\"evidence\":\"S.5.6\"}]', '145', 'item', NULL, NULL, NULL, '2024-02-16 10:06:50', '2024-02-16 10:06:50'),
(152, 'I.1', 'The Institution/College conducts a review on the statements of the Vision and Mission as well\nas its goals and program objectives for the approval of authorities concern', '[{\"evidence\":\"I.1\"}]', '139', 'item', NULL, NULL, NULL, '2024-02-16 10:07:19', '2024-02-16 10:07:19'),
(153, 'I.2', 'The college / Academic Unit follows a system of formulating its goals and the objectives of the\nprogram', '[{\"evidence\":\"I.2\"}]', '139', 'item', NULL, NULL, NULL, '2024-02-16 10:07:52', '2024-02-16 10:07:52'),
(154, 'I.3', 'The College / Academic Unit’s faculty, personnel, students and other stakeholders\n(cooperating agencies, linkages, alumni, industry sector and other concerned groups) participate in\nthe formulation, review and/or revision of the VMGO', '[{\"evidence\":\"I.3\"}]', '139', 'item', NULL, NULL, NULL, '2024-02-16 10:08:11', '2024-02-16 10:08:11'),
(155, 'O.1', 'The VMGO are crafted and duly approved by the BOR/BOT', '[{\"evidence\":\"O.1\"}]', '140', 'item', NULL, NULL, NULL, '2024-02-16 10:10:42', '2024-02-16 10:10:42'),
(156, 'PARAMETER B:', 'DISSEMINATION AND ACCEPTABILITY', NULL, '136', 'param', NULL, NULL, NULL, '2024-02-17 06:38:59', '2024-02-17 06:38:59'),
(157, 'System - Inputs and Processes', NULL, NULL, '156', 'ind', '1', NULL, NULL, '2024-02-17 06:38:59', '2024-02-17 06:38:59'),
(158, 'Implementation', NULL, NULL, '156', 'ind', '2', NULL, NULL, '2024-02-17 06:38:59', '2024-02-17 06:38:59'),
(159, 'Outcome/s', NULL, NULL, '156', 'ind', '3', NULL, NULL, '2024-02-17 06:38:59', '2024-02-17 06:38:59'),
(160, 'S.1', 'The VGMO are available on bulletin boards, in catalogs/manuals and in other forms of\ncommunication media.', '[{\"evidence\":\"S.1\"}]', '157', 'item', NULL, NULL, NULL, '2024-02-17 06:39:28', '2024-02-17 06:39:28'),
(161, 'I.2', 'A system of dissemination and acceptability of the VGMO is enforce', '[{\"evidence\":\"I.2\"}]', '158', 'item', NULL, NULL, NULL, '2024-02-17 06:42:05', '2024-02-17 06:42:05'),
(162, 'I.3', 'The formulation/review/revision of the VMGO is participated in by the following:', '[{\"evidence\":\"I.3\"}]', '158', 'item', NULL, NULL, NULL, '2024-02-17 06:42:31', '2024-02-17 06:42:31'),
(163, 'I.3.1', 'Administrators', '[{\"evidence\":\"I.3.1\"}]', '162', 'item', NULL, NULL, NULL, '2024-02-17 06:42:57', '2024-02-17 06:42:57'),
(164, 'I.3.2', 'Faculty', '[{\"evidence\":\"I.3.2\"}]', '162', 'item', NULL, NULL, NULL, '2024-02-17 06:43:13', '2024-02-17 06:43:13'),
(165, 'I.3.3', 'Staff', '[{\"evidence\":\"I.3.3\"}]', '162', 'item', NULL, NULL, NULL, '2024-02-17 06:43:44', '2024-02-17 06:43:44'),
(166, 'I.3.4', 'Students', '[{\"evidence\":\"I.3.4\"}]', '162', 'item', NULL, NULL, NULL, '2024-02-17 06:43:56', '2024-02-17 06:43:56'),
(167, 'I.3.5', 'other stakeholder', '[{\"evidence\":\"I.3.5\"}]', '162', 'item', NULL, NULL, NULL, '2024-02-17 06:44:24', '2024-02-17 06:44:24'),
(168, 'I.4', 'The faculty and staff perform their jobs/function in consonance with VMGO', '[{\"evidence\":\"I.4\"}]', '158', 'item', NULL, NULL, NULL, '2024-02-17 06:44:50', '2024-02-17 06:44:50'),
(169, 'I.5', 'The VGMO are widely disseminated to the different agencies, institutions, industry sector\nand the community.', '[{\"evidence\":\"I.5\"}]', '158', 'item', NULL, NULL, NULL, '2024-02-17 06:45:29', '2024-02-17 06:45:29'),
(170, 'O.1', 'There is full awareness and acceptance of the VGMO by the administrators, faculty, staff,\nstudents and other stakeholders.', '[{\"evidence\":\"O.1\"}]', '159', 'item', NULL, NULL, NULL, '2024-02-17 06:46:36', '2024-02-17 06:46:36'),
(171, 'O.2', 'There is congruency between actual educational practices and activities with the following', '[{\"evidence\":\"O.2\"}]', '159', 'item', NULL, NULL, NULL, '2024-02-17 06:46:55', '2024-02-17 06:46:55'),
(172, 'O.2.1', 'Vision and Mission of the SUC;', '[{\"evidence\":\"O.2.1\"}]', '171', 'item', NULL, NULL, NULL, '2024-02-17 06:47:22', '2024-02-17 06:47:22'),
(173, 'O.2.2', 'Goals of the College/Academic Unit; and', '[{\"evidence\":\"O.2.2\"}]', '171', 'item', NULL, NULL, NULL, '2024-02-17 06:47:40', '2024-02-17 06:47:40'),
(174, 'O.2.3', 'Objectives Program.', '[{\"evidence\":\"O.2.3\"}]', '171', 'item', NULL, NULL, NULL, '2024-02-17 06:47:55', '2024-02-17 06:47:55'),
(175, 'O.3', 'The goals and objectives are being achieved.', '[{\"evidence\":\"O.3\"}]', '159', 'item', NULL, NULL, NULL, '2024-02-17 06:48:13', '2024-02-17 06:48:13'),
(176, 'AREA II:', 'FACULTY', NULL, '2', 'area', NULL, NULL, NULL, '2024-02-17 06:50:25', '2024-02-17 06:50:25'),
(177, 'PARAMETER A:', 'ACADEMIC QUALIFICATIONS AND PROFESSIONAL EXPERIENCE', NULL, '176', 'param', NULL, NULL, NULL, '2024-02-17 06:50:55', '2024-02-17 06:50:55'),
(178, 'System - Inputs and Processes', NULL, NULL, '177', 'ind', '1', NULL, NULL, '2024-02-17 06:50:55', '2024-02-17 06:50:55'),
(179, 'Implementation', NULL, NULL, '177', 'ind', '2', NULL, NULL, '2024-02-17 06:50:55', '2024-02-17 06:50:55'),
(180, 'Outcome/s', NULL, NULL, '177', 'ind', '3', NULL, NULL, '2024-02-17 06:50:55', '2024-02-17 06:50:55'),
(181, 'S.1', 'The required number of faculty possess graduate degrees\nappropriate and relevant to the program or any the allied fields.', '[{\"evidence\":\"S.1\"}]', '178', 'item', NULL, NULL, NULL, '2024-02-17 06:51:19', '2024-02-17 06:51:19'),
(182, 'S.2', 'Other qualifications such as the following are considered:', '[{\"evidence\":\"S.2\"}]', '178', 'item', NULL, NULL, NULL, '2024-02-17 06:54:13', '2024-02-17 06:54:13'),
(183, 'S.2.1', 'Professional Experience', '[{\"evidence\":\"S.2.1\"}]', '182', 'item', NULL, NULL, NULL, '2024-02-17 06:54:31', '2024-02-17 06:54:31'),
(184, 'S.2.2', 'Licensure (if applicable)', '[{\"evidence\":\"S.2.2\"}]', '182', 'item', NULL, NULL, NULL, '2024-02-17 06:55:11', '2024-02-17 06:55:11'),
(185, 'S.2.3', 'Specialization', '[{\"evidence\":\"S.2.3\"}]', '182', 'item', NULL, NULL, NULL, '2024-02-17 06:55:50', '2024-02-17 06:55:50'),
(186, 'S.2.4', 'Technical/Pedagogical skills and competence; and Group Members Thesis Title Adviser', '[{\"evidence\":\"S.2.4\"}]', '182', 'item', NULL, NULL, NULL, '2024-02-17 06:56:45', '2024-02-17 06:56:45'),
(187, 'S.2.5', 'Special abilities, computer literacy, research productivity;', '[{\"evidence\":\"S.2.5\"}]', '182', 'item', NULL, NULL, NULL, '2024-02-17 06:56:58', '2024-02-17 06:56:58'),
(188, 'S.3', 'Faculty handling OJT/practicum courses have had atleast three (3) years of\nteaching and industry based experience in the field, if applicable.', '[{\"evidence\":\"S.3\"}]', '178', 'item', NULL, NULL, NULL, '2024-02-17 06:57:23', '2024-02-17 06:57:23'),
(189, 'S.4', 'Atleast 40% of the faculty are graduate degree holders', '[{\"evidence\":\"S.4\"}]', '178', 'item', NULL, NULL, NULL, '2024-02-17 06:57:59', '2024-02-17 06:57:59'),
(190, 'I.1', 'The Faculty demonstrate professional competence and are\nengage in any or a combination of the following', '[{\"evidence\":\"I.1\"}]', '179', 'item', NULL, NULL, NULL, '2024-02-17 06:58:27', '2024-02-17 06:58:27'),
(191, 'I.1.1', 'Instruction', '[{\"evidence\":\"I.1.1\"}]', '190', 'item', NULL, NULL, NULL, '2024-02-17 06:58:56', '2024-02-17 06:58:56'),
(192, 'I.1.2', 'Research', '[{\"evidence\":\"I.1.2\"}]', '190', 'item', NULL, NULL, NULL, '2024-02-17 06:59:45', '2024-02-17 06:59:45'),
(193, 'I.1.3', 'Extension', '[{\"evidence\":\"I.1.3\"}]', '190', 'item', NULL, NULL, NULL, '2024-02-17 07:00:48', '2024-02-17 07:00:48'),
(194, 'I.1.4', 'Production', '[{\"evidence\":\"I.1.4\"}]', '190', 'item', NULL, NULL, NULL, '2024-02-17 07:01:07', '2024-02-17 07:01:07'),
(195, 'I.1.5', 'Consultancy and expert service; and', '[{\"evidence\":\"I.1.5\"}]', '190', 'item', NULL, NULL, NULL, '2024-02-17 07:02:24', '2024-02-17 07:02:24'),
(196, 'I.1.6', 'Publication, Creative and Scholarly works', '[{\"evidence\":\"I.1.6\"}]', '190', 'item', NULL, NULL, NULL, '2024-02-17 07:02:41', '2024-02-17 07:02:41'),
(197, 'I.2', 'Faculty pursue graduate degrees related to the program and/or\nallied fields from reputable institutions (which atleast level II\naccreditation status or World/Asian rank)', '[{\"evidence\":\"I.2\"}]', '179', 'item', NULL, NULL, NULL, '2024-02-17 07:03:00', '2024-02-17 07:03:00'),
(198, 'O.1', 'This institution has qualified and competent faculty', '[{\"evidence\":\"O.1\"}]', '180', 'item', NULL, NULL, NULL, '2024-02-17 07:03:33', '2024-02-17 07:03:33'),
(199, 'PARAMETER B:', 'RECRUITMENT, SELECTION AND ORIENTATION', NULL, '176', 'param', NULL, NULL, NULL, '2024-02-17 07:05:23', '2024-02-17 07:45:39'),
(200, 'System - Inputs and Processes', NULL, NULL, '199', 'ind', '1', NULL, NULL, '2024-02-17 07:05:23', '2024-02-17 07:05:23'),
(201, 'Implementation', NULL, NULL, '199', 'ind', '2', NULL, NULL, '2024-02-17 07:05:23', '2024-02-17 07:05:23'),
(202, 'Outcome/s', NULL, NULL, '199', 'ind', '3', NULL, NULL, '2024-02-17 07:05:23', '2024-02-17 07:05:23'),
(203, 'S.1', 'There is institutional Human Resource Development Plan/Program designed\nfor faculty recruitment.', '[{\"evidence\":\"S.1\"}]', '200', 'item', NULL, NULL, NULL, '2024-02-17 07:05:35', '2024-02-17 07:05:35'),
(204, 'I.1', 'Recruitment and selection of faculty is processed by the Faculty Selection\nBoard using the following criteria ;', '[{\"evidence\":\"I.1\"}]', '201', 'item', NULL, NULL, NULL, '2024-02-17 07:06:24', '2024-02-17 07:06:24'),
(205, 'I.1.1', 'Academic Qualifications;', '[{\"evidence\":\"I.1.1\"}]', '204', 'item', NULL, NULL, NULL, '2024-02-17 07:06:34', '2024-02-17 07:06:34'),
(206, 'I.1.2', 'Personal Qualities;', '[{\"evidence\":\"I.1.2\"}]', '204', 'item', NULL, NULL, NULL, '2024-02-17 07:06:50', '2024-02-17 07:06:50'),
(207, 'I.1.3', 'Communication Skill;', '[{\"evidence\":\"I.1.3\"}]', '204', 'item', NULL, NULL, NULL, '2024-02-17 07:07:06', '2024-02-17 07:07:06'),
(208, 'I.1.4', 'Teaching Ability;', '[{\"evidence\":\"I.1.4\"}]', '204', 'item', NULL, NULL, NULL, '2024-02-17 07:07:16', '2024-02-17 07:07:16'),
(209, 'I.1.5', 'Medical Examination Result;', '[{\"evidence\":\"I.1.5\"}]', '204', 'item', NULL, NULL, NULL, '2024-02-17 07:07:43', '2024-02-17 07:07:43'),
(210, 'I.1.6', 'Psychological Examination Result;', '[{\"evidence\":\"I.1.6\"}]', '204', 'item', NULL, NULL, NULL, '2024-02-17 07:07:53', '2024-02-17 07:07:53'),
(211, 'I.1.7', 'relevant professional experiences,(if any);', '[{\"evidence\":\"I.1.7\"}]', '204', 'item', NULL, NULL, NULL, '2024-02-17 07:08:06', '2024-02-17 07:08:06'),
(212, 'I.1.8', 'previous record of employment, (if any);', '[{\"evidence\":\"I.1.8\"}]', '204', 'item', NULL, NULL, NULL, '2024-02-17 07:08:17', '2024-02-17 07:08:17'),
(213, 'I.1.9', 'technical/special skills and abilities; and', '[{\"evidence\":\"I.1.9\"}]', '204', 'item', NULL, NULL, NULL, '2024-02-17 07:08:32', '2024-02-17 07:08:32'),
(214, 'I.1.10', 'previous performance rating (if any)', '[{\"evidence\":\"I.1.10\"}]', '204', 'item', NULL, NULL, NULL, '2024-02-17 07:08:56', '2024-02-17 07:08:56'),
(215, 'I.2', 'The hiring adopts an open competitive selection, based on the CSC-approved\n\nMerit System and Promotion Plan of the institution published and well-\ndisseminated through various media outlets:', '[{\"evidence\":\"I.2\"}]', '201', 'item', NULL, NULL, NULL, '2024-02-17 07:09:25', '2024-02-17 07:09:25'),
(216, 'I.2.1', 'print media (newspaper, flyers, CSC Bulletin of vacant position);', '[{\"evidence\":\"I.2.1\"}]', '215', 'item', NULL, NULL, NULL, '2024-02-17 07:09:38', '2024-02-17 07:09:38'),
(217, 'I.2.2', 'broadcast media (TV, radio)', '[{\"evidence\":\"I.2.2\"}]', '215', 'item', NULL, NULL, NULL, '2024-02-17 07:09:50', '2024-02-17 07:09:50'),
(218, 'I.2.3', 'website;', '[{\"evidence\":\"I.2.3\"}]', '215', 'item', NULL, NULL, NULL, '2024-02-17 07:10:01', '2024-02-17 07:10:01'),
(219, 'I.2.4', 'bulletin boards; and', '[{\"evidence\":\"I.2.4\"}]', '215', 'item', NULL, NULL, NULL, '2024-02-17 07:10:11', '2024-02-17 07:10:11'),
(220, 'I.2.5', 'others (please specify)', '[{\"evidence\":\"I.2.5\"}]', '215', 'item', NULL, NULL, NULL, '2024-02-17 07:10:22', '2024-02-17 07:10:22'),
(221, 'I.3', 'Recruitment and selection process involved the Dean, concerned Chair,\nfaculty representative/s and other administration policies on their duties,\nresponsibilities , benefits and other academic concerns.', '[{\"evidence\":\"I.3\"}]', '201', 'item', NULL, NULL, NULL, '2024-02-17 07:10:39', '2024-02-17 07:10:39'),
(222, 'I.4', 'A Screening Committee selects and recommends the best and most qualified\napplicant.', '[{\"evidence\":\"I.4\"}]', '201', 'item', NULL, NULL, NULL, '2024-02-17 07:11:25', '2024-02-17 07:11:25'),
(223, 'I.5', 'Measures to avoid professional in-breeding are observe.', '[{\"evidence\":\"I.5\"}]', '201', 'item', NULL, NULL, NULL, '2024-02-17 07:11:39', '2024-02-17 07:11:39'),
(224, 'I.6', 'The institutions conducts orientation for the newly-hired faculty on its vision\nand mission, CSC, PRC, DBM, and administration policies on their duties,\nresponsibilities, benefits and other academic concerns.', '[{\"evidence\":\"I.6\"}]', '201', 'item', NULL, NULL, NULL, '2024-02-17 07:12:03', '2024-02-17 07:12:03'),
(225, 'O.1', 'The most qualified faculty are selected .', '[{\"evidence\":\"O.1\"}]', '202', 'item', NULL, NULL, NULL, '2024-02-17 07:12:37', '2024-02-17 07:12:37'),
(226, 'PARAMETER C:', 'FACULTY ADEQUACY AND LOADING', NULL, '176', 'param', NULL, NULL, NULL, '2024-02-17 07:13:39', '2024-02-17 07:13:39'),
(227, 'System - Inputs and Processes', NULL, NULL, '226', 'ind', '1', NULL, NULL, '2024-02-17 07:13:39', '2024-02-17 07:13:39'),
(228, 'Implementation', NULL, NULL, '226', 'ind', '2', NULL, NULL, '2024-02-17 07:13:39', '2024-02-17 07:13:39'),
(229, 'Outcome/s', NULL, NULL, '226', 'ind', '3', NULL, NULL, '2024-02-17 07:13:39', '2024-02-17 07:13:39'),
(230, 'S.1', 'Faculty-Student ratio is in accordance with the program requirements and standards as\nfollow:', '[{\"evidence\":\"S.1\"}]', '227', 'item', NULL, NULL, NULL, '2024-02-17 07:14:34', '2024-02-17 07:14:34'),
(231, 'S.1.1', 'Lecture (1:35-50)', '[{\"evidence\":\"S.1.1\"}]', '230', 'item', NULL, NULL, NULL, '2024-02-17 07:14:51', '2024-02-17 07:14:51'),
(232, 'S.1.2', 'Laboratory (Specific to the discipline', '[{\"evidence\":\"S.1.2\"}]', '230', 'item', NULL, NULL, NULL, '2024-02-17 07:15:01', '2024-02-17 07:15:01'),
(233, 'S.2', 'There is a provision for incentives of overload teaching in accordance with the CMO of the\nprogram and/or institutional guidelines.', '[{\"evidence\":\"S.2\"}]', '227', 'item', NULL, NULL, NULL, '2024-02-17 07:15:54', '2024-02-17 07:15:54'),
(234, 'S.3', 'There are full time faculty classified by rank, subject/specialization.', '[{\"evidence\":\"S.3\"}]', '227', 'item', NULL, NULL, NULL, '2024-02-17 07:16:39', '2024-02-17 07:16:39'),
(235, 'S.4', 'Faculty schedule has time for preparation of lessons, scoring of test papers, record-keeping,\nclass evaluation and other instruction-related activities.', '[{\"evidence\":\"S.4\"}]', '227', 'item', NULL, NULL, NULL, '2024-02-17 07:17:33', '2024-02-17 07:17:33'),
(236, 'S.5', 'Workload guidelines contain sufficient time for teaching and/or research, extension,\nproduction and other assigned tasks.', '[{\"evidence\":\"S.5\"}]', '227', 'item', NULL, NULL, NULL, '2024-02-17 07:17:57', '2024-02-17 07:17:57'),
(237, 'S.6', 'There is equitable, measurable and fair distribution of teaching load and other assignment.', '[{\"evidence\":\"S.6\"}]', '227', 'item', NULL, NULL, NULL, '2024-02-17 07:18:16', '2024-02-17 07:18:16'),
(238, 'I.1', 'The maximum total load is assigned to regular full-time faculty in accordance to the CMO\nof the program and institutional guidelines.', '[{\"evidence\":\"I.1\"}]', '228', 'item', NULL, NULL, NULL, '2024-02-17 07:18:42', '2024-02-17 07:18:42'),
(239, 'I.2', 'A faculty manual is published formalizing faculty policies, standards and guidelines.', '[{\"evidence\":\"I.2\"}]', '228', 'item', NULL, NULL, NULL, '2024-02-17 07:19:00', '2024-02-17 07:19:00'),
(240, 'I.3', 'Professional subjects are handled by specialists in the discipline/program.', '[{\"evidence\":\"I.3\"}]', '228', 'item', NULL, NULL, NULL, '2024-02-17 07:19:21', '2024-02-17 07:19:21'),
(241, 'I.4', 'The faculty are assigned to teach their major/minor fields of specialization, for a maximum\nof four (4) different subject preparations within a semester.', '[{\"evidence\":\"I.4\"}]', '228', 'item', NULL, NULL, NULL, '2024-02-17 07:21:01', '2024-02-17 07:21:01'),
(242, 'I.5', 'Administrative arrangements are adopted when vacancies/leaves of absence occur deuring\nthe term.', '[{\"evidence\":\"I.5\"}]', '228', 'item', NULL, NULL, NULL, '2024-02-17 07:22:17', '2024-02-17 07:22:17'),
(243, 'I.6', 'No less than 60% of the professional subjects offered in the program are handled by the\nfull-time faculty.', '[{\"evidence\":\"I.6\"}]', '228', 'item', NULL, NULL, NULL, '2024-02-17 07:22:31', '2024-02-17 07:22:31'),
(244, 'I.7', 'Teaching schedule does not allow more than six (6) hours of continuous teaching.', '[{\"evidence\":\"I.7\"}]', '228', 'item', NULL, NULL, NULL, '2024-02-17 07:22:51', '2024-02-17 07:22:51'),
(245, 'I.8', 'Administrative, research and/or professional assignment outside of regular teaching are\ngiven credits.', '[{\"evidence\":\"I.8\"}]', '228', 'item', NULL, NULL, NULL, '2024-02-17 07:23:19', '2024-02-17 07:23:19'),
(246, 'I.9', 'Consultation, tutorial, remedial classes, expert service and other instruction related activities\nare given credits in consonance with faculty workload guidelines.', '[{\"evidence\":\"I.9\"}]', '228', 'item', NULL, NULL, NULL, '2024-02-17 07:23:55', '2024-02-17 07:23:55'),
(247, 'I.10', 'Workload assignments and number of preparations follow existing workload guidelines.', '[{\"evidence\":\"I.10\"}]', '228', 'item', NULL, NULL, NULL, '2024-02-17 07:24:17', '2024-02-17 07:24:17'),
(248, 'O.1', 'The faculty are effiecient and effective with sufficient time for instruction, research,\nextension, production and other assigned tasks.', '[{\"evidence\":\"O.1\"}]', '229', 'item', NULL, NULL, NULL, '2024-02-17 07:24:37', '2024-02-17 07:24:37'),
(249, 'PARAMETER D:', 'RANK AND TENURE', NULL, '176', 'param', NULL, NULL, NULL, '2024-02-17 07:25:09', '2024-02-17 07:45:55'),
(250, 'System - Inputs and Processes', NULL, NULL, '249', 'ind', '1', NULL, NULL, '2024-02-17 07:25:09', '2024-02-17 07:25:09'),
(251, 'Implementation', NULL, NULL, '249', 'ind', '2', NULL, NULL, '2024-02-17 07:25:09', '2024-02-17 07:25:09'),
(252, 'Outcome/s', NULL, NULL, '249', 'ind', '3', NULL, NULL, '2024-02-17 07:25:09', '2024-02-17 07:25:09'),
(253, 'S.1', 'The institution has a system of promotion in rank and tenure based on\nofficial issuances.', '[{\"evidence\":\"S.1\"}]', '250', 'item', NULL, NULL, NULL, '2024-02-17 07:25:52', '2024-02-17 07:25:52'),
(254, 'S.2', 'The institution has a policy on temporary status employment.', '[{\"evidence\":\"S.2\"}]', '250', 'item', NULL, NULL, NULL, '2024-02-17 07:26:14', '2024-02-17 07:26:14'),
(255, 'S.3', 'At least 50% of the full-time faculty teaching the professional courses are\nunder permanent/regular status.', '[{\"evidence\":\"S.3\"}]', '250', 'item', NULL, NULL, NULL, '2024-02-17 07:26:29', '2024-02-17 07:26:29'),
(256, 'I.1', 'The institution implements the system od promotion in rank and salary\nbased on existing policies and issuances (e.g. NBC 461)', '[{\"evidence\":\"I.1\"}]', '251', 'item', NULL, NULL, NULL, '2024-02-17 07:26:46', '2024-02-17 07:26:46'),
(257, 'I.2', 'Retirement, separation or termination benefits are implemented in\naccordance with institutional and government (CSC, GSIS/DBM) policies and\nguidelines.', '[{\"evidence\":\"I.2\"}]', '251', 'item', NULL, NULL, NULL, '2024-02-17 07:27:11', '2024-02-17 07:27:11'),
(258, 'I.3', 'The faculty are officially informed of their rank and tenure after evaluation\nof their credentials and performance.', '[{\"evidence\":\"I.3\"}]', '251', 'item', NULL, NULL, NULL, '2024-02-17 07:27:30', '2024-02-17 07:27:30'),
(259, 'I.4', 'The faculty concerned is officially informed of the extension, renewal or\ntermination of their appointments.', '[{\"evidence\":\"I.4\"}]', '251', 'item', NULL, NULL, NULL, '2024-02-17 07:27:43', '2024-02-17 07:27:43'),
(260, 'I.5', 'The institution implements a Merit System and Promotion Plan (MSPP)\nwhich emphasizes quality teaching performance, research, creative work,\nextension and production services.', '[{\"evidence\":\"I.5\"}]', '251', 'item', NULL, NULL, NULL, '2024-02-17 07:28:01', '2024-02-17 07:28:01'),
(261, 'I.6', 'The probationary period or temporary status required before a permanent\nstatus is granted to the faculty in accordance with Civil Service and institutional\npolicies and guidelines .', '[{\"evidence\":\"I.6\"}]', '251', 'item', NULL, NULL, NULL, '2024-02-17 07:28:13', '2024-02-17 07:28:13'),
(262, 'O.1', 'The faculty are satisfied with their rank and employment status.', '[{\"evidence\":\"O.1\"}]', '252', 'item', NULL, NULL, NULL, '2024-02-17 07:28:34', '2024-02-17 07:28:34'),
(263, 'PARAMETER E:', 'FACULTY DEVELOPMENT', NULL, '176', 'param', NULL, NULL, NULL, '2024-02-17 07:29:22', '2024-02-17 07:46:19'),
(264, 'System - Inputs and Processes', NULL, NULL, '263', 'ind', '1', NULL, NULL, '2024-02-17 07:29:22', '2024-02-17 07:29:22'),
(265, 'Implementation', NULL, NULL, '263', 'ind', '2', NULL, NULL, '2024-02-17 07:29:22', '2024-02-17 07:29:22'),
(266, 'Outcome/s', NULL, NULL, '263', 'ind', '3', NULL, NULL, '2024-02-17 07:29:22', '2024-02-17 07:29:22'),
(267, 'S.1', 'The institution has an approved and sustainable Faculty Development Program (FDP)', '[{\"evidence\":\"S.1\"}]', '264', 'item', NULL, NULL, NULL, '2024-02-17 07:30:35', '2024-02-17 07:30:35'),
(268, 'S.2', 'There are policies on faculty academic recognition and grant of scholarship/fellowships\nand awards.', '[{\"evidence\":\"S.2\"}]', '264', 'item', NULL, NULL, NULL, '2024-02-17 07:31:05', '2024-02-17 07:31:05'),
(269, 'S.3', 'Every faculty member has at least one active membership in professional/scientific\norganization or honor society relevant to his/her assignment and field of specialization.', '[{\"evidence\":\"S.3\"}]', '264', 'item', NULL, NULL, NULL, '2024-02-17 07:31:21', '2024-02-17 07:31:21'),
(270, 'S.4', 'The budget allocation for faculty development is adequate.', '[{\"evidence\":\"S.4\"}]', '264', 'item', NULL, NULL, NULL, '2024-02-17 07:31:56', '2024-02-17 07:31:56'),
(271, 'I.1', 'The institution implements a sustainable Faculty Development Program based on identified\npriorities/needs as follows:', '[{\"evidence\":\"I.1\"}]', '265', 'item', NULL, NULL, NULL, '2024-02-17 07:32:14', '2024-02-17 07:32:14'),
(272, 'I.1.1', 'upgraded educational qualifications (graduate studies);', '[{\"evidence\":\"I.1.1\"}]', '271', 'item', NULL, NULL, NULL, '2024-02-17 07:32:26', '2024-02-17 07:32:26'),
(273, 'I.1.2', 'upgraded educational qualifications (graduate studies);', '[{\"evidence\":\"I.1.2\"}]', '271', 'item', NULL, NULL, NULL, '2024-02-17 07:33:59', '2024-02-17 07:33:59'),
(274, 'I.1.3', 'conduct of research activities and publication of research output; and', '[{\"evidence\":\"I.1.3\"}]', '271', 'item', NULL, NULL, NULL, '2024-02-17 07:34:15', '2024-02-17 07:34:15'),
(275, 'I.1.4', 'giving lectures and presentation of papers in national/international conferences, symposia\nand seminars.', '[{\"evidence\":\"I.1.4\"}]', '271', 'item', NULL, NULL, NULL, '2024-02-17 07:34:27', '2024-02-17 07:34:27');
INSERT INTO `instruments_component` (`id`, `title`, `description`, `attachment`, `parent`, `category`, `indicator`, `action`, `exclude_rate`, `created_at`, `updated_at`) VALUES
(276, 'I.2', 'The institution supports the professional growth of the faculty through attendance in educational\nlectures, symposia, seminars, workshops, conferences, and other forms of training.', '[{\"evidence\":\"I.2\"}]', '265', 'item', NULL, NULL, NULL, '2024-02-17 07:34:43', '2024-02-17 07:34:43'),
(277, 'I.3', 'The institution conduct in-service training activities regularly at least once per team.', '[{\"evidence\":\"I.3\"}]', '265', 'item', NULL, NULL, NULL, '2024-02-17 07:34:57', '2024-02-17 07:34:57'),
(278, 'I.4', 'Selection of deserving faculty to be granted scholarships, fellowships, seminars, conferences\nand/or training grants is done objectively.', '[{\"evidence\":\"I.4\"}]', '265', 'item', NULL, NULL, NULL, '2024-02-17 07:35:08', '2024-02-17 07:35:08'),
(279, 'I.5', 'The budget for faculty development is adequately allocated.', '[{\"evidence\":\"I.5\"}]', '265', 'item', NULL, NULL, NULL, '2024-02-17 07:35:19', '2024-02-17 07:35:19'),
(280, 'I.6', 'The budget for faculty development is wisely-utilized.', '[{\"evidence\":\"I.6\"}]', '265', 'item', NULL, NULL, NULL, '2024-02-17 07:35:49', '2024-02-17 07:35:49'),
(281, 'I.7', 'The faculty Development Program is implemented with the following provisions:', '[{\"evidence\":\"I.7\"}]', '265', 'item', NULL, NULL, NULL, '2024-02-17 07:36:08', '2024-02-17 07:36:08'),
(282, 'I.7.1', 'adequate and qualified supervision of faculty;', '[{\"evidence\":\"I.7.1\"}]', '281', 'item', NULL, NULL, NULL, '2024-02-17 07:36:23', '2024-02-17 07:36:23'),
(283, 'I.7.2', 'scholarships, fellowships, sabbatical leaves, and research grants;', '[{\"evidence\":\"I.7.2\"}]', '281', 'item', NULL, NULL, NULL, '2024-02-17 07:36:36', '2024-02-17 07:36:36'),
(284, 'I.7.3', 'financial support for active membership in professional organizations;', '[{\"evidence\":\"I.7.3\"}]', '281', 'item', NULL, NULL, NULL, '2024-02-17 07:36:45', '2024-02-17 07:36:45'),
(285, 'I.7.4', 'deloading to finish the faculty’s thesis/dissertion;', '[{\"evidence\":\"I.7.4\"}]', '281', 'item', NULL, NULL, NULL, '2024-02-17 07:36:56', '2024-02-17 07:36:56'),
(286, 'I.7.5', 'attendance in continuing professional education (CPE) programs such as seminars,\nworkshops and conferences or some in-service training cources;', '[{\"evidence\":\"I.7.5\"}]', '281', 'item', NULL, NULL, NULL, '2024-02-17 07:37:08', '2024-02-17 07:37:08'),
(287, 'I.7.6', 'Conducting research activities related to the program;', '[{\"evidence\":\"I.7.6\"}]', '281', 'item', NULL, NULL, NULL, '2024-02-17 07:37:21', '2024-02-17 07:37:21'),
(288, 'I.7.7', 'Publishing scholarly articles and research outputs; and', '[{\"evidence\":\"I.7.7\"}]', '281', 'item', NULL, NULL, NULL, '2024-02-17 07:37:35', '2024-02-17 07:37:35'),
(289, 'I.7.8', 'production of instructional materials (IMs).', '[{\"evidence\":\"I.7.8\"}]', '281', 'item', NULL, NULL, NULL, '2024-02-17 07:37:47', '2024-02-17 07:37:47'),
(290, 'I.8', 'Opportunities for the faculty to attend/participate in capability building and enhancing\nactivities are fairly distributed.', '[{\"evidence\":\"I.8\"}]', '265', 'item', NULL, NULL, NULL, '2024-02-17 07:38:02', '2024-02-17 07:38:02'),
(291, 'I.9', 'Tuition fee privileged and other forms of assistance are utilized by faculty pursuing\nadvanced (master’s and/or doctoral) degrees.', '[{\"evidence\":\"I.9\"}]', '265', 'item', NULL, NULL, NULL, '2024-02-17 07:38:19', '2024-02-17 07:38:19'),
(292, 'I.10', 'Faculty are given incentives for book-writing, manuals, handbooks, compilations and instructional\nmaterials to keep up with new knowledge and techniques and techniques in the field of specialization.', '[{\"evidence\":\"I.10\"}]', '265', 'item', NULL, NULL, NULL, '2024-02-17 07:38:29', '2024-02-17 07:38:29'),
(293, 'O.1', 'The faculty are well-trained and competent to serve the institution.', '[{\"evidence\":\"O.1\"}]', '266', 'item', NULL, NULL, NULL, '2024-02-17 07:38:47', '2024-02-17 07:38:47'),
(294, 'O.2', 'The faculty are committed to serve and support the programs and projects of the institution.', '[{\"evidence\":\"O.2\"}]', '266', 'item', NULL, NULL, NULL, '2024-02-17 07:39:02', '2024-02-17 07:39:02'),
(295, 'PARAMETER F:', 'PROFESSIONAL PERFORMANCE AND SCHOLARLY WORKS.', NULL, '176', 'param', NULL, NULL, NULL, '2024-02-17 07:44:49', '2024-02-17 07:44:49'),
(296, 'System - Inputs and Processes', NULL, NULL, '295', 'ind', '1', NULL, NULL, '2024-02-17 07:44:50', '2024-02-17 07:44:50'),
(297, 'Implementation', NULL, NULL, '295', 'ind', '2', NULL, NULL, '2024-02-17 07:44:50', '2024-02-17 07:44:50'),
(298, 'Outcome/s', NULL, NULL, '295', 'ind', '3', NULL, NULL, '2024-02-17 07:44:50', '2024-02-17 07:44:50'),
(299, 'S.1', 'The institution has a system of evaluating the faculty on the following', '[{\"evidence\":\"S.1\"}]', '296', 'item', NULL, NULL, NULL, '2024-02-17 07:46:36', '2024-02-17 07:46:36'),
(300, 'S.1.1', 'Professional Performance; and', '[{\"evidence\":\"S.1.1\"}]', '299', 'item', NULL, NULL, NULL, '2024-02-17 07:47:13', '2024-02-17 07:47:13'),
(301, 'S.1.2', 'Scholarly Works', '[{\"evidence\":\"S.1.2\"}]', '299', 'item', NULL, NULL, NULL, '2024-02-17 07:47:43', '2024-02-17 07:47:43'),
(302, 'I.1', 'Demonstrate skills and competencies in all of the following:', '[{\"evidence\":\"I.1\"}]', '297', 'item', NULL, NULL, NULL, '2024-02-17 07:48:11', '2024-02-17 07:48:11'),
(303, 'I.1.2', 'Reflecting the program outcomes clearly in the course objectives.', '[{\"evidence\":\"I.1.2\"}]', '302', 'item', NULL, NULL, NULL, '2024-02-17 07:51:47', '2024-02-17 07:51:47'),
(304, 'I.1.3', 'Knowledge/mastery of the content, issues and methodological, creative, innovative and\nproblem solving;', '[{\"evidence\":\"I.1.3\"}]', '302', 'item', NULL, NULL, NULL, '2024-02-17 07:52:13', '2024-02-17 07:52:13'),
(305, 'I.1.4', 'Proficiency in the use of the language of instruction;', '[{\"evidence\":\"I.1.4\"}]', '302', 'item', NULL, NULL, NULL, '2024-02-17 07:52:48', '2024-02-17 07:52:48'),
(306, 'I.1.5', 'The use of higher order thinking skills such as analytical, critical, creative innovative and problem solving;', '[{\"evidence\":\"I.1.5\"}]', '302', 'item', NULL, NULL, NULL, '2024-02-17 07:53:19', '2024-02-17 07:53:19'),
(307, 'I.1.6', 'Innovativeness and resourcefulness in the different instructional processes;', '[{\"evidence\":\"I.1.6\"}]', '302', 'item', NULL, NULL, NULL, '2024-02-17 07:53:42', '2024-02-17 07:53:42'),
(308, 'I.1.7', 'Integrations of values and work ethics in the teaching learning process; and', '[{\"evidence\":\"I.1.7\"}]', '302', 'item', NULL, NULL, NULL, '2024-02-17 07:54:09', '2024-02-17 07:54:09'),
(309, 'I.1.8', 'Integration of Gender and development (GAD) activities.', '[{\"evidence\":\"I.1.8\"}]', '302', 'item', NULL, NULL, NULL, '2024-02-17 07:54:25', '2024-02-17 07:54:25'),
(310, 'I.2', 'Promptly submit required reports and other academic outputs.', '[{\"evidence\":\"I.2\"}]', '297', 'item', NULL, NULL, NULL, '2024-02-17 07:54:46', '2024-02-17 07:54:46'),
(311, 'I.3', 'Update lecture notes through an interface of relevant research findings and new\nknowledge.', '[{\"evidence\":\"I.3\"}]', '297', 'item', NULL, NULL, NULL, '2024-02-17 07:55:53', '2024-02-17 07:55:53'),
(312, 'I.4', 'Serve as a resource person/lecturer/consultant in the program/field of specialization.', '[{\"evidence\":\"I.4\"}]', '297', 'item', NULL, NULL, NULL, '2024-02-17 07:56:10', '2024-02-17 07:56:10'),
(313, 'I.5', 'Present paper in local, regional/national and/or international for a.', '[{\"evidence\":\"I.5\"}]', '297', 'item', NULL, NULL, NULL, '2024-02-17 07:56:20', '2024-02-17 07:56:20'),
(314, 'I.6', 'Publish papers in regional, national and international magazines and journals.', '[{\"evidence\":\"I.6\"}]', '297', 'item', NULL, NULL, NULL, '2024-02-17 07:56:43', '2024-02-17 07:56:43'),
(315, 'I.7', 'Conduct research and public output', '[{\"evidence\":\"I.7\"}]', '297', 'item', NULL, NULL, NULL, '2024-02-17 07:57:32', '2024-02-17 07:57:32'),
(316, 'I.9', 'Regularly update respective course syllabi.', '[{\"evidence\":\"I.9\"}]', '297', 'item', NULL, NULL, NULL, '2024-02-17 07:59:59', '2024-02-17 07:59:59'),
(317, 'I.10', 'Utilize ICT and other resources in the enhancement of the teaching-learning process; and', '[{\"evidence\":\"I.10\"}]', '297', 'item', NULL, NULL, NULL, '2024-02-17 08:00:19', '2024-02-17 08:00:19'),
(318, 'I.11', 'Produce instructional materials, e.g, workbook, manuals, modules, audio-visual aids, etc.\nto facilitate teaching and learning.', '[{\"evidence\":\"I.11\"}]', '297', 'item', NULL, NULL, NULL, '2024-02-17 08:00:41', '2024-02-17 08:00:41'),
(319, 'PARAMETER G:', 'SALARIES, FRINGE BENEFITS, AND INCENTIVES', NULL, '176', 'param', NULL, NULL, NULL, '2024-02-17 08:02:55', '2024-02-17 08:02:55'),
(320, 'System - Inputs and Processes', NULL, NULL, '319', 'ind', '1', NULL, NULL, '2024-02-17 08:02:55', '2024-02-17 08:02:55'),
(321, 'Implementation', NULL, NULL, '319', 'ind', '2', NULL, NULL, '2024-02-17 08:02:55', '2024-02-17 08:02:55'),
(322, 'Outcome/s', NULL, NULL, '319', 'ind', '3', NULL, NULL, '2024-02-17 08:02:55', '2024-02-17 08:02:55'),
(323, 'S.1', 'The institution has a system of compensation and rewards to its faculty and\nstaff.', '[{\"evidence\":\"S.1\"}]', '320', 'item', NULL, NULL, NULL, '2024-02-17 08:03:26', '2024-02-17 08:03:26'),
(324, 'I.1', 'The following fringe benefits are granted :', '[{\"evidence\":\"I.1\"}]', '321', 'item', NULL, NULL, NULL, '2024-02-17 08:03:42', '2024-02-17 08:03:42'),
(325, 'I.1.1', 'maternity leave/ paternity leave with pay;', '[{\"evidence\":\"I.1.1\"}]', '324', 'item', NULL, NULL, NULL, '2024-02-17 08:04:00', '2024-02-17 08:04:00'),
(326, 'I.1.2', 'sick leave;', '[{\"evidence\":\"I.1.2\"}]', '324', 'item', NULL, NULL, NULL, '2024-02-17 08:04:25', '2024-02-17 08:04:25'),
(327, 'I.1.3', 'study leave (with or without pay)', '[{\"evidence\":\"I.1.3\"}]', '324', 'item', NULL, NULL, NULL, '2024-02-17 08:04:53', '2024-02-17 08:04:53'),
(328, 'I.1.4', 'vacation leave', '[{\"evidence\":\"I.1.4\"}]', '324', 'item', NULL, NULL, NULL, '2024-02-17 08:05:12', '2024-02-17 08:05:12'),
(329, 'I.1.5', 'tuition fee discount for faculty and their dependents', '[{\"evidence\":\"I.1.5\"}]', '324', 'item', NULL, NULL, NULL, '2024-02-17 08:05:31', '2024-02-17 08:05:31'),
(330, 'I.1.6', 'clothing/uniform allowance;', '[{\"evidence\":\"I.1.6\"}]', '324', 'item', NULL, NULL, NULL, '2024-02-17 08:06:04', '2024-02-17 08:06:04'),
(331, 'I.1.7', 'performance based bonus (PBB);', '[{\"evidence\":\"I.1.7\"}]', '324', 'item', NULL, NULL, NULL, '2024-02-17 08:06:22', '2024-02-17 08:06:22'),
(332, 'I.1.8', 'anniversary bonus;', '[{\"evidence\":\"I.1.8\"}]', '324', 'item', NULL, NULL, NULL, '2024-02-17 08:08:13', '2024-02-17 08:08:13'),
(333, 'I.1.9', 'honoraria/ incentives for conducting research or production of scholarly\nworks;', '[{\"evidence\":\"I.1.9\"}]', '324', 'item', NULL, NULL, NULL, '2024-02-17 08:08:36', '2024-02-17 08:08:36'),
(334, 'I.1.10', 'housing privilege (optional);', '[{\"evidence\":\"I.1.10\"}]', '324', 'item', NULL, NULL, NULL, '2024-02-17 08:08:58', '2024-02-17 08:08:58'),
(335, 'I.1.11', 'sabbatical leave;', '[{\"evidence\":\"I.1.11\"}]', '324', 'item', NULL, NULL, NULL, '2024-02-17 08:09:35', '2024-02-17 08:09:35'),
(336, 'I.1.12', 'compensatory leave credit;', '[{\"evidence\":\"I.1.12\"}]', '324', 'item', NULL, NULL, NULL, '2024-02-17 08:09:54', '2024-02-17 08:09:54'),
(337, 'I.1.13', 'deloading to finish thesis/dissertation;', '[{\"evidence\":\"I.1.13\"}]', '324', 'item', NULL, NULL, NULL, '2024-02-17 08:10:14', '2024-02-17 08:10:14'),
(338, 'I.1.14', 'thesis/dissertation aid; and', '[{\"evidence\":\"I.1.14\"}]', '324', 'item', NULL, NULL, NULL, '2024-02-17 08:10:38', '2024-02-17 08:10:38'),
(339, 'I.1.15', 'other, (please identify)', '[{\"evidence\":\"I.1.15\"}]', '324', 'item', NULL, NULL, NULL, '2024-02-17 08:11:06', '2024-02-17 08:11:06'),
(340, 'I.2', 'Policies on salaries/benefits and other privileges are disseminated to the faculty.', '[{\"evidence\":\"I.2\"}]', '321', 'item', NULL, NULL, NULL, '2024-02-17 08:11:33', '2024-02-17 08:11:56'),
(341, 'I.3', 'Salaries are paid regularly and promptly', '[{\"evidence\":\"I.3\"}]', '321', 'item', NULL, NULL, NULL, '2024-02-17 08:12:09', '2024-02-17 08:12:09'),
(342, 'I.4', 'Teaching assignments beyond the regular load are compensated (e.g.\noverload pay, service credits, etc.).', '[{\"evidence\":\"I.4\"}]', '321', 'item', NULL, NULL, NULL, '2024-02-17 08:12:25', '2024-02-17 08:12:25'),
(343, 'I.5', 'Faculty who are actually involved in the production of scholarly materials.', '[{\"evidence\":\"I.5\"}]', '321', 'item', NULL, NULL, NULL, '2024-02-17 08:12:54', '2024-02-17 08:12:54'),
(344, 'I.6', 'Faculty with outstanding performance are given recognition/awards and\nincentives.', '[{\"evidence\":\"I.6\"}]', '321', 'item', NULL, NULL, NULL, '2024-02-17 08:13:26', '2024-02-17 08:13:26'),
(345, 'O.1', 'The Faculty are satisfied with their compensation and rewards.', '[{\"evidence\":\"O.1\"}]', '322', 'item', NULL, NULL, NULL, '2024-02-17 08:13:44', '2024-02-17 08:13:44'),
(346, 'PARAMETER H:', 'PROFESSIONALISM', NULL, '176', 'param', NULL, NULL, NULL, '2024-02-17 08:14:04', '2024-02-17 08:14:04'),
(347, 'System - Inputs and Processes', NULL, NULL, '346', 'ind', '1', NULL, NULL, '2024-02-17 08:14:04', '2024-02-17 08:14:04'),
(348, 'Implementation', NULL, NULL, '346', 'ind', '2', NULL, NULL, '2024-02-17 08:14:04', '2024-02-17 08:14:04'),
(349, 'Outcome/s', NULL, NULL, '346', 'ind', '3', NULL, NULL, '2024-02-17 08:14:04', '2024-02-17 08:14:04'),
(350, 'S.1', 'There are approved SUC Code and SUC Faculty Manual that defines the policies,\nguidelines, rules and regulations affecting the faculty.', '[{\"evidence\":\"S.1\"}]', '347', 'item', NULL, NULL, NULL, '2024-02-17 08:14:17', '2024-02-17 08:14:17'),
(351, 'I.1', 'Responsibly observe the following', '[{\"evidence\":\"I.1\"}]', '348', 'item', NULL, NULL, NULL, '2024-02-17 08:14:59', '2024-02-17 08:14:59'),
(352, 'I.1.1', 'Regular and prompt attendance in classes;', '[{\"evidence\":\"I.1.1\"}]', '351', 'item', NULL, NULL, NULL, '2024-02-17 08:15:11', '2024-02-17 08:15:11'),
(353, 'I.1.2', 'Participation in faculty meetings and university/college activities;', '[{\"evidence\":\"I.1.2\"}]', '351', 'item', NULL, NULL, NULL, '2024-02-17 08:15:36', '2024-02-17 08:15:36'),
(354, 'I.1.5', 'Decorum at all times', '[{\"evidence\":\"I.1.5\"}]', '351', 'item', NULL, NULL, NULL, '2024-02-17 08:17:03', '2024-02-17 08:17:03'),
(355, 'I.2', 'Follow the code of ethics of the profession and the code of ethical standards for\ngovernment officials and employees (RA 6713)', '[{\"evidence\":\"I.2\"}]', '348', 'item', NULL, NULL, NULL, '2024-02-17 08:17:18', '2024-02-17 08:17:18'),
(356, 'I.3', 'Exercise academic freedom judiciously.', '[{\"evidence\":\"I.3\"}]', '348', 'item', NULL, NULL, NULL, '2024-02-17 08:17:32', '2024-02-17 08:17:32'),
(357, 'I.4', 'Show commitment and loyalty to the institution as evidenced by:', '[{\"evidence\":\"I.4\"}]', '348', 'item', NULL, NULL, NULL, '2024-02-17 08:17:49', '2024-02-17 08:17:49'),
(358, 'I.4.1', 'Observance of official time;', '[{\"evidence\":\"I.4.1\"}]', '357', 'item', NULL, NULL, NULL, '2024-02-17 08:18:13', '2024-02-17 08:18:13'),
(359, 'I.4.2', 'Productive use of official time;', '[{\"evidence\":\"I.4.2\"}]', '357', 'item', NULL, NULL, NULL, '2024-02-17 08:19:58', '2024-02-17 08:19:58'),
(360, 'I.4.3', 'Performance of other tasks and assignments, with or without compensation; and', '[{\"evidence\":\"I.4.3\"}]', '357', 'item', NULL, NULL, NULL, '2024-02-17 08:20:17', '2024-02-17 08:20:17'),
(361, 'I.4.4', 'Compliance with terms of agreement/contracts (e.g. scholarship and training).', '[{\"evidence\":\"I.4.4\"}]', '357', 'item', NULL, NULL, NULL, '2024-02-17 08:20:44', '2024-02-17 08:20:44'),
(362, 'I.5', 'Maintain harmonious interpersonal relations with superiors, peers, students, parents and the\ncommunity.', '[{\"evidence\":\"I.5\"}]', '348', 'item', NULL, NULL, NULL, '2024-02-17 08:20:55', '2024-02-17 08:20:55'),
(363, 'I.6', 'Demonstrate knowledge of recent educational trends/ issues/ resources in the program\nunder survey.', '[{\"evidence\":\"I.6\"}]', '348', 'item', NULL, NULL, NULL, '2024-02-17 08:21:19', '2024-02-17 08:21:19'),
(364, 'I.7', 'Show evidence of professional growth through further and continuing studies.', '[{\"evidence\":\"I.7\"}]', '348', 'item', NULL, NULL, NULL, '2024-02-17 08:21:39', '2024-02-17 08:21:39'),
(365, 'I.8', 'Engage in practices which enable the faculty to demonstrate harmonious interpersonal\nrelations with students, faculty and the community.', '[{\"evidence\":\"I.8\"}]', '348', 'item', NULL, NULL, NULL, '2024-02-17 08:21:52', '2024-02-17 08:21:52'),
(366, 'O.1', 'The corps of faculty manifests a commendable level of professionalism.', '[{\"evidence\":\"O.1\"}]', '349', 'item', NULL, NULL, NULL, '2024-02-17 08:22:49', '2024-02-17 08:22:49'),
(367, 'AREA III:', 'CURRICULUM INSTRUCTION', NULL, '2', 'area', NULL, NULL, NULL, '2024-02-17 08:25:32', '2024-02-17 08:25:32'),
(368, 'PARAMETER A:', 'CURRICULUM AND PROGRAM OF STUDIES', NULL, '367', 'param', NULL, NULL, NULL, '2024-02-17 08:26:03', '2024-02-17 08:26:03'),
(369, 'System - Inputs and Processes', NULL, NULL, '368', 'ind', '1', NULL, NULL, '2024-02-17 08:26:03', '2024-02-17 08:26:03'),
(370, 'Implementation', NULL, NULL, '368', 'ind', '2', NULL, NULL, '2024-02-17 08:26:03', '2024-02-17 08:26:03'),
(371, 'Outcome/s', NULL, NULL, '368', 'ind', '3', NULL, NULL, '2024-02-17 08:26:03', '2024-02-17 08:26:03'),
(372, 'S.1', 'The curriculum provides for the development of the following professional competencies', '[{\"evidence\":\"S.1\"}]', '369', 'item', NULL, NULL, NULL, '2024-02-17 08:26:16', '2024-02-17 08:26:16'),
(373, 'S.1.1', 'Acquisition of knowledge and theories based on the field of specialization/discipline.', '[{\"evidence\":\"S.1.1\"}]', '372', 'item', NULL, NULL, NULL, '2024-02-17 08:26:29', '2024-02-17 08:26:29'),
(374, 'S.1.2', 'Application of the theories to real problems in the field;', '[{\"evidence\":\"S.1.2\"}]', '372', 'item', NULL, NULL, NULL, '2024-02-17 08:26:52', '2024-02-17 08:26:52'),
(375, 'S.1.3', 'Demonstration of skills in applying different strategies in the actual work setting.', '[{\"evidence\":\"S.1.3\"}]', '372', 'item', NULL, NULL, NULL, '2024-02-17 08:27:11', '2024-02-17 08:27:11'),
(376, 'S.2', 'There is a system of validation of subjects taken from other schools.', '[{\"evidence\":\"S.2\"}]', '369', 'item', NULL, NULL, NULL, '2024-02-17 08:27:26', '2024-02-17 08:27:26'),
(377, 'S.3', 'The curriculum reflects the local, regional and national development goals as well as the\ninstitution’s vision and mission.', '[{\"evidence\":\"S.3\"}]', '369', 'item', NULL, NULL, NULL, '2024-02-17 08:27:37', '2024-02-17 08:27:37'),
(378, 'I.1', 'The curriculum/program of study meets the requirements and standards of CHED.', '[{\"evidence\":\"I.1\"}]', '370', 'item', NULL, NULL, NULL, '2024-02-17 08:27:50', '2024-02-17 08:27:50'),
(379, 'I.1.1', 'General Education', '[{\"evidence\":\"I.1.1\"}]', '378', 'item', NULL, NULL, NULL, '2024-02-17 08:28:14', '2024-02-17 08:28:14'),
(380, 'I.1.2', 'Common Course', '[{\"evidence\":\"I.1.2\"}]', '378', 'item', NULL, NULL, NULL, '2024-02-17 08:28:26', '2024-02-17 08:28:26'),
(381, 'I.1.3', 'Professional CS Courses', '[{\"evidence\":\"I.1.3\"}]', '378', 'item', NULL, NULL, NULL, '2024-02-17 08:28:48', '2024-02-17 08:28:48'),
(382, 'I.1.4', 'Professional Elective Courses', '[{\"evidence\":\"I.1.4\"}]', '378', 'item', NULL, NULL, NULL, '2024-02-17 08:29:02', '2024-02-17 08:29:02'),
(383, 'I.2', 'The subjects are logically sequenced and prerequisite courses are identified.', '[{\"evidence\":\"I.2\"}]', '370', 'item', NULL, NULL, NULL, '2024-02-17 08:29:18', '2024-02-17 08:29:18'),
(384, 'I.3', 'The curricular content is responsive to the needs of the country and recent development in\nthe profession.', '[{\"evidence\":\"I.3\"}]', '370', 'item', NULL, NULL, NULL, '2024-02-17 08:29:44', '2024-02-17 08:29:44'),
(385, 'I.4', 'The curricular content covers the extent of the professional and technical preparation\nrequired of its graduates.', '[{\"evidence\":\"I.4\"}]', '370', 'item', NULL, NULL, NULL, '2024-02-17 08:29:59', '2024-02-17 08:29:59'),
(386, 'I.5', 'The curriculum integrates values, reflective of national customs, culture and tradition in\ncases where applicable.', '[{\"evidence\":\"I.5\"}]', '370', 'item', NULL, NULL, NULL, '2024-02-17 08:30:13', '2024-02-17 08:30:13'),
(387, 'I.6', 'Opportunities for participation in hands-on activities, such as immersion/practical\ntraining and field study are maintained in the curriculum.', '[{\"evidence\":\"I.6\"}]', '370', 'item', NULL, NULL, NULL, '2024-02-17 08:30:25', '2024-02-17 08:30:25'),
(388, 'I.7', 'The following activities are undertaken to ensure quality in the process of curriculum\ndevelopment as follows:', '[{\"evidence\":\"I.7\"}]', '370', 'item', NULL, NULL, NULL, '2024-02-17 08:30:37', '2024-02-17 08:30:37'),
(389, 'I.7.1', 'Participative planning and designing of the curriculum by the following stakeholders;', '[{\"evidence\":\"I.7.1\"}]', '388', 'item', NULL, NULL, NULL, '2024-02-17 08:30:48', '2024-02-17 08:30:48'),
(390, 'I.7.1.1', 'administration;', '[{\"evidence\":\"I.7.1.1\"}]', '389', 'item', NULL, NULL, NULL, '2024-02-17 08:31:07', '2024-02-17 08:31:07'),
(391, 'I.7.1.2', 'faculty;', '[{\"evidence\":\"I.7.1.2\"}]', '389', 'item', NULL, NULL, NULL, '2024-02-17 08:31:18', '2024-02-17 08:31:18'),
(392, 'I.7.1.3', 'student;', '[{\"evidence\":\"I.7.1.3\"}]', '389', 'item', NULL, NULL, NULL, '2024-02-17 08:31:27', '2024-02-17 08:31:27'),
(393, 'I.7.1.4', 'alumni;', '[{\"evidence\":\"I.7.1.4\"}]', '389', 'item', NULL, NULL, NULL, '2024-02-17 08:31:38', '2024-02-17 08:31:38'),
(394, 'I.7.1.5', 'representative from the industry/sector; and', '[{\"evidence\":\"I.7.1.5\"}]', '389', 'item', NULL, NULL, NULL, '2024-02-17 08:31:56', '2024-02-17 08:31:56'),
(395, 'I.7.1.6', 'others (please specify)', '[{\"evidence\":\"I.7.1.6\"}]', '389', 'item', NULL, NULL, NULL, '2024-02-17 08:32:11', '2024-02-17 08:32:11'),
(396, 'I.7.2', 'Periodic review, assessment, updating and approval of the curriculum by the Academic\nCouncil;', '[{\"evidence\":\"I.7.2\"}]', '388', 'item', NULL, NULL, NULL, '2024-02-17 08:32:29', '2024-02-17 08:32:29'),
(397, 'I.7.3', 'confirmation of the curriculum by the Board of Regents/Trustees (BOR/BOT)', '[{\"evidence\":\"I.7.3\"}]', '388', 'item', NULL, NULL, NULL, '2024-02-17 08:32:39', '2024-02-17 08:32:39'),
(398, 'I.8', 'The program of study allows the accommodation of the students with special needs and\nassists the to finish the degree.', '[{\"evidence\":\"I.8\"}]', '370', 'item', NULL, NULL, NULL, '2024-02-17 08:33:07', '2024-02-17 08:33:07'),
(399, 'O.1', 'The curriculum is responsive and relevant to the demands of the times.', '[{\"evidence\":\"O.1\"}]', '371', 'item', NULL, NULL, NULL, '2024-02-17 08:33:26', '2024-02-17 08:33:26'),
(400, 'PARAMETER B:', 'INSTRUCTIONAL PROCESS. METHODOLOGIES AND LEARNING OPPORTUNITIES.', NULL, '367', 'param', NULL, NULL, NULL, '2024-02-17 08:35:52', '2024-02-17 08:35:52'),
(401, 'System - Inputs and Processes', NULL, NULL, '400', 'ind', '1', NULL, NULL, '2024-02-17 08:35:52', '2024-02-17 08:35:52'),
(402, 'Implementation', NULL, NULL, '400', 'ind', '2', NULL, NULL, '2024-02-17 08:35:52', '2024-02-17 08:35:52'),
(403, 'Outcome/s', NULL, NULL, '400', 'ind', '3', NULL, NULL, '2024-02-17 08:35:52', '2024-02-17 08:35:52'),
(404, 'S.1', 'There is institutional outcome-based standard format in the preparation of course syllabi', '[{\"evidence\":\"S.1\"}]', '401', 'item', NULL, NULL, NULL, '2024-02-17 08:36:07', '2024-02-17 08:36:07'),
(405, 'S.2', 'The Syllabi includes the list of suggested readings and references of print and electronic\nresources within the last ten (10) years.', '[{\"evidence\":\"S.2\"}]', '401', 'item', NULL, NULL, NULL, '2024-02-17 08:36:20', '2024-02-17 08:36:20'),
(406, 'S.3', 'Copies of all course syllabi during the term are available at the Dean’s office or in any other\nappropriate repository.', '[{\"evidence\":\"S.3\"}]', '401', 'item', NULL, NULL, NULL, '2024-02-17 08:36:35', '2024-02-17 08:36:35'),
(407, 'S.4', 'Copies of all course syllabi in previous terms are filed for reference purposes.', '[{\"evidence\":\"S.4\"}]', '401', 'item', NULL, NULL, NULL, '2024-02-17 08:36:47', '2024-02-17 08:36:47'),
(408, 'S.5', 'There is provision for remedial measures to strengthen the basic skills in Mathematics,\nEnglish, and other “tool” subjects.', '[{\"evidence\":\"S.5\"}]', '401', 'item', NULL, NULL, NULL, '2024-02-17 08:36:58', '2024-02-17 08:36:58'),
(409, 'S.6', 'There is mechanism to facilitate the teaching-learning process.', '[{\"evidence\":\"S.6\"}]', '401', 'item', NULL, NULL, NULL, '2024-02-17 08:37:24', '2024-02-17 08:37:24'),
(410, 'I.1', 'The Dean or official concerned approves the updated syllabus for each subject.', '[{\"evidence\":\"I.1\"}]', '402', 'item', NULL, NULL, NULL, '2024-02-17 08:37:43', '2024-02-17 08:37:43'),
(411, 'I.2', 'The faculty prepares syllabi with comprehensive contents.', '[{\"evidence\":\"I.2\"}]', '402', 'item', NULL, NULL, NULL, '2024-02-17 08:38:00', '2024-02-17 08:38:00'),
(412, 'I.3', 'The faculty revise and enhance the syllabi preferably every two (2) years and as needed.', '[]', '402', 'item', NULL, NULL, NULL, '2024-02-17 08:38:14', '2024-02-17 08:38:14'),
(413, 'I.4', 'The faculty distributes a copy of the syllabi to each student.', '[{\"evidence\":\"I.4\"}]', '402', 'item', NULL, NULL, NULL, '2024-02-17 08:38:25', '2024-02-17 08:38:25'),
(414, 'I.5', 'Teaching strategies stimulate the development of the student’s higher order thinking\n(HOTS) such as critical thinking, analytical thinking and problem solving.', '[{\"evidence\":\"I.5\"}]', '402', 'item', NULL, NULL, NULL, '2024-02-17 08:38:35', '2024-02-17 08:38:35'),
(415, 'I.6', 'Classroom instruction is enriched through the use of the following strategies:', '[{\"evidence\":\"I.6\"}]', '402', 'item', NULL, NULL, NULL, '2024-02-17 08:38:49', '2024-02-17 08:38:49'),
(416, 'I.6.1', 'symposia, seminars, workshops, professional lectures;', '[{\"evidence\":\"I.6.1\"}]', '415', 'item', NULL, NULL, NULL, '2024-02-17 08:39:02', '2024-02-17 08:39:02'),
(417, 'I.6.2', 'educational tours/learning visits/other curricular activities;', '[{\"evidence\":\"I.6.2\"}]', '415', 'item', NULL, NULL, NULL, '2024-02-17 08:39:20', '2024-02-17 08:39:20'),
(418, 'I.6.3', 'peer-teaching/cooperative learning;', '[{\"evidence\":\"I.6.3\"}]', '415', 'item', NULL, NULL, NULL, '2024-02-17 08:39:34', '2024-02-17 08:39:34'),
(419, 'I.6.4', 'computer-assisted instruction (CAI) and computer-assisted learning(CAL);', '[{\"evidence\":\"I.6.4\"}]', '415', 'item', NULL, NULL, NULL, '2024-02-17 08:39:53', '2024-02-17 08:39:53'),
(420, 'I.7', 'Atleast three (3) of the following course requirements are used:', '[{\"evidence\":\"I.7\"}]', '402', 'item', NULL, NULL, NULL, '2024-02-17 08:40:08', '2024-02-17 08:40:08'),
(421, 'I.7.1', 'group/individual projects;', '[{\"evidence\":\"I.7.1\"}]', '420', 'item', NULL, NULL, NULL, '2024-02-17 08:40:20', '2024-02-17 08:40:20'),
(422, 'I.7.2', 'group/individual reports;', '[{\"evidence\":\"I.7.2\"}]', '420', 'item', NULL, NULL, NULL, '2024-02-17 08:40:30', '2024-02-17 08:40:30'),
(423, 'I.7.3', 'performance activities;', '[{\"evidence\":\"I.7.3\"}]', '420', 'item', NULL, NULL, NULL, '2024-02-17 08:40:41', '2024-02-17 08:40:41'),
(424, 'I.8', 'Instruction is enriched through the use to atleast ten (10) of the following\ntechniques/strategies:', '[{\"evidence\":\"I.8\"}]', '402', 'item', NULL, NULL, NULL, '2024-02-17 08:40:54', '2024-02-17 08:40:54'),
(425, 'I.9', 'Instructional strategies provide for student individual needs and the development of\nmultiple intelligences.', '[{\"evidence\":\"I.9\"}]', '402', 'item', NULL, NULL, NULL, '2024-02-17 08:41:56', '2024-02-17 08:41:56'),
(426, 'I.10', 'Instruction is enhanced through the following;', '[{\"evidence\":\"I.10\"}]', '402', 'item', NULL, NULL, NULL, '2024-02-17 08:42:11', '2024-02-17 08:42:11'),
(427, 'I.10.1', 'submission of approved and updated syllabus for every subject/course;', '[{\"evidence\":\"I.10.1\"}]', '426', 'item', NULL, NULL, NULL, '2024-02-17 08:42:34', '2024-02-17 08:42:34'),
(428, 'I.10.2', 'regular classroom observation/supervision;', '[{\"evidence\":\"I.10.2\"}]', '426', 'item', NULL, NULL, NULL, '2024-02-17 08:42:46', '2024-02-17 08:42:46'),
(429, 'I.10.3', 'regular faculty meetings with the College/Academic Dean/Development\nChair;', '[{\"evidence\":\"I.10.3\"}]', '426', 'item', NULL, NULL, NULL, '2024-02-17 08:43:11', '2024-02-17 08:43:11'),
(430, 'I.10.4', 'regular faculty performance evaluation;', '[{\"evidence\":\"I.10.4\"}]', '426', 'item', NULL, NULL, NULL, '2024-02-17 08:43:24', '2024-02-17 08:43:24'),
(431, 'I.10.5', 'attendance/participation of faculty in in-service training;', '[{\"evidence\":\"I.10.5\"}]', '426', 'item', NULL, NULL, NULL, '2024-02-17 08:43:36', '2024-02-17 08:43:36'),
(432, 'I.10.7', 'adaptation of alternative instructional delivery modes;', '[{\"evidence\":\"I.10.7\"}]', '426', 'item', NULL, NULL, NULL, '2024-02-17 08:44:29', '2024-02-17 08:44:29'),
(433, 'I.11', 'Instructional Materials (IMs) are reviewed and recommended by an Instructional Materials\nCommittee (IMC).', '[{\"evidence\":\"I.11\"}]', '402', 'item', NULL, NULL, NULL, '2024-02-17 08:44:50', '2024-02-17 08:44:50'),
(434, 'I.12', 'Varied, multi-sensory materials and computer programs are utilized;', '[{\"evidence\":\"I.12\"}]', '402', 'item', NULL, NULL, NULL, '2024-02-17 08:45:04', '2024-02-17 08:45:04'),
(435, 'I.13', 'The College/Academic Unit maintains consortia and linkages with other learning\ninstitutions for academic exchange of instructional materials.', '[{\"evidence\":\"I.13\"}]', '402', 'item', NULL, NULL, NULL, '2024-02-17 08:45:14', '2024-02-17 08:45:14'),
(436, 'I.14', 'The faculty are encouraged to produce their own instructional materials such as modules,\nsoftware, visual aids, manuals and textbooks.', '[{\"evidence\":\"I.14\"}]', '402', 'item', NULL, NULL, NULL, '2024-02-17 08:45:23', '2024-02-17 08:45:23'),
(437, 'O.1', 'The faculty are encouraged to produce their own instructional materials such as modules,\nsoftware, visual aids, manuals and textbooks.', '[{\"evidence\":\"O.1\"}]', '403', 'item', NULL, NULL, NULL, '2024-02-17 08:45:41', '2024-02-17 08:45:41'),
(438, 'O.2', 'Varied teaching strategies are efficiently and effectively used.', '[{\"evidence\":\"O.2\"}]', '403', 'item', NULL, NULL, NULL, '2024-02-17 08:45:59', '2024-02-17 08:45:59'),
(439, 'O.3', 'Instructional materials produced by the faculty are copyrighted/patented.', '[{\"evidence\":\"O.3\"}]', '403', 'item', NULL, NULL, NULL, '2024-02-17 08:46:11', '2024-02-17 08:46:11'),
(440, 'PARAMETER C:', 'ASSESSMENT OF ACADEMIC PERFORMANCE', NULL, '367', 'param', NULL, NULL, NULL, '2024-02-17 08:46:35', '2024-02-17 08:46:35'),
(441, 'System - Inputs and Processes', NULL, NULL, '440', 'ind', '1', NULL, NULL, '2024-02-17 08:46:35', '2024-02-17 08:46:35'),
(442, 'Implementation', NULL, NULL, '440', 'ind', '2', NULL, NULL, '2024-02-17 08:46:35', '2024-02-17 08:46:35'),
(443, 'Outcome/s', NULL, NULL, '440', 'ind', '3', NULL, NULL, '2024-02-17 08:46:35', '2024-02-17 08:46:35'),
(444, 'S.1', 'The program of studies has a system of evaluating students performance through a\ncombination of the following:', '[{\"evidence\":\"S.1\"}]', '441', 'item', NULL, NULL, NULL, '2024-02-17 08:46:55', '2024-02-17 08:46:55'),
(445, 'S.1.1', 'formative tests such as quizzes, unit tests;', '[{\"evidence\":\"S.1.1\"}]', '444', 'item', NULL, NULL, NULL, '2024-02-17 08:47:06', '2024-02-17 08:47:06'),
(446, 'S.1.2', 'Summative tests such as midterm and final examinations.', '[{\"evidence\":\"S.1.2\"}]', '444', 'item', NULL, NULL, NULL, '2024-02-17 08:47:19', '2024-02-17 08:47:19'),
(447, 'S.1.3', 'project and term papers;', '[{\"evidence\":\"S.1.3\"}]', '444', 'item', NULL, NULL, NULL, '2024-02-17 08:47:36', '2024-02-17 08:47:36'),
(448, 'S.1.4', 'Practicum and performance tests; and', '[{\"evidence\":\"S.1.4\"}]', '444', 'item', NULL, NULL, NULL, '2024-02-17 08:47:51', '2024-02-17 08:47:51'),
(449, 'S.1.5', 'other course requirements;', '[{\"evidence\":\"S.1.5\"}]', '444', 'item', NULL, NULL, NULL, '2024-02-17 08:48:04', '2024-02-17 08:48:04'),
(450, 'S.2', 'The summative tests have the following descriptions:', '[{\"evidence\":\"S.2\"}]', '441', 'item', NULL, NULL, NULL, '2024-02-17 08:48:22', '2024-02-17 08:48:22'),
(451, 'S.2.1', 'comprehensive enough to test the levels of cognitive skills and knowledge of content; and', '[{\"evidence\":\"S.2.1\"}]', '450', 'item', NULL, NULL, NULL, '2024-02-17 08:48:39', '2024-02-17 08:48:39'),
(452, 'S.2.2', 'based on well defined Table of Specifications (TOS).', '[{\"evidence\":\"S.2.2\"}]', '450', 'item', NULL, NULL, NULL, '2024-02-17 08:48:57', '2024-02-17 08:48:57'),
(453, 'I.1', 'Varied Evaluation measure are used, such as;', '[{\"evidence\":\"I.1\"}]', '442', 'item', NULL, NULL, NULL, '2024-02-17 08:49:14', '2024-02-17 08:49:14'),
(454, 'I.1.1', 'portfolio;', '[{\"evidence\":\"I.1.1\"}]', '453', 'item', NULL, NULL, NULL, '2024-02-17 08:49:24', '2024-02-17 08:49:24'),
(455, 'I.1.2', 'rubric assessment;', '[{\"evidence\":\"I.1.2\"}]', '453', 'item', NULL, NULL, NULL, '2024-02-17 08:49:48', '2024-02-17 08:49:48'),
(456, 'I.1.3', 'skills demonstration;', '[{\"evidence\":\"I.1.3\"}]', '453', 'item', NULL, NULL, NULL, '2024-02-17 08:49:58', '2024-02-17 08:49:58'),
(457, 'I.1.4', 'paper and pencil tests;', '[{\"evidence\":\"I.1.4\"}]', '453', 'item', NULL, NULL, NULL, '2024-02-17 08:50:08', '2024-02-17 08:50:08'),
(458, 'I.1.5', 'oral examinations;', '[{\"evidence\":\"I.1.5\"}]', '453', 'item', NULL, NULL, NULL, '2024-02-17 08:50:17', '2024-02-17 08:50:17'),
(459, 'I.1.6', 'group/ individual reports;', '[{\"evidence\":\"I.1.6\"}]', '453', 'item', NULL, NULL, NULL, '2024-02-17 08:50:25', '2024-02-17 08:50:25'),
(460, 'I.1.7', 'group / individual projects;', '[{\"evidence\":\"I.1.7\"}]', '453', 'item', NULL, NULL, NULL, '2024-02-17 08:50:34', '2024-02-17 08:50:34'),
(461, 'I.2', 'Evaluation tools/instruments are reviewed and revised periodically.', '[{\"evidence\":\"I.2\"}]', '442', 'item', NULL, NULL, NULL, '2024-02-17 08:50:47', '2024-02-17 08:50:47'),
(462, 'I.3', 'The faculty are trained how to assess student performance properly.', '[{\"evidence\":\"I.3\"}]', '442', 'item', NULL, NULL, NULL, '2024-02-17 08:50:56', '2024-02-17 08:50:56'),
(463, 'I.4', 'The College/Academic Unit encourages and supports assessment for multiple intelligence.', '[{\"evidence\":\"I.4\"}]', '442', 'item', NULL, NULL, NULL, '2024-02-17 08:51:07', '2024-02-17 08:51:07'),
(464, 'I.5', 'Course and test requirements are returned to students after results are checked, recorded\nand analyzed', '[{\"evidence\":\"I.5\"}]', '442', 'item', NULL, NULL, NULL, '2024-02-17 08:51:20', '2024-02-17 08:51:20'),
(465, 'I.6', 'The System of student evaluation and grading is defined, understood and disseminated to:', '[{\"evidence\":\"I.6\"}]', '442', 'item', NULL, NULL, NULL, '2024-02-17 08:51:31', '2024-02-17 08:51:31'),
(466, 'I.6.1', 'students;', '[{\"evidence\":\"I.6.1\"}]', '465', 'item', NULL, NULL, NULL, '2024-02-17 08:51:41', '2024-02-17 08:51:41'),
(467, 'I.6.2', 'faculty;', '[{\"evidence\":\"I.6.2\"}]', '465', 'item', NULL, NULL, NULL, '2024-02-17 08:52:00', '2024-02-17 08:52:00'),
(468, 'I.6.3', 'academic administrators; and', '[{\"evidence\":\"I.6.3\"}]', '465', 'item', NULL, NULL, NULL, '2024-02-17 08:52:15', '2024-02-17 08:52:15'),
(469, 'I.6.4', 'parents/guardians;', '[{\"evidence\":\"I.6.4\"}]', '465', 'item', NULL, NULL, NULL, '2024-02-17 08:52:30', '2024-02-17 08:52:30'),
(470, 'O.1', 'The student’s academic performance is commendable', '[{\"evidence\":\"O.1\"}]', '443', 'item', NULL, NULL, NULL, '2024-02-17 08:52:50', '2024-02-17 08:52:50'),
(471, 'O.2', 'The retention rate of students is on the average', '[{\"evidence\":\"O.2\"}]', '443', 'item', NULL, NULL, NULL, '2024-02-17 08:53:03', '2024-02-17 08:53:03'),
(472, 'PARAMETER D:', 'MANAGEMENT OF LEARNING', NULL, '367', 'param', NULL, NULL, NULL, '2024-02-17 08:53:31', '2024-02-17 08:53:31'),
(473, 'System - Inputs and Processes', NULL, NULL, '472', 'ind', '1', NULL, NULL, '2024-02-17 08:53:31', '2024-02-17 08:53:31'),
(474, 'Implementation', NULL, NULL, '472', 'ind', '2', NULL, NULL, '2024-02-17 08:53:31', '2024-02-17 08:53:31'),
(475, 'Outcome/s', NULL, NULL, '472', 'ind', '3', NULL, NULL, '2024-02-17 08:53:31', '2024-02-17 08:53:31'),
(476, 'S.1', 'There are policies on management of learning which includes the following:', '[{\"evidence\":\"S.1\"}]', '473', 'item', NULL, NULL, NULL, '2024-02-17 08:54:00', '2024-02-17 08:54:00'),
(477, 'S.1.1', 'students’ attendance in class and other academic activities;', '[{\"evidence\":\"S.1.1\"}]', '476', 'item', NULL, NULL, NULL, '2024-02-17 08:54:18', '2024-02-17 08:54:18'),
(478, 'S.1.2', 'Schedule of classes.', '[{\"evidence\":\"S.1.2\"}]', '476', 'item', NULL, NULL, NULL, '2024-02-17 08:54:48', '2024-02-17 08:54:48'),
(479, 'S.1.3', 'Student\'s discipline', '[{\"evidence\":\"S.1.3\"}]', '476', 'item', NULL, NULL, NULL, '2024-02-17 08:55:12', '2024-02-17 08:55:12'),
(480, 'S.1.4', 'Maintenance of cleanliness and orderliness', '[{\"evidence\":\"S.1.4\"}]', '476', 'item', NULL, NULL, NULL, '2024-02-17 08:55:25', '2024-02-17 08:55:25'),
(481, 'I.1', 'The policies on management of learning are enforced', '[{\"evidence\":\"I.1\"}]', '474', 'item', NULL, NULL, NULL, '2024-02-17 08:55:41', '2024-02-17 08:55:41'),
(482, 'I.2', 'Student activities are well planned and implemented.', '[{\"evidence\":\"I.2\"}]', '474', 'item', NULL, NULL, NULL, '2024-02-17 08:55:52', '2024-02-17 08:55:52'),
(483, 'I.3', 'Assignments are designed to reinforce teaching which result in students’ maximum learning', '[{\"evidence\":\"I.3\"}]', '474', 'item', NULL, NULL, NULL, '2024-02-17 08:56:47', '2024-02-17 08:56:47'),
(484, 'I.4', 'The maximum class size of 50 for undergraduate courses are enforced.', '[{\"evidence\":\"I.4\"}]', '474', 'item', NULL, NULL, NULL, '2024-02-17 08:56:59', '2024-02-17 08:56:59'),
(485, 'I.5', 'Classroom discipline is maintained in accordance with democratic practices.', '[{\"evidence\":\"I.5\"}]', '474', 'item', NULL, NULL, NULL, '2024-02-17 08:57:10', '2024-02-17 08:57:10'),
(486, 'I.6', 'The class officers and assigned students assists in maintaining cleanliness of classroom,\nlaboratories, corridors and school campus', '[{\"evidence\":\"I.6\"}]', '474', 'item', NULL, NULL, NULL, '2024-02-17 08:57:24', '2024-02-17 08:57:24'),
(487, 'I.7', 'Independent work and performance are encouraged and monitored in the following\nactivities:', '[{\"evidence\":\"I.7\"}]', '474', 'item', NULL, NULL, NULL, '2024-02-17 08:57:35', '2024-02-17 08:57:35'),
(488, 'I.7.1', 'case studies and reports;', '[{\"evidence\":\"I.7.1\"}]', '487', 'item', NULL, NULL, NULL, '2024-02-17 08:57:45', '2024-02-17 08:57:45'),
(489, 'I.8', 'Independent work and performance are encouraged and monitored in the following\nactivities:', '[{\"evidence\":\"I.8\"}]', '474', 'item', NULL, NULL, NULL, '2024-02-17 08:58:00', '2024-02-17 08:58:00'),
(490, 'O.1', 'Learning is efficiently and effectively managed.', '[{\"evidence\":\"O.1\"}]', '475', 'item', NULL, NULL, NULL, '2024-02-17 08:58:10', '2024-02-17 08:58:10'),
(491, 'PARAMETER E:', 'GRADUATION REQUIREMENTS', NULL, '367', 'param', NULL, NULL, NULL, '2024-02-17 08:58:37', '2024-02-17 08:58:37'),
(492, 'System - Inputs and Processes', NULL, NULL, '491', 'ind', '1', NULL, NULL, '2024-02-17 08:58:37', '2024-02-17 08:58:37'),
(493, 'Implementation', NULL, NULL, '491', 'ind', '2', NULL, NULL, '2024-02-17 08:58:37', '2024-02-17 08:58:37'),
(494, 'Outcome/s', NULL, NULL, '491', 'ind', '3', NULL, NULL, '2024-02-17 08:58:37', '2024-02-17 08:58:37'),
(495, 'S.1', 'There is policy on graduation requirements', '[{\"evidence\":\"S.1\"}]', '492', 'item', NULL, NULL, NULL, '2024-02-17 08:58:49', '2024-02-17 08:58:49'),
(496, 'I.1', 'The students are regularly informed of the academic requirements of their respective courses', '[{\"evidence\":\"I.1\"}]', '493', 'item', NULL, NULL, NULL, '2024-02-17 08:59:01', '2024-02-17 08:59:01'),
(497, 'I.2', 'The College/Academic Unit implements the system for student returnees and transferers to\nmeet the residence and other graduation requirements', '[{\"evidence\":\"I.2\"}]', '493', 'item', NULL, NULL, NULL, '2024-02-17 08:59:22', '2024-02-17 08:59:22'),
(498, 'I.3', 'Graduating students conduct research and/or undergo practicum/OJT or other activities\nprescribed in their respective curricula', '[{\"evidence\":\"I.3\"}]', '493', 'item', NULL, NULL, NULL, '2024-02-17 08:59:36', '2024-02-17 08:59:36'),
(499, 'I.4', 'The College/ Academic Unit assist the graduating students with academic deficiencies,\ndisciplinary cases, and other problems which hinder issuance of clearance.', '[{\"evidence\":\"I.4\"}]', '493', 'item', NULL, NULL, NULL, '2024-02-17 08:59:59', '2024-02-17 08:59:59'),
(500, 'I.5', 'A clearance from academic and financial accountabilities and responsibilities is requires\nbefore graduation.', '[{\"evidence\":\"I.5\"}]', '493', 'item', NULL, NULL, NULL, '2024-02-17 09:00:13', '2024-02-17 09:00:13'),
(501, 'O.1', 'At least 60% of the students enrolled in the program are able to graduate within the\nregular time frames', '[{\"evidence\":\"O.1\"}]', '494', 'item', NULL, NULL, NULL, '2024-02-17 09:00:25', '2024-02-17 09:00:25'),
(502, 'PARAMETER F:', 'ADMINISTRATIVE SUPPORT FOR EFFECTIVE INSTRUCTION', NULL, '367', 'param', NULL, NULL, NULL, '2024-02-17 09:00:46', '2024-02-17 09:00:46'),
(503, 'System - Inputs and Processes', NULL, NULL, '502', 'ind', '1', NULL, NULL, '2024-02-17 09:00:46', '2024-02-17 09:00:46'),
(504, 'Implementation', NULL, NULL, '502', 'ind', '2', NULL, NULL, '2024-02-17 09:00:46', '2024-02-17 09:00:46'),
(505, 'Outcome/s', NULL, NULL, '502', 'ind', '3', NULL, NULL, '2024-02-17 09:00:46', '2024-02-17 09:00:46'),
(506, 'S.1', 'The institution has policies on:', '[{\"evidence\":\"S.1\"}]', '503', 'item', NULL, NULL, NULL, '2024-02-17 09:01:09', '2024-02-17 09:01:09'),
(507, 'S.1.1', 'substitution or special arrangement whenever a faculty is on leave or absent;', '[{\"evidence\":\"S.1.1\"}]', '506', 'item', NULL, NULL, NULL, '2024-02-17 09:01:22', '2024-02-17 09:01:22'),
(508, 'S.1.2', 'Giving awards and/or special recognition for faculty and students with outstanding achievements; and', '[{\"evidence\":\"S.1.2\"}]', '506', 'item', NULL, NULL, NULL, '2024-02-17 09:01:44', '2024-02-17 09:01:44'),
(509, 'S.1.3', 'supervision/monitoring and evaluation of faculty performance', '[{\"evidence\":\"S.1.3\"}]', '506', 'item', NULL, NULL, NULL, '2024-02-17 09:01:53', '2024-02-17 09:01:53'),
(510, 'I.1', 'The institution implements rules on the attendance of the faculty in their respective classes and other\nacademic related activities.', '[{\"evidence\":\"I.1\"}]', '504', 'item', NULL, NULL, NULL, '2024-02-17 09:02:06', '2024-02-17 09:02:06'),
(511, 'I.2', 'Dialogues are regularly conducted by the administration with the;', '[{\"evidence\":\"I.2\"}]', '504', 'item', NULL, NULL, NULL, '2024-02-17 09:02:18', '2024-02-17 09:02:18'),
(512, 'I.2.1', 'faculty; and', '[{\"evidence\":\"I.2.1\"}]', '511', 'item', NULL, NULL, NULL, '2024-02-17 09:02:30', '2024-02-17 09:02:30'),
(513, 'I.2.2', 'student;', '[{\"evidence\":\"I.2.2\"}]', '511', 'item', NULL, NULL, NULL, '2024-02-17 09:02:42', '2024-02-17 09:02:42'),
(514, 'I.3', 'Quality instruction is assured through the following strategies:', '[{\"evidence\":\"I.3\"}]', '504', 'item', NULL, NULL, NULL, '2024-02-17 09:02:54', '2024-02-17 09:02:54'),
(515, 'I.3.1', 'conducting seminars/workshops on syllabi making;', '[{\"evidence\":\"I.3.1\"}]', '514', 'item', NULL, NULL, NULL, '2024-02-17 09:03:04', '2024-02-17 09:03:04'),
(516, 'I.3.2', 'holding workshops on test construction and the corresponding table of specifications.', '[{\"evidence\":\"I.3.2\"}]', '514', 'item', NULL, NULL, NULL, '2024-02-17 09:03:18', '2024-02-17 09:03:18'),
(517, 'I.3.3', 'Conducting competency assessment;', '[{\"evidence\":\"I.3.3\"}]', '514', 'item', NULL, NULL, NULL, '2024-02-17 09:03:27', '2024-02-17 09:03:27'),
(518, 'I.3.4', 'conducting supervisory visit of classes and providing assistance if necessary;', '[{\"evidence\":\"I.3.4\"}]', '514', 'item', NULL, NULL, NULL, '2024-02-17 09:03:39', '2024-02-17 09:03:39'),
(519, 'I.3.5', 'Holding of regular faculty meeting;', '[{\"evidence\":\"I.3.5\"}]', '514', 'item', NULL, NULL, NULL, '2024-02-17 09:03:49', '2024-02-17 09:03:49'),
(520, 'I.3.6', 'requiring consultations between students and faculty', '[{\"evidence\":\"I.3.6\"}]', '514', 'item', NULL, NULL, NULL, '2024-02-17 09:04:00', '2024-02-17 09:04:00'),
(521, 'I.3.7', 'conducting studies on academic performance of students;', '[{\"evidence\":\"I.3.7\"}]', '514', 'item', NULL, NULL, NULL, '2024-02-17 09:04:11', '2024-02-17 09:04:11'),
(522, 'I.3.8', 'providing opportunities for the participation of the faculty in in-service training\nactivities.;', '[{\"evidence\":\"I.3.8\"}]', '514', 'item', NULL, NULL, NULL, '2024-02-17 09:04:23', '2024-02-17 09:04:23'),
(523, 'I.4', 'Periodic faculty performance evaluation on teaching and in other functions is done by at\nleast three of the following:', '[{\"evidence\":\"I.4\"}]', '504', 'item', NULL, NULL, NULL, '2024-02-17 09:04:33', '2024-02-17 09:04:33'),
(524, 'I.4.1', 'the Dean/Academic Head/Department Chair;', '[{\"evidence\":\"I.4.1\"}]', '523', 'item', NULL, NULL, NULL, '2024-02-17 09:04:42', '2024-02-17 09:04:42'),
(525, 'I.4.2', 'the students;', '[{\"evidence\":\"I.4.2\"}]', '523', 'item', NULL, NULL, NULL, '2024-02-17 09:04:55', '2024-02-17 09:04:55'),
(526, 'I.4.3', 'the faculty member himself/herself;', '[{\"evidence\":\"I.4.3\"}]', '523', 'item', NULL, NULL, NULL, '2024-02-17 09:05:08', '2024-02-17 09:05:08'),
(527, 'I.4.4', 'peers; and', '[{\"evidence\":\"I.4.4\"}]', '523', 'item', NULL, NULL, NULL, '2024-02-17 09:05:20', '2024-02-17 09:05:20'),
(528, 'I.5', 'The results of the performance evaluation are used to improve the\nperformance/competencies of the faculty.', '[{\"evidence\":\"I.5\"}]', '504', 'item', NULL, NULL, NULL, '2024-02-17 09:05:34', '2024-02-17 09:05:34'),
(529, 'I.6', 'Students are given recognition for exemplary academic and non-academic performance;', '[{\"evidence\":\"I.6\"}]', '504', 'item', NULL, NULL, NULL, '2024-02-17 09:05:48', '2024-02-17 09:05:48'),
(530, 'I.7', 'Outstanding achievement of students is recognized and encouraged through the following:', '[{\"evidence\":\"I.7\"}]', '504', 'item', NULL, NULL, NULL, '2024-02-17 09:05:59', '2024-02-17 09:05:59'),
(531, 'I.7.1', 'inclusion in the honor roll; Dean’s list, etc;', '[{\"evidence\":\"I.7.1\"}]', '530', 'item', NULL, NULL, NULL, '2024-02-17 09:06:10', '2024-02-17 09:06:10'),
(532, 'I.7.2', 'grant of tuition scholarship;', '[{\"evidence\":\"I.7.2\"}]', '530', 'item', NULL, NULL, NULL, '2024-02-17 09:06:20', '2024-02-17 09:06:20'),
(533, 'I.7.3', 'award of honor medals and merit certificates;', '[{\"evidence\":\"I.7.3\"}]', '530', 'item', NULL, NULL, NULL, '2024-02-17 09:06:29', '2024-02-17 09:06:29'),
(534, 'I.7.4', 'membership in honor societies/honor class/sections, etc.', '[{\"evidence\":\"I.7.4\"}]', '530', 'item', NULL, NULL, NULL, '2024-02-17 09:06:38', '2024-02-17 09:06:38'),
(535, 'I.7.5', 'grant of special privileges such as opportunities for leadership and others (excluding\nexemption from major exams on all professional business subjects); and', '[{\"evidence\":\"I.7.5\"}]', '530', 'item', NULL, NULL, NULL, '2024-02-17 09:06:58', '2024-02-17 09:06:58'),
(536, 'I.7.6', 'grant of special awards and recognition for outstanding academic accomplishments, e.g.\nBest Thesis, Student Researcher of the Year, etc.', '[{\"evidence\":\"I.7.6\"}]', '530', 'item', NULL, NULL, NULL, '2024-02-17 09:07:08', '2024-02-17 09:07:08'),
(538, 'I.8', 'Indicators on performance of graduates and studies such as:', '[{\"evidence\":\"I.8\"}]', '504', 'item', NULL, NULL, NULL, '2024-02-17 09:07:57', '2024-02-17 09:07:57'),
(539, 'I.8.1', 'analysis of performance of graduates in the Information Technology Licensure\nExamination; if applicable', '[{\"evidence\":\"I.8.1\"}]', '538', 'item', NULL, NULL, NULL, '2024-02-17 09:08:08', '2024-02-17 09:08:08'),
(540, 'I.8.2', 'employability of graduates; and', '[{\"evidence\":\"I.8.2\"}]', '538', 'item', NULL, NULL, NULL, '2024-02-17 09:08:23', '2024-02-17 09:08:23'),
(541, 'I.8.3', 'feedback from employers regarding performance of graduates.', '[{\"evidence\":\"I.8.3\"}]', '538', 'item', NULL, NULL, NULL, '2024-02-17 09:08:34', '2024-02-17 09:08:34'),
(542, 'O.1', 'The faculty and students have commendable performance as a result of administrative\nsupport.', '[{\"evidence\":\"O.1\"}]', '505', 'item', NULL, NULL, NULL, '2024-02-17 09:09:06', '2024-02-17 09:09:06'),
(543, 'O.2', 'The graduates of the program are employable', '[{\"evidence\":\"O.2\"}]', '505', 'item', NULL, NULL, NULL, '2024-02-17 09:09:16', '2024-02-17 09:09:16'),
(544, 'AREA IV:', 'SUPPORT TO STUDENTS', NULL, '2', 'area', NULL, NULL, NULL, '2024-02-17 09:10:29', '2024-02-17 09:10:29'),
(545, 'PARAMETER A:', 'STUDENT SERVICES PROGRAM', NULL, '544', 'param', NULL, NULL, NULL, '2024-02-17 09:14:46', '2024-02-17 09:14:46'),
(546, 'System - Inputs and Processes', NULL, NULL, '545', 'ind', '1', NULL, NULL, '2024-02-17 09:14:46', '2024-02-17 09:14:46'),
(547, 'Implementation', NULL, NULL, '545', 'ind', '2', NULL, NULL, '2024-02-17 09:14:46', '2024-02-17 09:14:46'),
(548, 'Outcome/s', NULL, NULL, '545', 'ind', '3', NULL, NULL, '2024-02-17 09:14:46', '2024-02-17 09:14:46'),
(549, 'S.1', 'The institution has student Service Program (SSP)', '[{\"evidence\":\"S.1\"}]', '546', 'item', NULL, NULL, NULL, '2024-02-17 09:15:13', '2024-02-17 09:15:13'),
(550, 'S.2', 'The Student Affairs Services (SAS) Program is cconsistent with the vision mission', '[{\"evidence\":\"S.2\"}]', '546', 'item', NULL, NULL, NULL, '2024-02-17 09:15:43', '2024-02-17 09:15:43');
INSERT INTO `instruments_component` (`id`, `title`, `description`, `attachment`, `parent`, `category`, `indicator`, `action`, `exclude_rate`, `created_at`, `updated_at`) VALUES
(551, 'S.3', 'The objectives of the SAS are clearly defined.', '[{\"evidence\":\"S.3\"}]', '546', 'item', NULL, NULL, NULL, '2024-02-17 09:16:02', '2024-02-17 09:16:02'),
(552, 'S.4', 'The objectives of the SAS are in accordance with CMO No.9 series of 2013.', '[{\"evidence\":\"S.4\"}]', '546', 'item', NULL, NULL, NULL, '2024-02-17 09:16:47', '2024-02-17 09:16:47'),
(553, 'S.5', 'The SAS is composed of:', '[{\"evidence\":\"S.5\"}]', '546', 'item', NULL, NULL, NULL, '2024-02-17 09:17:12', '2024-02-17 09:17:12'),
(554, 'S.5.1', 'student welfare programs and services:and', '[{\"evidence\":\"S.5.1\"}]', '553', 'item', NULL, NULL, NULL, '2024-02-17 09:17:31', '2024-02-17 09:17:31'),
(555, 'S.5.2', 'Student development programs and services.', '[{\"evidence\":\"S.5.2\"}]', '553', 'item', NULL, NULL, NULL, '2024-02-17 09:17:43', '2024-02-17 09:17:43'),
(556, 'S.6', 'The following basic servies are available', '[{\"evidence\":\"S.6\"}]', '546', 'item', NULL, NULL, NULL, '2024-02-17 09:18:02', '2024-02-17 09:18:02'),
(557, 'S.6.1', 'Student welfare', '[{\"evidence\":\"S.6.1\"}]', '556', 'item', NULL, NULL, NULL, '2024-02-17 09:18:24', '2024-02-17 09:18:24'),
(558, 'S.6.1.1', 'Information and orientation Services.', '[{\"evidence\":\"S.6.1.1\"}]', '557', 'item', NULL, NULL, NULL, '2024-02-17 09:18:37', '2024-02-17 09:18:37'),
(559, 'S.6.1.2', 'Guidance and counceling Service', '[{\"evidence\":\"S.6.1.2\"}]', '557', 'item', NULL, NULL, NULL, '2024-02-17 09:19:02', '2024-02-17 09:19:02'),
(560, 'S.6.1.3', 'Career and job Placement Services', '[{\"evidence\":\"S.6.1.3\"}]', '557', 'item', NULL, NULL, NULL, '2024-02-17 09:19:38', '2024-02-17 09:19:38'),
(561, 'S.6.1.4', 'Economi Enterprise Development and :', '[{\"evidence\":\"S.6.1.4\"}]', '557', 'item', NULL, NULL, NULL, '2024-02-17 09:21:04', '2024-02-17 09:21:04'),
(562, 'S.6.1.5', 'Student Handbook Development', '[{\"evidence\":\"S.6.1.5\"}]', '557', 'item', NULL, NULL, NULL, '2024-02-17 09:21:15', '2024-02-17 09:21:15'),
(563, 'S.6.2', 'Student development', '[{\"evidence\":\"S.6.2\"}]', '556', 'item', NULL, NULL, NULL, '2024-02-17 09:21:32', '2024-02-17 09:21:32'),
(564, 'S.6.2.1', 'Student activities', '[{\"evidence\":\"S.6.2.1\"}]', '563', 'item', NULL, NULL, NULL, '2024-02-17 09:21:44', '2024-02-17 09:21:44'),
(565, 'S.6.2.2', 'Student Organization and Activities', '[{\"evidence\":\"S.6.2.2\"}]', '563', 'item', NULL, NULL, NULL, '2024-02-17 09:21:59', '2024-02-17 09:21:59'),
(566, 'S.6.2.3', 'Leadership Training', '[{\"evidence\":\"S.6.2.3\"}]', '563', 'item', NULL, NULL, NULL, '2024-02-17 09:22:11', '2024-02-17 09:22:11'),
(567, 'S.6.2.4', 'Student Council/Government', '[{\"evidence\":\"S.6.2.4\"}]', '563', 'item', NULL, NULL, NULL, '2024-02-17 09:22:36', '2024-02-17 09:22:36'),
(568, 'S.6.2.5', 'Student discipline : and', '[{\"evidence\":\"S.6.2.5\"}]', '563', 'item', NULL, NULL, NULL, '2024-02-17 09:22:55', '2024-02-17 09:22:55'),
(569, 'S.6.2.6', 'Student Publication/Yearbook', '[{\"evidence\":\"S.6.2.6\"}]', '563', 'item', NULL, NULL, NULL, '2024-02-17 09:23:14', '2024-02-17 09:23:14'),
(570, 'S.6.3', 'Institutional Student Program and Services:', '[{\"evidence\":\"S.6.3\"}]', '556', 'item', NULL, NULL, NULL, '2024-02-17 09:23:34', '2024-02-17 09:23:34'),
(571, 'S.6.3.1', 'Admission Services:', '[{\"evidence\":\"S.6.3.1\"}]', '570', 'item', NULL, NULL, NULL, '2024-02-17 09:23:53', '2024-02-17 09:23:53'),
(572, 'S.6.3.2', 'Scholarship and Financial Assistance (SFA)', '[{\"evidence\":\"S.6.3.2\"}]', '570', 'item', NULL, NULL, NULL, '2024-02-17 09:24:23', '2024-02-17 09:24:23'),
(573, 'S.6.3.3', 'Food Services', '[{\"evidence\":\"S.6.3.3\"}]', '570', 'item', NULL, NULL, NULL, '2024-02-17 09:24:56', '2024-02-17 09:24:56'),
(574, 'S.6.3.4', 'Health and wellness Services', '[{\"evidence\":\"S.6.3.4\"}]', '570', 'item', NULL, NULL, NULL, '2024-02-17 09:25:08', '2024-02-17 09:25:08'),
(575, 'S.6.3.5', 'Safety and Security Services:', '[{\"evidence\":\"S.6.3.5\"}]', '570', 'item', NULL, NULL, NULL, '2024-02-17 09:25:38', '2024-02-17 09:25:38'),
(576, 'S.6.3.6', 'Student housing and ResidentIal Services', '[{\"evidence\":\"S.6.3.6\"}]', '570', 'item', NULL, NULL, NULL, '2024-02-17 09:26:43', '2024-02-17 09:26:43'),
(577, 'S.6.3.7', 'Multi-faith and inter-faith Services', '[{\"evidence\":\"S.6.3.7\"}]', '570', 'item', NULL, NULL, NULL, '2024-02-17 09:27:03', '2024-02-17 09:27:03'),
(578, 'S.6.3.8', 'Foreign/international student Services (whenever applicable)', '[{\"evidence\":\"S.6.3.8\"}]', '570', 'item', NULL, NULL, NULL, '2024-02-17 09:27:25', '2024-02-17 09:27:25'),
(579, 'S.6.3.9', 'Services for student with special needs:', '[{\"evidence\":\"S.6.3.9\"}]', '570', 'item', NULL, NULL, NULL, '2024-02-17 09:27:43', '2024-02-17 09:27:43'),
(580, 'S.6.3.10', 'Culture and Arts Program', '[{\"evidence\":\"S.6.3.10\"}]', '570', 'item', NULL, NULL, NULL, '2024-02-17 09:28:19', '2024-02-17 09:28:19'),
(581, 'S.6.3.11', 'Sport and Development Program', '[{\"evidence\":\"S.6.3.11\"}]', '570', 'item', NULL, NULL, NULL, '2024-02-17 09:28:39', '2024-02-17 09:28:39'),
(582, 'S.6.3.12', 'Social and Community involment programs:and', '[{\"evidence\":\"S.6.3.12\"}]', '570', 'item', NULL, NULL, NULL, '2024-02-17 09:29:15', '2024-02-17 09:29:15'),
(583, 'S.6.3.13', 'Other (please specify)', '[{\"evidence\":\"S.6.3.13\"}]', '570', 'item', NULL, NULL, NULL, '2024-02-17 09:29:27', '2024-02-17 09:29:27'),
(584, 'S.7', 'There is a SAS Unit that manages student affairs development and welfare\nprograms', '[{\"evidence\":\"S.7\"}]', '546', 'item', NULL, NULL, NULL, '2024-02-17 09:29:50', '2024-02-17 09:29:50'),
(585, 'S.8', 'The SAS unit has an organizational structure indicating its relationship\nwith other unit', '[{\"evidence\":\"S.8\"}]', '546', 'item', NULL, NULL, NULL, '2024-02-17 09:30:18', '2024-02-17 09:30:18'),
(586, 'S.9', 'The SAS unit is headed by qualified official.', '[{\"evidence\":\"S.9\"}]', '546', 'item', NULL, NULL, NULL, '2024-02-17 09:32:01', '2024-02-17 09:32:01'),
(587, 'S.10', 'The sas unit is staffed with qualified personnel.', '[{\"evidence\":\"S.10\"}]', '546', 'item', NULL, NULL, NULL, '2024-02-17 09:32:31', '2024-02-17 09:32:31'),
(588, 'S.11', 'The various student services are provided with adequate staff, physical\nfacilities, equipment and materials (e.g. one (1) guidance counselor for every 1000\nstudents, etc.).', '[{\"evidence\":\"S.11\"}]', '546', 'item', NULL, NULL, NULL, '2024-02-17 09:33:20', '2024-02-17 09:33:20'),
(589, 'S.12', 'There is sufficient budget allocation for student Affairs and services of\nthe institution.', '[{\"evidence\":\"S.12\"}]', '546', 'item', NULL, NULL, NULL, '2024-02-17 09:33:36', '2024-02-17 09:33:36'),
(590, 'I.1', 'The objectives of the SAS are disseminated to and understood by the\nstudents,faculty,staff and administrators.', '[{\"evidence\":\"I.1\"}]', '547', 'item', NULL, NULL, NULL, '2024-02-17 09:33:57', '2024-02-17 09:33:57'),
(591, 'I.2', 'The SAS plans, implements, monitors and coordinates programs and services\nfor student welfare and development.', '[{\"evidence\":\"I.2\"}]', '547', 'item', NULL, NULL, NULL, '2024-02-17 09:34:22', '2024-02-17 09:34:22'),
(592, 'I.3', 'Permit, orteous and efficient services in the handling of business\ntransactions with student are evident.', '[{\"evidence\":\"I.3\"}]', '547', 'item', NULL, NULL, NULL, '2024-02-17 09:35:02', '2024-02-17 09:35:02'),
(593, 'I.4', 'The SAS staff receive salaries on time', '[{\"evidence\":\"I.4\"}]', '547', 'item', NULL, NULL, NULL, '2024-02-17 09:35:14', '2024-02-17 09:35:14'),
(594, 'I.5', 'The SAS is represented in the policy and decision making body of the\ninstitution', '[{\"evidence\":\"I.5\"}]', '547', 'item', NULL, NULL, NULL, '2024-02-17 09:35:25', '2024-02-17 09:35:25'),
(595, 'I.6', 'The project and activities of the SAS units are recognized and implement', '[{\"evidence\":\"I.6\"}]', '547', 'item', NULL, NULL, NULL, '2024-02-17 09:35:43', '2024-02-17 09:35:43'),
(596, 'I.7', 'There is continuous and systematic evaluation of the effectiveness of\nprograms and services for student welfare and development', '[{\"evidence\":\"I.7\"}]', '547', 'item', NULL, NULL, NULL, '2024-02-17 09:36:01', '2024-02-17 09:36:01'),
(597, 'O.1', 'The Student are satisfied with student Services Program.', '[{\"evidence\":\"O.1\"}]', '548', 'item', NULL, NULL, NULL, '2024-02-17 09:36:16', '2024-02-17 09:36:16'),
(598, 'PARAMETER B:', 'STUDENT WELFARE', NULL, '544', 'param', NULL, NULL, NULL, '2024-02-17 09:37:19', '2024-02-17 09:37:19'),
(599, 'System - Inputs and Processes', NULL, NULL, '598', 'ind', '1', NULL, NULL, '2024-02-17 09:37:19', '2024-02-17 09:37:19'),
(600, 'Implementation', NULL, NULL, '598', 'ind', '2', NULL, NULL, '2024-02-17 09:37:19', '2024-02-17 09:37:19'),
(601, 'Outcome/s', NULL, NULL, '598', 'ind', '3', NULL, NULL, '2024-02-17 09:37:19', '2024-02-17 09:37:19'),
(602, 'S.1', 'The institution has a Student Handbook containing comprehensive information on\nprograms and services for student welfare and development', '[{\"evidence\":\"S.1\"}]', '599', 'item', NULL, NULL, NULL, '2024-02-17 09:37:52', '2024-02-17 09:37:52'),
(603, 'S.2', 'The Information materials on educational, career, personal and social concerns are readily\navailable such as:', '[{\"evidence\":\"S.2\"}]', '599', 'item', NULL, NULL, NULL, '2024-02-17 09:38:17', '2024-02-17 09:38:17'),
(604, 'S.3', 'The information materials on educational, career, personal and social concerns are readily available, such as:', '[{\"evidence\":\"S.3\"}]', '599', 'item', NULL, NULL, NULL, '2024-02-17 09:50:20', '2024-02-17 09:50:20'),
(605, 'S.3.1', 'R.A. 9262 or Anti Violence Against Women and Children', '[{\"evidence\":\"S.3.1\"}]', '604', 'item', NULL, NULL, NULL, '2024-02-17 09:50:33', '2024-02-17 09:50:33'),
(606, 'S.3.2', 'Anti Bullying Act', '[{\"evidence\":\"S.3.2\"}]', '604', 'item', NULL, NULL, NULL, '2024-02-17 09:50:59', '2024-02-17 09:50:59'),
(607, 'S.3.3', 'Guidelines on drug abuse prevention and control', '[{\"evidence\":\"S.3.3\"}]', '604', 'item', NULL, NULL, NULL, '2024-02-17 09:51:11', '2024-02-17 09:51:11'),
(608, 'S.3.4', 'R.A. 7877 or the Anti-Sexual Harassment Act of 1995;', '[{\"evidence\":\"S.3.4\"}]', '604', 'item', NULL, NULL, NULL, '2024-02-17 09:51:20', '2024-02-17 09:52:43'),
(609, 'S.3.5', 'HIV AIDS awareness;', '[{\"evidence\":\"S.3.5\"}]', '604', 'item', NULL, NULL, NULL, '2024-02-17 09:51:30', '2024-02-17 09:52:31'),
(610, 'S.3.6', 'Self Care and Healthy Lifestyle', '[{\"evidence\":\"S.3.6\"}]', '604', 'item', NULL, NULL, NULL, '2024-02-17 09:53:29', '2024-02-17 09:53:29'),
(611, 'S.3.7', 'R.A. 9442, particularly on the provision on publi8c ridicule and\nvilification against person with disability available', '[{\"evidence\":\"S.3.7\"}]', '604', 'item', NULL, NULL, NULL, '2024-02-17 09:54:48', '2024-02-17 09:54:48'),
(612, 'S.4', 'The guidance and Counseling Program provided the following services', '[{\"evidence\":\"S.4\"}]', '599', 'item', NULL, NULL, NULL, '2024-02-17 09:55:03', '2024-02-17 09:55:03'),
(613, 'S.4.1', 'Information and inventory', '[{\"evidence\":\"S.4.1\"}]', '612', 'item', NULL, NULL, NULL, '2024-02-17 09:55:38', '2024-02-17 09:55:38'),
(614, 'S.4.2', 'Counseling', '[{\"evidence\":\"S.4.2\"}]', '612', 'item', NULL, NULL, NULL, '2024-02-17 09:55:48', '2024-02-17 09:55:48'),
(615, 'S.4.3', 'placement and follow up', '[{\"evidence\":\"S.4.3\"}]', '612', 'item', NULL, NULL, NULL, '2024-02-17 09:57:43', '2024-02-17 09:57:43'),
(616, 'S.4.4', 'referral', '[{\"evidence\":\"S.4.4\"}]', '612', 'item', NULL, NULL, NULL, '2024-02-17 09:58:53', '2024-02-17 09:58:53'),
(619, 'S.5', 'Gender Sensitive individual and group counseling provided', '[{\"evidence\":\"S.5\"}]', '599', 'item', NULL, NULL, NULL, '2024-02-17 10:00:39', '2024-02-17 10:00:39'),
(620, 'S.6', 'Counseling Services consider cultural differences', '[{\"evidence\":\"S.6\"}]', '599', 'item', NULL, NULL, NULL, '2024-02-17 10:00:49', '2024-02-17 10:00:49'),
(621, 'S.7', 'The Guidance program is headed by a licensed Guidance Counselor with\nat least a master’s degree in Guidance and Counseling', '[{\"evidence\":\"S.7\"}]', '599', 'item', NULL, NULL, NULL, '2024-02-17 10:01:00', '2024-02-17 10:01:00'),
(622, 'S.8', 'All Guidance Counselor are licensed.', '[{\"evidence\":\"S.8\"}]', '599', 'item', NULL, NULL, NULL, '2024-02-17 10:01:11', '2024-02-17 10:01:11'),
(623, 'S.9', 'The Guidance Program is supported by qualified staff', '[{\"evidence\":\"S.9\"}]', '599', 'item', NULL, NULL, NULL, '2024-02-17 10:01:21', '2024-02-17 10:01:21'),
(624, 'S.10', 'Every Student has an updated profile at the guidance office', '[{\"evidence\":\"S.10\"}]', '599', 'item', NULL, NULL, NULL, '2024-02-17 10:01:40', '2024-02-17 10:01:40'),
(625, 'S.11', 'A counseling room is provided for students including those with special\nneeds.', '[{\"evidence\":\"S.11\"}]', '599', 'item', NULL, NULL, NULL, '2024-02-17 10:01:50', '2024-02-17 10:01:50'),
(626, 'S.12', 'There is a well-planned assessment program for students with\nappropriate standardized psychological test', '[{\"evidence\":\"S.12\"}]', '599', 'item', NULL, NULL, NULL, '2024-02-17 10:01:59', '2024-02-17 10:01:59'),
(627, 'S.13', 'Career seminar and job placement services are available for students', '[{\"evidence\":\"S.13\"}]', '599', 'item', NULL, NULL, NULL, '2024-02-17 10:02:10', '2024-02-17 10:02:10'),
(628, 'S.14', 'There is a mechanism to establish partnership and collaboration with other\ninstitutions, agency and industry.', '[{\"evidence\":\"S.14\"}]', '599', 'item', NULL, NULL, NULL, '2024-02-17 10:02:20', '2024-02-17 10:02:20'),
(629, 'S.15', 'There is a mechanism for archiving student records for reference purposes', '[{\"evidence\":\"S.15\"}]', '599', 'item', NULL, NULL, NULL, '2024-02-17 10:02:29', '2024-02-17 10:02:29'),
(630, 'I.1', 'The ratio of a guidance Counselor to student population is 1-1000', '[{\"evidence\":\"I.1\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:02:43', '2024-02-17 10:02:43'),
(631, 'I.2', 'Counseling and other student record are maintained and kept\nconfidential.', '[{\"evidence\":\"I.2\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:02:54', '2024-02-17 10:02:54'),
(632, 'I.3', 'Appropriate intervention programs and services are adopted to promote\nand enhance student welfare and development', '[{\"evidence\":\"I.3\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:03:11', '2024-02-17 10:03:11'),
(633, 'I.4', 'The Guidance Office maintains an updated inventory of student\ncumulative record', '[{\"evidence\":\"I.4\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:03:22', '2024-02-17 10:03:22'),
(634, 'I.5', 'The psychological tests are administered, scored and interpreted by\nqualified staff and result confidential', '[{\"evidence\":\"I.5\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:03:33', '2024-02-17 10:03:33'),
(635, 'I.6', 'The test results are disseminated to concerned parties.', '[{\"evidence\":\"I.6\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:03:48', '2024-02-17 10:03:48'),
(636, 'I.7', 'The test result are utilized in designing activities to meet the student\nneeds.', '[{\"evidence\":\"I.7\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:03:59', '2024-02-17 10:03:59'),
(637, 'I.8', 'A scheme for appropriate follow up and referrals are utilized', '[{\"evidence\":\"I.8\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:04:09', '2024-02-17 10:04:09'),
(638, 'I.9', 'the guidance office prepares valid data of students in career and job\nplacement.', '[{\"evidence\":\"I.9\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:04:24', '2024-02-17 10:04:24'),
(639, 'I.10', 'Student placement is regularly monitored and followed up', '[{\"evidence\":\"I.10\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:04:34', '2024-02-17 10:04:34'),
(640, 'I.11', 'The institution maintains active networking with the school, the\ncommunities, alumni and other concerned agencies for career and job\nplacement of students', '[{\"evidence\":\"I.11\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:04:43', '2024-02-17 10:04:43'),
(641, 'I.12', 'Career and counseling is provided to enable students to choose\nappropriate major/field of specialization.', '[{\"evidence\":\"I.12\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:04:55', '2024-02-17 10:04:55'),
(642, 'I.13', 'The information materials on career and job placement and job\nopportunities are made accessible.', '[{\"evidence\":\"I.13\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:05:04', '2024-02-17 10:05:04'),
(643, 'I.19', 'The student body isinvolved in the development and revisionof student\nhandbook', '[{\"evidence\":\"I.19\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:05:36', '2024-02-17 10:05:36'),
(644, 'I.14', 'The SAS maintains liaison with its alumni to follow up graduates job performance, vis-a-vis:', '[{\"evidence\":\"I.14\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:08:54', '2024-02-17 10:08:54'),
(645, 'I.14.1', 'awards received;', '[{\"evidence\":\"I.14.1\"}]', '644', 'item', NULL, NULL, NULL, '2024-02-17 10:09:14', '2024-02-17 10:09:14'),
(646, 'I.14.2', 'key positions in private and/or government agencies; and', '[{\"evidence\":\"I.14.2\"}]', '644', 'item', NULL, NULL, NULL, '2024-02-17 10:09:25', '2024-02-17 10:09:25'),
(647, 'I.14.3', 'status of the enterprise, if applicable.', '[{\"evidence\":\"I.14.3\"}]', '644', 'item', NULL, NULL, NULL, '2024-02-17 10:09:34', '2024-02-17 10:09:34'),
(648, 'I.15', 'Skills development programs are conducted.', '[{\"evidence\":\"I.15\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:09:56', '2024-02-17 10:09:56'),
(649, 'I.16', 'The students are given assistance in career and job placement.', '[{\"evidence\":\"I.16\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:10:25', '2024-02-17 10:10:25'),
(650, 'I.17', 'The institution encourages student economic ventures such as but not limited to:', '[{\"evidence\":\"I.17\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:10:41', '2024-02-17 10:10:41'),
(651, 'I.17.1', 'student laboratory cooperatives;', '[{\"evidence\":\"I.17.1\"}]', '650', 'item', NULL, NULL, NULL, '2024-02-17 10:10:55', '2024-02-17 10:10:55'),
(652, 'I.17.2', 'entrepreneurial activities/projects;', '[{\"evidence\":\"I.17.2\"}]', '650', 'item', NULL, NULL, NULL, '2024-02-17 10:11:05', '2024-02-17 10:11:05'),
(653, 'I.17.3', 'savings; and', '[{\"evidence\":\"I.17.3\"}]', '650', 'item', NULL, NULL, NULL, '2024-02-17 10:11:16', '2024-02-17 10:11:16'),
(654, 'I.17.4', 'others (please specify)', '[{\"evidence\":\"I.17.4\"}]', '650', 'item', NULL, NULL, NULL, '2024-02-17 10:11:35', '2024-02-17 10:11:35'),
(655, 'I.18', 'Updated information on student welfare and development are accessible and disseminated.', '[{\"evidence\":\"I.18\"}]', '600', 'item', NULL, NULL, NULL, '2024-02-17 10:11:54', '2024-02-17 10:11:54'),
(656, 'O.1', 'Quality student welfare services are available.', '[{\"evidence\":\"O.1\"}]', '601', 'item', NULL, NULL, NULL, '2024-02-17 10:12:13', '2024-02-17 10:12:13'),
(657, 'PARAMETER C:', 'STUDENT DEVELOPMENT', NULL, '544', 'param', NULL, NULL, NULL, '2024-02-17 10:17:53', '2024-02-17 10:17:53'),
(658, 'System - Inputs and Processes', NULL, NULL, '657', 'ind', '1', NULL, NULL, '2024-02-17 10:17:53', '2024-02-17 10:17:53'),
(659, 'Implementation', NULL, NULL, '657', 'ind', '2', NULL, NULL, '2024-02-17 10:17:53', '2024-02-17 10:17:53'),
(660, 'Outcome/s', NULL, NULL, '657', 'ind', '3', NULL, NULL, '2024-02-17 10:17:53', '2024-02-17 10:17:53'),
(661, 'S.1', 'The institution has a system of accreditation, monitoring and evaluation of students\norganization.', '[{\"evidence\":\"S.1\"}]', '658', 'item', NULL, NULL, NULL, '2024-02-17 10:20:12', '2024-02-17 10:20:12'),
(662, 'S.2', 'The Institution provides adequate office space and other forms of support to accredited\nstudent organizations.', '[{\"evidence\":\"S.2\"}]', '658', 'item', NULL, NULL, NULL, '2024-02-17 10:20:25', '2024-02-17 10:20:25'),
(663, 'S.3', 'there is coordination between the school administration and SAS concerning students with\ndrug and other related problems.', '[{\"evidence\":\"S.3\"}]', '658', 'item', NULL, NULL, NULL, '2024-02-17 10:20:38', '2024-02-17 10:20:38'),
(664, 'S.4', 'A mechanism to address student’s grievance is in place.', '[{\"evidence\":\"S.4\"}]', '658', 'item', NULL, NULL, NULL, '2024-02-17 10:20:50', '2024-02-17 10:20:50'),
(665, 'S.5', 'programs and opportunities to develop and enhance\nLeadership among students is provided.', '[{\"evidence\":\"S.5\"}]', '658', 'item', NULL, NULL, NULL, '2024-02-17 10:21:01', '2024-02-17 10:21:01'),
(666, 'I.1', 'Requirements and procedures for recognition/accreditation of student\norganizations are widely disseminated.', '[{\"evidence\":\"I.1\"}]', '659', 'item', NULL, NULL, NULL, '2024-02-17 10:21:17', '2024-02-17 10:21:17'),
(667, 'I.2', 'The constitution and by-laws of students organizations incorporate\nparticipation and advocacy in social action activities.', '[{\"evidence\":\"I.2\"}]', '659', 'item', NULL, NULL, NULL, '2024-02-17 10:21:29', '2024-02-17 10:21:29'),
(668, 'I.3', 'The institution conducts leadership training', '[{\"evidence\":\"I.3\"}]', '659', 'item', NULL, NULL, NULL, '2024-02-17 10:21:48', '2024-02-17 10:21:48'),
(669, 'I.4', 'The institution recognizes the right of the students to:', '[{\"evidence\":\"I.4\"}]', '659', 'item', NULL, NULL, NULL, '2024-02-17 10:22:00', '2024-02-17 10:22:00'),
(670, 'I.5', 'The institution ensures transparency in the development/revision of\nguidelines and procedures for student council/government.', '[{\"evidence\":\"I.5\"}]', '659', 'item', NULL, NULL, NULL, '2024-02-17 10:22:30', '2024-02-17 10:22:30'),
(671, 'I.6', 'The institution implements gender and disability sensitive rules and\nregulations published in a Student Handbook/Manual acceptable to students.', '[{\"evidence\":\"I.6\"}]', '659', 'item', NULL, NULL, NULL, '2024-02-17 10:22:41', '2024-02-17 10:22:41'),
(672, 'I.7', 'sanctions are in force for misconduct such us but not limited to arts of\nvandalism, hazing, bullying, libelous statement and other negative acts that\nthreaten peace and order inside and outside the school premises.', '[{\"evidence\":\"I.7\"}]', '659', 'item', NULL, NULL, NULL, '2024-02-17 10:22:53', '2024-02-17 10:22:53'),
(673, 'I.8', 'Grievance Committee is established to ensure due process in dealing with\nstudents misconduct.', '[{\"evidence\":\"I.8\"}]', '659', 'item', NULL, NULL, NULL, '2024-02-17 10:23:05', '2024-02-17 10:23:05'),
(674, 'I.9', 'the institution supports the establishment and implementation of students’\napplication as provided form in RA 7079, otherwise known as “campus\njournalism act of 1991and other media forms.', '[{\"evidence\":\"I.9\"}]', '659', 'item', NULL, NULL, NULL, '2024-02-17 10:23:15', '2024-02-17 10:23:15'),
(675, 'I.10', 'the production/publication of a year book is encourage.', '[{\"evidence\":\"I.10\"}]', '659', 'item', NULL, NULL, NULL, '2024-02-17 10:23:27', '2024-02-17 10:23:27'),
(676, 'O.1', 'quality students development services are assured .', '[{\"evidence\":\"O.1\"}]', '660', 'item', NULL, NULL, NULL, '2024-02-17 10:23:39', '2024-02-17 10:23:39'),
(677, 'PARAMETER D:', 'INSTITUTIONAL STUDENT PROGRAMS AND SERVICES', NULL, '544', 'param', NULL, NULL, NULL, '2024-02-17 10:24:15', '2024-02-17 10:24:15'),
(678, 'System - Inputs and Processes', NULL, NULL, '677', 'ind', '1', NULL, NULL, '2024-02-17 10:24:15', '2024-02-17 10:24:15'),
(679, 'Implementation', NULL, NULL, '677', 'ind', '2', NULL, NULL, '2024-02-17 10:24:15', '2024-02-17 10:24:15'),
(680, 'Outcome/s', NULL, NULL, '677', 'ind', '3', NULL, NULL, '2024-02-17 10:24:15', '2024-02-17 10:24:15'),
(681, 'S.1', 'There is a system of student recruitment , selection, admissions and retentions', '[{\"evidence\":\"S.1\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:24:37', '2024-02-17 10:24:37'),
(682, 'S.2', 'Admission requirements and procedures of persons with disabilities in RA 7277 are in', '[{\"evidence\":\"S.2\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:24:51', '2024-02-17 10:24:51'),
(683, 'S.3', 'Scholarship and financial assistance in various forms are available to students', '[{\"evidence\":\"S.3\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:25:01', '2024-02-17 10:25:01'),
(684, 'S.4', 'Policies and guidance are institutionalized for students from marginalized sector of the\ncountry', '[{\"evidence\":\"S.4\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:25:11', '2024-02-17 10:25:11'),
(685, 'S.5', 'There is a policy on wellness and healthy lifestyle', '[{\"evidence\":\"S.5\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:25:22', '2024-02-17 10:25:22'),
(686, 'S.6', 'Buildings and facilities which conform with government standards are provided with\naccessible with persons with disability', '[{\"evidence\":\"S.6\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:25:32', '2024-02-17 10:25:32'),
(687, 'S.7', 'There is a disaster risk reduction and management programs is compliance with RA10121,\notherwise as known as the “Philippine Disaster Risk Reduction and Management Act of 2010”', '[{\"evidence\":\"S.7\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:25:43', '2024-02-17 10:25:43'),
(688, 'S.8', 'Policies on the used of student facilities are in place.', '[{\"evidence\":\"S.8\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:26:03', '2024-02-17 10:26:03'),
(689, 'S.9', 'An integrated service program that caters to the various needs from foreign students ,\nstudents are available , whenever applicable', '[{\"evidence\":\"S.9\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:26:15', '2024-02-17 10:26:15'),
(690, 'S.10', 'A liason officer is available to assist foreign students in their transactions with concerned\ngovernment agencies, whenever applicable.', '[{\"evidence\":\"S.10\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:26:29', '2024-02-17 10:26:29'),
(691, 'S.11', 'There are programs for life skills training(e.g.conflict and stress\nmanagement,harassment,etc) counselling ,testing referral for students with special needs.', '[{\"evidence\":\"S.11\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:26:41', '2024-02-17 10:26:41'),
(692, 'S.12', 'The institutions provide opportunities for promotion and appreciation of culture and arts', '[{\"evidence\":\"S.12\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:26:52', '2024-02-17 10:26:52'),
(693, 'S.13', 'The institution are well equipped offices for:', '[{\"evidence\":\"S.13\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:27:07', '2024-02-17 10:27:07'),
(694, 'S.13.1', 'Culture and Arts', '[{\"evidence\":\"S.13.1\"}]', '693', 'item', NULL, NULL, NULL, '2024-02-17 10:27:20', '2024-02-17 10:27:20'),
(695, 'S.13.2', 'Sports Development', '[{\"evidence\":\"S.13.2\"}]', '693', 'item', NULL, NULL, NULL, '2024-02-17 10:27:29', '2024-02-17 10:27:29'),
(696, 'S.13.3', 'Student Publication', '[{\"evidence\":\"S.13.3\"}]', '693', 'item', NULL, NULL, NULL, '2024-02-17 10:27:39', '2024-02-17 10:27:39'),
(697, 'S.13.4', 'Medical and Dental', '[{\"evidence\":\"S.13.4\"}]', '693', 'item', NULL, NULL, NULL, '2024-02-17 10:27:53', '2024-02-17 10:27:53'),
(699, 'S.14', 'There is a well-furnished medical-dental clinic', '[{\"evidence\":\"S.14\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:28:52', '2024-02-17 10:28:52'),
(700, 'S.15', 'There is a medical dental program designed for:', '[{\"evidence\":\"S.15\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:29:06', '2024-02-17 10:29:06'),
(701, 'S.15.1', 'diagnostic purposes', '[{\"evidence\":\"S.15.1\"}]', '700', 'item', NULL, NULL, NULL, '2024-02-17 10:29:19', '2024-02-17 10:29:19'),
(702, 'S.15.2', 'first aid', '[{\"evidence\":\"S.15.2\"}]', '700', 'item', NULL, NULL, NULL, '2024-02-17 10:29:30', '2024-02-17 10:29:30'),
(703, 'S.15.3', 'prevention and prophylaxis', '[{\"evidence\":\"S.15.3\"}]', '700', 'item', NULL, NULL, NULL, '2024-02-17 10:29:40', '2024-02-17 10:29:40'),
(704, 'S.15.4', 'physical dental exam', '[{\"evidence\":\"S.15.4\"}]', '700', 'item', NULL, NULL, NULL, '2024-02-17 10:29:51', '2024-02-17 10:29:51'),
(705, 'S.16', 'updated information on student help, condition is available to parents /guardians', '[{\"evidence\":\"S.16\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:30:14', '2024-02-17 10:30:14'),
(706, 'S.17', 'There are mechanism to promote national . sectoral, and cultural sports activities and\ndevelopment in coordination with concern agencies', '[{\"evidence\":\"S.17\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:30:25', '2024-02-17 10:30:25'),
(707, 'S.18', 'There are financial assistance programs designed for:', '[{\"evidence\":\"S.18\"}]', '678', 'item', NULL, NULL, NULL, '2024-02-17 10:30:36', '2024-02-17 10:30:36'),
(708, 'S.18.1', 'Educational Loans', '[{\"evidence\":\"S.18.1\"}]', '707', 'item', NULL, NULL, NULL, '2024-02-17 10:30:49', '2024-02-17 10:30:49'),
(709, 'S.18.2', 'Student Assistanceship', '[{\"evidence\":\"S.18.2\"}]', '707', 'item', NULL, NULL, NULL, '2024-02-17 10:31:04', '2024-02-17 10:31:04'),
(710, 'S.18.3', 'attendance to seminars, trainings(sports,leadership,etc)', '[{\"evidence\":\"S.18.3\"}]', '707', 'item', NULL, NULL, NULL, '2024-02-17 10:31:17', '2024-02-17 10:31:17'),
(711, 'S.18.4', 'grant in aid', '[{\"evidence\":\"S.18.4\"}]', '707', 'item', NULL, NULL, NULL, '2024-02-17 10:31:28', '2024-02-17 10:31:28'),
(712, 'I.1', 'The faculty and students are properly informed of the admission guidelines and retention policies.', '[{\"evidence\":\"I.1\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:31:43', '2024-02-17 10:31:43'),
(713, 'I.1.1', 'substitution or special arrangement whenever a faculty is on leave or absent;', '[{\"evidence\":\"I.1.1\"}]', '712', 'item', NULL, NULL, NULL, '2024-02-17 10:31:55', '2024-02-17 10:31:55'),
(714, 'I.2', 'The and procedures on selection, admission and retention of students are implemented.', '[{\"evidence\":\"I.2\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:32:09', '2024-02-17 10:32:09'),
(715, 'I.3', 'following student admission records are filed and made available to concerned parties', '[{\"evidence\":\"I.3\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:32:24', '2024-02-17 10:32:24'),
(716, 'I.3.1', 'enrollment trends;', '[{\"evidence\":\"I.3.1\"}]', '715', 'item', NULL, NULL, NULL, '2024-02-17 10:32:36', '2024-02-17 10:32:36'),
(717, 'I.3.2', 'drop-out rate;', '[{\"evidence\":\"I.3.2\"}]', '715', 'item', NULL, NULL, NULL, '2024-02-17 10:32:54', '2024-02-17 10:32:54'),
(718, 'I.3.3', 'examination results and passing percentage;', '[{\"evidence\":\"I.3.3\"}]', '715', 'item', NULL, NULL, NULL, '2024-02-17 10:33:17', '2024-02-17 10:33:17'),
(719, 'I.3.4', 'employability of graduates;', '[{\"evidence\":\"I.3.4\"}]', '715', 'item', NULL, NULL, NULL, '2024-02-17 10:33:29', '2024-02-17 10:33:29'),
(720, 'I.3.5', 'student transferees;', '[{\"evidence\":\"I.3.5\"}]', '715', 'item', NULL, NULL, NULL, '2024-02-17 10:33:42', '2024-02-17 10:36:19'),
(721, 'I.4', 'Retention policies are approved by the Academic Council and confirmed by the Board of Regents/Trustees.', '[{\"evidence\":\"I.4\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:34:03', '2024-02-17 10:34:03'),
(722, 'I.3.6', 'student classification by specialization.', '[{\"evidence\":\"I.3.6\"}]', '715', 'item', NULL, NULL, NULL, '2024-02-17 10:36:37', '2024-02-17 10:36:37'),
(723, 'I.5', 'The list of tuition and other school fees is posted conspicuously.', '[{\"evidence\":\"I.5\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:37:05', '2024-02-17 10:37:05'),
(724, 'I.6', 'The institution provides access to scholarship and financial assistance.', '[{\"evidence\":\"I.6\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:37:24', '2024-02-17 10:37:24'),
(725, 'I.7', 'Guidelines on scholarship and financial assistance are widely and promptly disseminated.', '[{\"evidence\":\"I.7\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:37:37', '2024-02-17 10:37:37'),
(726, 'I.8', 'Criteria for safety, sanitation and food choices in the school canteen, cafeteria are enforced.', '[{\"evidence\":\"I.8\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:37:52', '2024-02-17 10:37:52'),
(727, 'I.9', 'The institution coordinates with the local government for the safety and sanitation of food service outside the\nschool premises.', '[{\"evidence\":\"I.9\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:38:04', '2024-02-17 10:38:04'),
(728, 'I.10', 'The institution periodically inspects food outlets for sanitation and hygiene. The sanitary permit is displayed\nin a prominent area of the food outlet.', '[{\"evidence\":\"I.10\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:38:15', '2024-02-17 10:38:15'),
(729, 'I.11', 'The primary health care services are administered to all students by licensed medical, dental, and allied\nprofessionals.', '[{\"evidence\":\"I.11\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:38:27', '2024-02-17 10:38:27'),
(730, 'I.12', 'Facilities for keeping health care and updated health records of students are adequate and well- maintained.', '[{\"evidence\":\"I.12\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:38:54', '2024-02-17 10:38:54'),
(731, 'I.13', 'Policies and procedures in the selection of student athletes,  performers, writers, etc. are implemented.', '[{\"evidence\":\"I.13\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:39:30', '2024-02-17 10:39:30'),
(732, 'I.14', 'Health and related laws, rules and regulations are enforced.', '[{\"evidence\":\"I.14\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:39:45', '2024-02-17 10:39:45'),
(733, 'I.15', 'Licensed and competent security personnel ensure the safety and   security of students.', '[{\"evidence\":\"I.15\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:39:56', '2024-02-17 10:39:56'),
(734, 'I.16', 'Earthquake and fire drills involving students, faculty and administrative staff are conducted regularly.', '[{\"evidence\":\"I.16\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:40:12', '2024-02-17 10:40:12'),
(735, 'I.17', 'The institution establishes programs for the students to help in crime   prevention, cleanliness and orderliness, observance of a clean and   green environment, safety and security of the school premises.', '[{\"evidence\":\"I.17\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:40:22', '2024-02-17 10:40:22'),
(736, 'I.18', 'The institution provides assistance to students on accessible, affordable, clean, conducive to learning, dormitories and housing facilities.', '[{\"evidence\":\"I.18\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:40:35', '2024-02-17 10:40:35'),
(737, 'I.19', 'The institution ensures that the students right to practice his/her religion is respected.', '[{\"evidence\":\"I.19\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:40:47', '2024-02-17 10:40:47'),
(738, 'I.20', 'Submission of required reports on foreign students to concerned government agencies is done, whenever applicable.', '[{\"evidence\":\"I.20\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:40:58', '2024-02-17 10:40:58'),
(739, 'I.21', 'The Code of Conduct for foreign students in the country is enforced.', '[{\"evidence\":\"I.21\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:41:08', '2024-02-17 10:41:08'),
(740, 'I.22', 'The institution accommodates students with special needs.', '[{\"evidence\":\"I.22\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:41:19', '2024-02-17 10:41:19'),
(741, 'I.23', 'There is a regular submission of the list of students with special needs  to the CHEDRO describing the institutions intervention programs.', '[{\"evidence\":\"I.23\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:41:32', '2024-02-17 10:41:32'),
(742, 'I.24', 'Sports development programs are regularly conducted. (part 1, part 2)', '[{\"evidence\":\"I.24\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:41:43', '2024-02-17 10:41:43'),
(743, 'I.25', 'The institution ensures opportunities for students to participate in  socio and civic action activities.', '[{\"evidence\":\"I.25\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:41:55', '2024-02-17 10:41:55'),
(744, 'I.26', 'The students are covered with Life and Accident Insurance.', '[{\"evidence\":\"I.26\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:42:25', '2024-02-17 10:42:25'),
(745, 'I.27', 'The institution rewards SAS staff for exceptional job performance.', '[{\"evidence\":\"I.27\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:42:37', '2024-02-17 10:42:37'),
(746, 'I.28', 'The institution informs the students and other stakeholders on other related programs and services not cited in CMO No.9 s. 2013.', '[{\"evidence\":\"I.28\"}]', '679', 'item', NULL, NULL, NULL, '2024-02-17 10:42:50', '2024-02-17 10:42:50'),
(748, 'O.1', 'The institutional programs and services develop student potentials to the fullest.', '[{\"evidence\":\"O.1\"}]', '680', 'item', NULL, NULL, NULL, '2024-02-17 10:44:23', '2024-02-17 10:44:23'),
(749, 'PARAMETER E:', 'RESEARCH, MONITORING AND EVALUATION', NULL, '544', 'param', NULL, NULL, NULL, '2024-02-17 10:45:31', '2024-02-17 10:45:31'),
(750, 'System - Inputs and Processes', NULL, NULL, '749', 'ind', '1', NULL, NULL, '2024-02-17 10:45:31', '2024-02-17 10:45:31'),
(751, 'Implementation', NULL, NULL, '749', 'ind', '2', NULL, NULL, '2024-02-17 10:45:31', '2024-02-17 10:45:31'),
(752, 'Outcome/s', NULL, NULL, '749', 'ind', '3', NULL, NULL, '2024-02-17 10:45:31', '2024-02-17 10:45:31'),
(753, 'S.1', 'The institution has a research program on student affairs and services.', '[{\"evidence\":\"S.1\"}]', '750', 'item', NULL, NULL, NULL, '2024-02-17 10:46:00', '2024-02-17 10:47:10'),
(754, 'S.2', 'There is a mechanism for monitoring and evaluation of SAS programs.', '[{\"evidence\":\"S.2\"}]', '750', 'item', NULL, NULL, NULL, '2024-02-17 10:46:11', '2024-02-17 10:46:11'),
(755, 'S.3', 'Monitoring and evaluation instruments are available.', '[{\"evidence\":\"S.3\"}]', '750', 'item', NULL, NULL, NULL, '2024-02-17 10:46:21', '2024-02-17 10:46:21'),
(756, 'S.4', 'There is adequate funding for the conduct of SAS researches and   monitoring evaluation.', '[{\"evidence\":\"S.4\"}]', '750', 'item', NULL, NULL, NULL, '2024-02-17 10:46:33', '2024-02-17 10:46:33'),
(757, 'I.1', 'Researches on student affairs and services are conducted.', '[{\"evidence\":\"I.1\"}]', '751', 'item', NULL, NULL, NULL, '2024-02-17 10:46:55', '2024-02-17 10:46:55'),
(758, 'I.2', 'Research results and outputs are disseminated and utilized.', '[{\"evidence\":\"I.2\"}]', '751', 'item', NULL, NULL, NULL, '2024-02-17 10:47:49', '2024-02-17 10:47:49'),
(759, 'I.3', 'Regular monitoring and evaluation on the implementation of student   services are conducted.', '[{\"evidence\":\"I.3\"}]', '751', 'item', NULL, NULL, NULL, '2024-02-17 10:48:00', '2024-02-17 10:48:00'),
(760, 'I.4', 'Monitoring and evaluation instruments are developed, reviewed, and continuously improved.', '[{\"evidence\":\"I.4\"}]', '751', 'item', NULL, NULL, NULL, '2024-02-17 10:48:11', '2024-02-17 10:48:11'),
(761, 'I.5', 'Reports are filed and submitted regularly to CHEDRO.', '[{\"evidence\":\"I.5\"}]', '751', 'item', NULL, NULL, NULL, '2024-02-17 10:48:21', '2024-02-17 10:48:21'),
(762, 'O.1', 'Research outputs are presented and published.', '[{\"evidence\":\"O.1\"}]', '752', 'item', NULL, NULL, NULL, '2024-02-17 10:48:38', '2024-02-17 10:48:38'),
(763, 'AREA V:', 'RESEARCH', NULL, '2', 'area', NULL, NULL, NULL, '2024-02-17 10:52:42', '2024-02-17 10:52:42'),
(764, 'PARAMETER A:', 'PRIORITIES AND RELEVANCE', NULL, '763', 'param', NULL, NULL, NULL, '2024-02-17 11:02:15', '2024-02-17 11:02:15'),
(765, 'System - Inputs and Processes', NULL, NULL, '764', 'ind', '1', NULL, NULL, '2024-02-17 11:02:15', '2024-02-17 11:02:15'),
(766, 'Implementation', NULL, NULL, '764', 'ind', '2', NULL, NULL, '2024-02-17 11:02:15', '2024-02-17 11:02:15'),
(767, 'Outcome/s', NULL, NULL, '764', 'ind', '3', NULL, NULL, '2024-02-17 11:02:15', '2024-02-17 11:02:15'),
(768, 'S.1', 'The institution’s research agenda is in consonance with institutional, regional and\nnational priorities concerned such as DOST, CHED- National Higher Education\nResearch Agenda, NEDA, etc.', '[{\"evidence\":\"S.1\"}]', '765', 'item', NULL, NULL, NULL, '2024-02-17 11:03:04', '2024-02-17 11:03:04'),
(769, 'S.2', 'The institution has an approved Research Manual.', '[{\"evidence\":\"S.2\"}]', '765', 'item', NULL, NULL, NULL, '2024-02-17 11:03:16', '2024-02-17 11:03:16'),
(770, 'I.1', 'The approved Research Agenda is implemented.', '[{\"evidence\":\"I.1\"}]', '766', 'item', NULL, NULL, NULL, '2024-02-17 11:03:29', '2024-02-17 11:03:29'),
(771, 'I.2', 'The following stakeholders participate in the formulation of research agenda as\nbases for identifying institutional thrusts and priorities:', '[{\"evidence\":\"I.2\"}]', '766', 'item', NULL, NULL, NULL, '2024-02-17 11:03:40', '2024-02-17 11:03:40'),
(772, 'I.2.1', 'administrators;', '[{\"evidence\":\"I.2.1\"}]', '771', 'item', NULL, NULL, NULL, '2024-02-17 11:03:52', '2024-02-17 11:03:52'),
(773, 'I.2.2', 'faculty;', '[{\"evidence\":\"I.2.2\"}]', '771', 'item', NULL, NULL, NULL, '2024-02-17 11:04:07', '2024-02-17 11:04:07'),
(774, 'I.2.3', 'students;', '[{\"evidence\":\"I.2.3\"}]', '771', 'item', NULL, NULL, NULL, '2024-02-17 11:04:24', '2024-02-17 11:04:24'),
(775, 'I.2.4', 'government agency representatives (DOST, CHED, NEDA, etc.,) and', '[{\"evidence\":\"I.2.4\"}]', '771', 'item', NULL, NULL, NULL, '2024-02-17 11:04:36', '2024-02-17 11:04:36'),
(776, 'I.2.5', 'other stakeholders (alumni, parents, etc.)', '[{\"evidence\":\"I.2.5\"}]', '771', 'item', NULL, NULL, NULL, '2024-02-17 11:05:31', '2024-02-17 11:05:31'),
(777, 'I.3', 'Action researches to test theory in practice are conducted by faculty and\nstudents', '[{\"evidence\":\"I.3\"}]', '766', 'item', NULL, NULL, NULL, '2024-02-17 11:05:58', '2024-02-17 11:05:58'),
(778, 'I.4', 'Team collaborative and interdisciplinary research is encouraged.', '[{\"evidence\":\"I.4\"}]', '766', 'item', NULL, NULL, NULL, '2024-02-17 11:06:13', '2024-02-17 11:06:13'),
(779, 'I.5', 'Research outputs are published in refereed national and / or international\njournals.', '[{\"evidence\":\"I.5\"}]', '766', 'item', NULL, NULL, NULL, '2024-02-17 11:06:24', '2024-02-17 11:06:24'),
(780, 'O.1', 'Priority researches are identified and conducted', '[{\"evidence\":\"O.1\"}]', '767', 'item', NULL, NULL, NULL, '2024-02-17 11:06:37', '2024-02-17 11:06:37'),
(781, 'O.2', 'Research results are published.', '[{\"evidence\":\"O.2\"}]', '767', 'item', NULL, NULL, NULL, '2024-02-17 11:06:48', '2024-02-17 11:06:48'),
(782, 'PARAMETER B:', 'FUNDING AND OTHER RESOURCES', NULL, '763', 'param', NULL, NULL, NULL, '2024-02-17 11:08:14', '2024-02-17 11:08:14'),
(783, 'System - Inputs and Processes', NULL, NULL, '782', 'ind', '1', NULL, NULL, '2024-02-17 11:08:14', '2024-02-17 11:08:14'),
(784, 'Implementation', NULL, NULL, '782', 'ind', '2', NULL, NULL, '2024-02-17 11:08:14', '2024-02-17 11:08:14'),
(785, 'Outcome/s', NULL, NULL, '782', 'ind', '3', NULL, NULL, '2024-02-17 11:08:14', '2024-02-17 11:08:14'),
(786, 'S.1', 'The institution has an approved and adequate budget for research.', '[{\"evidence\":\"S.1\"}]', '783', 'item', NULL, NULL, NULL, '2024-02-17 11:08:30', '2024-02-17 11:08:30'),
(787, 'S.2', 'There are provisions for the following:', '[{\"evidence\":\"S.2\"}]', '783', 'item', NULL, NULL, NULL, '2024-02-17 11:08:41', '2024-02-17 11:08:41'),
(788, 'S.2.1', 'facilities and equipment such as Internet, statistical software, and other\nICT resources;', '[{\"evidence\":\"S.2.1\"}]', '787', 'item', NULL, NULL, NULL, '2024-02-17 11:08:54', '2024-02-17 11:08:54'),
(789, 'S.2.2', 'research staff;', '[{\"evidence\":\"S.2.2\"}]', '787', 'item', NULL, NULL, NULL, '2024-02-17 11:09:15', '2024-02-17 11:09:15'),
(790, 'S.2.3', 'supplies and materials; and', '[{\"evidence\":\"S.2.3\"}]', '787', 'item', NULL, NULL, NULL, '2024-02-17 11:09:26', '2024-02-17 11:09:26'),
(791, 'S.2.4', 'workplace.', '[{\"evidence\":\"S.2.4\"}]', '787', 'item', NULL, NULL, NULL, '2024-02-17 11:09:41', '2024-02-17 11:09:41'),
(792, 'I.1', 'allocates adequate funds for the conduct of faculty and student research.', '[{\"evidence\":\"I.1\"}]', '784', 'item', NULL, NULL, NULL, '2024-02-17 11:10:13', '2024-02-17 11:10:13'),
(793, 'I.2', 'establishes linkages with the local/ national/ international agencies for funding\nsupport and assistance.', '[{\"evidence\":\"I.2\"}]', '784', 'item', NULL, NULL, NULL, '2024-02-17 11:10:25', '2024-02-17 11:10:25'),
(794, 'I.3', 'maintains a functional and long- range program of faculty/ staff development to\nenhance research capability and competence.', '[{\"evidence\":\"I.3\"}]', '784', 'item', NULL, NULL, NULL, '2024-02-17 11:10:40', '2024-02-17 11:10:40'),
(795, 'I.4', 'encourages the conduct of externally funded researches.', '[{\"evidence\":\"I.4\"}]', '784', 'item', NULL, NULL, NULL, '2024-02-17 11:10:50', '2024-02-17 11:10:50'),
(796, 'O.1', 'The research Program is adequately funded.', '[{\"evidence\":\"O.1\"}]', '785', 'item', NULL, NULL, NULL, '2024-02-17 11:11:02', '2024-02-17 11:11:02'),
(797, 'PARAMETER C:', 'IMPLEMENTATION, MONITORING, EVALUATION AND UTILIZATION OF RESEARCH RESULTS/OUTPUTS', NULL, '763', 'param', NULL, NULL, NULL, '2024-02-17 11:12:50', '2024-02-17 11:12:50'),
(798, 'System - Inputs and Processes', NULL, NULL, '797', 'ind', '1', NULL, NULL, '2024-02-17 11:12:50', '2024-02-17 11:12:50'),
(799, 'Implementation', NULL, NULL, '797', 'ind', '2', NULL, NULL, '2024-02-17 11:12:50', '2024-02-17 11:12:50'),
(800, 'Outcome/s', NULL, NULL, '797', 'ind', '3', NULL, NULL, '2024-02-17 11:12:50', '2024-02-17 11:12:50'),
(801, 'S.1', 'There is a system of implementation , monitoring , evaluation and utilization of\nresearch outputs :', '[{\"evidence\":\"S.1\"}]', '798', 'item', NULL, NULL, NULL, '2024-02-17 11:13:33', '2024-02-17 11:13:33'),
(802, 'S.2', 'The institution has a policy on intellectual Property Rights (IPR).', '[{\"evidence\":\"S.2\"}]', '798', 'item', NULL, NULL, NULL, '2024-02-17 11:13:43', '2024-02-17 11:13:43'),
(803, 'I.1', 'The institution / College / Academic Unit has a Research Unit managed by\ncompetent staff.', '[{\"evidence\":\"I.1\"}]', '799', 'item', NULL, NULL, NULL, '2024-02-17 11:13:55', '2024-02-17 11:13:55'),
(804, 'I.2', 'The Research Manual provides guidelines and procedures for the administration\nand conduct of research.', '[{\"evidence\":\"I.2\"}]', '799', 'item', NULL, NULL, NULL, '2024-02-17 11:14:09', '2024-02-17 11:14:09'),
(805, 'I.3', 'The faculty conduct applied and operational researchers in their fields of\nspecialization in accordance with the thrust and priorities of the program\n/institution.', '[{\"evidence\":\"I.3\"}]', '799', 'item', NULL, NULL, NULL, '2024-02-17 11:14:20', '2024-02-17 11:14:20'),
(806, 'I.4', 'The institution provides incentives to faculty researchers/ such as honoraria\n,service credits ,deloading , etc', '[{\"evidence\":\"I.4\"}]', '799', 'item', NULL, NULL, NULL, '2024-02-17 11:14:45', '2024-02-17 11:14:45'),
(807, 'I.5', 'The College Academic Unit requires its students to conduct research, as a course\nrequirement, (whenever applicable).', '[{\"evidence\":\"I.5\"}]', '799', 'item', NULL, NULL, NULL, '2024-02-17 11:14:56', '2024-02-17 11:14:56'),
(808, 'I.6', 'The institution provides opportunities for advanced studies and/ or training to\nenhance faculty/ staff research competence:', '[{\"evidence\":\"I.6\"}]', '799', 'item', NULL, NULL, NULL, '2024-02-17 11:15:08', '2024-02-17 11:15:08'),
(809, 'I.7', 'Completed and on-going research studies are periodically monitored and\nevaluated in local and regional in-house reviews.', '[{\"evidence\":\"I.7\"}]', '799', 'item', NULL, NULL, NULL, '2024-02-17 11:15:29', '2024-02-17 11:15:29'),
(810, 'I.8', 'Research outputs are utilized as inputs in:', '[{\"evidence\":\"I.8\"}]', '799', 'item', NULL, NULL, NULL, '2024-02-17 11:15:40', '2024-02-17 11:15:40'),
(811, 'I.8.1', 'Institutional development;', '[{\"evidence\":\"I.8.1\"}]', '810', 'item', NULL, NULL, NULL, '2024-02-17 11:15:52', '2024-02-17 11:15:52'),
(812, 'I.8.2', 'The improvement of instructional processes ;and', '[{\"evidence\":\"I.8.2\"}]', '810', 'item', NULL, NULL, NULL, '2024-02-17 11:16:03', '2024-02-17 11:16:03'),
(813, 'I.8.3', 'The transfer of generated technology /knowledge to the community.', '[{\"evidence\":\"I.8.3\"}]', '810', 'item', NULL, NULL, NULL, '2024-02-17 11:16:15', '2024-02-17 11:16:15'),
(814, 'I.9', 'Packaged technologies and new information are disseminated to the target\nclientele through appropriate delivery systems.', '[{\"evidence\":\"I.9\"}]', '799', 'item', NULL, NULL, NULL, '2024-02-17 11:16:27', '2024-02-17 11:16:27'),
(815, 'I.10', 'The institution ensures:', '[{\"evidence\":\"I.10\"}]', '799', 'item', NULL, NULL, NULL, '2024-02-17 11:16:38', '2024-02-17 11:16:38'),
(816, 'I.10.1', 'Research outputs are protected by IPR laws; and', '[{\"evidence\":\"I.10.1\"}]', '815', 'item', NULL, NULL, NULL, '2024-02-17 11:16:51', '2024-02-17 11:16:51'),
(817, 'I.10.2', 'Faculty and students observed research ethics to avoid malpractices like\nplagiarisms, fabrication of data, etc.', '[{\"evidence\":\"I.10.2\"}]', '815', 'item', NULL, NULL, NULL, '2024-02-17 11:17:11', '2024-02-17 11:17:11'),
(818, 'O.1', 'Implemented, monitoring, evaluation and research utilization of outputs are\neffective.', '[{\"evidence\":\"O.1\"}]', '800', 'item', NULL, NULL, NULL, '2024-02-17 11:17:21', '2024-02-17 11:17:21'),
(819, 'PARAMETER D:', 'PUBLICATION AND DISSEMINATION', NULL, '763', 'param', NULL, NULL, NULL, '2024-02-17 11:18:06', '2024-02-17 11:18:06'),
(820, 'System - Inputs and Processes', NULL, NULL, '819', 'ind', '1', NULL, NULL, '2024-02-17 11:18:06', '2024-02-17 11:18:06'),
(821, 'Implementation', NULL, NULL, '819', 'ind', '2', NULL, NULL, '2024-02-17 11:18:06', '2024-02-17 11:18:06'),
(822, 'Outcome/s', NULL, NULL, '819', 'ind', '3', NULL, NULL, '2024-02-17 11:18:06', '2024-02-17 11:18:06');
INSERT INTO `instruments_component` (`id`, `title`, `description`, `attachment`, `parent`, `category`, `indicator`, `action`, `exclude_rate`, `created_at`, `updated_at`) VALUES
(823, 'S.1', 'The institution has an approved and copyrighted Research Journal', '[{\"evidence\":\"S.1\"}]', '820', 'item', NULL, NULL, NULL, '2024-02-17 11:18:22', '2024-02-17 11:18:22'),
(824, 'S.2', 'The institution has incentives for:', '[{\"evidence\":\"S.2\"}]', '820', 'item', NULL, NULL, NULL, '2024-02-17 11:18:33', '2024-02-17 11:18:33'),
(826, 'S.2.1', 'Paper presentations;', '[{\"evidence\":\"S.2.1\"}]', '824', 'item', NULL, NULL, NULL, '2024-02-17 11:22:25', '2024-02-17 11:22:25'),
(827, 'S.2.2', 'journal publication;', '[{\"evidence\":\"S.2.2\"}]', '824', 'item', NULL, NULL, NULL, '2024-02-17 11:26:58', '2024-02-17 11:26:58'),
(828, 'S.2.3', 'outstanding research related performance; and', '[{\"evidence\":\"S.2.3\"}]', '824', 'item', NULL, NULL, NULL, '2024-02-17 11:27:14', '2024-02-17 11:27:14'),
(829, 'S.2.4', 'patented outputs.', '[{\"evidence\":\"S.2.4\"}]', '824', 'item', NULL, NULL, NULL, '2024-02-17 11:27:33', '2024-02-17 11:27:33'),
(830, 'I.1', 'The institution provides opportunities for the dissemination of research results in\nfora, conferences, seminars, and other related means.', '[{\"evidence\":\"I.1\"}]', '821', 'item', NULL, NULL, NULL, '2024-02-17 11:27:48', '2024-02-17 11:27:48'),
(831, 'I.2', 'The institution regularly publishes a research journal.', '[{\"evidence\":\"I.2\"}]', '821', 'item', NULL, NULL, NULL, '2024-02-17 11:28:01', '2024-02-17 11:28:01'),
(832, 'I.3', 'Library exchange of research publications with other HEI’s and agencies is\nmaintained.', '[{\"evidence\":\"I.3\"}]', '821', 'item', NULL, NULL, NULL, '2024-02-17 11:28:33', '2024-02-17 11:28:33'),
(833, 'I.4', 'Research manuscripts/ technical reports are well- written, and edited following the\ninstitutional format.', '[{\"evidence\":\"I.4\"}]', '821', 'item', NULL, NULL, NULL, '2024-02-17 11:28:44', '2024-02-17 11:28:44'),
(834, 'I.5', 'The institution supports the researchers in all of the following activities:', '[{\"evidence\":\"I.5\"}]', '821', 'item', NULL, NULL, NULL, '2024-02-17 11:29:05', '2024-02-17 11:29:05'),
(835, 'I.5.1', 'Instructional Materials Development;', '[{\"evidence\":\"I.5.1\"}]', '834', 'item', NULL, NULL, NULL, '2024-02-17 11:29:35', '2024-02-17 11:29:35'),
(836, 'I.5.2', 'paper presentations, journal publication, classroom lectures, and other\nsimilar activities;', '[{\"evidence\":\"I.5.2\"}]', '834', 'item', NULL, NULL, NULL, '2024-02-17 11:30:00', '2024-02-17 11:30:00'),
(837, 'I.5.3', 'editorship/ writing in academic, scientific and professional journals;', '[{\"evidence\":\"I.5.3\"}]', '834', 'item', NULL, NULL, NULL, '2024-02-17 11:30:18', '2024-02-17 11:30:18'),
(838, 'I.5.4', 'thesis/ dissertation advising and;', '[{\"evidence\":\"I.5.4\"}]', '834', 'item', NULL, NULL, NULL, '2024-02-17 11:30:33', '2024-02-17 11:30:33'),
(839, 'I.5.5', 'patenting of research outputs.', '[{\"evidence\":\"I.5.5\"}]', '834', 'item', NULL, NULL, NULL, '2024-02-17 11:30:45', '2024-02-17 11:30:45'),
(840, 'I.6', 'Research results are published preferably in refereed journals.', '[{\"evidence\":\"I.6\"}]', '821', 'item', NULL, NULL, NULL, '2024-02-17 11:31:00', '2024-02-17 11:31:00'),
(841, 'I.7', 'Research results are disseminated to the target clientele.', '[{\"evidence\":\"I.7\"}]', '821', 'item', NULL, NULL, NULL, '2024-02-17 11:31:21', '2024-02-17 11:31:21'),
(842, 'I.8', 'The College/ Academic Unit generates income from patents, licenses, copyrights,\nand other research outputs.', '[{\"evidence\":\"I.8\"}]', '821', 'item', NULL, NULL, NULL, '2024-02-17 11:31:42', '2024-02-17 11:31:42'),
(843, 'O.1', 'Research outputs are published in refereed journals.', '[{\"evidence\":\"O.1\"}]', '822', 'item', NULL, NULL, NULL, '2024-02-17 11:32:01', '2024-02-17 11:32:01'),
(844, 'O.2', 'Research outputs are utilized.', '[{\"evidence\":\"O.2\"}]', '822', 'item', NULL, NULL, NULL, '2024-02-17 11:32:12', '2024-02-17 11:32:12'),
(845, 'O.3', 'Patented and copyrighted research outputs are commercialized.', '[{\"evidence\":\"O.3\"}]', '822', 'item', NULL, NULL, NULL, '2024-02-17 11:32:24', '2024-02-17 11:32:24'),
(846, 'AREA VI:', 'EXTENSION AND COMMUNITY INVOLVEMENT', NULL, '2', 'area', NULL, NULL, NULL, '2024-02-17 16:28:17', '2024-02-17 16:28:17'),
(847, 'PARAMETER A:', 'PRIORITIES AND RELEVANCE', NULL, '846', 'param', NULL, NULL, NULL, '2024-02-17 16:32:33', '2024-02-17 16:32:33'),
(848, 'System - Inputs and Processes', NULL, NULL, '847', 'ind', '1', NULL, NULL, '2024-02-17 16:32:33', '2024-02-17 16:32:33'),
(849, 'Implementation', NULL, NULL, '847', 'ind', '2', NULL, NULL, '2024-02-17 16:32:33', '2024-02-17 16:32:33'),
(850, 'Outcome/s', NULL, NULL, '847', 'ind', '3', NULL, NULL, '2024-02-17 16:32:33', '2024-02-17 16:32:33'),
(851, 'S.1', 'The extension agenda is in consonance of local, regional and national\ndevelopment thrust and priorities.', '[{\"evidence\":\"S.1\"}]', '848', 'item', NULL, NULL, NULL, '2024-02-17 16:33:05', '2024-02-17 16:33:05'),
(852, 'S.2', 'The College/Academic Unit has a benchmark survey of the problems, priorities\nand resources of the community.', '[{\"evidence\":\"S.2\"}]', '848', 'item', NULL, NULL, NULL, '2024-02-17 16:33:20', '2024-02-17 16:33:20'),
(853, 'S.3', 'Extension program reflects the VMGO.', '[{\"evidence\":\"S.3\"}]', '848', 'item', NULL, NULL, NULL, '2024-02-17 16:33:30', '2024-02-17 16:33:30'),
(854, 'S.4', 'There is a pool of consultants/experts from various disciplines to serve in\nextension projects and activities.', '[{\"evidence\":\"S.4\"}]', '848', 'item', NULL, NULL, NULL, '2024-02-17 16:33:40', '2024-02-17 16:33:40'),
(855, 'S.5', 'The institution has an approved and copyrighted Extension Manual', '[{\"evidence\":\"S.5\"}]', '848', 'item', NULL, NULL, NULL, '2024-02-17 16:33:52', '2024-02-17 16:33:52'),
(856, 'I.1', 'The extension projects and activities implemented are based on the results of the\nBenchmark survey.', '[{\"evidence\":\"I.1\"}]', '849', 'item', NULL, NULL, NULL, '2024-02-17 16:34:03', '2024-02-17 16:34:03'),
(857, 'I.2', 'The extension projects and activities complement the curriculum of the program\nunder review', '[{\"evidence\":\"I.2\"}]', '849', 'item', NULL, NULL, NULL, '2024-02-17 16:34:14', '2024-02-17 16:34:14'),
(858, 'I.3', 'A mutual exchange of resources and services between the College/Academic\nUnit and the community is evident.', '[{\"evidence\":\"I.3\"}]', '849', 'item', NULL, NULL, NULL, '2024-02-17 16:34:25', '2024-02-17 16:34:25'),
(859, 'I.4', 'Linkages with local, national, foreign, and non-governmental agencies are\ninstitutionalized.', '[{\"evidence\":\"I.4\"}]', '849', 'item', NULL, NULL, NULL, '2024-02-17 16:34:42', '2024-02-17 16:34:42'),
(860, 'O.1', 'Priority and relevant extension projects and activities are conducted.', '[{\"evidence\":\"O.1\"}]', '850', 'item', NULL, NULL, NULL, '2024-02-17 16:34:54', '2024-02-17 16:34:54'),
(861, 'PARAMETER B:', 'PLANNING, IMPLEMENTATION, MONITORING AND EVALUATION', NULL, '846', 'param', NULL, NULL, NULL, '2024-02-17 16:36:14', '2024-02-17 16:36:14'),
(862, 'System - Inputs and Processes', NULL, NULL, '861', 'ind', '1', NULL, NULL, '2024-02-17 16:36:14', '2024-02-17 16:36:14'),
(863, 'Implementation', NULL, NULL, '861', 'ind', '2', NULL, NULL, '2024-02-17 16:36:14', '2024-02-17 16:36:14'),
(864, 'Outcome/s', NULL, NULL, '861', 'ind', '3', NULL, NULL, '2024-02-17 16:36:14', '2024-02-17 16:36:14'),
(865, 'S.1', 'There is a distinct office that manages the Extension Program.', '[{\"evidence\":\"S.1\"}]', '862', 'item', NULL, NULL, NULL, '2024-02-17 16:36:42', '2024-02-17 16:36:42'),
(866, 'S.2', 'Instruments for monitoring and evaluation are available.', '[{\"evidence\":\"S.2\"}]', '862', 'item', NULL, NULL, NULL, '2024-02-17 16:36:55', '2024-02-17 16:36:55'),
(867, 'I.1', 'The administration, faculty, students and other stakeholders of the\nCollege/Academic Unit participate in the planning and organization of Extension\nProgram.', '[{\"evidence\":\"I.1\"}]', '863', 'item', NULL, NULL, NULL, '2024-02-17 16:37:09', '2024-02-17 16:37:09'),
(868, 'I.2', 'The administration, faculty and students are involved in the implementation and\ndissemination of extension programs', '[{\"evidence\":\"I.2\"}]', '863', 'item', NULL, NULL, NULL, '2024-02-17 16:37:20', '2024-02-17 16:37:20'),
(869, 'I.3', 'The Extension Projects and activates served varied clienteles', '[{\"evidence\":\"I.3\"}]', '863', 'item', NULL, NULL, NULL, '2024-02-17 16:37:31', '2024-02-17 16:37:31'),
(870, 'I.4', 'The conduct of extension projects and activities is sustainable.', '[{\"evidence\":\"I.4\"}]', '863', 'item', NULL, NULL, NULL, '2024-02-17 16:37:51', '2024-02-17 16:37:51'),
(871, 'I.5', 'Technologies/new knowledge are disseminated to the clientele through\nappropriate delivery systems.', '[{\"evidence\":\"I.5\"}]', '863', 'item', NULL, NULL, NULL, '2024-02-17 16:38:03', '2024-02-17 16:38:03'),
(872, 'I.6', 'The extension activities are documented in the form of:', '[{\"evidence\":\"I.6\"}]', '863', 'item', NULL, NULL, NULL, '2024-02-17 16:38:15', '2024-02-17 16:38:15'),
(873, 'I.6.1', 'pamphlets;', '[{\"evidence\":\"I.6.1\"}]', '872', 'item', NULL, NULL, NULL, '2024-02-17 16:38:31', '2024-02-17 16:38:31'),
(874, 'I.6.2', 'flyers;', '[{\"evidence\":\"I.6.2\"}]', '872', 'item', NULL, NULL, NULL, '2024-02-17 16:38:44', '2024-02-17 16:38:44'),
(875, 'I.6.3', 'bulletins;', '[{\"evidence\":\"I.6.3\"}]', '872', 'item', NULL, NULL, NULL, '2024-02-17 16:38:56', '2024-02-17 16:38:56'),
(876, 'I.6.4', 'newsletters; and', '[{\"evidence\":\"I.6.4\"}]', '872', 'item', NULL, NULL, NULL, '2024-02-17 16:39:22', '2024-02-17 16:39:22'),
(877, 'I.6.5', 'electronic resources', '[{\"evidence\":\"I.6.5\"}]', '872', 'item', NULL, NULL, NULL, '2024-02-17 16:39:34', '2024-02-17 16:39:34'),
(878, 'I.7', 'Periodic monitoring and evaluation of extension projects and activities are\nconducted.', '[{\"evidence\":\"I.7\"}]', '863', 'item', NULL, NULL, NULL, '2024-02-17 16:39:47', '2024-02-17 16:39:47'),
(879, 'I.8', 'Results of monitoring and evaluation are disseminated and discussed with\nconcerned stakeholders.', '[{\"evidence\":\"I.8\"}]', '863', 'item', NULL, NULL, NULL, '2024-02-17 16:39:59', '2024-02-17 16:39:59'),
(880, 'I.9', 'Re-planning of activities based on feedback conducted.', '[{\"evidence\":\"I.9\"}]', '863', 'item', NULL, NULL, NULL, '2024-02-17 16:40:10', '2024-02-17 16:40:10'),
(881, 'I.10', 'Accomplishment and terminal reports are filled and submitted on time', '[{\"evidence\":\"I.10\"}]', '863', 'item', NULL, NULL, NULL, '2024-02-17 16:40:22', '2024-02-17 16:40:22'),
(882, 'O.1', 'The Extension Program is well-planned, implemented, monitored, evaluated and\ndisseminated.', '[{\"evidence\":\"O.1\"}]', '864', 'item', NULL, NULL, NULL, '2024-02-17 16:40:37', '2024-02-17 16:40:37'),
(883, 'O.2', 'The Extension Program has contributed to the improvement on the quality of life\nof the target clientele/beneficiaries', '[{\"evidence\":\"O.2\"}]', '864', 'item', NULL, NULL, NULL, '2024-02-17 16:40:49', '2024-02-17 16:40:49'),
(884, 'PARAMETER C:', 'FUNDING AND OTHER RESOURCES', NULL, '846', 'param', NULL, NULL, NULL, '2024-02-17 16:41:37', '2024-02-17 16:41:37'),
(885, 'System - Inputs and Processes', NULL, NULL, '884', 'ind', '1', NULL, NULL, '2024-02-17 16:41:37', '2024-02-17 16:41:37'),
(886, 'Implementation', NULL, NULL, '884', 'ind', '2', NULL, NULL, '2024-02-17 16:41:37', '2024-02-17 16:41:37'),
(887, 'Outcome/s', NULL, NULL, '884', 'ind', '3', NULL, NULL, '2024-02-17 16:41:37', '2024-02-17 16:41:37'),
(888, 'S.1', 'There is an approved and adequate budget for extension', '[{\"evidence\":\"S.1\"}]', '885', 'item', NULL, NULL, NULL, '2024-02-17 16:41:59', '2024-02-17 16:41:59'),
(889, 'S.2', 'There is a provision of:', '[{\"evidence\":\"S.2\"}]', '885', 'item', NULL, NULL, NULL, '2024-02-17 16:42:10', '2024-02-17 16:42:10'),
(890, 'S.2.1', 'Facilities and equipment such as internet and ICT resources;', '[{\"evidence\":\"S.2.1\"}]', '889', 'item', NULL, NULL, NULL, '2024-02-17 16:42:23', '2024-02-17 16:42:23'),
(891, 'S.2.2', 'extension staff;', '[{\"evidence\":\"S.2.2\"}]', '889', 'item', NULL, NULL, NULL, '2024-02-17 16:42:35', '2024-02-17 16:42:35'),
(892, 'S.2.3', 'supplies and materials; and', '[{\"evidence\":\"S.2.3\"}]', '889', 'item', NULL, NULL, NULL, '2024-02-17 16:42:55', '2024-02-17 16:42:55'),
(893, 'S.2.4', 'workplace', '[{\"evidence\":\"S.2.4\"}]', '889', 'item', NULL, NULL, NULL, '2024-02-17 16:43:06', '2024-02-17 16:43:06'),
(894, 'I.1', 'The budget for the extension program is utilized as planned', '[{\"evidence\":\"I.1\"}]', '886', 'item', NULL, NULL, NULL, '2024-02-17 16:43:22', '2024-02-17 16:43:22'),
(895, 'I.2', 'Honoraria and other incentives (deloading, credit unit equivalent, etc.)', '[{\"evidence\":\"I.2\"}]', '886', 'item', NULL, NULL, NULL, '2024-02-17 16:43:33', '2024-02-17 16:43:33'),
(896, 'I.3', 'The College/Academic Unit sources out the from other agencies;', '[{\"evidence\":\"I.3\"}]', '886', 'item', NULL, NULL, NULL, '2024-02-17 16:43:47', '2024-02-17 16:43:47'),
(897, 'I.3.1', 'additional funding; and', '[{\"evidence\":\"I.3.1\"}]', '896', 'item', NULL, NULL, NULL, '2024-02-17 16:44:01', '2024-02-17 16:44:01'),
(898, 'I.3.2', 'technical assistance and service inputs', '[{\"evidence\":\"I.3.2\"}]', '896', 'item', NULL, NULL, NULL, '2024-02-17 16:44:12', '2024-02-17 16:44:12'),
(899, 'O.1', 'The Extension Program is adequately funded.', '[{\"evidence\":\"O.1\"}]', '887', 'item', NULL, NULL, NULL, '2024-02-17 16:44:24', '2024-02-17 16:44:24'),
(900, 'PARAMETER D:', 'COMMUNITY INVOLVEMENT AND PARTICIPATION IN THE INSTITUTION\'S ACTIVITIES', NULL, '846', 'param', NULL, NULL, NULL, '2024-02-17 16:46:28', '2024-02-17 16:46:28'),
(901, 'System - Inputs and Processes', NULL, NULL, '900', 'ind', '1', NULL, NULL, '2024-02-17 16:46:28', '2024-02-17 16:46:28'),
(902, 'Implementation', NULL, NULL, '900', 'ind', '2', NULL, NULL, '2024-02-17 16:46:28', '2024-02-17 16:46:28'),
(903, 'Outcome/s', NULL, NULL, '900', 'ind', '3', NULL, NULL, '2024-02-17 16:46:28', '2024-02-17 16:46:28'),
(904, 'S.1', 'There is a strategy for involving the community, government and private agencies\nand the Extension Program.', '[{\"evidence\":\"S.1\"}]', '901', 'item', NULL, NULL, NULL, '2024-02-17 16:46:47', '2024-02-17 16:46:47'),
(905, 'I.1', 'The College/Academic Unit is committed to the service and development of the\ncommunity, and', '[{\"evidence\":\"I.1\"}]', '902', 'item', NULL, NULL, NULL, '2024-02-17 16:47:00', '2024-02-17 16:47:00'),
(906, 'I.1.1', 'initiates and maintains community development projects;', '[{\"evidence\":\"I.1.1\"}]', '905', 'item', NULL, NULL, NULL, '2024-02-17 16:47:13', '2024-02-17 16:47:13'),
(907, 'I.1.2', 'involves the students, faculty, staff administrators in the projects; and', '[{\"evidence\":\"I.1.2\"}]', '905', 'item', NULL, NULL, NULL, '2024-02-17 16:47:24', '2024-02-17 16:47:24'),
(908, 'I.1.3', 'coordinates its community program and services with the target clienteles.', '[{\"evidence\":\"I.1.3\"}]', '905', 'item', NULL, NULL, NULL, '2024-02-17 16:47:44', '2024-02-17 16:47:44'),
(909, 'I.2', 'There is community participation and involvement in extension in the following:', '[{\"evidence\":\"I.2\"}]', '902', 'item', NULL, NULL, NULL, '2024-02-17 16:47:56', '2024-02-17 16:47:56'),
(910, 'I.2.1', 'Planning', '[{\"evidence\":\"I.2.1\"}]', '909', 'item', NULL, NULL, NULL, '2024-02-17 16:48:08', '2024-02-17 16:48:08'),
(911, 'I.2.2', 'Implementation and dissemination;', '[{\"evidence\":\"I.2.2\"}]', '909', 'item', NULL, NULL, NULL, '2024-02-17 16:48:20', '2024-02-17 16:48:20'),
(912, 'I.2.3', 'monitoring and evaluation;', '[{\"evidence\":\"I.2.3\"}]', '909', 'item', NULL, NULL, NULL, '2024-02-17 16:48:31', '2024-02-17 16:48:31'),
(913, 'I.2.4', 'out-sourcing of funds, materials and other service inputs; and', '[{\"evidence\":\"I.2.4\"}]', '909', 'item', NULL, NULL, NULL, '2024-02-17 16:48:43', '2024-02-17 16:48:43'),
(914, 'I.2.5', 'utilization of technology, knowledge learned, skills acquired from the extension projects and activities.', '[{\"evidence\":\"I.2.5\"}]', '909', 'item', NULL, NULL, NULL, '2024-02-17 16:49:08', '2024-02-17 16:49:08'),
(915, 'O.1', 'There is wholesome coordination between the Extension Program implementers\nand the target clientele/beneficiaries.', '[{\"evidence\":\"O.1\"}]', '903', 'item', NULL, NULL, NULL, '2024-02-17 16:49:21', '2024-02-17 16:49:21'),
(916, 'AREA VIII:', 'PHYSICAL PLANTS FACILITIES', NULL, '2', 'area', NULL, NULL, NULL, '2024-02-17 16:54:08', '2024-02-17 16:54:08'),
(917, 'PARAMETER A:', 'CAMPUS', NULL, '916', 'param', NULL, NULL, NULL, '2024-02-17 16:54:33', '2024-02-17 16:54:33'),
(918, 'System - Inputs and Processes', NULL, NULL, '917', 'ind', '1', NULL, NULL, '2024-02-17 16:54:33', '2024-02-17 16:54:33'),
(919, 'Implementation', NULL, NULL, '917', 'ind', '2', NULL, NULL, '2024-02-17 16:54:33', '2024-02-17 16:54:33'),
(920, 'Outcome/s', NULL, NULL, '917', 'ind', '3', NULL, NULL, '2024-02-17 16:54:33', '2024-02-17 16:54:33'),
(921, 'S.1', 'There is a Site Development Plan, and program of implementation.', '[{\"evidence\":\"S.1\"}]', '918', 'item', NULL, NULL, NULL, '2024-02-17 16:56:39', '2024-02-17 16:56:39'),
(922, 'S.2', 'The campus has accessible good roads and pathways.', '[{\"evidence\":\"S.2\"}]', '918', 'item', NULL, NULL, NULL, '2024-02-17 16:56:51', '2024-02-17 16:56:51'),
(923, 'S.3', 'The campus is in a well-planned, clean and properly landscape environment.', '[{\"evidence\":\"S.3\"}]', '918', 'item', NULL, NULL, NULL, '2024-02-17 16:57:08', '2024-02-17 16:57:08'),
(924, 'S.4', 'There is a system to ensure that all of the following are provided:', '[{\"evidence\":\"S.4\"}]', '918', 'item', NULL, NULL, NULL, '2024-02-17 16:57:27', '2024-02-17 16:57:27'),
(925, 'S.4.1', 'traffic safety in and outside the campus;', '[{\"evidence\":\"S.4.1\"}]', '924', 'item', NULL, NULL, NULL, '2024-02-17 16:57:42', '2024-02-17 16:57:42'),
(926, 'S.4.2', 'waste management program;', '[{\"evidence\":\"S.4.2\"}]', '924', 'item', NULL, NULL, NULL, '2024-02-17 16:58:04', '2024-02-17 16:58:04'),
(927, 'S.4.3', 'proper utilization, repair and upkeep of school facilities and equipment; and', '[{\"evidence\":\"S.4.3\"}]', '924', 'item', NULL, NULL, NULL, '2024-02-17 16:58:24', '2024-02-17 16:58:24'),
(928, 'S.4.4', 'cleanliness and orderliness of the school campus.', '[{\"evidence\":\"S.4.4\"}]', '924', 'item', NULL, NULL, NULL, '2024-02-17 16:58:37', '2024-02-17 16:58:37'),
(929, 'S.5', 'An area for outdoor educational activities, e.g., social, physical, athletic, cultural,\nmilitary training, etc. exists.', '[{\"evidence\":\"S.5\"}]', '918', 'item', NULL, NULL, NULL, '2024-02-17 16:58:49', '2024-02-17 16:58:49'),
(930, 'S.6', 'There is a campus security unit that ensures safety of the academic community.', '[{\"evidence\":\"S.6\"}]', '918', 'item', NULL, NULL, NULL, '2024-02-17 16:59:04', '2024-02-17 16:59:04'),
(931, 'I.1', 'The site infrastructure development plan is implemented as planned.', '[{\"evidence\":\"I.1\"}]', '919', 'item', NULL, NULL, NULL, '2024-02-17 16:59:30', '2024-02-17 16:59:30'),
(932, 'I.2', 'The site plan is strategically displayed inside the campus indicating the location\nof the different buildings, driveways, parking areas, etc.', '[{\"evidence\":\"I.2\"}]', '919', 'item', NULL, NULL, NULL, '2024-02-17 16:59:42', '2024-02-17 16:59:42'),
(933, 'I.3', 'The infrastructure development plan is implemented in accordance with\napproved zoning ordinances.', '[{\"evidence\":\"I.3\"}]', '919', 'item', NULL, NULL, NULL, '2024-02-17 16:59:53', '2024-02-17 16:59:53'),
(934, 'I.4', 'Covered walks are provided to protect the academic community from inclement\nweather.', '[{\"evidence\":\"I.4\"}]', '919', 'item', NULL, NULL, NULL, '2024-02-17 17:00:05', '2024-02-17 17:00:05'),
(935, 'I.5', 'The institution implements a Waste Management Program.', '[{\"evidence\":\"I.5\"}]', '919', 'item', NULL, NULL, NULL, '2024-02-17 17:00:16', '2024-02-17 17:00:16'),
(936, 'I.6', 'The Maintenance Unit or its equivalent periodically inspects school facilities and\nequipment to ensure their proper utilization and upkeep.', '[{\"evidence\":\"I.6\"}]', '919', 'item', NULL, NULL, NULL, '2024-02-17 17:00:30', '2024-02-17 17:00:30'),
(937, 'O.1', 'The Campus environment is conducive to all educational activities', '[{\"evidence\":\"O.1\"}]', '920', 'item', NULL, NULL, NULL, '2024-02-17 17:00:41', '2024-02-17 17:00:41'),
(938, 'O.2', 'The site can accommodate its present school population and future expansion.', '[{\"evidence\":\"O.2\"}]', '920', 'item', NULL, NULL, NULL, '2024-02-17 17:00:52', '2024-02-17 17:00:52'),
(939, 'O.3', 'The campus is safe and well-maintained.', '[{\"evidence\":\"O.3\"}]', '920', 'item', NULL, NULL, NULL, '2024-02-17 17:01:03', '2024-02-17 17:01:03'),
(940, 'O.4', 'The campus is well-planned, clean and properly landscaped.', '[{\"evidence\":\"O.4\"}]', '920', 'item', NULL, NULL, NULL, '2024-02-17 17:01:14', '2024-02-17 17:01:14'),
(941, 'PARAMETER B:', 'BUILDINGS', NULL, '916', 'param', NULL, NULL, NULL, '2024-02-17 17:01:54', '2024-02-17 17:01:54'),
(942, 'System - Inputs and Processes', NULL, NULL, '941', 'ind', '1', NULL, NULL, '2024-02-17 17:01:54', '2024-02-17 17:01:54'),
(943, 'Implementation', NULL, NULL, '941', 'ind', '2', NULL, NULL, '2024-02-17 17:01:54', '2024-02-17 17:01:54'),
(944, 'Outcome/s', NULL, NULL, '941', 'ind', '3', NULL, NULL, '2024-02-17 17:01:54', '2024-02-17 17:01:54'),
(945, 'S.1', 'The buildings meet all requirements of the Building Code. A Certificate of\nOccupancy for each building is conspicuously displayed.', '[{\"evidence\":\"S.1\"}]', '942', 'item', NULL, NULL, NULL, '2024-02-17 17:02:12', '2024-02-17 17:02:12'),
(946, 'S.2', 'The buildings are constructed according to their respective use.', '[{\"evidence\":\"S.2\"}]', '942', 'item', NULL, NULL, NULL, '2024-02-17 17:02:26', '2024-02-17 17:02:26'),
(947, 'S.3', 'The buildings are well-planned and appropriately located to provide for future\nexpansion.', '[{\"evidence\":\"S.3\"}]', '942', 'item', NULL, NULL, NULL, '2024-02-17 17:02:38', '2024-02-17 17:02:38'),
(948, 'S.4', 'Entry and exit points permit the use of the buildings for public and other\nfunctions with minimum interference to school activities.', '[{\"evidence\":\"S.4\"}]', '942', 'item', NULL, NULL, NULL, '2024-02-17 17:02:49', '2024-02-17 17:02:49'),
(949, 'S.5', 'Emergency exits are provided and properly marked.', '[{\"evidence\":\"S.5\"}]', '942', 'item', NULL, NULL, NULL, '2024-02-17 17:03:02', '2024-02-17 17:03:02'),
(950, 'S.6', 'The buildings are equipped with emergency/ fire escapes which are readily\naccessible.', '[{\"evidence\":\"S.6\"}]', '942', 'item', NULL, NULL, NULL, '2024-02-17 17:03:13', '2024-02-17 17:03:13'),
(951, 'S.7', 'The corridors, doorways and alleys are well-constructed for better mobility.', '[{\"evidence\":\"S.7\"}]', '942', 'item', NULL, NULL, NULL, '2024-02-17 17:03:26', '2024-02-17 17:03:26'),
(952, 'S.8', 'The buildings are well-ventilated and lighted.', '[{\"evidence\":\"S.8\"}]', '942', 'item', NULL, NULL, NULL, '2024-02-17 17:03:38', '2024-02-17 17:03:38'),
(953, 'S.9', 'The buildings have facilities for persons with disability (PWDs) as provided by\nlaw.', '[{\"evidence\":\"S.9\"}]', '942', 'item', NULL, NULL, NULL, '2024-02-17 17:03:49', '2024-02-17 17:03:49'),
(954, 'S.10', 'There is a central signal and fire Alarm system.', '[{\"evidence\":\"S.10\"}]', '942', 'item', NULL, NULL, NULL, '2024-02-17 17:04:03', '2024-02-17 17:04:03'),
(955, 'S.11', 'There are readily accessible and functional fire extinguishers and other fire-\nfighting equipment.', '[{\"evidence\":\"S.11\"}]', '942', 'item', NULL, NULL, NULL, '2024-02-17 17:04:16', '2024-02-17 17:04:16'),
(956, 'S.12', 'Bulletin boards, display boards, waste disposal containers and other amenities\nare strategically located inside the buildings.', '[{\"evidence\":\"S.12\"}]', '942', 'item', NULL, NULL, NULL, '2024-02-17 17:04:28', '2024-02-17 17:04:28'),
(957, 'S.13', 'There are faculty rooms and offices.', '[{\"evidence\":\"S.13\"}]', '942', 'item', NULL, NULL, NULL, '2024-02-17 17:04:39', '2024-02-17 17:04:39'),
(958, 'S.14', 'The buildings are insured.', '[{\"evidence\":\"S.14\"}]', '942', 'item', NULL, NULL, NULL, '2024-02-17 17:04:52', '2024-02-17 17:04:52'),
(959, 'I.1', 'The buildings are clean, well-maintained and free from vandalistic acts.', '[{\"evidence\":\"I.1\"}]', '943', 'item', NULL, NULL, NULL, '2024-02-17 17:05:03', '2024-02-17 17:05:03'),
(960, 'I.2', 'Toilets are clean and well-maintained.', '[{\"evidence\":\"I.2\"}]', '943', 'item', NULL, NULL, NULL, '2024-02-17 17:05:18', '2024-02-17 17:05:18'),
(961, 'I.3', 'Electrical lines are safely installed and periodically checked.', '[{\"evidence\":\"I.3\"}]', '943', 'item', NULL, NULL, NULL, '2024-02-17 17:05:37', '2024-02-17 17:05:37'),
(962, 'I.4', 'Water facilities are functional and well-distributed in all buildings.', '[{\"evidence\":\"I.4\"}]', '943', 'item', NULL, NULL, NULL, '2024-02-17 17:05:56', '2024-02-17 17:05:56'),
(963, 'I.5', 'There is a periodic potability testing of drinking water.', '[{\"evidence\":\"I.5\"}]', '943', 'item', NULL, NULL, NULL, '2024-02-17 17:06:08', '2024-02-17 17:06:08'),
(964, 'I.6', 'Floor plans indicating fire exits and location of fire-fighting equipment,\nstandpipes, and other water sources are conspicuously displayed in each\nbuilding.', '[{\"evidence\":\"I.6\"}]', '943', 'item', NULL, NULL, NULL, '2024-02-17 17:06:19', '2024-02-17 17:06:19'),
(965, 'I.7', 'All school facilities are periodically subjected to pest control and inspection.', '[{\"evidence\":\"I.7\"}]', '943', 'item', NULL, NULL, NULL, '2024-02-17 17:06:31', '2024-02-17 17:06:31'),
(966, 'I.8', 'Smoking is strictly prohibited inside the campus.', '[{\"evidence\":\"I.8\"}]', '943', 'item', NULL, NULL, NULL, '2024-02-17 17:06:42', '2024-02-17 17:06:42'),
(967, 'I.9', 'Periodic drill on disaster and risk reduction (earthquake, flood, fire, etc.) is\nconducted.', '[{\"evidence\":\"I.9\"}]', '943', 'item', NULL, NULL, NULL, '2024-02-17 17:06:53', '2024-02-17 17:06:53'),
(968, 'O.1', 'The buildings and other facilities are safe, well-maintained and functional.', '[{\"evidence\":\"O.1\"}]', '944', 'item', NULL, NULL, NULL, '2024-02-17 17:07:14', '2024-02-17 17:07:14'),
(969, 'PARAMETER C:', 'CLASSROOMS', NULL, '916', 'param', NULL, NULL, NULL, '2024-02-17 17:27:58', '2024-02-17 17:27:58'),
(970, 'System - Inputs and Processes', NULL, NULL, '969', 'ind', '1', NULL, NULL, '2024-02-17 17:27:58', '2024-02-17 17:27:58'),
(971, 'Implementation', NULL, NULL, '969', 'ind', '2', NULL, NULL, '2024-02-17 17:27:58', '2024-02-17 17:27:58'),
(972, 'Outcome/s', NULL, NULL, '969', 'ind', '3', NULL, NULL, '2024-02-17 17:27:58', '2024-02-17 17:27:58'),
(973, 'S.1', 'Classroom size (1.5 sq. m. per student) meets standard specifications for\ninstruction.', '[{\"evidence\":\"S.1\"}]', '970', 'item', NULL, NULL, NULL, '2024-02-17 17:29:12', '2024-02-17 17:29:12'),
(974, 'S.2', 'The classrooms are well-lighted, ventilated and acoustically conditioned.', '[{\"evidence\":\"S.2\"}]', '970', 'item', NULL, NULL, NULL, '2024-02-17 17:29:29', '2024-02-17 17:29:29'),
(975, 'S.3', 'The classrooms are adequate and are provided with enough chairs, furniture and\nequipment.', '[{\"evidence\":\"S.3\"}]', '970', 'item', NULL, NULL, NULL, '2024-02-17 17:29:41', '2024-02-17 17:29:41'),
(976, 'S.4', 'There are sufficient supplies (chalkboards/ whiteboards, and instructional\nmaterials) in each classroom.', '[{\"evidence\":\"S.4\"}]', '970', 'item', NULL, NULL, NULL, '2024-02-17 17:29:53', '2024-02-17 17:29:53'),
(977, 'I.1', 'The classrooms are clearly marked and arranged relative to their functions.', '[{\"evidence\":\"I.1\"}]', '971', 'item', NULL, NULL, NULL, '2024-02-17 17:30:06', '2024-02-17 17:30:06'),
(978, 'I.2', 'The classrooms are well- maintained and free from interference.', '[{\"evidence\":\"I.2\"}]', '971', 'item', NULL, NULL, NULL, '2024-02-17 17:30:20', '2024-02-17 17:30:20'),
(979, 'I.3', 'Students cooperate in maintaining the cleanliness and orderliness of the\nclassrooms.', '[{\"evidence\":\"I.3\"}]', '971', 'item', NULL, NULL, NULL, '2024-02-17 17:30:31', '2024-02-17 17:30:31'),
(980, 'O.1', 'Classrooms are adequate and conducive to learning.', '[{\"evidence\":\"O.1\"}]', '972', 'item', NULL, NULL, NULL, '2024-02-17 17:30:44', '2024-02-17 17:30:44'),
(981, 'PARAMETER D:', 'OFFICES AND STAFFROOMS', NULL, '916', 'param', NULL, NULL, NULL, '2024-02-17 17:31:45', '2024-02-17 17:31:45'),
(982, 'System - Inputs and Processes', NULL, NULL, '981', 'ind', '1', NULL, NULL, '2024-02-17 17:31:45', '2024-02-17 17:31:45'),
(983, 'Implementation', NULL, NULL, '981', 'ind', '2', NULL, NULL, '2024-02-17 17:31:45', '2024-02-17 17:31:45'),
(984, 'Outcome/s', NULL, NULL, '981', 'ind', '3', NULL, NULL, '2024-02-17 17:31:45', '2024-02-17 17:31:45'),
(985, 'S.1', 'The administrative offices are accessible to stakeholders.', '[{\"evidence\":\"S.1\"}]', '982', 'item', NULL, NULL, NULL, '2024-02-17 17:32:01', '2024-02-17 17:32:01'),
(986, 'S.2', 'All offices are accessible and conveniently located in accordance with their\nfunctions.', '[{\"evidence\":\"S.2\"}]', '982', 'item', NULL, NULL, NULL, '2024-02-17 17:32:25', '2024-02-17 17:32:25'),
(987, 'S.3', 'There are offices and workspaces for all officials, faculty, and administrative\nstaff.', '[{\"evidence\":\"S.3\"}]', '982', 'item', NULL, NULL, NULL, '2024-02-17 17:32:37', '2024-02-17 17:32:37'),
(988, 'S.4', 'Administration and faculty offices and staff rooms are clean, well-lighted and\nventilated.', '[{\"evidence\":\"S.4\"}]', '982', 'item', NULL, NULL, NULL, '2024-02-17 17:32:52', '2024-02-17 17:32:52'),
(989, 'S.5', 'Function rooms and lounges are available and accessible.', '[{\"evidence\":\"S.5\"}]', '982', 'item', NULL, NULL, NULL, '2024-02-17 17:33:04', '2024-02-17 17:33:04'),
(990, 'S.6', 'Storerooms are strategically located.', '[{\"evidence\":\"S.6\"}]', '982', 'item', NULL, NULL, NULL, '2024-02-17 17:33:16', '2024-02-17 17:33:16'),
(991, 'S.7', 'There is an internal and external communication system.', '[{\"evidence\":\"S.7\"}]', '982', 'item', NULL, NULL, NULL, '2024-02-17 17:33:28', '2024-02-17 17:33:28'),
(992, 'S.8', 'There are clean toilets for administrators, faculty, staff, and students', '[{\"evidence\":\"S.8\"}]', '982', 'item', NULL, NULL, NULL, '2024-02-17 17:33:40', '2024-02-17 17:33:40'),
(993, 'I.1', 'All offices are well-maintained.', '[{\"evidence\":\"I.1\"}]', '983', 'item', NULL, NULL, NULL, '2024-02-17 17:34:01', '2024-02-17 17:34:01'),
(994, 'I.2', 'All offices are furnished with the necessary equipment, furniture, supplies and\nmaterials.', '[{\"evidence\":\"I.2\"}]', '983', 'item', NULL, NULL, NULL, '2024-02-17 17:34:14', '2024-02-17 17:34:14'),
(995, 'O.1', 'The offices and staff rooms are adequate and conducive to working environment.', '[{\"evidence\":\"O.1\"}]', '984', 'item', NULL, NULL, NULL, '2024-02-17 17:34:28', '2024-02-17 17:34:28'),
(996, 'PARAMETER E:', 'ASSEMBLY, ATHLETIC AND SPORTS FACILITIES', NULL, '916', 'param', NULL, NULL, NULL, '2024-02-17 17:34:53', '2024-02-17 17:34:53'),
(997, 'System - Inputs and Processes', NULL, NULL, '996', 'ind', '1', NULL, NULL, '2024-02-17 17:34:53', '2024-02-17 17:34:53'),
(998, 'Implementation', NULL, NULL, '996', 'ind', '2', NULL, NULL, '2024-02-17 17:34:53', '2024-02-17 17:34:53'),
(999, 'Outcome/s', NULL, NULL, '996', 'ind', '3', NULL, NULL, '2024-02-17 17:34:53', '2024-02-17 17:34:53'),
(1000, 'S.1', 'Function rooms for holding meetings, conferences, convocations and similar\nactivities are sufficient.', '[{\"evidence\":\"S.1\"}]', '997', 'item', NULL, NULL, NULL, '2024-02-17 17:35:17', '2024-02-17 17:35:17'),
(1001, 'S.2', 'Facilities for athletic sports, cultural activities, military training, etc. are\naccessible.', '[{\"evidence\":\"S.2\"}]', '997', 'item', NULL, NULL, NULL, '2024-02-17 17:35:29', '2024-02-17 17:35:29'),
(1002, 'S.3', 'The seating capacity conforms to standards.', '[{\"evidence\":\"S.3\"}]', '997', 'item', NULL, NULL, NULL, '2024-02-17 17:35:42', '2024-02-17 17:35:42'),
(1003, 'S.4', 'There are adequate and well-marked entry and exit points.', '[{\"evidence\":\"S.4\"}]', '997', 'item', NULL, NULL, NULL, '2024-02-17 17:35:54', '2024-02-17 17:35:54'),
(1004, 'S.5', 'There are storage facilities for athletic sports and other curricular training\nequipment.', '[{\"evidence\":\"S.5\"}]', '997', 'item', NULL, NULL, NULL, '2024-02-17 17:36:07', '2024-02-17 17:36:07'),
(1005, 'I.1', 'Indoor facilities are constructed with:', '[{\"evidence\":\"I.1\"}]', '998', 'item', NULL, NULL, NULL, '2024-02-17 17:36:20', '2024-02-17 17:36:20'),
(1007, 'I.1.1', 'appropriate flooring;', '[{\"evidence\":\"I.1.1\"}]', '1005', 'item', NULL, NULL, NULL, '2024-02-17 17:37:08', '2024-02-17 17:37:08'),
(1008, 'I.1.2', 'proper lighting and ventilation;', '[{\"evidence\":\"I.1.2\"}]', '1005', 'item', NULL, NULL, NULL, '2024-02-17 17:37:20', '2024-02-17 17:37:20'),
(1009, 'I.1.3', 'safety measures;', '[{\"evidence\":\"I.1.3\"}]', '1005', 'item', NULL, NULL, NULL, '2024-02-17 17:37:32', '2024-02-17 17:37:32'),
(1010, 'I.1.4', 'toilets;', '[{\"evidence\":\"I.1.4\"}]', '1005', 'item', NULL, NULL, NULL, '2024-02-17 17:37:44', '2024-02-17 17:37:44'),
(1011, 'I.1.5', 'functional drinking facilities; and', '[{\"evidence\":\"I.1.5\"}]', '1005', 'item', NULL, NULL, NULL, '2024-02-17 17:37:55', '2024-02-17 17:37:55'),
(1012, 'I.1.6', 'enough chairs.', '[{\"evidence\":\"I.1.6\"}]', '1005', 'item', NULL, NULL, NULL, '2024-02-17 17:38:10', '2024-02-17 17:38:10'),
(1013, 'I.2', 'The constructed outdoor facilities are:', '[{\"evidence\":\"I.2\"}]', '998', 'item', NULL, NULL, NULL, '2024-02-17 17:38:29', '2024-02-17 17:38:29'),
(1014, 'I.2.1', 'free from hazards;', '[{\"evidence\":\"I.2.1\"}]', '1013', 'item', NULL, NULL, NULL, '2024-02-17 17:38:41', '2024-02-17 17:38:41'),
(1015, 'I.2.2', 'suitably surfaced floor;', '[{\"evidence\":\"I.2.2\"}]', '1013', 'item', NULL, NULL, NULL, '2024-02-17 17:38:54', '2024-02-17 17:38:54'),
(1016, 'I.2.3', 'appropriately laid out for a variety of activities;', '[{\"evidence\":\"I.2.3\"}]', '1013', 'item', NULL, NULL, NULL, '2024-02-17 17:39:06', '2024-02-17 17:39:06'),
(1017, 'I.2.4', 'properly maintained and secured; and', '[{\"evidence\":\"I.2.4\"}]', '1013', 'item', NULL, NULL, NULL, '2024-02-17 17:39:19', '2024-02-17 17:39:19'),
(1018, 'I.2.5', 'Installed with a drainage system.', '[{\"evidence\":\"I.2.5\"}]', '1013', 'item', NULL, NULL, NULL, '2024-02-17 17:39:33', '2024-02-17 17:39:33'),
(1019, 'I.3', 'Assembly, athletic sports and cultural facilities are sufficient and varied to meet\nthe requirements of the institution.', '[{\"evidence\":\"I.3\"}]', '998', 'item', NULL, NULL, NULL, '2024-02-17 17:39:46', '2024-02-17 17:39:46'),
(1020, 'I.4', 'Audio-visual room and facilities with appropriate equipment are utilized in\nsupport of the teaching-learning such as but not limited to video/ overhead/ slide\nprojector, sound system, LCD projectors and screens.', '[{\"evidence\":\"I.4\"}]', '998', 'item', NULL, NULL, NULL, '2024-02-17 17:40:00', '2024-02-17 17:40:00'),
(1021, 'O.1', 'Indoor and outdoor facilities are well-equipped and properly maintained.', '[{\"evidence\":\"O.1\"}]', '999', 'item', NULL, NULL, NULL, '2024-02-17 17:40:14', '2024-02-17 17:40:14'),
(1022, 'PARAMETER F:', 'MEDICAL & DENTAL CLINIC', NULL, '916', 'param', NULL, NULL, NULL, '2024-02-17 17:40:47', '2024-02-17 17:40:47'),
(1023, 'System - Inputs and Processes', NULL, NULL, '1022', 'ind', '1', NULL, NULL, '2024-02-17 17:40:47', '2024-02-17 17:40:47'),
(1024, 'Implementation', NULL, NULL, '1022', 'ind', '2', NULL, NULL, '2024-02-17 17:40:47', '2024-02-17 17:40:47'),
(1025, 'Outcome/s', NULL, NULL, '1022', 'ind', '3', NULL, NULL, '2024-02-17 17:40:47', '2024-02-17 17:40:47'),
(1026, 'S.1', 'The Medical and Dental Clinic has basic facilities such as: reception area, records\nsection, examination/ treatment room and toilets.', '[{\"evidence\":\"S.1\"}]', '1023', 'item', NULL, NULL, NULL, '2024-02-17 17:41:03', '2024-02-17 17:41:03'),
(1027, 'S.2', 'The institution has a functional medical and dental section/area.', '[{\"evidence\":\"S.2\"}]', '1023', 'item', NULL, NULL, NULL, '2024-02-17 17:41:15', '2024-02-17 17:41:15'),
(1028, 'S.3', 'Potable water is available and sufficient.', '[{\"evidence\":\"S.3\"}]', '1023', 'item', NULL, NULL, NULL, '2024-02-17 17:41:27', '2024-02-17 17:41:27'),
(1029, 'S.4', 'Medical and dental equipment are provided.', '[{\"evidence\":\"S.4\"}]', '1023', 'item', NULL, NULL, NULL, '2024-02-17 17:41:39', '2024-02-17 17:41:39'),
(1030, 'S.5', 'There are enough medical and dental supplies and materials.', '[{\"evidence\":\"S.5\"}]', '1023', 'item', NULL, NULL, NULL, '2024-02-17 17:41:51', '2024-02-17 17:41:51'),
(1031, 'S.6', 'Storage facilities ( refrigerator, steel cabinets, etc.) are available.', '[{\"evidence\":\"S.6\"}]', '1023', 'item', NULL, NULL, NULL, '2024-02-17 17:42:04', '2024-02-17 17:42:04'),
(1032, 'S.7', 'Medical and dental supplies and materials are properly labeled.', '[{\"evidence\":\"S.7\"}]', '1023', 'item', NULL, NULL, NULL, '2024-02-17 17:42:16', '2024-02-17 17:42:16'),
(1033, 'S.8', 'The following basic medical equipment and medicines are all available:', '[{\"evidence\":\"S.8\"}]', '1023', 'item', NULL, NULL, NULL, '2024-02-17 17:42:29', '2024-02-17 17:42:29'),
(1034, 'S.8.1', 'emergency medicines;', '[{\"evidence\":\"S.8.1\"}]', '1033', 'item', NULL, NULL, NULL, '2024-02-17 17:42:45', '2024-02-17 17:42:45'),
(1035, 'S.8.2', 'ambobag;', '[{\"evidence\":\"S.8.2\"}]', '1033', 'item', NULL, NULL, NULL, '2024-02-17 17:42:57', '2024-02-17 17:42:57'),
(1036, 'S.8.3', 'oxygen tank;', '[{\"evidence\":\"S.8.3\"}]', '1033', 'item', NULL, NULL, NULL, '2024-02-17 17:43:10', '2024-02-17 17:43:10'),
(1037, 'S.8.4', 'intravenous fluid;', '[{\"evidence\":\"S.8.4\"}]', '1033', 'item', NULL, NULL, NULL, '2024-02-17 17:43:22', '2024-02-17 17:43:22'),
(1038, 'S.8.5', 'sphygmomanometer (at least 2 sets);', '[{\"evidence\":\"S.8.5\"}]', '1033', 'item', NULL, NULL, NULL, '2024-02-17 17:43:35', '2024-02-17 17:43:35'),
(1039, 'S.8.6', 'thermometer (at least 10 pcs);', '[{\"evidence\":\"S.8.6\"}]', '1033', 'item', NULL, NULL, NULL, '2024-02-17 17:43:48', '2024-02-17 17:43:48'),
(1040, 'S.8.7', 'diagnostic sets;', '[{\"evidence\":\"S.8.7\"}]', '1033', 'item', NULL, NULL, NULL, '2024-02-17 17:44:01', '2024-02-17 17:44:01'),
(1041, 'S.8.8', 'stethoscope (at least 2 units);', '[{\"evidence\":\"S.8.8\"}]', '1033', 'item', NULL, NULL, NULL, '2024-02-17 17:44:14', '2024-02-17 17:44:14'),
(1042, 'S.8.9', 'treatment cart; and', '[{\"evidence\":\"S.8.9\"}]', '1033', 'item', NULL, NULL, NULL, '2024-02-17 17:44:27', '2024-02-17 17:44:27'),
(1043, 'S.8.10', 'nebulizer.', '[{\"evidence\":\"S.8.10\"}]', '1033', 'item', NULL, NULL, NULL, '2024-02-17 17:44:41', '2024-02-17 17:44:41'),
(1044, 'S.9', 'The following basic dental equipment and apparatuses are available:', '[{\"evidence\":\"S.9\"}]', '1023', 'item', NULL, NULL, NULL, '2024-02-17 17:45:01', '2024-02-17 17:45:01'),
(1045, 'S.9.1', 'dental chair;', '[{\"evidence\":\"S.9.1\"}]', '1044', 'item', NULL, NULL, NULL, '2024-02-17 17:45:16', '2024-02-17 17:45:16'),
(1046, 'S.9.2', 'autoclave (sterilizer);', '[{\"evidence\":\"S.9.2\"}]', '1044', 'item', NULL, NULL, NULL, '2024-02-17 17:45:28', '2024-02-17 17:45:28'),
(1047, 'S.9.3', 'medical supplies;', '[{\"evidence\":\"S.9.3\"}]', '1044', 'item', NULL, NULL, NULL, '2024-02-17 17:45:42', '2024-02-17 17:45:42'),
(1048, 'S.9.4', 'filling instruments; and', '[{\"evidence\":\"S.9.4\"}]', '1044', 'item', NULL, NULL, NULL, '2024-02-17 17:45:55', '2024-02-17 17:45:55'),
(1049, 'S.9.5', 'basic instruments (forceps, mouth mirror, cotton fliers, explorer, etc).', '[{\"evidence\":\"S.9.5\"}]', '1044', 'item', NULL, NULL, NULL, '2024-02-17 17:46:09', '2024-02-17 17:46:09'),
(1050, 'S.10', 'The Medical/Dental Clinic has ample space, adequate lighting and ventilation.', '[{\"evidence\":\"S.10\"}]', '1023', 'item', NULL, NULL, NULL, '2024-02-17 17:46:24', '2024-02-17 17:46:24'),
(1051, 'I.1', 'The Medical and Dental Clinics are managed by qualified medical and dental\nofficers.', '[{\"evidence\":\"I.1\"}]', '1024', 'item', NULL, NULL, NULL, '2024-02-17 17:46:48', '2024-02-17 17:46:48'),
(1052, 'I.2', 'Distinct rooms and storage areas are properly labeled.', '[{\"evidence\":\"I.2\"}]', '1024', 'item', NULL, NULL, NULL, '2024-02-17 17:47:01', '2024-02-17 17:47:01'),
(1053, 'I.3', 'Medical and dental services are regularly monitored and evaluated.', '[{\"evidence\":\"I.3\"}]', '1024', 'item', NULL, NULL, NULL, '2024-02-17 17:47:14', '2024-02-17 17:47:14'),
(1054, 'O.1', 'The medical, dental clinic and services are functional.', '[{\"evidence\":\"O.1\"}]', '1025', 'item', NULL, NULL, NULL, '2024-02-17 17:47:27', '2024-02-17 17:47:27'),
(1055, 'PARAMETER G:', 'STUDENT CENTER', NULL, '916', 'param', NULL, NULL, NULL, '2024-02-17 17:47:56', '2024-02-17 17:47:56'),
(1056, 'System - Inputs and Processes', NULL, NULL, '1055', 'ind', '1', NULL, NULL, '2024-02-17 17:47:56', '2024-02-17 17:47:56'),
(1057, 'Implementation', NULL, NULL, '1055', 'ind', '2', NULL, NULL, '2024-02-17 17:47:56', '2024-02-17 17:47:56'),
(1058, 'Outcome/s', NULL, NULL, '1055', 'ind', '3', NULL, NULL, '2024-02-17 17:47:56', '2024-02-17 17:47:56'),
(1059, 'S.1', 'The institution has a Student Center with supplies and materials.', '[{\"evidence\":\"S.1\"}]', '1056', 'item', NULL, NULL, NULL, '2024-02-17 17:48:16', '2024-02-17 17:48:16'),
(1060, 'S.2', 'Policies and guidance on the proper utilization of Student Center are in place.', '[{\"evidence\":\"S.2\"}]', '1056', 'item', NULL, NULL, NULL, '2024-02-17 17:48:29', '2024-02-17 17:48:29'),
(1061, 'S.3', 'The Student Center is well-lighted and ventilated.', '[{\"evidence\":\"S.3\"}]', '1056', 'item', NULL, NULL, NULL, '2024-02-17 17:48:42', '2024-02-17 17:48:42'),
(1062, 'S.4', 'A conference room is available for students’ use.', '[{\"evidence\":\"S.4\"}]', '1056', 'item', NULL, NULL, NULL, '2024-02-17 17:48:54', '2024-02-17 17:48:54'),
(1063, 'S.5', 'There are facilities and equipment for table games, music appreciation, and TV or\nvideo viewing.', '[{\"evidence\":\"S.5\"}]', '1056', 'item', NULL, NULL, NULL, '2024-02-17 17:49:15', '2024-02-17 17:49:15'),
(1064, 'S.6', 'Cleaned and sanitary toilets, for men separate from those of women, are\navailable.', '[{\"evidence\":\"S.6\"}]', '1056', 'item', NULL, NULL, NULL, '2024-02-17 17:49:28', '2024-02-17 17:49:28'),
(1065, 'S.7', 'Toilet fixtures for students with special needs and PWD’s are provided.', '[{\"evidence\":\"S.7\"}]', '1056', 'item', NULL, NULL, NULL, '2024-02-17 17:49:42', '2024-02-17 17:49:42'),
(1066, 'S.8', 'There are officers for student leaders, the editorial staff of the student\npublication and the officers of other student organizations.', '[{\"evidence\":\"S.8\"}]', '1056', 'item', NULL, NULL, NULL, '2024-02-17 17:49:59', '2024-02-17 17:49:59'),
(1067, 'I.1', 'Student activities at the Student Center are regularly conducted and monitored.', '[{\"evidence\":\"I.1\"}]', '1057', 'item', NULL, NULL, NULL, '2024-02-17 17:50:12', '2024-02-17 17:50:12'),
(1068, 'I.2', 'The Student Center is properly maintained.', '[{\"evidence\":\"I.2\"}]', '1057', 'item', NULL, NULL, NULL, '2024-02-17 17:50:34', '2024-02-17 17:50:34'),
(1069, 'O.1', 'The Student Center is fully equipped and functional.', '[{\"evidence\":\"O.1\"}]', '1058', 'item', NULL, NULL, NULL, '2024-02-17 17:50:47', '2024-02-17 17:50:47'),
(1070, 'PARAMETER H:', 'FOOD SERVICES & CANTEEN', NULL, '916', 'param', NULL, NULL, NULL, '2024-02-17 17:51:25', '2024-02-17 17:51:25'),
(1071, 'System - Inputs and Processes', NULL, NULL, '1070', 'ind', '1', NULL, NULL, '2024-02-17 17:51:25', '2024-02-17 17:51:25'),
(1072, 'Implementation', NULL, NULL, '1070', 'ind', '2', NULL, NULL, '2024-02-17 17:51:25', '2024-02-17 17:51:25'),
(1073, 'Outcome/s', NULL, NULL, '1070', 'ind', '3', NULL, NULL, '2024-02-17 17:51:25', '2024-02-17 17:51:25'),
(1074, 'S.1', 'The canteen/cafeteria is well-lightened, ventilated, screened, and provided with\npotable water supply.', '[{\"evidence\":\"S.1\"}]', '1071', 'item', NULL, NULL, NULL, '2024-02-17 17:51:50', '2024-02-17 17:51:50'),
(1075, 'S.2', 'There are enough;', '[{\"evidence\":\"S.2\"}]', '1071', 'item', NULL, NULL, NULL, '2024-02-17 17:52:05', '2024-02-17 17:52:05'),
(1076, 'S.2.1', 'cooking and preparatory equipment;', '[{\"evidence\":\"S.2.1\"}]', '1075', 'item', NULL, NULL, NULL, '2024-02-17 17:52:20', '2024-02-17 17:52:20'),
(1077, 'S.2.2', 'serving tools and utensils;', '[{\"evidence\":\"S.2.2\"}]', '1075', 'item', NULL, NULL, NULL, '2024-02-17 17:52:34', '2024-02-17 17:52:34'),
(1078, 'S.2.3', 'cleaning supplies and materials; and', '[{\"evidence\":\"S.2.3\"}]', '1075', 'item', NULL, NULL, NULL, '2024-02-17 17:52:47', '2024-02-17 17:52:47'),
(1079, 'S.2.4', 'dining tables and chairs.', '[{\"evidence\":\"S.2.4\"}]', '1075', 'item', NULL, NULL, NULL, '2024-02-17 17:53:00', '2024-02-17 17:53:00'),
(1080, 'S.3', 'Wash area and toilets are available.', '[{\"evidence\":\"S.3\"}]', '1071', 'item', NULL, NULL, NULL, '2024-02-17 17:53:14', '2024-02-17 17:53:14'),
(1081, 'I.1', 'The institution requires business and sanitary permits for the operation of the\nFood Center/Cafeteria/Canteen.', '[{\"evidence\":\"I.1\"}]', '1072', 'item', NULL, NULL, NULL, '2024-02-17 17:53:33', '2024-02-17 17:53:33'),
(1082, 'I.2', 'Food served is varied, nutritious, safe and sold at an affordable price.', '[{\"evidence\":\"I.2\"}]', '1072', 'item', NULL, NULL, NULL, '2024-02-17 17:53:46', '2024-02-17 17:53:46'),
(1083, 'I.3', 'The Food Center/ Cafeteria/ Canteen is well-managed by qualified and\ncompetent staff.', '[{\"evidence\":\"I.3\"}]', '1072', 'item', NULL, NULL, NULL, '2024-02-17 17:53:58', '2024-02-17 17:53:58'),
(1084, 'I.4', 'Cleanliness and orderliness are enforced.', '[{\"evidence\":\"I.4\"}]', '1072', 'item', NULL, NULL, NULL, '2024-02-17 17:54:14', '2024-02-17 17:54:14'),
(1085, 'I.5', 'The food services are prompt.', '[{\"evidence\":\"I.5\"}]', '1072', 'item', NULL, NULL, NULL, '2024-02-17 17:54:27', '2024-02-17 17:54:27'),
(1086, 'O.1', 'The Canteen/Cafeteria/Food Center is well-patronized.', '[{\"evidence\":\"O.1\"}]', '1073', 'item', NULL, NULL, NULL, '2024-02-17 17:54:39', '2024-02-17 17:54:39'),
(1087, 'O.2', 'The food services generate income for the institution.', '[{\"evidence\":\"O.2\"}]', '1073', 'item', NULL, NULL, NULL, '2024-02-17 17:54:52', '2024-02-17 17:54:52'),
(1088, 'PARAMETER I:', 'ACCREDITATION CENTER', NULL, '916', 'param', NULL, NULL, NULL, '2024-02-17 17:55:30', '2024-02-17 17:55:46'),
(1089, 'System - Inputs and Processes', NULL, NULL, '1088', 'ind', '1', NULL, NULL, '2024-02-17 17:55:30', '2024-02-17 17:55:30'),
(1090, 'Implementation', NULL, NULL, '1088', 'ind', '2', NULL, NULL, '2024-02-17 17:55:30', '2024-02-17 17:55:30'),
(1091, 'Outcome/s', NULL, NULL, '1088', 'ind', '3', NULL, NULL, '2024-02-17 17:55:30', '2024-02-17 17:55:30'),
(1092, 'S.1', 'The Accreditation Center (AC) is accessible and conveniently located.', '[{\"evidence\":\"S.1\"}]', '1089', 'item', NULL, NULL, NULL, '2024-02-17 17:56:13', '2024-02-17 17:56:13'),
(1093, 'S.2', 'The AC has the following equipment and fixtures:', '[{\"evidence\":\"S.2\"}]', '1089', 'item', NULL, NULL, NULL, '2024-02-17 17:56:26', '2024-02-17 17:56:26'),
(1094, 'S.2.1', 'working tables and chairs;', '[{\"evidence\":\"S.2.1\"}]', '1093', 'item', NULL, NULL, NULL, '2024-02-17 17:56:41', '2024-02-17 17:56:41'),
(1095, 'S.2.2', 'cabinets for display and filing;', '[{\"evidence\":\"S.2.2\"}]', '1093', 'item', NULL, NULL, NULL, '2024-02-17 17:56:55', '2024-02-17 17:56:55'),
(1096, 'S.2.3', 'good ventilation and lighting;', '[{\"evidence\":\"S.2.3\"}]', '1093', 'item', NULL, NULL, NULL, '2024-02-17 17:57:31', '2024-02-17 17:57:31'),
(1097, 'S.2.4', 'computer unit;', '[{\"evidence\":\"S.2.4\"}]', '1093', 'item', NULL, NULL, NULL, '2024-02-17 17:57:44', '2024-02-17 17:57:44'),
(1098, 'S.2.5', 'toilets; and', '[{\"evidence\":\"S.2.5\"}]', '1093', 'item', NULL, NULL, NULL, '2024-02-17 17:57:58', '2024-02-17 17:57:58'),
(1099, 'S.2.6', 'lounge.', '[{\"evidence\":\"S.2.6\"}]', '1093', 'item', NULL, NULL, NULL, '2024-02-17 17:58:11', '2024-02-17 17:58:11'),
(1100, 'I.1', 'The Institution/ College/ Academic Unit maintains the AC with the required\nresources, furniture, and documents.', '[{\"evidence\":\"I.1\"}]', '1090', 'item', NULL, NULL, NULL, '2024-02-17 17:58:42', '2024-02-17 17:58:42'),
(1101, 'I.2', 'The AC is managed by a qualified and committed staff/ faculty.', '[{\"evidence\":\"I.2\"}]', '1090', 'item', NULL, NULL, NULL, '2024-02-17 17:58:55', '2024-02-17 17:58:55'),
(1102, 'I.3', 'Required documents/ information and exhibits are updated, systematically\npackaged and readily available.', '[{\"evidence\":\"I.3\"}]', '1090', 'item', NULL, NULL, NULL, '2024-02-17 17:59:09', '2024-02-17 17:59:09'),
(1103, 'O.1', 'The AC is well-equipped and managed.', '[{\"evidence\":\"O.1\"}]', '1091', 'item', NULL, NULL, NULL, '2024-02-17 17:59:25', '2024-02-17 17:59:25'),
(1104, 'AREA IX:', 'LABORATORIES', NULL, '2', 'area', NULL, NULL, NULL, '2024-02-17 18:01:02', '2024-02-17 18:01:02'),
(1105, 'PARAMETER A:', 'LABORATORIES, SHOPS OR FACILITIES', NULL, '1104', 'param', NULL, NULL, NULL, '2024-02-17 18:02:42', '2024-02-17 18:02:42'),
(1106, 'System - Inputs and Processes', NULL, NULL, '1105', 'ind', '1', NULL, NULL, '2024-02-17 18:02:42', '2024-02-17 18:02:42'),
(1107, 'Implementation', NULL, NULL, '1105', 'ind', '2', NULL, NULL, '2024-02-17 18:02:42', '2024-02-17 18:02:42'),
(1108, 'Outcome/s', NULL, NULL, '1105', 'ind', '3', NULL, NULL, '2024-02-17 18:02:42', '2024-02-17 18:02:42'),
(1109, 'S.1', 'The laboratory layout conforms to acceptable standards (RA 6541 National\nBuilding Code of the Philippines/PD 856 “Code of Sanitation of the Philippines)\nand to particular needs of the Information Technology Program.', '[{\"evidence\":\"S.1\"}]', '1106', 'item', NULL, NULL, NULL, '2024-02-17 18:02:59', '2024-02-17 18:02:59');
INSERT INTO `instruments_component` (`id`, `title`, `description`, `attachment`, `parent`, `category`, `indicator`, `action`, `exclude_rate`, `created_at`, `updated_at`) VALUES
(1110, 'S.2', 'Room lightings conform to the standard requirements of fluorescent bulbs\nrelative to the size of the room.', '[{\"evidence\":\"S.2\"}]', '1106', 'item', NULL, NULL, NULL, '2024-02-17 18:03:31', '2024-02-17 18:03:31'),
(1111, 'S.3', 'The laboratories are properly lighted and well-ventilated.', '[{\"evidence\":\"S.3\"}]', '1106', 'item', NULL, NULL, NULL, '2024-02-17 18:03:49', '2024-02-17 18:03:49'),
(1112, 'S.4', 'Each laboratory room has at least two exit doors that open outward.', '[{\"evidence\":\"S.4\"}]', '1106', 'item', NULL, NULL, NULL, '2024-02-17 18:04:03', '2024-02-17 18:04:03'),
(1113, 'S.5', 'There is a laboratory for shop work for specific technologies.', '[{\"evidence\":\"S.5\"}]', '1106', 'item', NULL, NULL, NULL, '2024-02-17 18:04:27', '2024-02-17 18:04:27'),
(1114, 'S.6', 'There is a computer laboratory with at least 15 usable computer units and printer.', '[{\"evidence\":\"S.6\"}]', '1106', 'item', NULL, NULL, NULL, '2024-02-17 18:04:41', '2024-02-17 18:04:41'),
(1115, 'S.7', 'A laboratory space of 2 sq.m. per student with a total area of 70 sq.m. is\nprovided.', '[{\"evidence\":\"S.7\"}]', '1106', 'item', NULL, NULL, NULL, '2024-02-17 18:04:55', '2024-02-17 18:04:55'),
(1116, 'I.1', 'Furniture/Equipment arrangement allows free flow of movement and enables\nstudents to work comfortably without interference.', '[{\"evidence\":\"I.1\"}]', '1107', 'item', NULL, NULL, NULL, '2024-02-17 18:05:26', '2024-02-17 18:05:26'),
(1117, 'I.2', 'Safety and precautionary measures are implemented.', '[{\"evidence\":\"I.2\"}]', '1107', 'item', NULL, NULL, NULL, '2024-02-17 18:05:49', '2024-02-17 18:05:49'),
(1118, 'I.3', 'Usable fire extinguishers are accessible to staff and students.', '[{\"evidence\":\"I.3\"}]', '1107', 'item', NULL, NULL, NULL, '2024-02-17 18:06:02', '2024-02-17 18:06:02'),
(1119, 'I.4', 'Laboratory Operations Manuals for the faculty and students are provided in each\nlaboratory.', '[{\"evidence\":\"I.4\"}]', '1107', 'item', NULL, NULL, NULL, '2024-02-17 18:06:15', '2024-02-17 18:06:15'),
(1120, 'I.5', 'Demonstrations and training on the use of fire extinguishers, first-aid kit and\nother emergency measures are periodically conducted.', '[{\"evidence\":\"I.5\"}]', '1107', 'item', NULL, NULL, NULL, '2024-02-17 18:06:29', '2024-02-17 18:06:29'),
(1121, 'I.6', 'A well-equipped first aid kit, charts for antidotes and neutralizing solutions are\nalways available in each laboratory room.', '[{\"evidence\":\"I.6\"}]', '1107', 'item', NULL, NULL, NULL, '2024-02-17 18:06:41', '2024-02-17 18:06:41'),
(1122, 'I.7', 'A student’s access to a computer is at least 15 hours per term for every subject.', '[{\"evidence\":\"I.7\"}]', '1107', 'item', NULL, NULL, NULL, '2024-02-17 18:06:59', '2024-02-17 18:06:59'),
(1123, 'I.8', 'Appropriate laboratories for general education subjects are adequately equipped\nand well-maintained.', '[{\"evidence\":\"I.8\"}]', '1107', 'item', NULL, NULL, NULL, '2024-02-17 18:07:13', '2024-02-17 18:07:13'),
(1124, 'I.9', 'A well-equipped Multimedia Center is maintained.', '[{\"evidence\":\"I.9\"}]', '1107', 'item', NULL, NULL, NULL, '2024-02-17 18:07:50', '2024-02-17 18:07:50'),
(1125, 'I.10', 'Gas, water and electricity are utilized for class practicum activities.', '[{\"evidence\":\"I.10\"}]', '1107', 'item', NULL, NULL, NULL, '2024-02-17 18:08:04', '2024-02-17 18:08:04'),
(1126, 'I.11', 'A demonstration table, equipped with sink, water, electrical and gas outlets, is\navailable and utilized.', '[{\"evidence\":\"I.11\"}]', '1107', 'item', NULL, NULL, NULL, '2024-02-17 18:08:17', '2024-02-17 18:08:17'),
(1127, 'I.12', 'Laboratory supplies and equipment are kept in separate stocks rooms.', '[{\"evidence\":\"I.12\"}]', '1107', 'item', NULL, NULL, NULL, '2024-02-17 18:08:40', '2024-02-17 18:08:40'),
(1128, 'O.1', 'The laboratories and shops are well-equipped, function and are conducive to\nlearning.', '[{\"evidence\":\"O.1\"}]', '1108', 'item', NULL, NULL, NULL, '2024-02-17 18:08:56', '2024-02-17 18:08:56'),
(1129, 'PARAMETER B:', 'EQUIPMENT AND SUPPLIES', NULL, '1104', 'param', NULL, NULL, NULL, '2024-02-17 18:09:37', '2024-02-17 18:09:37'),
(1130, 'System - Inputs and Processes', NULL, NULL, '1129', 'ind', '1', NULL, NULL, '2024-02-17 18:09:38', '2024-02-17 18:09:38'),
(1131, 'Implementation', NULL, NULL, '1129', 'ind', '2', NULL, NULL, '2024-02-17 18:09:38', '2024-02-17 18:09:38'),
(1132, 'Outcome/s', NULL, NULL, '1129', 'ind', '3', NULL, NULL, '2024-02-17 18:09:38', '2024-02-17 18:09:38'),
(1133, 'S.1', 'The equipment, supplies and materials are available in the laboratories and\nshops.', '[{\"evidence\":\"S.1\"}]', '1130', 'item', NULL, NULL, NULL, '2024-02-17 18:09:55', '2024-02-17 18:09:55'),
(1134, 'S.2', 'Apparatuses, tools and materials conform to the specifications required for the\nsubjects in accordance with the CMO of the program.', '[{\"evidence\":\"S.2\"}]', '1130', 'item', NULL, NULL, NULL, '2024-02-17 18:10:15', '2024-02-17 18:10:15'),
(1135, 'S.3', 'Varied computer software are available.', '[{\"evidence\":\"S.3\"}]', '1130', 'item', NULL, NULL, NULL, '2024-02-17 18:10:29', '2024-02-17 18:10:29'),
(1136, 'I.1', 'Equipment are well-maintained.', '[{\"evidence\":\"I.1\"}]', '1131', 'item', NULL, NULL, NULL, '2024-02-17 18:10:43', '2024-02-17 18:10:43'),
(1137, 'I.2', 'Laboratory supplies and materials are wisely utilized', '[{\"evidence\":\"I.2\"}]', '1131', 'item', NULL, NULL, NULL, '2024-02-17 18:10:56', '2024-02-17 18:10:56'),
(1138, 'I.3', 'Licensed computer software are installed and utilized.', '[{\"evidence\":\"I.3\"}]', '1131', 'item', NULL, NULL, NULL, '2024-02-17 18:11:09', '2024-02-17 18:11:09'),
(1139, 'O.1', 'The laboratory equipment, supplies and materials are sufficient and wisely\nutilized.', '[{\"evidence\":\"O.1\"}]', '1132', 'item', NULL, NULL, NULL, '2024-02-17 18:11:24', '2024-02-17 18:11:24'),
(1140, 'PARAMETER C:', 'MAINTENANCE', NULL, '1104', 'param', NULL, NULL, NULL, '2024-02-17 18:11:46', '2024-02-17 18:11:46'),
(1141, 'System - Inputs and Processes', NULL, NULL, '1140', 'ind', '1', NULL, NULL, '2024-02-17 18:11:46', '2024-02-17 18:11:46'),
(1142, 'Implementation', NULL, NULL, '1140', 'ind', '2', NULL, NULL, '2024-02-17 18:11:46', '2024-02-17 18:11:46'),
(1143, 'Outcome/s', NULL, NULL, '1140', 'ind', '3', NULL, NULL, '2024-02-17 18:11:46', '2024-02-17 18:11:46'),
(1144, 'S.1', 'The A laboratory technician/assistant is available for the proper upkeep of\nlaboratory.', '[{\"evidence\":\"S.1\"}]', '1141', 'item', NULL, NULL, NULL, '2024-02-17 18:12:07', '2024-02-17 18:12:07'),
(1145, 'S.2', 'The institution has a Maintenance and Repair Department/Unit manned by skilled\npersonnel who provide service on direct call.', '[{\"evidence\":\"S.2\"}]', '1141', 'item', NULL, NULL, NULL, '2024-02-17 18:12:21', '2024-02-17 18:12:21'),
(1146, 'S.2.1', 'inventory of equipment and supplies;', '[{\"evidence\":\"S.2.1\"}]', '1145', 'item', NULL, NULL, NULL, '2024-02-17 18:12:45', '2024-02-17 18:12:45'),
(1147, 'S.2.2', 'checking on the physical condition of equipment and supplies; and', '[{\"evidence\":\"S.2.2\"}]', '1145', 'item', NULL, NULL, NULL, '2024-02-17 18:12:58', '2024-02-17 18:12:58'),
(1148, 'S.2.3', 'maintenance of the laboratories and shop.', '[{\"evidence\":\"S.2.3\"}]', '1145', 'item', NULL, NULL, NULL, '2024-02-17 18:13:12', '2024-02-17 18:13:12'),
(1150, 'I.1', 'The institution keeps the laboratories neat and orderly.', '[{\"evidence\":\"I.1\"}]', '1142', 'item', NULL, NULL, NULL, '2024-02-17 18:14:27', '2024-02-17 18:14:27'),
(1151, 'I.2', 'Laboratory supplies and materials are regularly replenished/replaced whenever\napplicable.', '[{\"evidence\":\"I.2\"}]', '1142', 'item', NULL, NULL, NULL, '2024-02-17 18:14:43', '2024-02-17 18:14:43'),
(1152, 'I.3', 'The inventory of laboratory facilities and equipment is systematically and\nperiodically conducted.', '[{\"evidence\":\"I.3\"}]', '1142', 'item', NULL, NULL, NULL, '2024-02-17 18:14:57', '2024-02-17 18:14:57'),
(1153, 'I.4', 'The laboratory equipment/instruments are in good condition and are periodically\ncalibrated.', '[{\"evidence\":\"I.4\"}]', '1142', 'item', NULL, NULL, NULL, '2024-02-17 18:15:12', '2024-02-17 18:15:12'),
(1154, 'I.5', 'All equipment are coded, listed and inventoried.', '[{\"evidence\":\"I.5\"}]', '1142', 'item', NULL, NULL, NULL, '2024-02-17 18:15:26', '2024-02-17 18:15:26'),
(1155, 'I.6', 'Waste disposal is efficiently and effectively managed on campus.', '[{\"evidence\":\"I.6\"}]', '1142', 'item', NULL, NULL, NULL, '2024-02-17 18:15:46', '2024-02-17 18:15:46'),
(1156, 'I.7', 'The following are properly maintained by trained staff/technicians:', '[{\"evidence\":\"I.7\"}]', '1142', 'item', NULL, NULL, NULL, '2024-02-17 18:16:18', '2024-02-17 18:16:18'),
(1157, 'I.7.1', 'shops;', '[{\"evidence\":\"I.7.1\"}]', '1156', 'item', NULL, NULL, NULL, '2024-02-17 18:17:12', '2024-02-17 18:17:12'),
(1158, 'I.7.2', 'computer laboratory;', '[{\"evidence\":\"I.7.2\"}]', '1156', 'item', NULL, NULL, NULL, '2024-02-17 18:17:26', '2024-02-17 18:17:26'),
(1159, 'I.7.3', 'multi-media/educational technology center;', '[{\"evidence\":\"I.7.3\"}]', '1156', 'item', NULL, NULL, NULL, '2024-02-17 18:17:40', '2024-02-17 18:17:40'),
(1160, 'I.7.4', 'research facility;', '[{\"evidence\":\"I.7.4\"}]', '1156', 'item', NULL, NULL, NULL, '2024-02-17 18:17:54', '2024-02-17 18:17:54'),
(1161, 'I.7.5', 'general education laboratory; and', '[{\"evidence\":\"I.7.5\"}]', '1156', 'item', NULL, NULL, NULL, '2024-02-17 18:18:08', '2024-02-17 18:18:08'),
(1162, 'I.7.5.1', 'natural science/physical science;', '[{\"evidence\":\"I.7.5.1\"}]', '1161', 'item', NULL, NULL, NULL, '2024-02-17 18:18:24', '2024-02-17 18:18:24'),
(1163, 'I.7.5.2', 'speech laboratory;', '[{\"evidence\":\"I.7.5.2\"}]', '1161', 'item', NULL, NULL, NULL, '2024-02-17 18:18:38', '2024-02-17 18:18:38'),
(1164, 'I.7.5.3', 'physical education; and', '[{\"evidence\":\"I.7.5.3\"}]', '1161', 'item', NULL, NULL, NULL, '2024-02-17 18:18:52', '2024-02-17 18:18:52'),
(1165, 'I.7.5.4', 'others (please specify).', '[{\"evidence\":\"I.7.5.4\"}]', '1161', 'item', NULL, NULL, NULL, '2024-02-17 18:19:09', '2024-02-17 18:19:09'),
(1166, 'O.1', 'The laboratories and shops are functional and are properly maintained.', '[{\"evidence\":\"O.1\"}]', '1143', 'item', NULL, NULL, NULL, '2024-02-17 18:19:24', '2024-02-17 18:19:24'),
(1167, 'PARAMETER D:', 'SPECIAL PROVISIONS', NULL, '1104', 'param', NULL, NULL, NULL, '2024-02-17 18:20:14', '2024-02-17 18:20:14'),
(1168, 'System - Inputs and Processes', NULL, NULL, '1167', 'ind', '1', NULL, NULL, '2024-02-17 18:20:14', '2024-02-17 18:20:14'),
(1169, 'Implementation', NULL, NULL, '1167', 'ind', '2', NULL, NULL, '2024-02-17 18:20:14', '2024-02-17 18:20:14'),
(1170, 'Outcome/s', NULL, NULL, '1167', 'ind', '3', NULL, NULL, '2024-02-17 18:20:14', '2024-02-17 18:20:14'),
(1171, 'S.1', 'Specific program requirements (listing of materials and equipment as per CMO)\nare in accordance with guidelines/policies embodied in official issuance.', '[{\"evidence\":\"S.1\"}]', '1168', 'item', NULL, NULL, NULL, '2024-02-17 18:20:38', '2024-02-17 18:20:38'),
(1172, 'S.2', 'There is an approved Project Procurement Management Plan (PPMP).', '[{\"evidence\":\"S.2\"}]', '1168', 'item', NULL, NULL, NULL, '2024-02-17 18:20:52', '2024-02-17 18:20:52'),
(1173, 'S.3', 'There is an approved Annual Procurement Plan (AAP) for laboratory equipment,\nsupplies and material.', '[{\"evidence\":\"S.3\"}]', '1168', 'item', NULL, NULL, NULL, '2024-02-17 18:21:08', '2024-02-17 18:21:08'),
(1174, 'I.1', 'The institution implements the special provision as listed in the CMO.', '[{\"evidence\":\"I.1\"}]', '1169', 'item', NULL, NULL, NULL, '2024-02-17 18:21:22', '2024-02-17 18:21:22'),
(1175, 'O.1', 'The special provision in the CMO of the program are complied with.', '[{\"evidence\":\"O.1\"}]', '1170', 'item', NULL, NULL, NULL, '2024-02-17 18:21:36', '2024-02-17 18:21:36'),
(1176, 'AREA X:', 'ADMINISTRATION', NULL, '2', 'area', NULL, NULL, NULL, '2024-02-17 18:22:50', '2024-02-17 18:22:50'),
(1177, 'PARAMETER A:', 'ORGANIZATION', NULL, '1176', 'param', NULL, NULL, NULL, '2024-02-17 18:23:15', '2024-02-17 18:23:15'),
(1178, 'System - Inputs and Processes', NULL, NULL, '1177', 'ind', '1', NULL, NULL, '2024-02-17 18:23:15', '2024-02-17 18:23:15'),
(1179, 'Implementation', NULL, NULL, '1177', 'ind', '2', NULL, NULL, '2024-02-17 18:23:15', '2024-02-17 18:23:15'),
(1180, 'Outcome/s', NULL, NULL, '1177', 'ind', '3', NULL, NULL, '2024-02-17 18:23:15', '2024-02-17 18:23:15'),
(1181, 'S.1', 'The institution has an organizational structure approved by the Board of\nRegents/Trustees (BOR/BOT)', '[{\"evidence\":\"S.1\"}]', '1178', 'item', NULL, NULL, NULL, '2024-02-17 18:23:41', '2024-02-17 18:23:41'),
(1182, 'S.2', 'Every office/unit in the original structure has functions approved by the BOR/BOT.', '[{\"evidence\":\"S.2\"}]', '1178', 'item', NULL, NULL, NULL, '2024-02-17 18:23:55', '2024-02-17 18:23:55'),
(1183, 'I.1', 'The institution is subdivided into administrative units in accordance with the\norganizational structure.', '[{\"evidence\":\"I.1\"}]', '1179', 'item', NULL, NULL, NULL, '2024-02-17 18:24:11', '2024-02-17 18:24:11'),
(1184, 'I.2', 'The functions, duties and responsibilities of administrative personnel/staff in\neach unit/office are identified and carried out.', '[{\"evidence\":\"I.2\"}]', '1179', 'item', NULL, NULL, NULL, '2024-02-17 18:24:37', '2024-02-17 18:24:37'),
(1185, 'I.3', 'The Board of Regents/Trustees is supportive with the growth and development of\nthe institution.', '[{\"evidence\":\"I.3\"}]', '1179', 'item', NULL, NULL, NULL, '2024-02-17 18:24:52', '2024-02-17 18:24:52'),
(1186, 'I.4', 'The Academic and Administrative Councils exercise their powers and perform\ntheir functions.', '[{\"evidence\":\"I.4\"}]', '1179', 'item', NULL, NULL, NULL, '2024-02-17 18:25:09', '2024-02-17 18:25:09'),
(1187, 'I.5', 'The flow of communication among and within units/departments is observed.', '[{\"evidence\":\"I.5\"}]', '1179', 'item', NULL, NULL, NULL, '2024-02-17 18:25:24', '2024-02-17 18:25:24'),
(1188, 'O.1', 'The institution has a well-designed and functional organizational structure.', '[{\"evidence\":\"O.1\"}]', '1180', 'item', NULL, NULL, NULL, '2024-02-17 18:25:38', '2024-02-17 18:25:38'),
(1189, 'PARAMETER B:', 'ACADEMIC ADMINISTRATION', NULL, '1176', 'param', NULL, NULL, NULL, '2024-02-17 18:26:00', '2024-02-17 18:26:00'),
(1190, 'System - Inputs and Processes', NULL, NULL, '1189', 'ind', '1', NULL, NULL, '2024-02-17 18:26:00', '2024-02-17 18:26:00'),
(1191, 'Implementation', NULL, NULL, '1189', 'ind', '2', NULL, NULL, '2024-02-17 18:26:00', '2024-02-17 18:26:00'),
(1192, 'Outcome/s', NULL, NULL, '1189', 'ind', '3', NULL, NULL, '2024-02-17 18:26:00', '2024-02-17 18:26:00'),
(1193, 'S.1', 'The Dean/Academic Unit Head possesses the required educational qualification,\nexperience and other prescribed requirements needed to administer the\nCollege/Academic Unit, as follows:', '[{\"evidence\":\"S.1\"}]', '1190', 'item', NULL, NULL, NULL, '2024-02-17 18:26:57', '2024-02-17 18:26:57'),
(1194, 'S.1.1', 'MS in ITE program. at least three (3) years of IT work/consultancy\nexperience and at least three (3) years of ITE teaching experience beyond\ncomputer literacy both of which must be within the last five (5) years;', '[{\"evidence\":\"S.1.1\"}]', '1193', 'item', NULL, NULL, NULL, '2024-02-17 18:27:13', '2024-02-17 18:27:13'),
(1195, 'S.1.2', 'PhD/MS in an ITE allied program and any of the following:', '[{\"evidence\":\"S.1.2\"}]', '1193', 'item', NULL, NULL, NULL, '2024-02-17 18:27:28', '2024-02-17 18:27:28'),
(1196, 'S.1.2.1', 'Completion of coursework requirements;', '[{\"evidence\":\"S.1.2.1\"}]', '1195', 'item', NULL, NULL, NULL, '2024-02-17 18:27:45', '2024-02-17 18:27:45'),
(1197, 'S.1.2.2', 'Five (5) years experience in systems design, applications\nprogramming, IT project management, or information technology research\nwithin the last eight (8) years.', '[{\"evidence\":\"S.1.2.2\"}]', '1195', 'item', NULL, NULL, NULL, '2024-02-17 18:28:00', '2024-02-17 18:28:00'),
(1198, 'S.1.3', 'Doctorate in an ITE program and at least three (3) years of IT\nwork/consultancy experience within the last five (5) years;', '[{\"evidence\":\"S.1.3\"}]', '1193', 'item', NULL, NULL, NULL, '2024-02-17 18:28:37', '2024-02-17 18:28:37'),
(1199, 'S.1.4', 'Doctorate in an allied program, at least three (3) years of\nwork/consultancy experience, at least five (5) years of teaching experience\nbeyond computer literacy both of which must be within the last five (5)\nyears.', '[{\"evidence\":\"S.1.4\"}]', '1193', 'item', NULL, NULL, NULL, '2024-02-17 18:28:52', '2024-02-17 18:28:52'),
(1200, 'S.2', 'The Department Chair/s, or their equivalent has appropriate/relevant educational\nqualification and experience.', '[{\"evidence\":\"S.2\"}]', '1190', 'item', NULL, NULL, NULL, '2024-02-17 18:29:15', '2024-02-17 18:29:15'),
(1201, 'I.1', 'The Dean is assisted by Department Chair/s or their equivalent with\nappropriate/relevant educational qualification and experience as follows:', '[{\"evidence\":\"I.1\"}]', '1191', 'item', NULL, NULL, NULL, '2024-02-17 18:29:38', '2024-02-17 18:29:38'),
(1202, 'I.1.1', 'Master’s degree in any ITE program;', '[{\"evidence\":\"I.1.1\"}]', '1201', 'item', NULL, NULL, NULL, '2024-02-17 18:30:04', '2024-02-17 18:30:04'),
(1203, 'I.1.2', 'Master’s degree in an ITE allied program and at least any of the following:', '[{\"evidence\":\"I.1.2\"}]', '1201', 'item', NULL, NULL, NULL, '2024-02-17 18:30:20', '2024-02-17 18:30:20'),
(1204, 'I.1.2.1', 'Completion of coursework requirements for a master’s degree in any\nof the ITE programs;', '[{\"evidence\":\"I.1.2.1\"}]', '1203', 'item', NULL, NULL, NULL, '2024-02-17 18:30:42', '2024-02-17 18:30:42'),
(1205, 'I.1.2.2', 'Five (5) years experience in systems design, applications\nprogramming, IT project management, or information technology\nresearch within the last eight (8) years', '[{\"evidence\":\"I.1.2.2\"}]', '1203', 'item', NULL, NULL, NULL, '2024-02-17 18:31:03', '2024-02-17 18:31:03'),
(1206, 'I.1.3', 'Doctorate in an ITE allied program and five (5) years experience teaching\nITE (beyond computer literacy courses) within the last eight (8) years.', '[{\"evidence\":\"I.1.3\"}]', '1201', 'item', NULL, NULL, NULL, '2024-02-17 18:31:40', '2024-02-17 18:31:40'),
(1207, 'I.2', 'The Dean implements a supervisory program.', '[{\"evidence\":\"I.2\"}]', '1191', 'item', NULL, NULL, NULL, '2024-02-17 18:31:57', '2024-02-17 18:31:57'),
(1208, 'I.3', 'The Dean participates in the recruitment and promotion of faculty and support\nstaff.', '[{\"evidence\":\"I.3\"}]', '1191', 'item', NULL, NULL, NULL, '2024-02-17 18:32:13', '2024-02-17 18:32:13'),
(1209, 'I.4', 'The Dean, the faculty and the administration work together for the improvement\nof the College/Academic Unit, particularly in:', '[{\"evidence\":\"I.4\"}]', '1191', 'item', NULL, NULL, NULL, '2024-02-17 18:33:07', '2024-02-17 18:33:07'),
(1210, 'I.4.1', 'Setting standards and targets;', '[{\"evidence\":\"I.4.1\"}]', '1209', 'item', NULL, NULL, NULL, '2024-02-17 18:33:24', '2024-02-17 18:33:24'),
(1211, 'I.4.2', 'Planning of programs and other related activities;', '[{\"evidence\":\"I.4.2\"}]', '1209', 'item', NULL, NULL, NULL, '2024-02-17 18:33:38', '2024-02-17 18:33:38'),
(1212, 'I.4.3', 'Implementing, monitoring and evaluation of plans, programs and other related activities;', '[{\"evidence\":\"I.4.3\"}]', '1209', 'item', NULL, NULL, NULL, '2024-02-17 18:33:59', '2024-02-17 18:33:59'),
(1213, 'I.4.4', 'Establishing linkages, partnerships and networking activities;', '[{\"evidence\":\"I.4.4\"}]', '1209', 'item', NULL, NULL, NULL, '2024-02-17 18:34:13', '2024-02-17 18:34:13'),
(1214, 'I.4.5', 'Providing professional growth and development opportunities for faculty and staff;', '[{\"evidence\":\"I.4.5\"}]', '1209', 'item', NULL, NULL, NULL, '2024-02-17 18:34:40', '2024-02-17 18:34:40'),
(1215, 'I.4.6', 'Preparing policies and guidelines on the internal administration and operation of the College/Academic Unit; and', '[{\"evidence\":\"I.4.6\"}]', '1209', 'item', NULL, NULL, NULL, '2024-02-17 18:35:04', '2024-02-17 18:35:04'),
(1216, 'I.4.7', 'Preparing guidelines on the proper use and maintenance of facilities, equipment, supplies and materials, etc.', '[{\"evidence\":\"I.4.7\"}]', '1209', 'item', NULL, NULL, NULL, '2024-02-17 18:35:25', '2024-02-17 18:35:25'),
(1217, 'I.5', 'Definite criteria and procedures in the selection and promotion of the facilities,\nmost qualified faculty and staff are enforced.', '[{\"evidence\":\"I.5\"}]', '1191', 'item', NULL, NULL, NULL, '2024-02-17 18:35:40', '2024-02-17 18:35:40'),
(1218, 'I.6', 'The Dean, faculty, and staff and students pursue collaborative activities in\ngenerating resources and income, and in implementing cost-effective measures.', '[{\"evidence\":\"I.6\"}]', '1191', 'item', NULL, NULL, NULL, '2024-02-17 18:35:54', '2024-02-17 18:35:54'),
(1219, 'I.7', 'The Dean implements policies and procedures on internal administration and\noperations of the College/Academic Unit', '[{\"evidence\":\"I.7\"}]', '1191', 'item', NULL, NULL, NULL, '2024-02-17 18:36:09', '2024-02-17 18:36:09'),
(1220, 'O.1', 'The College/Academic. Unit is efficiently and effectively managed.', '[{\"evidence\":\"O.1\"}]', '1192', 'item', NULL, NULL, NULL, '2024-02-17 18:36:48', '2024-02-17 18:36:48'),
(1221, 'PARAMETER C:', 'STUDENT ADMINISTRATION', NULL, '1176', 'param', NULL, NULL, NULL, '2024-02-17 18:37:13', '2024-02-17 18:37:13'),
(1222, 'System - Inputs and Processes', NULL, NULL, '1221', 'ind', '1', NULL, NULL, '2024-02-17 18:37:13', '2024-02-17 18:37:13'),
(1223, 'Implementation', NULL, NULL, '1221', 'ind', '2', NULL, NULL, '2024-02-17 18:37:13', '2024-02-17 18:37:13'),
(1224, 'Outcome/s', NULL, NULL, '1221', 'ind', '3', NULL, NULL, '2024-02-17 18:37:13', '2024-02-17 18:37:13'),
(1225, 'S.1', 'The institution has an approved printed Student Handbook/Manual containing\npolicies and guidelines on the following aspects of student life:', '[{\"evidence\":\"S.1\"}]', '1222', 'item', NULL, NULL, NULL, '2024-02-17 18:37:36', '2024-02-17 18:37:36'),
(1226, 'S.1.1', 'Admission and retention;', '[{\"evidence\":\"S.1.1\"}]', '1225', 'item', NULL, NULL, NULL, '2024-02-17 18:37:56', '2024-02-17 18:37:56'),
(1227, 'S.1.2', 'Registration requirements;', '[{\"evidence\":\"S.1.2\"}]', '1225', 'item', NULL, NULL, NULL, '2024-02-17 18:38:21', '2024-02-17 18:38:21'),
(1228, 'S.1.3', 'School fees;', '[{\"evidence\":\"S.1.3\"}]', '1225', 'item', NULL, NULL, NULL, '2024-02-17 18:38:36', '2024-02-17 18:38:36'),
(1229, 'S.1.4', 'Academic load; and', '[{\"evidence\":\"S.1.4\"}]', '1225', 'item', NULL, NULL, NULL, '2024-02-17 18:38:51', '2024-02-17 18:38:51'),
(1230, 'S.1.5', 'Transfers;', '[{\"evidence\":\"S.1.5\"}]', '1225', 'item', NULL, NULL, NULL, '2024-02-17 18:39:06', '2024-02-17 18:39:06'),
(1231, 'S.1.6', 'Residence, course work, scholastic and graduation requirements;', '[{\"evidence\":\"S.1.6\"}]', '1225', 'item', NULL, NULL, NULL, '2024-02-17 18:39:21', '2024-02-17 18:39:21'),
(1232, 'S.1.7', 'Examination and grading system;', '[{\"evidence\":\"S.1.7\"}]', '1225', 'item', NULL, NULL, NULL, '2024-02-17 18:39:38', '2024-02-17 18:39:38'),
(1233, 'S.1.8', 'Scholarships/grants/assistantships;', '[{\"evidence\":\"S.1.8\"}]', '1225', 'item', NULL, NULL, NULL, '2024-02-17 18:39:54', '2024-02-17 18:39:54'),
(1234, 'S.1.9', 'Shifting and adding/dropping of course/s/subject/s;', '[{\"evidence\":\"S.1.9\"}]', '1225', 'item', NULL, NULL, NULL, '2024-02-17 18:40:08', '2024-02-17 18:40:08'),
(1235, 'S.1.10', 'Code of conduct and discipline;', '[{\"evidence\":\"S.1.10\"}]', '1225', 'item', NULL, NULL, NULL, '2024-02-17 18:40:23', '2024-02-17 18:40:23'),
(1236, 'S.1.11', 'Attendance; and', '[{\"evidence\":\"S.1.11\"}]', '1225', 'item', NULL, NULL, NULL, '2024-02-17 18:40:38', '2024-02-17 18:40:38'),
(1237, 'S.1.12', 'Others (please specify)', '[{\"evidence\":\"S.1.12\"}]', '1225', 'item', NULL, NULL, NULL, '2024-02-17 18:40:57', '2024-02-17 18:40:57'),
(1238, 'I.1', 'Students are provided opportunities to participate in the planning and\nimplementation of activities concerning their welfare.', '[{\"evidence\":\"I.1\"}]', '1223', 'item', NULL, NULL, NULL, '2024-02-17 18:41:16', '2024-02-17 18:41:16'),
(1239, 'I.2', 'Concerned officials, faculty and staff act promptly on requests, needs, and\nproblems of the students.', '[{\"evidence\":\"I.2\"}]', '1223', 'item', NULL, NULL, NULL, '2024-02-17 18:41:30', '2024-02-17 18:41:30'),
(1240, 'I.3', 'The administration, faculty, staff and students work harmoniously and maintain\ngood working relationship.', '[{\"evidence\":\"I.3\"}]', '1223', 'item', NULL, NULL, NULL, '2024-02-17 18:41:45', '2024-02-17 18:41:45'),
(1241, 'O.1', 'The institution has an effective and functional Student Administration.', '[{\"evidence\":\"O.1\"}]', '1224', 'item', NULL, NULL, NULL, '2024-02-17 18:42:08', '2024-02-17 18:42:08'),
(1242, 'O.2', 'Policy implementation is efficient.', '[{\"evidence\":\"O.2\"}]', '1224', 'item', NULL, NULL, NULL, '2024-02-17 18:42:36', '2024-02-17 18:42:36'),
(1243, 'PARAMETER D:', 'FINANCIAL MANAGEMENT', NULL, '1176', 'param', NULL, NULL, NULL, '2024-02-17 18:42:57', '2024-02-17 18:42:57'),
(1244, 'System - Inputs and Processes', NULL, NULL, '1243', 'ind', '1', NULL, NULL, '2024-02-17 18:42:57', '2024-02-17 18:42:57'),
(1245, 'Implementation', NULL, NULL, '1243', 'ind', '2', NULL, NULL, '2024-02-17 18:42:57', '2024-02-17 18:42:57'),
(1246, 'Outcome/s', NULL, NULL, '1243', 'ind', '3', NULL, NULL, '2024-02-17 18:42:57', '2024-02-17 18:42:57'),
(1247, 'S.1', 'The institution has an approved Financial Development Plan (FDP).', '[{\"evidence\":\"S.1\"}]', '1244', 'item', NULL, NULL, NULL, '2024-02-17 18:43:18', '2024-02-17 18:43:18'),
(1248, 'S.2', 'The approved budget is in consonance with the FDP.', '[{\"evidence\":\"S.2\"}]', '1244', 'item', NULL, NULL, NULL, '2024-02-17 18:43:35', '2024-02-17 18:43:35'),
(1249, 'S.3', 'The Institution has specific budgetary allotment for the following:', '[{\"evidence\":\"S.3\"}]', '1244', 'item', NULL, NULL, NULL, '2024-02-17 18:43:51', '2024-02-17 18:43:51'),
(1250, 'S.3.1', 'Personnel services;', '[{\"evidence\":\"S.3.1\"}]', '1249', 'item', NULL, NULL, NULL, '2024-02-17 18:44:11', '2024-02-17 18:44:11'),
(1251, 'S.3.2', 'Maintenance and Other Operating Expenses (MOOE);', '[{\"evidence\":\"S.3.2\"}]', '1249', 'item', NULL, NULL, NULL, '2024-02-17 18:44:27', '2024-02-17 18:44:27'),
(1252, 'S.3.3', 'Capital outlay; and', '[{\"evidence\":\"S.3.3\"}]', '1249', 'item', NULL, NULL, NULL, '2024-02-17 18:44:42', '2024-02-17 18:44:42'),
(1253, 'S.3.4', 'Special projects.', '[{\"evidence\":\"S.3.4\"}]', '1249', 'item', NULL, NULL, NULL, '2024-02-17 18:44:57', '2024-02-17 18:44:57'),
(1254, 'I.1', 'The institution maintains a Financial Management Office managed by qualified\nand competent staff.', '[{\"evidence\":\"I.1\"}]', '1245', 'item', NULL, NULL, NULL, '2024-02-17 18:45:16', '2024-02-17 18:45:16'),
(1255, 'I.2', 'The financial management personnel are responsible for the efficient\nmanagement of the financial resources/funds of the institution.', '[{\"evidence\":\"I.2\"}]', '1245', 'item', NULL, NULL, NULL, '2024-02-17 18:45:31', '2024-02-17 18:45:31'),
(1256, 'I.3', 'The administrative, faculty staff and student representatives participate in the\nbudget preparation and in the procurement program of the institution.', '[{\"evidence\":\"I.3\"}]', '1245', 'item', NULL, NULL, NULL, '2024-02-17 18:45:46', '2024-02-17 18:45:46'),
(1257, 'I.4', 'The budget of the Institution is fairly and objectively allocated.', '[{\"evidence\":\"I.4\"}]', '1245', 'item', NULL, NULL, NULL, '2024-02-17 18:46:01', '2024-02-17 18:46:01'),
(1258, 'I.5', 'The institution allocates funds for the following services and activities:', '[{\"evidence\":\"I.5\"}]', '1245', 'item', NULL, NULL, NULL, '2024-02-17 18:46:16', '2024-02-17 18:46:16'),
(1259, 'I.5.1', 'Cultural development;', '[{\"evidence\":\"I.5.1\"}]', '1258', 'item', NULL, NULL, NULL, '2024-02-17 18:46:39', '2024-02-17 18:46:39'),
(1260, 'I.5.2', 'Athletic and sports development;', '[{\"evidence\":\"I.5.2\"}]', '1258', 'item', NULL, NULL, NULL, '2024-02-17 18:46:55', '2024-02-17 18:46:55'),
(1261, 'I.5.3', 'Medical/dental services;', '[{\"evidence\":\"I.5.3\"}]', '1258', 'item', NULL, NULL, NULL, '2024-02-17 18:47:11', '2024-02-17 18:47:11'),
(1262, 'I.5.4', 'Library;', '[{\"evidence\":\"I.5.4\"}]', '1258', 'item', NULL, NULL, NULL, '2024-02-17 18:47:29', '2024-02-17 18:47:29'),
(1263, 'I.5.5', 'Student body organization;', '[{\"evidence\":\"I.5.5\"}]', '1258', 'item', NULL, NULL, NULL, '2024-02-17 18:47:45', '2024-02-17 18:47:45'),
(1264, 'I.5.6', 'Guidance and counseling;', '[{\"evidence\":\"I.5.6\"}]', '1258', 'item', NULL, NULL, NULL, '2024-02-17 18:48:00', '2024-02-17 18:48:00'),
(1265, 'I.5.7', 'Improvement of laboratories/shops;', '[{\"evidence\":\"I.5.7\"}]', '1258', 'item', NULL, NULL, NULL, '2024-02-17 18:48:18', '2024-02-17 18:48:18'),
(1266, 'I.5.8', 'Repair and maintenance of facilities and equipment;', '[{\"evidence\":\"I.5.8\"}]', '1258', 'item', NULL, NULL, NULL, '2024-02-17 18:48:33', '2024-02-17 18:48:33'),
(1267, 'I.5.9', 'Purchase of new equipment, supplies and materials;', '[{\"evidence\":\"I.5.9\"}]', '1258', 'item', NULL, NULL, NULL, '2024-02-17 18:48:56', '2024-02-17 18:48:56'),
(1268, 'I.5.10', 'Replacement of old and unserviceable equipment;', '[{\"evidence\":\"I.5.10\"}]', '1258', 'item', NULL, NULL, NULL, '2024-02-17 18:49:12', '2024-02-17 18:49:12'),
(1269, 'I.5.11', 'Construction of new facilities, as needed;', '[{\"evidence\":\"I.5.11\"}]', '1258', 'item', NULL, NULL, NULL, '2024-02-17 18:49:30', '2024-02-17 18:49:30'),
(1270, 'I.5.12', 'Improvement/expansion of physical plant;', '[{\"evidence\":\"I.5.12\"}]', '1258', 'item', NULL, NULL, NULL, '2024-02-17 18:49:51', '2024-02-17 18:49:51'),
(1271, 'I.5.13', 'Extension and community service;', '[{\"evidence\":\"I.5.13\"}]', '1258', 'item', NULL, NULL, NULL, '2024-02-17 18:50:06', '2024-02-17 18:50:06'),
(1272, 'I.5.14', 'Disaster risk reduction; and', '[{\"evidence\":\"I.5.14\"}]', '1258', 'item', NULL, NULL, NULL, '2024-02-17 18:50:43', '2024-02-17 18:50:43'),
(1273, 'I.5.15', 'Auxiliary services, etc.', '[{\"evidence\":\"I.5.15\"}]', '1258', 'item', NULL, NULL, NULL, '2024-02-17 18:51:00', '2024-02-17 18:51:00'),
(1274, 'I.6', 'The budget allotted for specific expenditures indicated in item I.5. is in\nconsonance with existing policies and guidelines.', '[{\"evidence\":\"I.6\"}]', '1245', 'item', NULL, NULL, NULL, '2024-02-17 18:51:18', '2024-02-17 18:51:18'),
(1275, 'O.1', 'The institution has a sound and effective financial management system.', '[{\"evidence\":\"O.1\"}]', '1246', 'item', NULL, NULL, NULL, '2024-02-17 18:51:43', '2024-02-17 18:51:43'),
(1276, 'PARAMETER E:', 'SUPPLY MANAGEMENT', NULL, '1176', 'param', NULL, NULL, NULL, '2024-02-17 18:52:18', '2024-02-17 18:52:18'),
(1277, 'System - Inputs and Processes', NULL, NULL, '1276', 'ind', '1', NULL, NULL, '2024-02-17 18:52:18', '2024-02-17 18:52:18'),
(1278, 'Implementation', NULL, NULL, '1276', 'ind', '2', NULL, NULL, '2024-02-17 18:52:18', '2024-02-17 18:52:18'),
(1279, 'Outcome/s', NULL, NULL, '1276', 'ind', '3', NULL, NULL, '2024-02-17 18:52:18', '2024-02-17 18:52:18'),
(1280, 'S.1', 'There is a policy on graduation requirements.', '[{\"evidence\":\"S.1\"}]', '1277', 'item', NULL, NULL, NULL, '2024-02-17 18:52:52', '2024-02-17 18:52:52'),
(1281, 'S.2', 'The institution as a system for the proper disposal on non-serviceable and\ncondemned equipment, supplies and materials.', '[{\"evidence\":\"S.2\"}]', '1277', 'item', NULL, NULL, NULL, '2024-02-17 18:53:08', '2024-02-17 18:53:08'),
(1282, 'S.3', 'The office has a storeroom for keeping and storing all equipment, supplies and\nmaterials purchased.', '[{\"evidence\":\"S.3\"}]', '1277', 'item', NULL, NULL, NULL, '2024-02-17 18:53:26', '2024-02-17 18:53:26'),
(1283, 'I.1', 'The institution maintains a Supply Management Office (SMO) managed by\nqualified staff with specific function and responsibilities.', '[{\"evidence\":\"I.1\"}]', '1278', 'item', NULL, NULL, NULL, '2024-02-17 18:53:41', '2024-02-17 18:53:41'),
(1284, 'I.2', 'The Bids and Awards Committee (BAC) is responsible for the procurement and\ndeliveries of needed equipment, supplies and materials in accordance with the\napproved Annual Procurement Plan (APP) and project Procurement Management\nPlan (PPMP)', '[{\"evidence\":\"I.2\"}]', '1278', 'item', NULL, NULL, NULL, '2024-02-17 18:53:56', '2024-02-17 18:53:56'),
(1285, 'I.3', 'The BAC perform its task and responsibilities in accordance with recent\nprocurement policies and official issuances.', '[{\"evidence\":\"I.3\"}]', '1278', 'item', NULL, NULL, NULL, '2024-02-17 18:54:14', '2024-02-17 18:54:14'),
(1286, 'I.4', 'The SMO prepares, evaluates and submit the annual inventory of serviceable and\nnon-serviceable facilities and equipment.', '[{\"evidence\":\"I.4\"}]', '1278', 'item', NULL, NULL, NULL, '2024-02-17 18:54:31', '2024-02-17 18:54:31'),
(1287, 'I.5', 'All approved request for procurement are published in the Philippine Government\nElectronic Procurement System (PhilGEPS)', '[{\"evidence\":\"I.5\"}]', '1278', 'item', NULL, NULL, NULL, '2024-02-17 18:54:51', '2024-02-17 18:54:51'),
(1288, 'O.1', 'The institution has an efficient and effective Supply Management System.', '[{\"evidence\":\"O.1\"}]', '1279', 'item', NULL, NULL, NULL, '2024-02-17 18:55:13', '2024-02-17 18:55:13'),
(1289, 'O.2', 'All procurement transactions are transparent.', '[{\"evidence\":\"O.2\"}]', '1279', 'item', NULL, NULL, NULL, '2024-02-17 18:55:28', '2024-02-17 18:55:28'),
(1290, 'PARAMETER F:', 'RECORDS MANAGEMENT', NULL, '1176', 'param', NULL, NULL, NULL, '2024-02-17 18:55:55', '2024-02-17 18:55:55'),
(1291, 'System - Inputs and Processes', NULL, NULL, '1290', 'ind', '1', NULL, NULL, '2024-02-17 18:55:55', '2024-02-17 18:55:55'),
(1292, 'Implementation', NULL, NULL, '1290', 'ind', '2', NULL, NULL, '2024-02-17 18:55:55', '2024-02-17 18:55:55'),
(1293, 'Outcome/s', NULL, NULL, '1290', 'ind', '3', NULL, NULL, '2024-02-17 18:55:55', '2024-02-17 18:55:55'),
(1294, 'S.1', 'The institution has a system of records keeping.', '[{\"evidence\":\"S.1\"}]', '1291', 'item', NULL, NULL, NULL, '2024-02-17 18:56:23', '2024-02-17 18:56:23'),
(1295, 'S.2', 'The institution has policies and procedures to ensure the security and\nconfidentiality of records.', '[{\"evidence\":\"S.2\"}]', '1291', 'item', NULL, NULL, NULL, '2024-02-17 18:56:42', '2024-02-17 18:56:42'),
(1296, 'S.3', 'Policies and procedures on prompt release of records are in place.', '[{\"evidence\":\"S.3\"}]', '1291', 'item', NULL, NULL, NULL, '2024-02-17 19:10:32', '2024-02-17 19:10:32'),
(1297, 'I.1', 'The institution maintains a Records Management Office (RMO) managed by a\nqualified Records Officer.', '[{\"evidence\":\"I.1\"}]', '1292', 'item', NULL, NULL, NULL, '2024-02-17 19:11:10', '2024-02-17 19:11:10'),
(1298, 'I.2', 'A records system is installed in offices where it allows easy access to\ninformation needed by concerned parties.', '[{\"evidence\":\"I.2\"}]', '1292', 'item', NULL, NULL, NULL, '2024-02-17 19:11:27', '2024-02-17 19:11:27'),
(1299, 'I.3', 'The Human Resource Management Office (HRMO) maintains accurate,\nup-to-date and systematic records of faculty and staff.', '[{\"evidence\":\"I.3\"}]', '1292', 'item', NULL, NULL, NULL, '2024-02-17 19:12:08', '2024-02-17 19:12:08'),
(1300, 'I.4', 'The following updated record compilations are made available to concerned\nparties:', '[{\"evidence\":\"I.4\"}]', '1292', 'item', NULL, NULL, NULL, '2024-02-17 19:12:24', '2024-02-17 19:12:24'),
(1301, 'I.4.1', 'Minutes of the Board of Regents/Trustees meetings;', '[{\"evidence\":\"I.4.1\"}]', '1300', 'item', NULL, NULL, NULL, '2024-02-17 19:12:55', '2024-02-17 19:12:55'),
(1302, 'I.4.2', 'Minutes of the faculty meetings, e.g. minutes of the Academic Council meetings;', '[{\"evidence\":\"I.4.2\"}]', '1300', 'item', NULL, NULL, NULL, '2024-02-17 19:13:20', '2024-02-17 19:13:20'),
(1303, 'I.4.3', 'Faculty/non-teaching personnel individual files;', '[{\"evidence\":\"I.4.3\"}]', '1300', 'item', NULL, NULL, NULL, '2024-02-17 19:13:37', '2024-02-17 19:13:37'),
(1304, 'I.4.4', 'Faculty/non-teaching personnel performance evaluation; and', '[{\"evidence\":\"I.4.4\"}]', '1300', 'item', NULL, NULL, NULL, '2024-02-17 19:14:32', '2024-02-17 19:14:32'),
(1305, 'I.4.5', 'other records such as:', '[{\"evidence\":\"I.4.5\"}]', '1300', 'item', NULL, NULL, NULL, '2024-02-17 19:14:49', '2024-02-17 19:14:49'),
(1306, 'I.4.5.1', 'student directory;', '[{\"evidence\":\"I.4.5.1\"}]', '1305', 'item', NULL, NULL, NULL, '2024-02-17 19:15:07', '2024-02-17 19:15:07'),
(1307, 'I.4.5.2', 'alumni directory;', '[{\"evidence\":\"I.4.5.2\"}]', '1305', 'item', NULL, NULL, NULL, '2024-02-17 19:15:23', '2024-02-17 19:15:23'),
(1308, 'I.4.5.3', 'permanent records of student;', '[{\"evidence\":\"I.4.5.3\"}]', '1305', 'item', NULL, NULL, NULL, '2024-02-17 19:15:41', '2024-02-17 19:15:41'),
(1309, 'I.4.5.4', 'reports of Director/Dean;', '[{\"evidence\":\"I.4.5.4\"}]', '1305', 'item', NULL, NULL, NULL, '2024-02-17 19:15:58', '2024-02-17 19:15:58'),
(1310, 'I.4.5.5', 'annual reports;', '[{\"evidence\":\"I.4.5.5\"}]', '1305', 'item', NULL, NULL, NULL, '2024-02-17 19:16:14', '2024-02-17 19:16:14'),
(1311, 'I.4.5.6', 'accomplishment/progress reports;', '[{\"evidence\":\"I.4.5.6\"}]', '1305', 'item', NULL, NULL, NULL, '2024-02-17 19:16:31', '2024-02-17 19:16:31'),
(1312, 'I.4.5.7', 'scholarship records;', '[{\"evidence\":\"I.4.5.7\"}]', '1305', 'item', NULL, NULL, NULL, '2024-02-17 19:16:49', '2024-02-17 19:16:49'),
(1313, 'I.4.5.8', 'statistical data;', '[{\"evidence\":\"I.4.5.8\"}]', '1305', 'item', NULL, NULL, NULL, '2024-02-17 19:17:07', '2024-02-17 19:17:07'),
(1314, 'I.4.5.9', 'financial records of students;', '[{\"evidence\":\"I.4.5.9\"}]', '1305', 'item', NULL, NULL, NULL, '2024-02-17 19:17:24', '2024-02-17 19:17:24'),
(1315, 'I.4.5.10', 'inventory of property;', '[{\"evidence\":\"I.4.5.10\"}]', '1305', 'item', NULL, NULL, NULL, '2024-02-17 19:17:41', '2024-02-17 19:17:41'),
(1316, 'I.4.5.11', 'proceedings of administrative investigation (if any); and', '[{\"evidence\":\"I.4.5.11\"}]', '1305', 'item', NULL, NULL, NULL, '2024-02-17 19:17:59', '2024-02-17 19:17:59'),
(1317, 'I.4.5.12', 'others (please specify)', '[{\"evidence\":\"I.4.5.12\"}]', '1305', 'item', NULL, NULL, NULL, '2024-02-17 19:18:17', '2024-02-17 19:18:17'),
(1318, 'O.1', 'The institution has a commendable Records Management System.', '[{\"evidence\":\"O.1\"}]', '1293', 'item', NULL, NULL, NULL, '2024-02-17 19:18:39', '2024-02-17 19:18:39'),
(1319, 'PARAMETER G:', 'INSTITUTIONAL PLANNING AND DEVELOPMENT', NULL, '1176', 'param', NULL, NULL, NULL, '2024-02-17 19:20:01', '2024-02-17 19:20:01'),
(1320, 'System - Inputs and Processes', NULL, NULL, '1319', 'ind', '1', NULL, NULL, '2024-02-17 19:20:01', '2024-02-17 19:20:01'),
(1321, 'Implementation', NULL, NULL, '1319', 'ind', '2', NULL, NULL, '2024-02-17 19:20:01', '2024-02-17 19:20:01'),
(1322, 'Outcome/s', NULL, NULL, '1319', 'ind', '3', NULL, NULL, '2024-02-17 19:20:01', '2024-02-17 19:20:01'),
(1323, 'S.1', 'The institution has an approved strategic Development Plan available in printed\nand/or electronic forms.', '[{\"evidence\":\"S.1\"}]', '1320', 'item', NULL, NULL, NULL, '2024-02-17 19:20:36', '2024-02-17 19:20:36'),
(1324, 'S.2', 'There is a system of monitoring the implementation of the SDP.', '[{\"evidence\":\"S.2\"}]', '1320', 'item', NULL, NULL, NULL, '2024-02-17 19:20:53', '2024-02-17 19:20:53'),
(1325, 'I.1', 'The institution’s Planning and Development Unit plans, monitors, and evaluates\nplanned activities/targets.', '[{\"evidence\":\"I.1\"}]', '1321', 'item', NULL, NULL, NULL, '2024-02-17 19:21:36', '2024-02-17 19:21:36'),
(1326, 'I.2', 'The planning process is a cooperative and participative endeavour of the\nadministration, the faculty staff and the students.', '[{\"evidence\":\"I.2\"}]', '1321', 'item', NULL, NULL, NULL, '2024-02-17 19:21:55', '2024-02-17 19:21:55'),
(1327, 'I.3', 'The SDP is implemented, monitored, evaluated, reviewed and updated regularly.', '[{\"evidence\":\"I.3\"}]', '1321', 'item', NULL, NULL, NULL, '2024-02-17 19:22:14', '2024-02-17 19:22:14'),
(1328, 'O.1', 'The SDP is congruent with the VMGO, as well as with the local, regional and\nnational development goals and agenda.', '[{\"evidence\":\"O.1\"}]', '1322', 'item', NULL, NULL, NULL, '2024-02-17 19:22:32', '2024-02-17 19:22:32'),
(1329, 'PARAMETER H', 'PERFORMANCE OF ADMINISTRATIVE PERSONNEL', NULL, '1176', 'param', NULL, NULL, NULL, '2024-02-17 19:23:45', '2024-02-17 19:23:45'),
(1330, 'System - Inputs and Processes', NULL, NULL, '1329', 'ind', '1', NULL, NULL, '2024-02-17 19:23:45', '2024-02-17 19:23:45'),
(1331, 'Implementation', NULL, NULL, '1329', 'ind', '2', NULL, NULL, '2024-02-17 19:23:45', '2024-02-17 19:23:45'),
(1332, 'Outcome/s', NULL, NULL, '1329', 'ind', '3', NULL, NULL, '2024-02-17 19:23:45', '2024-02-17 19:23:45'),
(1333, 'S.1', 'The institution has an approved performance evaluation system for\nadministrative personnel which includes the following items:', '[{\"evidence\":\"S.1\"}]', '1330', 'item', NULL, NULL, NULL, '2024-02-17 19:24:21', '2024-02-17 19:24:21'),
(1334, 'S.1.1', 'competence;', '[{\"evidence\":\"S.1.1\"}]', '1333', 'item', NULL, NULL, NULL, '2024-02-17 19:25:13', '2024-02-17 19:25:13'),
(1335, 'S.1.2', 'Quality of work;', '[{\"evidence\":\"S.1.2\"}]', '1333', 'item', NULL, NULL, NULL, '2024-02-17 19:25:47', '2024-02-17 19:25:47'),
(1336, 'S.1.3', 'Work ethics (punctuality, wise use of time, etc.);', '[{\"evidence\":\"S.1.3\"}]', '1333', 'item', NULL, NULL, NULL, '2024-02-17 19:26:06', '2024-02-17 19:26:06'),
(1337, 'S.1.4', 'Creative ability and innovativeness;', '[{\"evidence\":\"S.1.4\"}]', '1333', 'item', NULL, NULL, NULL, '2024-02-17 19:26:24', '2024-02-17 19:26:24'),
(1338, 'S.1.5', 'Ability to handle internal and external pressures; and', '[{\"evidence\":\"S.1.5\"}]', '1333', 'item', NULL, NULL, NULL, '2024-02-17 19:26:42', '2024-02-17 19:26:42'),
(1339, 'S.1.6', 'Interpersonal relations.', '[{\"evidence\":\"S.1.6\"}]', '1333', 'item', NULL, NULL, NULL, '2024-02-17 19:27:11', '2024-02-17 19:27:11'),
(1340, 'I.1', 'The institution regularly monitors and evaluates the performance of the\nadministrative personnel.', '[{\"evidence\":\"I.1\"}]', '1331', 'item', NULL, NULL, NULL, '2024-02-17 19:28:16', '2024-02-17 19:28:16'),
(1341, 'I.2', 'The results of performance evaluation of the administrative personnel are\nutilized:', '[{\"evidence\":\"I.2\"}]', '1331', 'item', NULL, NULL, NULL, '2024-02-17 19:28:32', '2024-02-17 19:28:32'),
(1342, 'I.2.1', 'To improve performance and delivery of service; and', '[{\"evidence\":\"I.2.1\"}]', '1341', 'item', NULL, NULL, NULL, '2024-02-17 19:28:56', '2024-02-17 19:28:56'),
(1343, 'I.2.2', 'For promotion.', '[{\"evidence\":\"I.2.2\"}]', '1341', 'item', NULL, NULL, NULL, '2024-02-17 19:29:13', '2024-02-17 19:29:13'),
(1344, 'O.1', 'The administrative personnel/staff have commendable performance.', '[{\"evidence\":\"O.1\"}]', '1332', 'item', NULL, NULL, NULL, '2024-02-17 19:29:32', '2024-02-17 19:29:32'),
(1345, 'I.1', 'A system of dissemination and acceptability of the VMGO is enforced.', '[{\"evidence\":\"I.1\"}]', '158', 'item', NULL, NULL, NULL, '2024-02-18 02:37:27', '2024-02-18 02:37:27');

-- --------------------------------------------------------

--
-- Table structure for table `instrument_comments`
--

CREATE TABLE `instrument_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `instrumentId` bigint(20) UNSIGNED NOT NULL,
  `accredId` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instrument_comments`
--

INSERT INTO `instrument_comments` (`id`, `userId`, `instrumentId`, `accredId`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(11, 2, 1658, 34, 'wow', 'Needs Improvement', '2025-01-26 06:15:54', '2025-01-26 06:36:20'),
(12, 3, 1640, 34, 'wow', 'Needs Improvement', '2025-01-26 06:38:37', '2025-01-26 06:38:39'),
(13, 3, 1658, 34, 'weoas', 'Recommendation', '2025-01-26 07:32:16', '2025-01-26 07:38:18'),
(14, 3, 1640, 34, 'yes', 'Recommendation', '2025-01-26 07:40:34', '2025-01-26 07:40:37'),
(15, 3, 1661, 34, 'set free', 'Strength', '2025-01-26 07:57:01', '2025-01-26 07:57:06');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_12_09_093804_create_institutes_table', 1),
(6, '2022_12_09_093929_create_programs_table', 1),
(7, '2022_12_09_094012_create_instruments_table', 1),
(8, '2022_12_09_094113_create_users_table', 1),
(9, '2022_12_16_124542_create_accreditations_table', 1),
(10, '2022_12_16_124702_create_progress_table', 1),
(11, '2022_12_21_082545_create_faculty_staff_table', 1),
(12, '2022_12_22_135901_create_registrations_table', 1),
(13, '2022_12_24_053949_create_area_assigns_table', 1),
(14, '2022_12_25_043041_create_area_self_accreditors_table', 1),
(15, '2022_12_26_030801_create_temporary_files_table', 1),
(16, '2022_12_26_031845_create_document_versions_table', 1),
(17, '2022_12_26_041402_create_document_current_versions_table', 1),
(18, '2022_12_29_140116_create_document_comments_table', 1),
(19, '2023_01_08_032209_create_task_assigns_table', 1),
(20, '2023_01_12_112041_create_instrument_comments_table', 1),
(21, '2023_01_18_115351_create_shares_table', 1),
(22, '2023_01_19_121934_create_user_logs_table', 1),
(23, '2023_01_20_162116_create_chats_table', 1),
(24, '2023_01_20_162339_create_chat_conversations_table', 1),
(25, '2023_01_21_144431_create_notifications_table', 1),
(26, '2023_01_23_082922_create_attached_documents_table', 1),
(27, '2023_01_31_033506_create_announcements_table', 1),
(28, '2023_02_01_144717_create_self_surveys_table', 1),
(29, '2023_02_04_075249_create_self_survey_rates_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `userNotifier` bigint(20) UNSIGNED DEFAULT NULL,
  `documentId` bigint(20) UNSIGNED DEFAULT NULL,
  `instrumentId` bigint(20) UNSIGNED DEFAULT NULL,
  `seen` tinyint(1) DEFAULT NULL,
  `isOwner` tinyint(1) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `abbreviation` varchar(255) NOT NULL,
  `program_name` varchar(255) NOT NULL,
  `instituteId` bigint(20) UNSIGNED NOT NULL,
  `bot` varchar(255) DEFAULT NULL,
  `established` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `abbreviation`, `program_name`, `instituteId`, `bot`, `established`, `created_at`, `updated_at`) VALUES
(25, 'BSIT', 'Bachelor in Science in Information Technology', 1, NULL, '2024-09-26', '2025-01-25 20:40:44', '2025-01-25 20:40:44'),
(26, 'BSCS', 'Bachelor in Science in Computer Science', 1, NULL, '2024-10-26', '2025-01-25 22:35:52', '2025-01-25 22:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instrumentId` bigint(20) UNSIGNED NOT NULL,
  `parent` varchar(255) DEFAULT NULL,
  `area` bigint(20) UNSIGNED NOT NULL,
  `accredlvlId` bigint(20) UNSIGNED NOT NULL,
  `isComplete` tinyint(1) DEFAULT NULL,
  `progress` varchar(255) DEFAULT NULL,
  `isRemoved` tinyint(1) DEFAULT NULL,
  `rate` varchar(5) DEFAULT NULL,
  `exclude_rate` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `progress`
--

INSERT INTO `progress` (`id`, `instrumentId`, `parent`, `area`, `accredlvlId`, `isComplete`, `progress`, `isRemoved`, `rate`, `exclude_rate`, `created_at`, `updated_at`) VALUES
(9636, 1615, NULL, 1615, 34, NULL, NULL, NULL, NULL, NULL, '2025-01-26 05:19:27', '2025-01-26 05:19:27'),
(9637, 1638, '1615', 1615, 34, NULL, NULL, NULL, NULL, NULL, '2025-01-26 05:19:27', '2025-01-26 05:19:27'),
(9638, 1639, '1638', 1615, 34, NULL, NULL, NULL, NULL, NULL, '2025-01-26 05:19:27', '2025-01-26 05:19:27'),
(9639, 1658, '1639', 1615, 34, NULL, NULL, NULL, NULL, NULL, '2025-01-26 05:19:27', '2025-01-26 05:19:27'),
(9640, 1640, '1638', 1615, 34, NULL, NULL, NULL, NULL, NULL, '2025-01-26 05:19:27', '2025-01-26 05:19:27'),
(9641, 1660, '1640', 1615, 34, NULL, NULL, NULL, NULL, NULL, '2025-01-26 05:19:27', '2025-01-26 05:19:27'),
(9642, 1641, '1638', 1615, 34, NULL, NULL, NULL, NULL, NULL, '2025-01-26 05:19:27', '2025-01-26 05:19:27'),
(9643, 1661, '1641', 1615, 34, NULL, NULL, NULL, NULL, NULL, '2025-01-26 05:19:27', '2025-01-26 05:19:27'),
(9644, 1620, NULL, 1620, 34, NULL, NULL, NULL, NULL, NULL, '2025-01-26 05:19:27', '2025-01-26 05:19:27'),
(9645, 1625, NULL, 1625, 34, NULL, NULL, NULL, NULL, NULL, '2025-01-26 05:19:27', '2025-01-26 05:19:27');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `removed` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `self_surveys`
--

CREATE TABLE `self_surveys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accredlvl` bigint(20) UNSIGNED NOT NULL,
  `rate` varchar(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `self_survey_rates`
--

CREATE TABLE `self_survey_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `surveyId` bigint(20) UNSIGNED NOT NULL,
  `instrumentId` bigint(20) UNSIGNED NOT NULL,
  `areaId` bigint(20) UNSIGNED NOT NULL,
  `parent` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shares`
--

CREATE TABLE `shares` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `documentId` bigint(20) UNSIGNED NOT NULL,
  `isRemoved` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_assigns`
--

CREATE TABLE `task_assigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `instrumentId` bigint(20) UNSIGNED NOT NULL,
  `areaId` bigint(20) UNSIGNED NOT NULL,
  `accredId` bigint(20) UNSIGNED NOT NULL,
  `due` datetime NOT NULL,
  `complete` tinyint(1) DEFAULT NULL,
  `notified` tinyint(1) DEFAULT NULL,
  `removed` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temporary_files`
--

CREATE TABLE `temporary_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `folder` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temporary_files`
--

INSERT INTO `temporary_files` (`id`, `folder`, `file`, `created_at`, `updated_at`) VALUES
(51, '67888127ea9b4-1736999207', '20250116034647.jpg', '2025-01-15 19:46:47', '2025-01-15 19:46:47'),
(52, '6788814c9cfc1-1736999244', '20250116034724.jpg', '2025-01-15 19:47:24', '2025-01-15 19:47:24'),
(53, '67888174eaca2-1736999284', '20250116034804.jpg', '2025-01-15 19:48:04', '2025-01-15 19:48:04'),
(54, '6788824d7dbb7-1736999501', '20250116035141.jpg', '2025-01-15 19:51:41', '2025-01-15 19:51:41'),
(55, '678882da346e8-1736999642', '20250116035402.jpg', '2025-01-15 19:54:02', '2025-01-15 19:54:02'),
(56, '678883059eef1-1736999685', '20250116035445.xlsx', '2025-01-15 19:54:45', '2025-01-15 19:54:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `designation` tinyint(4) NOT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `auth` tinyint(4) NOT NULL,
  `programId` bigint(20) UNSIGNED DEFAULT NULL,
  `instituteId` bigint(20) UNSIGNED DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `theme` varchar(10) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `designation`, `Role`, `auth`, `programId`, `instituteId`, `username`, `password`, `theme`, `avatar`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John', 'Marco', '', 9, NULL, 1, NULL, NULL, 'jdusername', '$2y$10$25aiMo5s1AHyly0YDchdY.7af5rOXb.HaiyL8gbJCWMdTRzZX1abW', NULL, NULL, 1, NULL, '2024-02-14 17:12:32', '2025-01-25 22:12:57'),
(2, 'QA', 'Admin', '', 6, NULL, 6, NULL, NULL, 'QAusername', '$2y$10$IABLbxsioF.60L7rfZ5loe4O/m6P59D3iri29gHQDEQOIoF5eKitW', NULL, NULL, NULL, NULL, '2024-02-14 17:12:33', '2025-01-26 09:00:26'),
(3, 'Internal', 'Accreditor', '', 7, NULL, 5, NULL, NULL, 'Internalusername', '$2y$10$JvI1P41AUKxsd/O.Swncj.zuF2wUFP.JSwAWkfQDPRa6CPomJ4esy', NULL, NULL, 1, NULL, '2024-02-14 17:12:33', '2025-01-26 06:37:49'),
(4, 'External', 'Accreditor', '', 8, NULL, 5, NULL, NULL, 'Externalusername', '$2y$10$Na/2DBM1RHWNdFJZihIe9uiOLh70j.15xyekY6NGajnQkyEg2Nhlq', NULL, NULL, 1, NULL, '2024-02-14 17:12:33', '2025-01-05 06:09:41'),
(5, 'Faculty', 'Faculty', '', 3, NULL, 2, 1, 1, 'Facultyusername', '$2y$10$4lVwsWXLYiDsGCysShCU8OZW3NGc3jO2wXncvtbBiEAOzpFg/nmYG', NULL, NULL, 1, NULL, '2024-02-14 17:19:43', '2024-02-14 17:21:13'),
(11, 'roldan', 'merced', 'roldan1234567890@earist.edu.ph', 3, NULL, 2, NULL, NULL, 'kissier0921', '$2y$10$jzzMMs3uy9yYYwXyG6EuWOI34LZmQdPvaNO6nf.PKu8FEdOjAgjHG', NULL, NULL, 1, NULL, '2024-12-28 18:59:03', '2025-01-15 19:43:43'),
(12, 'rm', 'marfil', 'rmmarfil@earist.edu.ph', 3, NULL, 2, 21, 1, 'rmmarfil', '$2y$10$iJRbr9F07Ca91hbODy.r7.xmHxpXbvHcGH4oUtxY3NXmjL1PBu1IS', NULL, NULL, NULL, NULL, '2025-01-05 06:33:40', '2025-01-05 06:33:40'),
(13, 'roldan', 'dela merced', 'roldan1234567890@earist.edu.ph', 8, NULL, 5, NULL, 1, 'roldan1234111', '$2y$10$QiFDDhAPJfk1W2FQ5.FAMOfmEX/nMhi1zisH4/3DNC.lSDum0o8tG', NULL, NULL, NULL, NULL, '2025-01-14 19:29:54', '2025-01-26 05:30:35'),
(14, 'roldan', 'dela merced', 'roldan1234567890@earist.edu.ph', 7, NULL, 5, NULL, 1, 'kkiissiieerr0099', '$2y$10$P2H8RIlS4d60WfuTQWRWr.CHV2imCWlxW4PDxeZEzHjq3CPgvcF1K', NULL, NULL, NULL, NULL, '2025-01-25 22:36:02', '2025-01-26 05:25:27');

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `accredlvl` bigint(20) UNSIGNED NOT NULL,
  `documentId` bigint(20) UNSIGNED NOT NULL,
  `instrumentId` bigint(20) UNSIGNED NOT NULL,
  `details` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logs`
--

INSERT INTO `user_logs` (`id`, `userId`, `accredlvl`, `documentId`, `instrumentId`, `details`, `created_at`, `updated_at`) VALUES
(54, 11, 30, 45, 1662, 'uploaded this document', '2025-01-15 19:46:50', '2025-01-15 19:46:50'),
(55, 11, 30, 46, 1662, 'uploaded this document', '2025-01-15 19:47:25', '2025-01-15 19:47:25'),
(56, 11, 30, 47, 1662, 'uploaded this document', '2025-01-15 19:48:07', '2025-01-15 19:48:07'),
(57, 11, 30, 48, 1662, 'uploaded this document', '2025-01-15 19:54:06', '2025-01-15 19:54:06'),
(58, 11, 30, 49, 1662, 'uploaded this document', '2025-01-15 19:54:48', '2025-01-15 19:54:48');

-- --------------------------------------------------------

--
-- Table structure for table `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(255) NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accreditations`
--
ALTER TABLE `accreditations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accreditations_instrumentid_foreign` (`instrumentId`),
  ADD KEY `accreditations_programid_foreign` (`programId`),
  ADD KEY `accreditations_selfsurvey_index` (`selfsurvey`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcements_userid_foreign` (`userId`);

--
-- Indexes for table `area_assigns`
--
ALTER TABLE `area_assigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_assigns_userid_foreign` (`userId`),
  ADD KEY `area_assigns_areaid_foreign` (`areaId`),
  ADD KEY `area_assigns_levelid_foreign` (`levelId`),
  ADD KEY `area_assigns_parent_index` (`parent`);

--
-- Indexes for table `area_self_accreditors`
--
ALTER TABLE `area_self_accreditors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_self_accreditors_userid_foreign` (`userId`),
  ADD KEY `area_self_accreditors_instrumentid_foreign` (`instrumentId`),
  ADD KEY `area_self_accreditors_accredlvl_foreign` (`accredlvl`);

--
-- Indexes for table `attached_documents`
--
ALTER TABLE `attached_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attached_documents_documentid_foreign` (`documentId`),
  ADD KEY `attached_documents_instrumentid_foreign` (`instrumentId`),
  ADD KEY `attached_documents_accredlvl_foreign` (`accredlvl`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chats_sender_foreign` (`sender`),
  ADD KEY `chats_receiver_foreign` (`receiver`);

--
-- Indexes for table `chat_conversations`
--
ALTER TABLE `chat_conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_conversations_convoid_foreign` (`convoId`),
  ADD KEY `chat_conversations_sender_foreign` (`sender`);

--
-- Indexes for table `document_comments`
--
ALTER TABLE `document_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_comments_userid_foreign` (`userId`),
  ADD KEY `document_comments_instrumentid_foreign` (`instrumentId`),
  ADD KEY `document_comments_accredid_foreign` (`accredId`),
  ADD KEY `document_comments_documentid_foreign` (`documentId`);

--
-- Indexes for table `document_current_versions`
--
ALTER TABLE `document_current_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_current_versions_accredlvl_foreign` (`accredlvl`),
  ADD KEY `document_current_versions_instrumentid_foreign` (`instrumentId`),
  ADD KEY `document_current_versions_documentid_foreign` (`documentId`);

--
-- Indexes for table `document_versions`
--
ALTER TABLE `document_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_versions_userid_foreign` (`userId`),
  ADD KEY `document_versions_title_index` (`title`),
  ADD KEY `document_versions_parent_index` (`parent`);

--
-- Indexes for table `faculty_staff`
--
ALTER TABLE `faculty_staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faculty_staff_programid_foreign` (`programId`),
  ADD KEY `faculty_staff_instituteid_foreign` (`instituteId`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `institutes`
--
ALTER TABLE `institutes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instruments`
--
ALTER TABLE `instruments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instruments_title_index` (`title`),
  ADD KEY `instruments_parent_index` (`parent`),
  ADD KEY `instruments_category_index` (`category`);

--
-- Indexes for table `instruments_component`
--
ALTER TABLE `instruments_component`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instruments_title_index` (`title`),
  ADD KEY `instruments_parent_index` (`parent`),
  ADD KEY `instruments_category_index` (`category`);

--
-- Indexes for table `instrument_comments`
--
ALTER TABLE `instrument_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instrument_comments_userid_foreign` (`userId`),
  ADD KEY `instrument_comments_instrumentid_foreign` (`instrumentId`),
  ADD KEY `instrument_comments_accredid_foreign` (`accredId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_userid_foreign` (`userId`),
  ADD KEY `notifications_usernotifier_foreign` (`userNotifier`),
  ADD KEY `notifications_documentid_foreign` (`documentId`),
  ADD KEY `notifications_instrumentid_foreign` (`instrumentId`),
  ADD KEY `notifications_seen_index` (`seen`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programs_instituteid_foreign` (`instituteId`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `progress_instrumentid_foreign` (`instrumentId`),
  ADD KEY `progress_area_foreign` (`area`),
  ADD KEY `progress_accredlvlid_foreign` (`accredlvlId`),
  ADD KEY `progress_parent_index` (`parent`),
  ADD KEY `progress_progress_index` (`progress`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `self_surveys`
--
ALTER TABLE `self_surveys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `self_surveys_accredlvl_foreign` (`accredlvl`);

--
-- Indexes for table `self_survey_rates`
--
ALTER TABLE `self_survey_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `self_survey_rates_surveyid_foreign` (`surveyId`),
  ADD KEY `self_survey_rates_instrumentid_foreign` (`instrumentId`),
  ADD KEY `self_survey_rates_areaid_foreign` (`areaId`),
  ADD KEY `self_survey_rates_parent_index` (`parent`);

--
-- Indexes for table `shares`
--
ALTER TABLE `shares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shares_userid_foreign` (`userId`),
  ADD KEY `shares_documentid_foreign` (`documentId`);

--
-- Indexes for table `task_assigns`
--
ALTER TABLE `task_assigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_assigns_userid_foreign` (`userId`),
  ADD KEY `task_assigns_areaid_foreign` (`areaId`),
  ADD KEY `task_assigns_instrumentid_foreign` (`instrumentId`),
  ADD KEY `task_assigns_accredid_foreign` (`accredId`),
  ADD KEY `task_assigns_due_index` (`due`),
  ADD KEY `task_assigns_notified_index` (`notified`);

--
-- Indexes for table `temporary_files`
--
ALTER TABLE `temporary_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_logs_userid_foreign` (`userId`),
  ADD KEY `user_logs_accredlvl_foreign` (`accredlvl`),
  ADD KEY `user_logs_instrumentid_foreign` (`instrumentId`),
  ADD KEY `user_logs_documentid_foreign` (`documentId`);

--
-- Indexes for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accreditations`
--
ALTER TABLE `accreditations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `area_assigns`
--
ALTER TABLE `area_assigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `area_self_accreditors`
--
ALTER TABLE `area_self_accreditors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `attached_documents`
--
ALTER TABLE `attached_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_conversations`
--
ALTER TABLE `chat_conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_comments`
--
ALTER TABLE `document_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `document_current_versions`
--
ALTER TABLE `document_current_versions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `document_versions`
--
ALTER TABLE `document_versions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `faculty_staff`
--
ALTER TABLE `faculty_staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `institutes`
--
ALTER TABLE `institutes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `instruments`
--
ALTER TABLE `instruments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1672;

--
-- AUTO_INCREMENT for table `instruments_component`
--
ALTER TABLE `instruments_component`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1346;

--
-- AUTO_INCREMENT for table `instrument_comments`
--
ALTER TABLE `instrument_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9646;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `self_surveys`
--
ALTER TABLE `self_surveys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `self_survey_rates`
--
ALTER TABLE `self_survey_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4337;

--
-- AUTO_INCREMENT for table `shares`
--
ALTER TABLE `shares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `task_assigns`
--
ALTER TABLE `task_assigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temporary_files`
--
ALTER TABLE `temporary_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accreditations`
--
ALTER TABLE `accreditations`
  ADD CONSTRAINT `accreditations_instrumentid_foreign` FOREIGN KEY (`instrumentId`) REFERENCES `instruments` (`id`),
  ADD CONSTRAINT `accreditations_programid_foreign` FOREIGN KEY (`programId`) REFERENCES `programs` (`id`);

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `area_assigns`
--
ALTER TABLE `area_assigns`
  ADD CONSTRAINT `area_assigns_areaid_foreign` FOREIGN KEY (`areaId`) REFERENCES `instruments` (`id`),
  ADD CONSTRAINT `area_assigns_levelid_foreign` FOREIGN KEY (`levelId`) REFERENCES `accreditations` (`id`),
  ADD CONSTRAINT `area_assigns_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `area_self_accreditors`
--
ALTER TABLE `area_self_accreditors`
  ADD CONSTRAINT `area_self_accreditors_accredlvl_foreign` FOREIGN KEY (`accredlvl`) REFERENCES `accreditations` (`id`),
  ADD CONSTRAINT `area_self_accreditors_instrumentid_foreign` FOREIGN KEY (`instrumentId`) REFERENCES `instruments` (`id`),
  ADD CONSTRAINT `area_self_accreditors_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `attached_documents`
--
ALTER TABLE `attached_documents`
  ADD CONSTRAINT `attached_documents_accredlvl_foreign` FOREIGN KEY (`accredlvl`) REFERENCES `accreditations` (`id`),
  ADD CONSTRAINT `attached_documents_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `document_current_versions` (`id`),
  ADD CONSTRAINT `attached_documents_instrumentid_foreign` FOREIGN KEY (`instrumentId`) REFERENCES `instruments` (`id`);

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_receiver_foreign` FOREIGN KEY (`receiver`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_sender_foreign` FOREIGN KEY (`sender`) REFERENCES `users` (`id`);

--
-- Constraints for table `chat_conversations`
--
ALTER TABLE `chat_conversations`
  ADD CONSTRAINT `chat_conversations_convoid_foreign` FOREIGN KEY (`convoId`) REFERENCES `chats` (`id`),
  ADD CONSTRAINT `chat_conversations_sender_foreign` FOREIGN KEY (`sender`) REFERENCES `users` (`id`);

--
-- Constraints for table `document_comments`
--
ALTER TABLE `document_comments`
  ADD CONSTRAINT `document_comments_accredid_foreign` FOREIGN KEY (`accredId`) REFERENCES `accreditations` (`id`),
  ADD CONSTRAINT `document_comments_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `document_current_versions` (`id`),
  ADD CONSTRAINT `document_comments_instrumentid_foreign` FOREIGN KEY (`instrumentId`) REFERENCES `instruments` (`id`),
  ADD CONSTRAINT `document_comments_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `document_current_versions`
--
ALTER TABLE `document_current_versions`
  ADD CONSTRAINT `document_current_versions_accredlvl_foreign` FOREIGN KEY (`accredlvl`) REFERENCES `accreditations` (`id`),
  ADD CONSTRAINT `document_current_versions_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `document_versions` (`id`),
  ADD CONSTRAINT `document_current_versions_instrumentid_foreign` FOREIGN KEY (`instrumentId`) REFERENCES `instruments` (`id`);

--
-- Constraints for table `document_versions`
--
ALTER TABLE `document_versions`
  ADD CONSTRAINT `document_versions_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `faculty_staff`
--
ALTER TABLE `faculty_staff`
  ADD CONSTRAINT `faculty_staff_instituteid_foreign` FOREIGN KEY (`instituteId`) REFERENCES `institutes` (`id`),
  ADD CONSTRAINT `faculty_staff_programid_foreign` FOREIGN KEY (`programId`) REFERENCES `programs` (`id`);

--
-- Constraints for table `instrument_comments`
--
ALTER TABLE `instrument_comments`
  ADD CONSTRAINT `instrument_comments_accredid_foreign` FOREIGN KEY (`accredId`) REFERENCES `accreditations` (`id`),
  ADD CONSTRAINT `instrument_comments_instrumentid_foreign` FOREIGN KEY (`instrumentId`) REFERENCES `instruments` (`id`),
  ADD CONSTRAINT `instrument_comments_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_documentid_foreign` FOREIGN KEY (`documentId`) REFERENCES `document_current_versions` (`id`),
  ADD CONSTRAINT `notifications_instrumentid_foreign` FOREIGN KEY (`instrumentId`) REFERENCES `instruments` (`id`),
  ADD CONSTRAINT `notifications_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_usernotifier_foreign` FOREIGN KEY (`userNotifier`) REFERENCES `users` (`id`);

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `progress_accredlvlid_foreign` FOREIGN KEY (`accredlvlId`) REFERENCES `accreditations` (`id`),
  ADD CONSTRAINT `progress_area_foreign` FOREIGN KEY (`area`) REFERENCES `instruments` (`id`),
  ADD CONSTRAINT `progress_instrumentid_foreign` FOREIGN KEY (`instrumentId`) REFERENCES `instruments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
