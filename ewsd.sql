-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2020 at 08:38 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ewsd`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `article_id` bigint(20) UNSIGNED NOT NULL,
  `magazine_id` bigint(20) UNSIGNED NOT NULL,
  `article_file_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_photo_url_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_photo_url_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_photo_url_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `article_is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `staff_id` bigint(20) UNSIGNED DEFAULT NULL,
  `article_created_at` timestamp NULL DEFAULT NULL,
  `article_updated_at` timestamp NULL DEFAULT NULL,
  `article_deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `article_id` bigint(20) UNSIGNED NOT NULL,
  `comment_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_id` bigint(20) UNSIGNED NOT NULL,
  `comment_created_at` timestamp NULL DEFAULT NULL,
  `comment_deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `faculty_id` bigint(20) UNSIGNED NOT NULL,
  `faculty_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`faculty_id`, `faculty_name`) VALUES
(1, 'Computing'),
(2, 'Information System');

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `gender_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`gender_id`, `gender_name`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `magazines`
--

CREATE TABLE `magazines` (
  `magazine_id` bigint(20) UNSIGNED NOT NULL,
  `magazine_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `magazine_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `magazine_img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_id` bigint(20) UNSIGNED NOT NULL,
  `academic_year` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_articles` int(11) NOT NULL,
  `magazine_closure_date` date NOT NULL,
  `magazine_final_closure_date` date NOT NULL,
  `magazine_created_at` timestamp NULL DEFAULT NULL,
  `magazine_updated_at` timestamp NULL DEFAULT NULL,
  `magazine_deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_students_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `staff_id` bigint(20) UNSIGNED NOT NULL,
  `staff_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `faculty_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `staff_profile_img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_created_at` timestamp NULL DEFAULT NULL,
  `staff_updated_at` timestamp NULL DEFAULT NULL,
  `staff_deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `student_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faculty_id` bigint(20) UNSIGNED NOT NULL,
  `student_profile_img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_id_img_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `student_dob` date NOT NULL,
  `student_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `student_created_at` timestamp NULL DEFAULT NULL,
  `student_updated_at` timestamp NULL DEFAULT NULL,
  `student_deleted_at` timestamp NULL DEFAULT NULL,
  `StudentGUID` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `student_name`, `student_username`, `student_email`, `student_password`, `faculty_id`, `student_profile_img_url`, `student_id_img_url`, `student_is_approved`, `student_dob`, `student_address`, `gender_id`, `student_created_at`, `student_updated_at`, `student_deleted_at`, `StudentGUID`) VALUES
(1, 'Suan', 'Suan123', 'suan@gmail.com', '12345', 2, 'images/StudentImages/_failure.jpg', 'images/StudentidImages/_failure.jpg', 1, '1998-03-18', 'Yangon', 1, '2020-10-08 14:40:27', NULL, NULL, '{530183B7-00A4-C799-C729-A24301B5389D}'),
(2, 'Hugo', 'Hugo123', 'hi@gmail.com', 'rstys4r55y6', 1, 'images/StudentImages/_man6.jfif', 'images/StudentidImages/_failure.jpg', 0, '1998-03-18', 'Yangon', 1, '2020-10-08 14:41:10', NULL, NULL, '{B082D273-0BCD-013B-D41C-86760ACD6410}'),
(3, 'John', 'John123werw', 'johnsf@gmail.com', '3w4r3tws4', 2, 'images/StudentImages/_1200px-Iterative_development_model.svg.png', 'images/StudentidImages/_failure.jpg', 0, '0000-00-00', 'Yangon', 1, '2020-10-08 15:25:59', NULL, NULL, '{43F6D2AB-EF6A-8233-8EB5-C60D10200ECF}'),
(4, 'Juan', 'Juan123', 'juan@gmail.com', 'dthrdtsshy', 1, 'images/StudentImages/_man6.jfif', 'images/StudentidImages/_web-development-team.jpg', 0, '1999-02-09', 'Yangon', 2, '2020-10-08 15:36:30', NULL, NULL, '{730754D6-00DC-0AF1-4D23-D51E4E83EC80}'),
(5, 'John', 'John123rty54ry4', 'johnsfghdfyf@gmail.com', 'rstfdrgextd', 1, 'images/StudentImages/_about_2.jpg', 'images/StudentidImages/_person_3.jpg', 0, '1998-02-03', 'Yangon', 1, '2020-10-09 05:06:59', NULL, NULL, '{42D8B09E-A318-5FB3-F45B-FD25D43BFF2A}'),
(6, 'John', 'John123v4twe4r', 'johnsdfsfwerw3r@gmail.com', 'wertwserefsr', 1, 'images/StudentImages/_about_1.jpg', 'images/StudentidImages/_person_2.jpg', 0, '2000-06-14', 'Yangon', 1, '2020-10-09 05:12:05', NULL, NULL, '{6B6B8F08-43ED-E084-3C8D-E6121F1453EE}'),
(8, 'John', 'John123dhgkjdctgu', 'juansagredxthsryf@gmail.com', 'tdhszxrhzsy', 1, 'images/StudentImages/_logo.png', 'images/StudentidImages/_img_1.jpg', 0, '2020-10-29', 'Yangon', 1, '2020-10-09 05:25:42', NULL, NULL, '{A672EB66-F2C5-20B3-5778-C44BACD78A5D}'),
(10, 'Suan', 'Suan123452', 'juandrtgtsrzh@gmail.com', '12345', 1, 'images/StudentImages/_man6.jfif', 'images/StudentidImages/_web-development-team.jpg', 0, '1999-03-11', '', 1, '2020-10-11 06:06:41', NULL, NULL, '{2C2CE58D-4DC8-3506-E1DB-F0DB2181AF83}'),
(12, 'Suan', 'Suantthetdherx', 'johnsfaq2edet@gmail.com', '12345', 1, 'images/StudentImages/_627x627-SftwareDev-Feature-HUSS.jpg', 'images/StudentidImages/_failure.jpg', 0, '2020-10-02', 'Yangon', 1, '2020-10-12 01:57:20', NULL, NULL, '{4344F960-A2BC-22F5-D035-C449C6A543AF}'),
(13, 'Suan', 'Suan123etjryzjzryherte4rt35ey46usr', 'hidhnyy@gmail.com', '12wedfghyururfhc', 1, 'images/StudentImages/_1200px-Iterative_development_model.svg.png', 'images/StudentidImages/_failure.jpg', 0, '2020-10-09', 'Yangon', 1, '2020-10-12 02:01:13', NULL, NULL, '{FE382258-9684-9D25-AA51-7437408DFE2B}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `articles_student_id_foreign` (`student_id`),
  ADD KEY `articles_staff_id_foreign` (`staff_id`),
  ADD KEY `articles_magazine_id_foreign` (`magazine_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `comments_article_id_foreign` (`article_id`),
  ADD KEY `comments_staff_id_foreign` (`staff_id`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indexes for table `magazines`
--
ALTER TABLE `magazines`
  ADD PRIMARY KEY (`magazine_id`),
  ADD KEY `magazines_staff_id_foreign` (`staff_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `staffs_staff_username_unique` (`staff_username`),
  ADD UNIQUE KEY `staffs_staff_email_unique` (`staff_email`),
  ADD KEY `staffs_faculty_id_foreign` (`faculty_id`),
  ADD KEY `staffs_role_id_foreign` (`role_id`),
  ADD KEY `staffs_gender_id_foreign` (`gender_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `students_student_username_unique` (`student_username`),
  ADD UNIQUE KEY `students_student_email_unique` (`student_email`),
  ADD KEY `students_faculty_id_foreign` (`faculty_id`),
  ADD KEY `students_gender_id_foreign` (`gender_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `article_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `faculty_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `gender_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `magazines`
--
ALTER TABLE `magazines`
  MODIFY `magazine_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `staff_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_magazine_id_foreign` FOREIGN KEY (`magazine_id`) REFERENCES `magazines` (`magazine_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `articles_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `articles_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`) ON DELETE CASCADE;

--
-- Constraints for table `magazines`
--
ALTER TABLE `magazines`
  ADD CONSTRAINT `magazines_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`) ON DELETE CASCADE;

--
-- Constraints for table `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `staffs_faculty_id_foreign` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`faculty_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staffs_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staffs_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_faculty_id_foreign` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`faculty_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
