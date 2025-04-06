-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2024 at 08:49 AM
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
-- Database: `text-mining`
--

-- --------------------------------------------------------

--
-- Table structure for table `curriculums`
--

CREATE TABLE `curriculums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `curriculum` varchar(255) NOT NULL,
  `curriculum_name` varchar(255) DEFAULT NULL,
  `curriculum_status` varchar(255) DEFAULT NULL,
  `date_time` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `curriculums`
--

INSERT INTO `curriculums` (`id`, `curriculum`, `curriculum_name`, `curriculum_status`, `date_time`, `created_at`, `updated_at`) VALUES
(1, 'Bachelor of Science in Secondary Education', 'Bachelor of Science in Secondary Education', 'active', '2023-07-30 04:48', '2023-07-29 21:02:29', '2023-07-29 21:02:29'),
(2, 'Bachelor of Science in Information Technology', 'Bachelor of Science in Information Technology', 'active', '2023-07-30 05:23', '2023-07-29 21:23:30', '2023-07-29 21:23:30'),
(3, 'Bachelor of Science in Computer Science', 'Bachelor of Science in Computer Science', 'active', '2023-07-30 05:24', '2023-07-29 21:24:08', '2023-07-29 21:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `department_description` varchar(255) DEFAULT NULL,
  `department_status` text DEFAULT NULL,
  `date_time` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department_name`, `department_description`, `department_status`, `date_time`, `created_at`, `updated_at`) VALUES
(1, 'ITD-BSCS', 'ITD', 'active', '2023-07-30 04:48', '2023-07-29 20:48:33', '2023-07-29 20:48:33'),
(2, 'ITD-BSIT', 'ITD', 'active', '2023-07-30 04:48', '2023-07-29 20:48:33', '2023-07-29 20:48:33'),
(3, 'MD-BSHM', 'MD', 'active', '2023-07-30 04:49', '2023-07-29 20:49:35', '2023-07-29 20:49:35'),
(4, 'MD-BSBM', 'MD', 'active', '2023-07-30 04:49', '2023-07-29 20:49:35', '2023-07-29 20:49:35'),
(6, 'FASD', 'FASD', 'active', '2024-01-03 17:30', '2024-01-03 09:30:32', '2024-01-03 09:30:32'),
(7, 'TED-BSED', 'TED', 'active', '2023-07-30 04:49', '2023-07-29 20:49:48', '2023-07-29 20:49:48'),
(8, 'TED-BEED', 'TED', 'active', '2023-07-30 04:49', '2023-07-29 20:49:48', '2023-07-29 20:49:48'),
(9, 'All Dept', 'All Dept', 'active', '2024-01-06 16:24', '2024-01-06 08:24:40', '2024-01-06 08:24:40');

-- --------------------------------------------------------

--
-- Table structure for table `facultyuploads`
--

CREATE TABLE `facultyuploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `manuscript_id` varchar(255) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `upload_file` varchar(255) DEFAULT NULL,
  `abstract` text DEFAULT NULL,
  `author` text DEFAULT NULL,
  `date_completed` varchar(255) DEFAULT NULL,
  `thesis_code` varchar(255) DEFAULT NULL,
  `thesis_status` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `all_dept` int(11) DEFAULT NULL,
  `dept_id` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `keywords` text NOT NULL,
  `keywords2` text NOT NULL,
  `keywords3` text NOT NULL,
  `keywords4` text NOT NULL,
  `keywords5` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facultyuploads`
--

INSERT INTO `facultyuploads` (`id`, `department_id`, `manuscript_id`, `title`, `upload_file`, `abstract`, `author`, `date_completed`, `thesis_code`, `thesis_status`, `slug`, `all_dept`, `dept_id`, `created_at`, `updated_at`, `keywords`, `keywords2`, `keywords3`, `keywords4`, `keywords5`) VALUES
(609, '3', '6', 'PDF uploaded has no Title.\n', 'waw.pdf', ' Many kinds of research focused on the flood detection and monitoring, flood management, \nflood risk management and flood forecasting in urban areas, wherein a large number of populations lies \nchaos in mobility is high. Owing to natural disasters, flooding in these regions can lead to an increase in \nmortality rates. This project is primarily focused on the detection of a flood by installing a flood detector \ndevice with a camera beside the bridge column. The camera is facing the three lines with different \ncolors. If one of the colors was tempered by the river water, the device will send an alarm to the \ncommunity that the water level in the river is high. This aims to alert the community and the authorities  \nto be aware and be ready for the approaching flood. FloodLevel Detection and Alert System proved \n87.1%, 73.6%, and 95.69% testing accuracy of Green, Blue, and Red respectively. Overall, the accuracy of \nthe whole system produced 85.46%.\n\n', 'PDF uploaded has no Author.\n', '2024-05-25 23:46', '3151332391', 'pending', 'pdf-uploaded-has-no-title', 5, 2, '2024-05-25 15:46:15', '2024-05-25 15:46:15', 'This keywords is not Found :Lina\n', '', '', '', ''),
(610, '3', '6', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-25 23:47', '1096382743', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 2, '2024-05-25 15:47:09', '2024-05-25 15:47:09', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(611, '3', '6', 'PDF uploaded has no Title.\n', 'waw.pdf', ' Many kinds of research focused on the flood detection and monitoring, flood management, \nflood risk management and flood forecasting in urban areas, wherein a large number of populations lies \nchaos in mobility is high. Owing to natural disasters, flooding in these regions can lead to an increase in \nmortality rates. This project is primarily focused on the detection of a flood by installing a flood detector \ndevice with a camera beside the bridge column. The camera is facing the three lines with different \ncolors. If one of the colors was tempered by the river water, the device will send an alarm to the \ncommunity that the water level in the river is high. This aims to alert the community and the authorities  \nto be aware and be ready for the approaching flood. FloodLevel Detection and Alert System proved \n87.1%, 73.6%, and 95.69% testing accuracy of Green, Blue, and Red respectively. Overall, the accuracy of \nthe whole system produced 85.46%.\n\n', 'PDF uploaded has no Author.\n', '2024-05-25 23:48', '7963165827', 'pending', 'pdf-uploaded-has-no-title', 5, 2, '2024-05-25 15:48:48', '2024-05-25 15:48:48', 'This keywords is not Found :Lina\n', '', '', '', ''),
(612, '2', '3', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-25 23:51', '5739204604', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 1, '2024-05-25 15:51:13', '2024-05-25 15:51:13', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(613, '2', '3', 'WASTE MANAGEMENT SYSTEM WITH REWARD SYSTEM USING \nSEARCHING ALGHORITHM\n\n', 'WASTE-Thesis-Chapter-1-5-updated-2.0.pdf', ' DELA MERCED, ROLDAN S., MOJICA, JOHN ANDREW C., MOJICA MA. \nNICA CECILIA  P., TAMPOC, ROGER C. Creating an Waste Management with \nReward System using Sequential Search Algorithm. An Undergraduate Thesis. \nBachelor of Science in Computer Science. Cavite State University -Naic, Cavite. June \n2023. Thesis Adviser:  Ms. Cami lle H. Dualan.  \n \nThe MENRO - Office is in continuous search for the solution of the arising waste \nmanagement problem. One of the major factor that contributes to w aste management \nproblem is the behavior of the public or the waste producer in managing their own \nwaste. The local government must have an effective system to encourage the public \nto be more mindful of their own waste.  \nWaste Management with Reward System using Sequential Search Algorithm \nis designed to assist the MENRO officer in handling all participant easily and \naccurately. The system includes this two users which is administrator and participant. \nThe Administrator can add, edit and delete member accoun t, recycling center, garbage \ntype and collection record and it helps the officer to view the total collection of every \nparticipant and the system provide graphical representation of data to view the \ncollection of recyclable materials by their partner Junks hop. The participant can view \ntheir collection record and reward from the recyclable materials they submitted to the \npartnered junkshop and the system help the participant to find the location of every \njunkshop using the map indicate in the system.  \nThe sys tem was developed using PHP for coding, Bootstrap for design and \nlayout, MySQL for database and visual studio code for text editor, HTML for Web page \nand Microsoft office for documentation.  \nThe system was evaluate by nine (9) MENRO Officer and staff, thirt y (30) \nBarangay Captain or Secretary, sixty (60) residence of Naic, and seven (7)  IT experts, \nfor a total of one hundred six (106) participant. It had a grand mean rating of 4.89 which \nis interpreted as excellent. Weighted mean was used to consolidate and analyze the\n\n', 'ROLDAN S. DELA MERCED  JOHN ANDREW C. MOJICA MA.  \n  NICA CECILIA P. MOJICA   ROGER C. TAMPOC\n\n', '2024-05-25 23:51', '6512551287', 'pending', 'waste-management-system-with-reward-system-using-searching-alghorithm', 5, 1, '2024-05-25 15:51:40', '2024-05-25 15:51:40', 'This keywords is not Found :Lina\n', '', '', '', ''),
(614, '2', '4', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 00:02', '2315039519', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 1, '2024-05-25 16:02:26', '2024-05-25 16:02:26', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(615, '3', '6', 'PDF uploaded has no Title.\n', 'waw.pdf', ' Many kinds of research focused on the flood detection and monitoring, flood management, \nflood risk management and flood forecasting in urban areas, wherein a large number of populations lies \nchaos in mobility is high. Owing to natural disasters, flooding in these regions can lead to an increase in \nmortality rates. This project is primarily focused on the detection of a flood by installing a flood detector \ndevice with a camera beside the bridge column. The camera is facing the three lines with different \ncolors. If one of the colors was tempered by the river water, the device will send an alarm to the \ncommunity that the water level in the river is high. This aims to alert the community and the authorities  \nto be aware and be ready for the approaching flood. FloodLevel Detection and Alert System proved \n87.1%, 73.6%, and 95.69% testing accuracy of Green, Blue, and Red respectively. Overall, the accuracy of \nthe whole system produced 85.46%.\n\n', 'PDF uploaded has no Author.\n', '2024-05-26 00:02', '5479136455', 'pending', 'pdf-uploaded-has-no-title', 5, 2, '2024-05-25 16:02:36', '2024-05-25 16:02:36', 'This keywords is not Found :Lina\n', '', '', '', ''),
(616, '2', '3', 'PDF uploaded has no Title.\n', 'waw.pdf', ' Many kinds of research focused on the flood detection and monitoring, flood management, \nflood risk management and flood forecasting in urban areas, wherein a large number of populations lies \nchaos in mobility is high. Owing to natural disasters, flooding in these regions can lead to an increase in \nmortality rates. This project is primarily focused on the detection of a flood by installing a flood detector \ndevice with a camera beside the bridge column. The camera is facing the three lines with different \ncolors. If one of the colors was tempered by the river water, the device will send an alarm to the \ncommunity that the water level in the river is high. This aims to alert the community and the authorities  \nto be aware and be ready for the approaching flood. FloodLevel Detection and Alert System proved \n87.1%, 73.6%, and 95.69% testing accuracy of Green, Blue, and Red respectively. Overall, the accuracy of \nthe whole system produced 85.46%.\n\n', 'PDF uploaded has no Author.\n', '2024-05-26 00:03', '1024542272', 'pending', 'pdf-uploaded-has-no-title', 5, 1, '2024-05-25 16:03:18', '2024-05-25 16:03:18', 'This keywords is not Found :Lina\n', '', '', '', ''),
(617, '2', '3', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 00:07', '8872512127', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 1, '2024-05-25 16:07:13', '2024-05-25 16:07:13', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(618, '2', '3', 'PDF uploaded has no Title.\n', 'waw.pdf', ' Many kinds of research focused on the flood detection and monitoring, flood management, \nflood risk management and flood forecasting in urban areas, wherein a large number of populations lies \nchaos in mobility is high. Owing to natural disasters, flooding in these regions can lead to an increase in \nmortality rates. This project is primarily focused on the detection of a flood by installing a flood detector \ndevice with a camera beside the bridge column. The camera is facing the three lines with different \ncolors. If one of the colors was tempered by the river water, the device will send an alarm to the \ncommunity that the water level in the river is high. This aims to alert the community and the authorities  \nto be aware and be ready for the approaching flood. FloodLevel Detection and Alert System proved \n87.1%, 73.6%, and 95.69% testing accuracy of Green, Blue, and Red respectively. Overall, the accuracy of \nthe whole system produced 85.46%.\n\n', 'PDF uploaded has no Author.\n', '2024-05-26 00:10', '4765185117', 'pending', 'pdf-uploaded-has-no-title', 5, 1, '2024-05-25 16:10:12', '2024-05-25 16:10:12', 'This keywords is not Found :Lina\n', '', '', '', ''),
(619, '2', '3', 'PDF uploaded has no Title.\n', 'waw.pdf', ' Many kinds of research focused on the flood detection and monitoring, flood management, \nflood risk management and flood forecasting in urban areas, wherein a large number of populations lies \nchaos in mobility is high. Owing to natural disasters, flooding in these regions can lead to an increase in \nmortality rates. This project is primarily focused on the detection of a flood by installing a flood detector \ndevice with a camera beside the bridge column. The camera is facing the three lines with different \ncolors. If one of the colors was tempered by the river water, the device will send an alarm to the \ncommunity that the water level in the river is high. This aims to alert the community and the authorities  \nto be aware and be ready for the approaching flood. FloodLevel Detection and Alert System proved \n87.1%, 73.6%, and 95.69% testing accuracy of Green, Blue, and Red respectively. Overall, the accuracy of \nthe whole system produced 85.46%.\n\n', 'PDF uploaded has no Author.\n', '2024-05-26 00:11', '9036788183', 'pending', 'pdf-uploaded-has-no-title', 5, 1, '2024-05-25 16:11:10', '2024-05-25 16:11:10', 'This keywords is not Found :Lina\n', '', '', '', ''),
(620, '2', '3', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 00:11', '8760586144', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 1, '2024-05-25 16:11:33', '2024-05-25 16:11:33', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(621, '2', '3', 'PDF uploaded has no Title.\n', 'waw.pdf', ' Many kinds of research focused on the flood detection and monitoring, flood management, \nflood risk management and flood forecasting in urban areas, wherein a large number of populations lies \nchaos in mobility is high. Owing to natural disasters, flooding in these regions can lead to an increase in \nmortality rates. This project is primarily focused on the detection of a flood by installing a flood detector \ndevice with a camera beside the bridge column. The camera is facing the three lines with different \ncolors. If one of the colors was tempered by the river water, the device will send an alarm to the \ncommunity that the water level in the river is high. This aims to alert the community and the authorities  \nto be aware and be ready for the approaching flood. FloodLevel Detection and Alert System proved \n87.1%, 73.6%, and 95.69% testing accuracy of Green, Blue, and Red respectively. Overall, the accuracy of \nthe whole system produced 85.46%.\n\n', 'PDF uploaded has no Author.\n', '2024-05-26 00:11', '4793623696', 'pending', 'pdf-uploaded-has-no-title', 5, 1, '2024-05-25 16:11:55', '2024-05-25 16:11:55', 'This keywords is not Found :Lina\n', '', '', '', ''),
(622, '2', '4', 'PDF uploaded has no Title.\n', 'waw.pdf', ' Many kinds of research focused on the flood detection and monitoring, flood management, \nflood risk management and flood forecasting in urban areas, wherein a large number of populations lies \nchaos in mobility is high. Owing to natural disasters, flooding in these regions can lead to an increase in \nmortality rates. This project is primarily focused on the detection of a flood by installing a flood detector \ndevice with a camera beside the bridge column. The camera is facing the three lines with different \ncolors. If one of the colors was tempered by the river water, the device will send an alarm to the \ncommunity that the water level in the river is high. This aims to alert the community and the authorities  \nto be aware and be ready for the approaching flood. FloodLevel Detection and Alert System proved \n87.1%, 73.6%, and 95.69% testing accuracy of Green, Blue, and Red respectively. Overall, the accuracy of \nthe whole system produced 85.46%.\n\n', 'PDF uploaded has no Author.\n', '2024-05-26 00:12', '7638535437', 'pending', 'pdf-uploaded-has-no-title', 5, 1, '2024-05-25 16:12:23', '2024-05-25 16:12:23', 'This keywords is not Found :Lina\n', '', '', '', ''),
(623, '2', '4', 'PDF uploaded has no Title.\n', 'waw.pdf', ' Many kinds of research focused on the flood detection and monitoring, flood management, \nflood risk management and flood forecasting in urban areas, wherein a large number of populations lies \nchaos in mobility is high. Owing to natural disasters, flooding in these regions can lead to an increase in \nmortality rates. This project is primarily focused on the detection of a flood by installing a flood detector \ndevice with a camera beside the bridge column. The camera is facing the three lines with different \ncolors. If one of the colors was tempered by the river water, the device will send an alarm to the \ncommunity that the water level in the river is high. This aims to alert the community and the authorities  \nto be aware and be ready for the approaching flood. FloodLevel Detection and Alert System proved \n87.1%, 73.6%, and 95.69% testing accuracy of Green, Blue, and Red respectively. Overall, the accuracy of \nthe whole system produced 85.46%.\n\n', 'PDF uploaded has no Author.\n', '2024-05-26 00:12', '3868152281', 'pending', 'pdf-uploaded-has-no-title', 5, 1, '2024-05-25 16:12:51', '2024-05-25 16:12:51', 'This keywords is not Found :Lina\n', '', '', '', ''),
(624, '2', '3', 'PDF uploaded has no Title.\n', 'waw.pdf', ' Many kinds of research focused on the flood detection and monitoring, flood management, \nflood risk management and flood forecasting in urban areas, wherein a large number of populations lies \nchaos in mobility is high. Owing to natural disasters, flooding in these regions can lead to an increase in \nmortality rates. This project is primarily focused on the detection of a flood by installing a flood detector \ndevice with a camera beside the bridge column. The camera is facing the three lines with different \ncolors. If one of the colors was tempered by the river water, the device will send an alarm to the \ncommunity that the water level in the river is high. This aims to alert the community and the authorities  \nto be aware and be ready for the approaching flood. FloodLevel Detection and Alert System proved \n87.1%, 73.6%, and 95.69% testing accuracy of Green, Blue, and Red respectively. Overall, the accuracy of \nthe whole system produced 85.46%.\n\n', 'PDF uploaded has no Author.\n', '2024-05-26 00:13', '5343618352', 'pending', 'pdf-uploaded-has-no-title', 5, 1, '2024-05-25 16:13:11', '2024-05-25 16:13:11', 'This keywords is not Found :Lina\n', '', '', '', ''),
(625, '1', '1', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 00:13', '3343737253', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 1, '2024-05-25 16:13:42', '2024-05-25 16:13:42', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(626, '2', '4', 'PDF uploaded has no Title.\n', 'waw.pdf', ' Many kinds of research focused on the flood detection and monitoring, flood management, \nflood risk management and flood forecasting in urban areas, wherein a large number of populations lies \nchaos in mobility is high. Owing to natural disasters, flooding in these regions can lead to an increase in \nmortality rates. This project is primarily focused on the detection of a flood by installing a flood detector \ndevice with a camera beside the bridge column. The camera is facing the three lines with different \ncolors. If one of the colors was tempered by the river water, the device will send an alarm to the \ncommunity that the water level in the river is high. This aims to alert the community and the authorities  \nto be aware and be ready for the approaching flood. FloodLevel Detection and Alert System proved \n87.1%, 73.6%, and 95.69% testing accuracy of Green, Blue, and Red respectively. Overall, the accuracy of \nthe whole system produced 85.46%.\n\n', 'PDF uploaded has no Author.\n', '2024-05-26 00:16', '7660960306', 'pending', 'pdf-uploaded-has-no-title', 5, 1, '2024-05-25 16:16:45', '2024-05-25 16:16:45', 'This keywords is not Found :Lina\n', '', '', '', ''),
(627, '2', '4', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 00:17', '3722376619', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 1, '2024-05-25 16:17:54', '2024-05-25 16:17:54', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(628, '2', '4', 'PDF uploaded has no Title.\n', 'waw.pdf', ' Many kinds of research focused on the flood detection and monitoring, flood management, \nflood risk management and flood forecasting in urban areas, wherein a large number of populations lies \nchaos in mobility is high. Owing to natural disasters, flooding in these regions can lead to an increase in \nmortality rates. This project is primarily focused on the detection of a flood by installing a flood detector \ndevice with a camera beside the bridge column. The camera is facing the three lines with different \ncolors. If one of the colors was tempered by the river water, the device will send an alarm to the \ncommunity that the water level in the river is high. This aims to alert the community and the authorities  \nto be aware and be ready for the approaching flood. FloodLevel Detection and Alert System proved \n87.1%, 73.6%, and 95.69% testing accuracy of Green, Blue, and Red respectively. Overall, the accuracy of \nthe whole system produced 85.46%.\n\n', 'PDF uploaded has no Author.\n', '2024-05-26 00:19', '3639734758', 'pending', 'pdf-uploaded-has-no-title', 5, 1, '2024-05-25 16:19:04', '2024-05-25 16:19:04', 'This keywords is not Found :Lina\n', '', '', '', ''),
(629, '3', '5', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 00:19', '8565079117', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 2, '2024-05-25 16:19:45', '2024-05-25 16:19:45', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(630, '2', '3', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 13:51', '4962763289', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 1, '2024-05-26 05:51:18', '2024-05-26 05:51:18', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(631, '2', '3', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 13:58', '7854429243', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 1, '2024-05-26 05:58:00', '2024-05-26 05:58:00', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(632, '1', '1', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 14:02', '5191600161', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 1, '2024-05-26 06:02:38', '2024-05-26 06:02:38', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(633, '3', '5', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 14:03', '7448831289', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 2, '2024-05-26 06:03:46', '2024-05-26 06:03:46', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(634, '2', '3', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 14:05', '5436185442', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 1, '2024-05-26 06:05:43', '2024-05-26 06:05:43', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(635, '2', '3', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 14:11', '5066520421', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 1, '2024-05-26 06:11:18', '2024-05-26 06:11:18', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(636, '2', '3', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 14:18', '6673554892', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 1, '2024-05-26 06:18:15', '2024-05-26 06:18:15', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(637, '2', '3', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 14:18', '7248613818', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 1, '2024-05-26 06:18:55', '2024-05-26 06:18:55', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(638, '1', '1', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 14:42', '1095653741', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 1, '2024-05-26 06:42:41', '2024-05-26 06:42:41', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', '', '', '', ''),
(639, '3', '6', 'ON-THE -JOB TRAINING AT CAVITE STATE \nUNIVERSITY BUCANA, MALAKI NAIC, \nCAVITE LIBRARY DEPARTMENT\n\n', 'Turingan-Narrative-daily-journal-nalang.pdf', 'PDF uploaded has no ABSTRACT.\n', 'LINA B. TURINGAN\n\n', '2024-05-26 14:48', '4336620169', 'pending', 'on-the-job-training-at-cavite-state-university-bucana-malaki-naic-cavite-library-department', 5, 2, '2024-05-26 06:48:22', '2024-05-26 06:48:22', ' Lina B. Turingan was born on August 07, 1983 at Santa Maria, Isabela. \nShe is the third born child among the nine children of Mr. Vicente B. Turingan and \nJulieta B. Turingan. She is presently residing at Calubcob, Naic, Cavite.\n \n', 'This keywords is not Found :roldan\n', ' ada. CSF was converted to a college in 1970, offering a two and a \nhalf-year Technical Education Curriculum with 50 students enrolled.\n \n', 'This keywords is not Found :dha\n', '5th keywords is empty!');

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
-- Table structure for table `manuscript_types`
--

CREATE TABLE `manuscript_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `manuscript_type` varchar(255) NOT NULL,
  `manuscript_shortname` varchar(255) DEFAULT NULL,
  `manuscript_status` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manuscript_types`
--

INSERT INTO `manuscript_types` (`id`, `department_id`, `manuscript_type`, `manuscript_shortname`, `manuscript_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Narrative', 'Narrative', 'active', '2024-01-03 01:27:45', '2024-01-03 01:27:45'),
(2, 1, 'Thesis', 'Thesis', 'active', '2024-01-03 01:28:05', '2024-01-03 01:28:05'),
(3, 2, 'Narrative', 'Narrative', 'active', '2024-01-03 01:28:37', '2024-01-03 01:28:37'),
(4, 2, 'Capstone', 'Capstone', 'active', '2024-01-03 01:27:20', '2024-01-03 01:27:20'),
(5, 3, 'EDP', 'EDP', 'active', '2024-01-03 01:29:11', '2024-01-03 01:29:11'),
(6, 3, 'Thesis', 'Thesis', 'active', '2024-01-03 01:27:45', '2024-01-03 01:27:45'),
(7, 4, 'Thesis', 'Thesis', 'active', '2024-01-03 01:28:56', '2024-01-03 01:28:56'),
(8, 4, 'Narrative', 'Narrative', 'active', '2024-01-03 01:27:45', '2024-01-03 01:27:45'),
(9, 6, 'Thesis', 'Thesis', 'active', '2024-01-03 01:29:49', '2024-01-03 01:29:49'),
(10, 7, 'Learning portfolio', 'Learning portfolio', 'active', '2024-01-03 01:30:59', '2024-01-03 01:30:59'),
(11, 8, 'Learning portfolio', 'Learning portfolio', 'active', '2024-01-03 01:31:17', '2024-01-03 01:31:17');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_07_29_175514_create_departments_table', 2),
(6, '2023_07_29_205617_create_curricula_table', 3),
(7, '2023_07_30_083517_create_usertypes_table', 4),
(8, '2023_07_31_110300_create_thesis_capstones_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
-- Table structure for table `thesis_capstones`
--

CREATE TABLE `thesis_capstones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `leader_name` varchar(255) DEFAULT NULL,
  `abstract` varchar(5000) DEFAULT NULL,
  `objectives` varchar(5000) DEFAULT NULL,
  `recommendations` varchar(1000) DEFAULT NULL,
  `thesis_members` varchar(255) DEFAULT NULL,
  `thesis_image` varchar(255) DEFAULT NULL,
  `thesis_document` varchar(255) DEFAULT NULL,
  `thesis_code` varchar(255) DEFAULT NULL,
  `curriculum_ids` int(11) DEFAULT NULL,
  `thesis_status` varchar(255) DEFAULT NULL,
  `thesis_datetime` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thesis_capstones`
--

INSERT INTO `thesis_capstones` (`id`, `title`, `slug`, `year`, `leader_name`, `abstract`, `objectives`, `recommendations`, `thesis_members`, `thesis_image`, `thesis_document`, `thesis_code`, `curriculum_ids`, `thesis_status`, `thesis_datetime`, `created_at`, `updated_at`) VALUES
(1, 'IT Solutions for Government Agencies', 'it-solutions-for-government-agencies', '2023', 'maria cecila o toledo', '<p>Government agencies face a unique set of challenges in managing data and providing services to citizens. As such the need for effective and efficient IT solutions has become increasingly crucial.&nbsp;</p>', '<p>This technology allows for better collaboration between different departments which can help improve communication and streamline workflows. Additionally cloud computing provides enhanced security features that can help safeguard sensitive government data.</p>', '<p>Data analytics can help government agencies identify patterns and trends, make more informed decisions and improve their services. By utilizing data analytics tools government agencies can better understand the needs of their constituents and tailor their services accordingly.</p>', '<p>member: laica, gina</p>', '1690900973.png', '1690900973.pdf', '6180419631', 2, 'pending', '2023-08-01 22:42', '2023-08-01 14:42:53', '2023-08-01 14:42:53'),
(2, 'Capstone Project Topics for Point of Sale', 'capstone-project-topics-for-point-of-sale', '2023', 'erlin n nedia', '<p>A POS system can speed up the checkout process by automating tasks such as item scanning, price calculation, and change calculation. This allows sales transactions to be processed more quickly and accurately, thereby reducing customer wait times and increasing sales volume.</p>', '<p>A point of sale (POS) application is an essential tool for any business that engages in transactions with customers. It is a computer-based system that enables businesses to manage sales, inventory, and customer information.</p>', '<ol><li>Better Data Management: A POS system can generate a wide range of reports that provide valuable insights into sales trends, inventory levels, and customer behavior. This data can be used to make informed decisions about pricing, promotions, and product selection.</li></ol>', '<p>member: nario, jhen</p>', '1690901145.png', '1690901145.pdf', '4882640339', 3, 'pending', '2023-08-01 22:45', '2023-08-01 14:45:45', '2023-08-01 14:45:45'),
(3, 'Capstone Project Topics for Library System', 'capstone-project-topics-for-library-system', '2023', 'richard o toledo', '<p>In the realm of library systems, capstone projects play a crucial role in bringing innovation, efficiency, and improved user experiences.</p>', '<p>Capstone projects in library systems focus on developing and implementing solutions that enhance the overall functionality and effectiveness of libraries.&nbsp;</p>', '<p>One key aspect of capstone projects in library systems is the utilization of modern technologies. This can include the implementation of integrated library systems (ILS) to automate tasks like cataloging, circulation, and resource management.</p>', '<p>member: zedrick, kristine</p>', '1690901357.png', '1690901357.pdf', '4410511400', 2, 'pending', '2023-08-01 22:49', '2023-08-01 14:49:17', '2023-08-01 14:49:17'),
(4, 'Project Ideas Related to Food Ordering System', 'project-ideas-related-to-food-ordering-system', '2023', 'marimar a istasoy', '<p>n today’s fast-paced world, the demand for online food ordering and delivery services has been increasing rapidly. A food ordering system is a digital platform that enables customers to place their food orders online and have them delivered to their doorstep.&nbsp;</p>', '<p>Food ordering systems have been around for quite some time, with the first online food ordering system being introduced in the late 1990s.</p>', '<p>A food ordering system is a web-based platform that enables customers to place orders for food items from restaurants and food delivery services.&nbsp;</p>', '<p>member: liza, rusa</p>', '1690901579.png', '1690901579.pdf', '5645934124', 1, 'approved', '2023-08-01 22:52', '2023-08-01 14:52:59', '2023-08-01 14:52:59'),
(5, 'Capstone Project Topics with Kiosk Integration', 'capstone-project-topics-with-kiosk-integration', '2023', 'marites a kalang', '<p>A kiosk is a self-service interactive terminal that allows users to access information, perform transactions, or complete tasks without the need for human assistance.&nbsp;</p>', '<p>Information and Self-Service: A capstone project can involve developing a kiosk-based system that provides users with information, such as product details, maps, event schedules, or FAQs.</p>', '<p>Point of Sale (POS) System: A capstone project can focus on developing a kiosk-based POS system for retail or service-oriented businesses. This would involve designing an intuitive interface for customers to browse products, make purchases, and complete transactions securely and efficiently.</p>', '<p>member: merna, lunar</p>', '1690902029.png', '1690902029.pdf', '1655084446', 2, 'approved', '2023-08-01 23:00', '2023-08-01 15:00:29', '2023-08-01 15:00:29'),
(6, 'Hospital Management Information System Capstone Project', 'hospital-management-information-system-capstone-project', '2023', 'jay r a siaboc', '<p>Hospital are the essential part of our lives, providing best medical facilities to people suffering from various ailments, which may be due to change in climatic conditions, increased work-load, emotional trauma stress etc.</p>', '<p>It is necessary for the hospitals to keep track of its day-to-day activities &amp; records of its patients, doctors, nurses, ward boys and other staff personals that keep the hospital running smoothly &amp; successfully.</p>', '<p>But keeping track of all the activities and their records on paper is very cumbersome and error prone. It also is very inefficient and a time-consuming process Observing the continuous increase in population and number of people visiting the hospital.&nbsp;</p>', '<p>member: richie, mila</p>', '1691071282.jfif', '1691071282.pdf', '3545973443', 2, 'approved', '2023-08-03 22:01', '2023-08-03 14:01:22', '2023-08-03 14:01:22'),
(7, 'School Portal Kit', 'school-portal-kit', '2023', 'marites a kalang', '<p>The capstone project, “School Portal Kit” is intended to be used by educational institutions. It is designed to streamline different school management processes.</p>', '<p>. Conventionally, different management areas are managed separately using manual approaches</p>', '<p>This involves paper works, physical storage for record-keeping, and face-to-face transactions. The manual method is ineffective and efficient and schools often encounter errors and serious challenges.</p>', '<p>member: luca, joshua</p>', '1691154558.png', '1691154559.pdf', '5060504804', 2, 'pending', '2023-08-04 21:09', '2023-08-04 13:09:19', '2023-08-04 13:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `curriculum_id` int(11) DEFAULT NULL,
  `manuscriptype_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` enum('admin','faculty','student') NOT NULL DEFAULT 'student',
  `status` enum('active','inactive','notverified') DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `first_name`, `middle_name`, `last_name`, `gender`, `department_id`, `curriculum_id`, `manuscriptype_id`, `email`, `email_verified_at`, `password`, `photo`, `contact_number`, `address`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin', 'a', 'Admin', 'Male', 0, 0, 0, 'admin@gmail.com', NULL, '$2y$10$.KegcPtyTwB6MdJnXLPiO.lFjhAMpJZiYZ/ipJGvZsdWT/7IyyDpK', '1691165341.png', NULL, NULL, 'admin', 'active', NULL, NULL, '2023-08-09 04:46:23'),
(9, '', '', 'maria cecila', 'o', 'toledo', 'Female', 2, 1, 0, 'maria@gmail.com', NULL, '$2y$10$GLmoWAXwcVGNakh0BLrbyucVfN3v8C1WKAEeB9D3cZ75JK0jq3Fae', '1691164513.png', '', '', 'student', 'active', NULL, '2023-07-29 14:03:03', '2023-08-04 15:55:13'),
(10, '', '', 'erlin', 'n', 'nedia', 'Female', 3, 3, 0, 'erlin@gmail.com', NULL, '$2y$10$zfae2LCXKMcG7rAiOLfKl.vAVV5xduvt5106Xh.p3k4MvMCpQQzhC', '', '', '', 'student', 'active', NULL, '2023-07-29 14:49:00', '2023-07-29 14:49:00'),
(16, '', '', 'richard', 'o', 'toledo', 'Male', 2, 2, 0, 'richard@gmail.com', NULL, '$2y$10$Tj0enhbtyDHTaYHq6F5A.unK7N6e5MdoeWtVlhLETZPI84puwAxoa', '', '', '', 'student', 'active', NULL, '2023-07-30 06:04:30', '2023-07-30 06:04:30'),
(17, '', '', 'marimar', 'a', 'istasoy', 'Male', 1, 1, 0, 'marimar@gmail.com', NULL, '$2y$10$d45Y/TYfgB8tDlBA9OB5Gu2Q/gf0dKu0ylOIH0/eCeYKCGjNimDzG', '', '', '', 'student', 'active', NULL, '2023-07-30 08:37:52', '2023-07-30 08:37:52'),
(19, '', '', 'joshua', 'a', 'dique', 'Male', 1, 2, 0, 'joshua@gmail.com', NULL, '$2y$10$6KH2E1dOxV3NsCUfTMSwkO5Up1wCSugzTggWuSfC2g4E88GAUUcxW', '', '', '', 'faculty', 'active', NULL, '2023-07-31 00:29:49', '2023-07-31 00:29:49'),
(20, '', '', 'marian', 'a', 'delacruz', 'Female', 2, 2, 0, 'marian@gmail.com', NULL, '$2y$10$.KegcPtyTwB6MdJnXLPiO.lFjhAMpJZiYZ/ipJGvZsdWT/7IyyDpK', '1691164471.png', '', '', 'faculty', 'active', NULL, '2023-07-31 00:30:40', '2023-08-04 15:54:31'),
(21, 'john doe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'john@gmail.com', NULL, '$2y$10$Ct6swlS9ppoEWYw/madWC.IYZ1RQ2wuraFimUB1oHCW1vSV8kVYxW', NULL, NULL, NULL, 'admin', 'active', NULL, NULL, '2023-07-31 01:34:37'),
(22, '', '', 'marites', 'a', 'kalang', 'Female', 3, 2, 0, 'marities@gmail.com', NULL, '$2y$10$vR9jgYSEIMPdrRQfcbHzbuUU.Dz8oQJLXSVQaxLBwrFZB1ivv/K5W', '', '', '', 'student', 'active', NULL, '2023-08-01 06:55:58', '2023-08-01 06:55:58'),
(23, '', '', 'jay r', 'a', 'siaboc', 'Male', 2, 2, 0, 'jr@gmail.com', NULL, '$2y$10$FctQGcGN7TDY6l/g.sThT.5Irg17T.HjPMaiiHxL1QAbm0RYLnrcW', '', '', '', 'student', 'notverified', NULL, '2023-08-01 06:56:39', '2023-08-01 06:56:39'),
(24, '', '', 'Lina', 'Baccay', 'Turingan', 'Female', 1, 2, 0, 'turingan@gmail.com', NULL, '$2y$10$tKe/OKlAIEl1bLAgp15h9eynQ4wHIDE0cejNGsU36kBRjBT68j.FS', '', '', '', 'student', 'active', NULL, '2023-09-06 04:45:38', '2023-09-06 04:45:38'),
(25, '', '', 'roldan', 'Salvacion Dela', 'merced', 'Male', 1, 2, 1, 'kissier0921@gmail.com', NULL, '$2y$10$lwvK5DU/wMzmEXhi1R63tOdqAw1KszzLpxfVez9/1cn9IXm7l6kta', '', '', '', 'faculty', 'active', NULL, '2024-03-10 20:17:57', '2024-03-10 20:17:57'),
(26, '', '', 'roldan', 'Salvacion Dela', 'merced', 'Male', 1, 2, 0, 'kissier060712@gmail.com', NULL, '$2y$10$Hc5xR6AloZiEKexVWa3XieHO5Vw7HEpCARVx44fvcw1E1EYZdsC3K', '', '', '', 'faculty', 'notverified', NULL, '2024-04-25 11:14:54', '2024-04-25 11:14:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `curriculums`
--
ALTER TABLE `curriculums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facultyuploads`
--
ALTER TABLE `facultyuploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `manuscript_types`
--
ALTER TABLE `manuscript_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `thesis_capstones`
--
ALTER TABLE `thesis_capstones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `curriculums`
--
ALTER TABLE `curriculums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7213220;

--
-- AUTO_INCREMENT for table `facultyuploads`
--
ALTER TABLE `facultyuploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=640;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manuscript_types`
--
ALTER TABLE `manuscript_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thesis_capstones`
--
ALTER TABLE `thesis_capstones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
