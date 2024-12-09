-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2024 at 11:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

DROP DATABASE IF EXISTS workout_tracker;
CREATE DATABASE IF NOT EXISTS workout_tracker;
USE workout_tracker;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bmcc_student_companion`
--
CREATE DATABASE IF NOT EXISTS `bmcc_student_companion` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bmcc_student_companion`;

-- --------------------------------------------------------

--
-- Table structure for table `ai_tutor_logs`
--

CREATE TABLE `ai_tutor_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `interaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `interaction_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `instructor_name` varchar(255) DEFAULT NULL,
  `semester` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `online` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_code`, `instructor_name`, `semester`, `description`, `online`, `created_at`) VALUES
(1, 'Introduction to Programming', 'CSC111', 'Louise Yan', 'Fall 2024', 'This course is an introduction to the fundamental concepts and terms of computer science, including algorithms, problem solving techniques, data types, concept of loops, conditional statements, modular programming, pointers, arrays, strings, basic file processing, structures and simple classes. Students will use a high-level computer programming language to solve a variety of problems.', 1, '2024-11-01 23:43:49'),
(2, 'Advanced Programming Techniques', 'CSC211', 'Mohammad Azhar', 'Fall 2024', 'This is a second course in programming which will further develop those skills gained in CSC 111 emphasizing reliability, maintainability, and reusability. Students will be introduced to applications of Pointers, Dynamic memory allocation, Arrays, Abstract data types, Objects, classes, and object-oriented design. Additional programming topics such as Inheritance, Polymorphism, Text Processing, Exception Handling, Recursion and Templates will also be covered.', 1, '2024-11-01 23:43:49'),
(3, 'Fundamentals of Computer Systems', 'CSC215', 'Yan Chen', 'Fall 2024', 'This course covers the fundamentals of computer organization and digital logic. Topics include number systems and codes, Boolean algebra, digital circuits, combinational logic design principles, sequential logic design principles, functional components of computer systems, hardware description language, and assembly language. Students will use computer aided design (CAD) tools for digital logic design, analysis and simulation.', 0, '2024-11-01 23:43:49'),
(4, 'Discrete Structures and Applications to Computer Science', 'CSC331', 'Jose Ramon Santos', 'Fall 2024', 'This course will introduce students to linear and non-linear data structures, their use and implementation, algorithms, and software engineering techniques. Topics will include: stacks, queues, lined lists, has tables, trees, graphs, searching and sorting techniques. Asymptotic analysis of algorithms and data structures will also be discussed.', 0, '2024-11-01 23:43:49'),
(5, 'Software Development', 'CSC350', 'Maryam Vatankhah', 'Fall 2024', 'This course covers the fundamentals of software development, including software development life cycle, object-oriented paradigm, design patterns and event-driven programming working in teams. The students are required to develop software applications with graphic user interfaces and databases.', 0, '2024-11-01 23:43:49'),
(6, 'Introduction to Computer Science', 'CSC101', 'Alan Turing', 'Spring 2023', 'Fundamental computer science principles including problem solving, algorithms, and programming basics.', 0, '2024-11-01 23:43:49'),
(7, 'Calculus I', 'MAT301', 'Isaac Newton', 'Spring 2023', 'Introduction to calculus, covering limits, derivatives, and integrals.', 0, '2024-11-01 23:43:49'),
(8, 'Calculus II', 'MAT302', 'Albert Einstein', 'Fall 2023', 'Continuation of Calculus I, focusing on integration techniques, applications, and series.', 0, '2024-11-01 23:43:49'),
(9, 'Physics for Engineers', 'PHY215', 'Marie Curie', 'Fall 2023', 'Introduction to physics principles for engineering students, covering mechanics, thermodynamics, and wave motion.', 0, '2024-11-01 23:43:49'),
(10, 'Data Structures', 'CSC231', 'Grace Hopper', 'Spring 2024', 'Introduction to data structures, including arrays, linked lists, stacks, and queues.', 0, '2024-11-01 23:43:49'),
(11, 'Information Systems', 'CIS345', 'Ada Lovelace', 'Spring 2024', 'Overview of information systems and their role in business operations, data management, and systems analysis.', 0, '2024-11-01 23:43:49'),
(12, 'Introduction to Statistics', 'MAT206', 'Florence Nightingale', 'Fall 2023', 'Foundational concepts of statistics, covering probability, distributions, and hypothesis testing.', 0, '2024-11-01 23:43:49');

-- --------------------------------------------------------

--
-- Table structure for table `course_enrollment`
--

CREATE TABLE `course_enrollment` (
  `enrollment_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `enrollment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_enrollment`
--

INSERT INTO `course_enrollment` (`enrollment_id`, `user_id`, `course_id`, `enrollment_date`) VALUES
(1, 1, 2, '2024-11-02 13:36:17'),
(2, 1, 3, '2024-11-02 13:36:17'),
(3, 1, 1, '2023-02-01 05:00:00'),
(4, 1, 6, '2023-02-01 05:00:00'),
(5, 1, 7, '2023-09-01 04:00:00'),
(6, 1, 8, '2023-09-01 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `file_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `file_type` enum('lecture_notes','textbook','syllabus','ppt','video','other') NOT NULL,
  `description` text DEFAULT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `grade` char(2) DEFAULT NULL,
  `grade_points` decimal(3,2) DEFAULT NULL,
  `semester` varchar(50) DEFAULT NULL,
  `date_awarded` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `user_id`, `course_id`, `grade`, `grade_points`, `semester`, `date_awarded`) VALUES
(1, 1, 1, 'A', 4.00, 'Spring 2023', '2023-06-01'),
(2, 1, 6, 'B', 3.00, 'Spring 2023', '2023-06-01'),
(3, 1, 7, 'B+', 3.30, 'Fall 2023', '2023-12-15'),
(4, 1, 8, 'A-', 3.70, 'Fall 2023', '2023-12-15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gpa` decimal(3,2) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `major` varchar(55) DEFAULT NULL,
  `role` enum('student','instructor','admin') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `gpa`, `password`, `major`, `role`, `created_at`) VALUES
(1, 'Bryan', 'Tikhonov', 'bryan.tikhonov@example.com', 3.50, '12345', 'CS', 'student', '2024-11-01 23:43:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ai_tutor_logs`
--
ALTER TABLE `ai_tutor_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_code` (`course_code`);

--
-- Indexes for table `course_enrollment`
--
ALTER TABLE `course_enrollment`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ai_tutor_logs`
--
ALTER TABLE `ai_tutor_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `course_enrollment`
--
ALTER TABLE `course_enrollment`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ai_tutor_logs`
--
ALTER TABLE `ai_tutor_logs`
  ADD CONSTRAINT `ai_tutor_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ai_tutor_logs_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE SET NULL;

--
-- Constraints for table `course_enrollment`
--
ALTER TABLE `course_enrollment`
  ADD CONSTRAINT `course_enrollment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_enrollment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE SET NULL;

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2019-10-21 13:37:09', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `qbase`
--
CREATE DATABASE IF NOT EXISTS `qbase` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `qbase`;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `AnswerID` int(11) NOT NULL,
  `QuestionID` int(11) DEFAULT NULL,
  `AnswerText` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`AnswerID`, `QuestionID`, `AnswerText`) VALUES
(2565, 647, 'void'),
(2566, 647, 'int'),
(2567, 647, 'float'),
(2568, 647, 'char'),
(2569, 648, 'void func();'),
(2570, 648, 'int func();'),
(2571, 648, 'void func(int x);'),
(2572, 648, 'func void();'),
(2573, 649, 'Nothing'),
(2574, 649, 'Hello\\, World!'),
(2575, 649, 'Error'),
(2576, 649, '\\ 0'),
(2577, 650, 'A declaration of a function without its implementation'),
(2578, 650, 'A function definition with the implementation'),
(2579, 650, 'A function call'),
(2580, 650, 'A variable declaration'),
(2581, 651, 'To allocate memory'),
(2582, 651, 'To declare variables'),
(2583, 651, 'To inform the compiler about the function’s return type and parameters'),
(2584, 651, 'To implement the function'),
(2585, 652, 'Hi\\, Bob'),
(2586, 652, 'Hi\\, Alice'),
(2587, 652, 'Error'),
(2588, 652, 'Nothing'),
(2589, 653, 'sum(x\\, y);'),
(2590, 653, 'int result = sum();'),
(2591, 653, 'int result = sum(x\\, y);'),
(2592, 653, 'sum();'),
(2593, 654, 'void functions return an integer value'),
(2594, 654, 'int functions do not return any value'),
(2595, 654, 'void functions do not return a value\\, int functions return an integer value'),
(2596, 654, 'Both return an integer value'),
(2597, 655, '1'),
(2598, 655, '2'),
(2599, 655, '3'),
(2600, 655, '\\ 0'),
(2601, 656, 'A function that returns a pointer'),
(2602, 656, 'A function that calls another function'),
(2603, 656, 'A function that calls itself'),
(2604, 656, 'A function that does not return a value'),
(2605, 657, 'void func() { func(); }'),
(2606, 657, 'int main() { func(); }'),
(2607, 657, 'void func() { cout << \\\"Hello\\\"; }'),
(2608, 657, 'int main() { return 0; }'),
(2609, 658, 'The first recursive call'),
(2610, 658, 'The condition that stops further recursive calls'),
(2611, 658, 'The function call itself'),
(2612, 658, 'The return statement'),
(2613, 659, '3'),
(2614, 659, '6'),
(2615, 659, '9'),
(2616, 659, '\\ 0'),
(2617, 660, 'void func(int x);'),
(2618, 660, 'int func();'),
(2619, 660, 'char func(int y);'),
(2620, 660, 'void func();'),
(2621, 661, '5'),
(2622, 661, '10'),
(2623, 661, '15'),
(2624, 661, 'Error'),
(2625, 662, 'void'),
(2626, 662, 'int'),
(2627, 662, 'float'),
(2628, 662, 'char'),
(2629, 663, '1'),
(2630, 663, '2'),
(2631, 663, '3'),
(2632, 663, '\\ 0'),
(2633, 664, 'return 5;'),
(2634, 664, 'cout << 5;'),
(2635, 664, 'exit(0);'),
(2636, 664, 'output(5);'),
(2637, 665, 'Functions must have different names'),
(2638, 665, 'Functions must have different return types'),
(2639, 665, 'Functions must have the same parameter types'),
(2640, 665, 'Functions can have the same name but different parameter lists'),
(2641, 666, 'Greater'),
(2642, 666, 'Smaller'),
(2643, 666, 'Error'),
(2644, 666, 'Nothing'),
(2645, 667, 'Equal'),
(2646, 667, 'Not Equal'),
(2647, 667, 'Error'),
(2648, 667, 'Nothing'),
(2649, 668, 'Less'),
(2650, 668, 'Equal'),
(2651, 668, 'Greater'),
(2652, 668, 'Error'),
(2653, 669, 'Between'),
(2654, 669, 'Out of range'),
(2655, 669, 'Error'),
(2656, 669, 'Nothing'),
(2657, 670, 'a is greater'),
(2658, 670, 'b is greater'),
(2659, 670, 'Error'),
(2660, 670, 'Nothing'),
(2661, 671, 'To end an if statement'),
(2662, 671, 'To combine two conditions'),
(2663, 671, 'To check another condition if the previous one is false'),
(2664, 671, 'To repeat a block of code'),
(2665, 672, '3'),
(2666, 672, '6'),
(2667, 672, '9'),
(2668, 672, '\\ 0'),
(2669, 673, '3 2 1'),
(2670, 673, '1 2 3'),
(2671, 673, 'Error'),
(2672, 673, 'Nothing'),
(2673, 674, 'The first recursive call'),
(2674, 674, 'The condition that stops further recursive calls'),
(2675, 674, 'The function call itself'),
(2676, 674, 'The return statement'),
(2677, 675, 'Prints 3 2 1'),
(2678, 675, 'Prints 1 2 3'),
(2679, 675, 'Prints 1 2 3'),
(2680, 675, 'Error'),
(2681, 676, 'It will run infinitely'),
(2682, 676, 'It will produce a syntax error'),
(2683, 676, 'It will return 0'),
(2684, 676, 'It will return the wrong value'),
(2685, 677, 'To increase the number of recursive calls'),
(2686, 677, 'To prevent errors'),
(2687, 677, 'To stop the recursion when a condition is met'),
(2688, 677, 'To return a value'),
(2689, 678, 'It must follow an if or else if statement'),
(2690, 678, 'It is optional'),
(2691, 678, 'It must have a condition'),
(2692, 678, 'It can only be used once in a chain of if statements'),
(2693, 679, 'One'),
(2694, 679, 'Two'),
(2695, 679, 'Other'),
(2696, 679, 'Error'),
(2697, 680, 'True'),
(2698, 680, 'False'),
(2699, 680, 'Error'),
(2700, 680, 'Nothing'),
(2701, 681, 'One'),
(2702, 681, 'Five'),
(2703, 681, 'None'),
(2704, 681, 'Error'),
(2705, 682, 'switch(x) {\\n case 1: break;\\n case 2: break;\\n}'),
(2706, 682, 'if (x == 1) { } else { }'),
(2707, 682, 'for (int i = 0; i < 10; i++) { }'),
(2708, 682, 'while (x > 0) { }'),
(2709, 683, '6'),
(2710, 683, '8'),
(2711, 683, '24'),
(2712, 683, '120'),
(2713, 684, 'True'),
(2714, 684, 'False'),
(2715, 684, 'Error'),
(2716, 684, 'Nothing'),
(2717, 685, 'if is used for fixed values, switch for conditions'),
(2718, 685, 'if is used for loops, switch for cases'),
(2719, 685, 'switch is used for fixed values, if for conditions'),
(2720, 685, 'switch is generally used for checking a variable against a set of constants'),
(2721, 686, '0 1 2'),
(2722, 686, '0 1 2'),
(2723, 686, '3 2 1'),
(2724, 686, 'Error'),
(2725, 687, 'for (int i = 0; i++)'),
(2726, 687, 'for (int i = 0; i < 10; i++)'),
(2727, 687, 'for i in range(10):'),
(2728, 687, 'for (i < 10; i++)'),
(2729, 688, 'Prints 1 2 3 4 5'),
(2730, 688, 'Prints 0 1 2 3 4'),
(2731, 688, 'Prints 0 0 0 0'),
(2732, 688, 'Error'),
(2733, 689, '54321'),
(2734, 689, '5 4 3 2 1'),
(2735, 689, '5432'),
(2736, 689, 'Error'),
(2737, 690, 'for loop'),
(2738, 690, 'while loop'),
(2739, 690, 'do-while loop'),
(2740, 690, 'none of the above'),
(2741, 691, 'while (true) {}'),
(2742, 691, 'for (int i = 0; i < 5; i++) {}'),
(2743, 691, 'do {} while (i < 5);'),
(2744, 691, 'while (false) {}'),
(2745, 692, 'Stops the loop'),
(2746, 692, 'Skips the current iteration and continues with the next'),
(2747, 692, 'Exits the loop'),
(2748, 692, 'Repeats the current iteration'),
(2749, 693, '0124'),
(2750, 693, '01234'),
(2751, 693, '1234'),
(2752, 693, 'Error'),
(2753, 694, '12'),
(2754, 694, '123'),
(2755, 694, '1234'),
(2756, 694, 'Error'),
(2757, 695, 'for loop'),
(2758, 695, 'infinite loop'),
(2759, 695, 'do-while loop'),
(2760, 695, 'none of the above'),
(2761, 696, 'To execute a block of code exactly once'),
(2762, 696, 'To repeat a block of code multiple times'),
(2763, 696, 'To handle conditional logic'),
(2764, 696, 'To prevent errors in code'),
(2765, 697, 'for loop'),
(2766, 697, 'while loop'),
(2767, 697, 'do-while loop'),
(2768, 697, 'none of the above'),
(2769, 698, 'It is always executed at least once'),
(2770, 698, 'It may never execute'),
(2771, 698, 'It only executes once'),
(2772, 698, 'It can only be used with numbers'),
(2773, 699, '135'),
(2774, 699, '12'),
(2775, 699, '345'),
(2776, 699, '12345'),
(2777, 700, 'for (int i = 5; i > 0; i--)'),
(2778, 700, 'for (int i = 5; i++)'),
(2779, 700, 'for (i > 0; i--)'),
(2780, 700, 'for (int i = 0; i < 5; i--)'),
(2781, 701, 'Prints i and j pairs 5 times'),
(2782, 701, 'Prints all combinations of i and j'),
(2783, 701, 'Prints 0 1 2 3 4'),
(2784, 701, 'Error'),
(2785, 702, 'A loop that runs infinitely'),
(2786, 702, 'A loop inside another loop'),
(2787, 702, 'A loop that runs in reverse'),
(2788, 702, 'A loop that uses break statements'),
(2789, 703, '0 1 2'),
(2790, 703, '0 0 1 0 2'),
(2791, 703, '0 0 1 2'),
(2792, 703, 'Error'),
(2793, 704, 'for loop runs infinitely, while loop terminates'),
(2794, 704, 'while loop runs faster than for loop'),
(2795, 704, 'for loop is used for a known number of iterations, while loop is used for unknown number of iterations'),
(2796, 704, 'while loop has no condition'),
(2797, 705, 'Prints 0 2 4'),
(2798, 705, 'Prints 0 1 2 3 4'),
(2799, 705, 'Prints 0 1 2 3 4 5'),
(2800, 705, 'Error'),
(2801, 706, 'Error'),
(2802, 706, 'File not found'),
(2803, 706, 'The contents of example.txt'),
(2804, 706, 'No output'),
(2805, 707, 'The contents of example.txt will be \\\"abcde\\\"'),
(2806, 707, 'Error opening the file'),
(2807, 707, 'File not found'),
(2808, 707, 'No output'),
(2809, 708, 'std::ifstream'),
(2810, 708, 'std::ofstream'),
(2811, 708, 'std::fopen'),
(2812, 708, 'std::fclose'),
(2813, 709, 'It will store 0 in the integer variable'),
(2814, 709, 'It will throw an exception'),
(2815, 709, 'It will prompt the user again for a valid input'),
(2816, 709, 'It will crash the program'),
(2817, 710, 'To flush the buffer and print immediately'),
(2818, 710, 'To ignore any previous errors'),
(2819, 710, 'To read from a file and store in a variable'),
(2820, 710, 'To write to a file without overwriting it'),
(2821, 711, 'The contents of example.txt'),
(2822, 711, 'Error opening the file'),
(2823, 711, 'File not found'),
(2824, 711, 'No output'),
(2825, 712, 'The contents of example.txt will be \\\"abc\\\"'),
(2826, 712, 'Error opening the file'),
(2827, 712, 'File not found'),
(2828, 712, 'No output'),
(2829, 713, 'std::ifstream'),
(2830, 713, 'std::ofstream'),
(2831, 713, 'std::fopen'),
(2832, 713, 'std::fclose'),
(2833, 714, 'It will store 0 in the char variable'),
(2834, 714, 'It will throw an exception'),
(2835, 714, 'It will prompt the user again for a valid input'),
(2836, 714, 'It will crash the program'),
(2837, 715, 'To ignore any previous errors'),
(2838, 715, 'To read from a file and store in a variable'),
(2839, 715, 'To write to a file without overwriting it'),
(2840, 715, 'To flush the buffer and print immediately'),
(2841, 716, 'The contents of example.txt'),
(2842, 716, 'Error opening the file'),
(2843, 716, 'File not found'),
(2844, 716, 'No output'),
(2845, 717, 'The contents of example.txt will be \\\"abcde\\\"'),
(2846, 717, 'Error opening the file'),
(2847, 717, 'File not found'),
(2848, 717, 'No output'),
(2849, 718, 'std::ifstream'),
(2850, 718, 'std::ofstream'),
(2851, 718, 'std::fopen'),
(2852, 718, 'std::fclose'),
(2853, 719, 'It will store 0 in the integer variable'),
(2854, 719, 'It will throw an exception'),
(2855, 719, 'It will prompt the user again for a valid input'),
(2856, 719, 'It will crash the program'),
(2857, 720, 'To flush the buffer and write immediately'),
(2858, 720, 'To ignore any previous errors'),
(2859, 720, 'To read from a file and store in a variable'),
(2860, 720, 'To write to a file without overwriting it'),
(2861, 721, 'The contents of example.txt'),
(2862, 721, 'Error opening the file'),
(2863, 721, 'File not found'),
(2864, 721, 'No output'),
(2865, 722, 'The contents of example.txt will be \\\"abc\\\"'),
(2866, 722, 'Error opening the file'),
(2867, 722, 'File not found'),
(2868, 722, 'No output'),
(2869, 723, 'std::ifstream'),
(2870, 723, 'std::ofstream'),
(2871, 723, 'std::fopen'),
(2872, 723, 'std::fclose'),
(2873, 724, 'It will store 0 in the char variable'),
(2874, 724, 'It will throw an exception'),
(2875, 724, 'It will prompt the user again for a valid input'),
(2876, 724, 'It will crash the program'),
(2877, 725, 'To ignore any previous errors'),
(2878, 725, 'To read from a file and store in a variable'),
(2879, 725, 'To write to a file without overwriting it'),
(2880, 725, 'To flush the buffer and print immediately'),
(2881, 726, 'The contents of example.txt'),
(2882, 726, 'Error opening the file'),
(2883, 726, 'File not found'),
(2884, 726, 'No output'),
(2885, 727, 'The contents of example.txt will be \\\"abcde\\\"'),
(2886, 727, 'Error opening the file'),
(2887, 727, 'File not found'),
(2888, 727, 'No output'),
(2889, 728, 'std::ifstream'),
(2890, 728, 'std::ofstream'),
(2891, 728, 'std::fopen'),
(2892, 728, 'std::fclose'),
(2893, 729, 'It will store 0 in the integer variable'),
(2894, 729, 'It will throw an exception'),
(2895, 729, 'It will prompt the user again for a valid input'),
(2896, 729, 'It will crash the program'),
(2897, 730, 'To flush the buffer and write immediately'),
(2898, 730, 'To ignore any previous errors'),
(2899, 730, 'To read from a file and store in a variable'),
(2900, 730, 'To write to a file without overwriting it'),
(2901, 731, 'The contents of example.txt'),
(2902, 731, 'Error opening the file'),
(2903, 731, 'File not found'),
(2904, 731, 'No output'),
(2905, 732, 'The contents of example.txt will be \\\"abc\\\"'),
(2906, 732, 'Error opening the file'),
(2907, 732, 'File not found'),
(2908, 732, 'No output'),
(2909, 733, 'std::ifstream'),
(2910, 733, 'std::ofstream'),
(2911, 733, 'std::fopen'),
(2912, 733, 'std::fclose'),
(2913, 734, 'It will store 0 in the char variable'),
(2914, 734, 'It will throw an exception'),
(2915, 734, 'It will prompt the user again for a valid input'),
(2916, 734, 'It will crash the program'),
(2917, 735, 'To ignore any previous errors'),
(2918, 735, 'To read from a file and store in a variable'),
(2919, 735, 'To write to a file without overwriting it'),
(2920, 735, 'To flush the buffer and print immediately'),
(2921, 736, 'The contents of example.txt'),
(2922, 736, 'Error opening the file'),
(2923, 736, 'File not found'),
(2924, 736, 'No output'),
(2925, 737, 'The contents of example.txt will be \\\"abcde\\\"'),
(2926, 737, 'Error opening the file'),
(2927, 737, 'File not found'),
(2928, 737, 'No output'),
(2929, 738, 'std::ifstream'),
(2930, 738, 'std::ofstream'),
(2931, 738, 'std::fopen'),
(2932, 738, 'std::fclose'),
(2933, 739, 'Both are used for input/output operations'),
(2934, 739, 'std::cin is used for text input, std::cout is used for binary output'),
(2935, 739, 'std::cin is used for binary input, std::cout is used for text output'),
(2936, 739, 'None of the above'),
(2937, 740, 'The ASCII value of each character in example.txt'),
(2938, 740, 'The contents of example.txt as strings'),
(2939, 740, 'Error opening the file'),
(2940, 740, 'No output'),
(2941, 741, 'For binary input/output operations only'),
(2942, 741, 'For both text and binary input/output operations'),
(2943, 741, 'For only text input/output operations'),
(2944, 741, 'None of the above'),
(2945, 742, 'fstream file(\'data.txt\');'),
(2946, 742, 'ifstream file(\'data.txt\');'),
(2947, 742, 'ofstream file(\'data.txt\');'),
(2948, 742, 'file.open(\'data.txt\')'),
(2949, 743, 'To write to files'),
(2950, 743, 'To read from files'),
(2951, 743, 'To delete files'),
(2952, 743, 'To close files'),
(2953, 744, 'Writes to a file'),
(2954, 744, 'Reads from a file'),
(2955, 744, 'Checks if the file opened successfully'),
(2956, 744, 'Closes the file'),
(2957, 745, 'file.end();'),
(2958, 745, 'file.close();'),
(2959, 745, 'file.stop();'),
(2960, 745, 'file.exit();'),
(2961, 746, 'The program crashes'),
(2962, 746, 'The program reads garbage values'),
(2963, 746, 'The program opens a new file'),
(2964, 746, 'The program returns an error'),
(2965, 747, 'To write to files'),
(2966, 747, 'To read from files'),
(2967, 747, 'To append to files'),
(2968, 747, 'To manage file pointers'),
(2969, 748, 'ofstream file(\'data.txt\');'),
(2970, 748, 'ofstream file(\'data.txt\', ios::app);'),
(2971, 748, 'file.open(\'data.txt\');'),
(2972, 748, 'fstream file(\'data.txt\', ios::in)'),
(2973, 749, 'The program writes to the file'),
(2974, 749, 'The program reads and writes to the file'),
(2975, 749, 'The program appends to the file'),
(2976, 749, 'The program fails to write to the file'),
(2977, 750, 'Reads from a file'),
(2978, 750, 'Writes \'Hello\' to output.txt'),
(2979, 750, 'Appends \'Hello\' to output.txt'),
(2980, 750, 'Opens and closes a file without writing'),
(2981, 751, 'ios::in is used for writing, ios::out is used for reading'),
(2982, 751, 'ios::in is used for reading, ios::out is used for writing'),
(2983, 751, 'ios::in is used for appending, ios::out is used for truncating'),
(2984, 751, 'There is no difference'),
(2985, 752, 'File streams are used to handle input and output to files'),
(2986, 752, 'File streams automatically close after use'),
(2987, 752, 'File streams can only read from files'),
(2988, 752, 'File streams work only with text files'),
(2989, 753, 'Reads and prints \'0\''),
(2990, 753, 'Reads and prints an empty string'),
(2991, 753, 'Reads and prints garbage values'),
(2992, 753, 'The program crashes'),
(2993, 754, 'file.open();'),
(2994, 754, 'file.fail();'),
(2995, 754, 'file.is_open();'),
(2996, 754, 'file.success()'),
(2997, 755, 'The file content is deleted'),
(2998, 755, 'The file content is appended'),
(2999, 755, 'The file content is locked'),
(3000, 755, 'The file content is reversed'),
(3001, 756, 'The program reads random characters'),
(3002, 756, 'The eofbit flag is set'),
(3003, 756, 'The program crashes'),
(3004, 756, 'The program returns an error code'),
(3005, 757, 'file << seek_start;'),
(3006, 757, 'file << begin;'),
(3007, 757, 'file.seekp(0);'),
(3008, 757, 'file.seekg(0);'),
(3009, 758, 'ios::in'),
(3010, 758, 'ios::out'),
(3011, 758, 'ios::binary'),
(3012, 758, 'ios::in | ios::out'),
(3013, 759, 'ifstream is for writing, fstream is for reading'),
(3014, 759, 'ifstream is for reading, fstream is for both reading and writing'),
(3015, 759, 'ifstream is for binary files, fstream is for text files'),
(3016, 759, 'fstream is faster than ifstream'),
(3017, 760, 'The file is opened and truncated'),
(3018, 760, 'An error occurs'),
(3019, 760, 'Nothing happens'),
(3020, 760, 'A new file is created and opened for appending'),
(3021, 761, 'To close the file'),
(3022, 761, 'To write to a file'),
(3023, 761, 'To get the current position of the file pointer'),
(3024, 761, 'To reset the file pointer'),
(3025, 762, 'Reads and prints the first character in the file'),
(3026, 762, 'Reads and prints all characters in the file'),
(3027, 762, 'Prints nothing'),
(3028, 762, 'Errors out'),
(3029, 763, 'file.move();'),
(3030, 763, 'file.go_to();'),
(3031, 763, 'file.seekg(position);'),
(3032, 763, 'file.rewind(position)'),
(3033, 764, 'Reads the first line of the file'),
(3034, 764, 'Reads and prints an empty string'),
(3035, 764, 'Reads and prints each line from the file'),
(3036, 764, 'Errors out'),
(3037, 765, 'ifstream file(\'data.bin\');'),
(3038, 765, 'ifstream file(\'data.bin\', ios::in);'),
(3039, 765, 'ifstream file(\'data.bin\', ios::binary);'),
(3040, 765, 'fstream file(\'data.bin\')'),
(3041, 766, 'Moves the file pointer to the beginning of the file'),
(3042, 766, 'Closes the file'),
(3043, 766, 'Gets the size of the file in bytes'),
(3044, 766, 'Truncates the file'),
(3045, 767, 'ios::in'),
(3046, 767, 'ios::app'),
(3047, 767, 'ios::binary'),
(3048, 767, 'ios::out'),
(3049, 768, 'To clear the file content'),
(3050, 768, 'To clear error flags associated with a file stream'),
(3051, 768, 'To reset the file pointer'),
(3052, 768, 'To close the file'),
(3053, 769, 'The file is appended'),
(3054, 769, 'The file remains unchanged'),
(3055, 769, 'An error is thrown'),
(3056, 769, 'The file is truncated'),
(3057, 770, 'ifstream file(\'data.bin\', ios::app);'),
(3058, 770, 'ifstream file(\'data.bin\', ios::binary | ios::out);'),
(3059, 770, 'file >> data;'),
(3060, 770, 'file.read(reinterpret_cast<char*>(&data), sizeof(data));'),
(3061, 771, 'ifstream file(\'data.txt\', ios::in | ios::binary);'),
(3062, 771, 'ofstream file(\'data.txt\', ios::out);'),
(3063, 771, 'fstream file(\'data.txt\', ios::in | ios::out);'),
(3064, 771, 'file.open(\'data.txt\')'),
(3065, 772, 'To store memory addresses'),
(3066, 772, 'To store values'),
(3067, 772, 'To store strings'),
(3068, 772, 'To store integers'),
(3069, 773, 'int ptr'),
(3070, 773, 'int ptr'),
(3071, 773, 'int ptr'),
(3072, 773, 'int: ptr'),
(3073, 774, 'It creates a pointer variable and assigns it the memory address of x'),
(3074, 774, 'It creates an integer variable x and assigns it the value 5, then creates a pointer variable px and assigns it the address of x'),
(3075, 774, 'It creates two integer variables x and px and assigns them both the value 5'),
(3076, 774, 'It creates a pointer variable px and assigns it the value 5'),
(3077, 775, 'The first declares a pointer to an integer, while the second declares a pointer to another pointer'),
(3078, 775, 'The first declares a pointer to an integer, while the second declares an integer variable'),
(3079, 775, 'Both declare pointers to integers, but the second one is a pointer to a pointer'),
(3080, 775, 'None of the above'),
(3081, 776, 'The value stored in the variable pointed by px, which is 5'),
(3082, 776, 'The memory address stored in px, which is not a meaningful output for the user'),
(3083, 776, 'An error message, because px is not initialized correctly'),
(3084, 776, 'The value of x, which is 5'),
(3085, 777, 'It creates a new pointer variable and assigns it the memory address of an existing integer variable x'),
(3086, 777, 'It reassigns the memory address stored in px to point to a different integer variable, which may not exist yet'),
(3087, 777, 'It tries to create a new integer variable named px, but this will cause an error if x has been previously declared'),
(3088, 777, 'None of the above'),
(3089, 778, 'The first declares a pointer variable, while the second returns the memory address of an integer variable'),
(3090, 778, 'The first returns the memory address of an integer variable, while the second declares a pointer variable'),
(3091, 778, 'Both are used to get the memory address of x, but with different syntax'),
(3092, 778, 'None of the above'),
(3093, 779, 'It creates a pointer variable that points to an integer variable that has already been initialized, and then assigns the memory address of this variable to px'),
(3094, 779, 'It reassigns the memory address stored in px to point to a different static integer variable'),
(3095, 779, 'It tries to create a new static integer variable named x, but this will cause an error if x has been previously declared as non-static'),
(3096, 779, 'None of the above'),
(3097, 780, 'A pointer that points to nowhere (NULL)'),
(3098, 780, 'An error message because NULL is not a valid integer value.'),
(3099, 780, 'px is set to 0, which can be interpreted as \'no value\''),
(3100, 780, 'None of the above'),
(3101, 781, 'It creates a new pointer variable and assigns it the memory address of an existing integer variable'),
(3102, 781, 'It allocates memory on the heap for an integer variable and returns a pointer to it'),
(3103, 781, 'It tries to create a new integer variable on the stack, but this will cause an error because px is declared as a pointer variable'),
(3104, 781, 'None of the above'),
(3105, 782, 'It creates five integer variables on the heap and returns an array of pointers to them, which can be assigned to px'),
(3106, 782, 'It allocates memory on the heap for five integer variables and returns a pointer to the first element'),
(3107, 782, 'It tries to create an integer variable named px on the stack, but this will cause an error because new is used with brackets'),
(3108, 782, 'None of the above'),
(3109, 783, 'It deletes the memory allocated for the pointer pointed by x and makes px a dangling pointer, so any further access to the deleted memory will result in undefined behavior'),
(3110, 783, 'It deallocates the memory stored in the variable pointed by x and makes px point to garbage or an error message is shown'),
(3111, 783, 'It reassigns the memory address of x to be used later with delete'),
(3112, 783, 'None of the above'),
(3113, 784, 'Using the delete operator followed by the address stored in a pointer variable'),
(3114, 784, 'Using the free function from C++ Standard Library'),
(3115, 784, 'Using the malloc and realloc functions from the C library'),
(3116, 784, 'None of the above'),
(3117, 785, 'The value stored in each element of the array pointed by px, which can be used later with delete to free this memory'),
(3118, 785, 'A random set of values that appear to be integers, but will result in undefined behavior when accessed further'),
(3119, 785, 'An error message because the memory has not been deallocated yet'),
(3120, 785, 'None of the above'),
(3121, 786, 'It assigns the address stored in x to px, so that further operations using px will modify x directly and vice versa'),
(3122, 786, 'It allocates memory on the heap for an integer variable, but does not assign it a value yet, which is then assigned the address of the integer variable named x, causing undefined behavior when accessed later'),
(3123, 786, 'px now points to x instead of being allocated new space on the heap'),
(3124, 786, 'None of the above'),
(3125, 787, 'The first declares a pointer that points directly at an existing integer variable x, while the second allocates memory for an integer on the heap and assigns it to px'),
(3126, 787, 'The first creates a static variable that is initialized with the address of x, while the second tries to create a new static variable named x'),
(3127, 787, 'px in both cases will point to garbage or throw errors depending on how they are used further'),
(3128, 787, 'None of the above'),
(3129, 788, 'It allocates memory for an integer, then immediately deallocates it and makes px a dangling pointer'),
(3130, 788, 'It tries to deallocate memory that has already been freed, but this will not throw an error or cause undefined behavior'),
(3131, 788, 'px now points to the newly allocated memory on the heap, which can be used to store another value later with new'),
(3132, 788, 'None of the above'),
(3133, 789, 'It allocates memory for an array of five integers and then deallocates it using the correct syntax for deleting arrays, making px point to garbage'),
(3134, 789, 'It tries to deallocate memory that has already been freed, but this will not throw an error or cause undefined behavior'),
(3135, 789, 'px is now a dangling pointer pointing at memory that was successfully deleted with delete[]'),
(3136, 789, 'None of the above'),
(3137, 790, 'The address of the newly allocated integer variable, which can be used to access it further with the dereference operator * and then delete again when done'),
(3138, 790, 'An error message because px has been deleted already, and its value now points at freed memory'),
(3139, 790, 'A random garbage value that is not related to the memory allocation operation'),
(3140, 790, 'None of the above'),
(3141, 791, 'It tries to deallocate memory allocated using new, which is incorrect because delete[] should be used only with arrays, resulting in undefined behavior'),
(3142, 791, 'An error message is shown indicating that delete[] cannot be used on non-array pointers like px, and the program terminates immediately'),
(3143, 791, 'The operation will execute without errors, but px will point to garbage memory or throw an error when accessed later'),
(3144, 791, 'None of the above'),
(3145, 792, 'A variable that stores a value'),
(3146, 792, 'A variable that stores the memory address of another variable'),
(3147, 792, 'A constant value'),
(3148, 792, 'A function that points to memory'),
(3149, 793, 'Memory address of x'),
(3150, 793, '5'),
(3151, 793, 'Error'),
(3152, 793, '\\ 0'),
(3153, 794, '&'),
(3154, 794, '*'),
(3155, 794, '@'),
(3156, 794, '%='),
(3157, 795, '&'),
(3158, 795, '*'),
(3159, 795, '->'),
(3160, 795, '=>'),
(3161, 796, 'int p = 5;'),
(3162, 796, 'int* p;'),
(3163, 796, 'int& p;'),
(3164, 796, 'int p*;'),
(3165, 797, 'Memory address of x'),
(3166, 797, '10'),
(3167, 797, 'Memory address of p'),
(3168, 797, 'Error'),
(3169, 798, 'To allocate memory statically'),
(3170, 798, 'To prevent memory access'),
(3171, 798, 'To allocate memory at runtime'),
(3172, 798, 'To initialize variables'),
(3173, 799, 'alloc'),
(3174, 799, 'calloc'),
(3175, 799, 'new'),
(3176, 799, 'malloc'),
(3177, 800, 'int arr[10];'),
(3178, 800, 'int* arr = new int;'),
(3179, 800, 'int* arr = new int[10];'),
(3180, 800, 'int* arr = malloc(10);'),
(3181, 801, 'Free the memory using delete'),
(3182, 801, 'Free the memory using delete[]'),
(3183, 801, 'Free the memory using free()'),
(3184, 801, 'Nothing, memory is automatically deallocated'),
(3185, 802, 'The program will crash'),
(3186, 802, 'Memory leak will occur'),
(3187, 802, 'The memory will be deleted automatically'),
(3188, 802, 'The program will not compile'),
(3189, 803, 'free(pointer);'),
(3190, 803, 'delete pointer;'),
(3191, 803, 'clear(pointer);'),
(3192, 803, 'remove(pointer);'),
(3193, 804, 'delete[] pointer;'),
(3194, 804, 'delete pointer;'),
(3195, 804, 'free(pointer);'),
(3196, 804, 'remove[] pointer;'),
(3197, 805, 'When memory is allocated incorrectly'),
(3198, 805, 'When memory is freed multiple times'),
(3199, 805, 'When dynamically allocated memory is not freed'),
(3200, 805, 'When the program crashes due to memory issues'),
(3201, 806, 'To deallocate memory allocated using new'),
(3202, 806, 'To allocate memory dynamically'),
(3203, 806, 'To free memory allocated using malloc'),
(3204, 806, 'To initialize variables'),
(3205, 807, 'To deallocate memory allocated for an array using new[]'),
(3206, 807, 'To allocate memory dynamically'),
(3207, 807, 'To free memory allocated for an array using malloc'),
(3208, 807, 'To initialize variables'),
(3209, 808, 'delete is used to deallocate memory allocated using new, while delete[] is used to deallocate memory allocated for an array using new[]'),
(3210, 808, 'delete is used to deallocate memory allocated for an array using new[], while delete[] is used to deallocate memory allocated using new'),
(3211, 808, 'delete is used to allocate memory dynamically, while delete[] is used to deallocate memory allocated using new'),
(3212, 808, 'delete is used to free memory allocated using malloc, while delete[] is used to deallocate memory allocated for an array using malloc'),
(3213, 809, 'To allocate memory dynamically'),
(3214, 809, 'To free memory allocated using new'),
(3215, 809, 'To initialize variables'),
(3216, 809, 'To deallocate memory'),
(3217, 810, 'To deallocate memory allocated using malloc'),
(3218, 810, 'To allocate memory dynamically'),
(3219, 810, 'To free memory allocated using new'),
(3220, 810, 'To initialize variables'),
(3221, 811, 'A function that cannot be overridden'),
(3222, 811, 'A function that belongs to the base class only'),
(3223, 811, 'A function in the base class that can be overridden by derived classes'),
(3224, 811, 'A function with no implementation'),
(3225, 812, 'To disable inheritance'),
(3226, 812, 'To allow a derived class to override a base class method'),
(3227, 812, 'To allow multiple inheritance'),
(3228, 812, 'To declare an abstract class'),
(3229, 813, 'A'),
(3230, 813, 'B'),
(3231, 813, 'Error'),
(3232, 813, 'Undefined behavior'),
(3233, 814, 'A function that does not return a value'),
(3234, 814, 'A function that must be implemented by derived classes'),
(3235, 814, 'A function that cannot be overridden'),
(3236, 814, 'A function that returns null'),
(3237, 815, 'virtual void func() { }'),
(3238, 815, 'virtual void func();'),
(3239, 815, 'virtual void func() = 0;'),
(3240, 815, 'void func() = 0;'),
(3241, 816, 'A class that cannot have any members'),
(3242, 816, 'A class that cannot be instantiated directly'),
(3243, 816, 'A class that cannot have constructors'),
(3244, 816, 'A class that cannot be inherited'),
(3245, 817, 'The function call produces an error'),
(3246, 817, 'The base class version of the function is used'),
(3247, 817, 'The program crashes'),
(3248, 817, 'The derived class becomes abstract'),
(3249, 818, 'A'),
(3250, 818, 'Error'),
(3251, 818, 'Undefined behavior'),
(3252, 818, 'Nothing'),
(3253, 819, 'When a class inherits from multiple classes'),
(3254, 819, 'When a class has multiple members'),
(3255, 819, 'When multiple classes inherit from a single class'),
(3256, 819, 'When a class is defined in multiple files'),
(3257, 820, 'class A : public B {}'),
(3258, 820, 'class A : public B, public C {}'),
(3259, 820, 'class A { class B {}; };'),
(3260, 820, 'class A : protected B {}'),
(3261, 821, '10'),
(3262, 821, '5'),
(3263, 821, 'Error'),
(3264, 821, 'Undefined behavior'),
(3265, 822, 'Derived class constructor first, then base class'),
(3266, 822, 'Base class constructor first, then derived class'),
(3267, 822, 'Base class constructors are called from left to right'),
(3268, 822, 'Derived class constructors are called first'),
(3269, 823, 'Using the `super` keyword'),
(3270, 823, 'Using the `this` keyword'),
(3271, 823, 'Using the `: base` syntax in the derived class constructor'),
(3272, 823, 'It is called automatically'),
(3273, 824, 'To hide variables from derived classes'),
(3274, 824, 'To allow access to derived classes but not other classes'),
(3275, 824, 'To prevent variables from being changed'),
(3276, 824, 'To allow public access to private variables'),
(3277, 825, 'A'),
(3278, 825, 'B'),
(3279, 825, 'Error'),
(3280, 825, 'Undefined behavior'),
(3281, 826, 'A'),
(3282, 826, 'B'),
(3283, 826, 'Error'),
(3284, 826, 'Undefined behavior'),
(3285, 827, 'They must be pure virtual'),
(3286, 827, 'They cannot be overridden'),
(3287, 827, 'They are used to properly clean up derived class objects'),
(3288, 827, 'They are not necessary for inheritance'),
(3289, 828, 'It is automatically virtual'),
(3290, 828, 'The base class destructor is called'),
(3291, 828, 'The derived class destructor may not be called'),
(3292, 828, 'The program crashes'),
(3293, 829, 'To prevent memory leaks'),
(3294, 829, 'To ensure the derived class destructor is called'),
(3295, 829, 'To prevent inheritance'),
(3296, 829, 'To enforce compile-time polymorphism'),
(3297, 830, 'Static polymorphism occurs at runtime, dynamic at compile-time'),
(3298, 830, 'Dynamic polymorphism occurs at compile-time, static at runtime'),
(3299, 830, 'They behave identically'),
(3300, 830, 'Static polymorphism is resolved at compile-time, dynamic at runtime'),
(3301, 831, 'A'),
(3302, 831, 'C'),
(3303, 831, 'B'),
(3304, 831, 'Error'),
(3305, 832, 'To create a new class that has all the properties and behavior of an existing class'),
(3306, 832, 'To create a new class that has some but not all of the properties and behavior of an existing class'),
(3307, 832, 'To prevent a class from inheriting the properties and behavior of another class'),
(3308, 832, 'None of the above'),
(3309, 833, 'Subclass'),
(3310, 833, 'Inherited Class'),
(3311, 833, 'Parent Class'),
(3312, 833, 'Superclass'),
(3313, 834, 'Parent Class'),
(3314, 834, 'Superclass'),
(3315, 834, 'Base Class'),
(3316, 834, 'Derived Class'),
(3317, 835, 'To create objects that can take on multiple forms depending on their type'),
(3318, 835, 'To prevent objects from taking on multiple forms depending on their type'),
(3319, 835, 'To ensure that all objects have the same properties and behavior'),
(3320, 835, 'None of the above'),
(3321, 836, 'A function that takes a parameter of any data type'),
(3322, 836, 'A class that can be instantiated with different parameters'),
(3323, 836, 'An object that can behave like multiple other objects'),
(3324, 836, 'None of the above'),
(3325, 837, 'A car is a type of vehicle, but not all vehicles are cars'),
(3326, 837, 'A square is a type of rectangle, but not all rectangles are squares'),
(3327, 837, 'A dog is a type of animal, but not all animals are dogs'),
(3328, 837, 'None of the above'),
(3329, 838, 'A function that takes a parameter of any data type'),
(3330, 838, 'A class that can be instantiated with different parameters'),
(3331, 838, 'An object that can behave like multiple other objects'),
(3332, 838, 'None of the above'),
(3333, 839, 'Overridden Method'),
(3334, 839, 'Inherited Method'),
(3335, 839, 'Parent Method'),
(3336, 839, 'Subclass Method'),
(3337, 840, 'To define an interface that must be implemented by any class that inherits from it'),
(3338, 840, 'To provide a default implementation for methods in a subclass'),
(3339, 840, 'To prevent a class from inheriting the properties and behavior of another class'),
(3340, 840, 'None of the above'),
(3341, 841, 'A class that cannot be instantiated and must be inherited by other classes'),
(3342, 841, 'A class that can be instantiated but also has abstract methods'),
(3343, 841, 'An interface that defines a contract for other classes to follow'),
(3344, 841, 'None of the above'),
(3345, 842, 'A function that takes a parameter of any data type'),
(3346, 842, 'A class that can be instantiated with different parameters'),
(3347, 842, 'An object that can behave like multiple other objects'),
(3348, 842, 'None of the above'),
(3349, 843, 'Overridden Method'),
(3350, 843, 'Inherited Method'),
(3351, 843, 'Parent Method'),
(3352, 843, 'Subclass Method'),
(3353, 844, 'To define an interface that must be implemented by any class that inherits from it'),
(3354, 844, 'To provide a default implementation for methods in a subclass'),
(3355, 844, 'To prevent a class from inheriting the properties and behavior of another class'),
(3356, 844, 'None of the above'),
(3357, 845, 'A contract that defines a set of methods that must be implemented by any class that inherits from it'),
(3358, 845, 'A class that can be instantiated but also has abstract methods'),
(3359, 845, 'An object that can behave like multiple other objects'),
(3360, 845, 'None of the above'),
(3361, 846, 'A car is a type of vehicle, but not all vehicles are cars'),
(3362, 846, 'A square is a type of rectangle, but not all rectangles are squares'),
(3363, 846, 'A dog is a type of animal, but not all animals are dogs'),
(3364, 846, 'None of the above'),
(3365, 847, 'A function that takes a parameter of any data type'),
(3366, 847, 'A class that can be instantiated with different parameters'),
(3367, 847, 'An object that can behave like multiple other objects'),
(3368, 847, 'None of the above'),
(3369, 848, 'Subclass'),
(3370, 848, 'Inherited Class'),
(3371, 848, 'Parent Class'),
(3372, 848, 'Superclass'),
(3373, 849, 'A class that cannot be instantiated and must be inherited by other classes'),
(3374, 849, 'A class that can be instantiated but also has abstract methods'),
(3375, 849, 'An interface that defines a contract for other classes to follow'),
(3376, 849, 'None of the above'),
(3377, 850, 'A function that takes a parameter of any data type'),
(3378, 850, 'A class that can be instantiated with different parameters'),
(3379, 850, 'An object that can behave like multiple other objects'),
(3380, 850, 'None of the above'),
(3381, 851, 'Overridden Method'),
(3382, 851, 'Inherited Method'),
(3383, 851, 'Parent Method'),
(3384, 851, 'Subclass Method'),
(3385, 852, 'A contract that defines a set of methods that must be implemented by any class that inherits from it'),
(3386, 852, 'A class that can be instantiated but also has abstract methods'),
(3387, 852, 'An object that can behave like multiple other objects'),
(3388, 852, 'None of the above'),
(3389, 853, 'A function that takes a parameter of any data type'),
(3390, 853, 'A class that can be instantiated with different parameters'),
(3391, 853, 'An object that can behave like multiple other objects'),
(3392, 853, 'None of the above'),
(3393, 854, 'A car is a type of vehicle, but not all vehicles are cars'),
(3394, 854, 'A square is a type of rectangle, but not all rectangles are squares'),
(3395, 854, 'A dog is a type of animal, but not all animals are dogs'),
(3396, 854, 'None of the above'),
(3397, 855, 'A function that takes a parameter of any data type'),
(3398, 855, 'A class that can be instantiated with different parameters'),
(3399, 855, 'An object that can behave like multiple other objects'),
(3400, 855, 'None of the above'),
(3401, 856, 'Overridden Method'),
(3402, 856, 'Inherited Method'),
(3403, 856, 'Parent Method'),
(3404, 856, 'Subclass Method'),
(3405, 857, 'class A : B, C {};'),
(3406, 857, 'class A inherits B, C {};'),
(3407, 857, 'class A : public B, public C {};'),
(3408, 857, 'class A extends B, C {};'),
(3409, 858, 'A'),
(3410, 858, 'B'),
(3411, 858, 'Error'),
(3412, 858, 'Undefined behavior'),
(3413, 859, 'It allows functions to return different types'),
(3414, 859, 'It allows the compiler to optimize code better'),
(3415, 859, 'It enables code reusability and flexibility by using base class references or pointers'),
(3416, 859, 'It prevents errors from occurring during inheritance'),
(3417, 860, 'To define a pure virtual function'),
(3418, 860, 'To explicitly indicate that a virtual function is overridden'),
(3419, 860, 'To prevent a function from being inherited'),
(3420, 860, 'To declare a function that cannot be overridden'),
(3421, 861, 'Using the `protected` keyword'),
(3422, 861, 'Using the `override` keyword'),
(3423, 861, 'Declaring the class as `virtual`'),
(3424, 861, 'Declaring the class as `final`'),
(3425, 862, 'A'),
(3426, 862, 'B'),
(3427, 862, 'Error'),
(3428, 862, 'Undefined behavior'),
(3429, 863, 'A'),
(3430, 863, 'B'),
(3431, 863, 'C'),
(3432, 863, 'Error'),
(3433, 864, 'The derived class gets a compilation error'),
(3434, 864, 'The derived class must override the function to resolve ambiguity'),
(3435, 864, 'The derived class automatically inherits both versions'),
(3436, 864, 'The derived class ignores one of the base class functions'),
(3437, 865, 'To prevent memory leaks'),
(3438, 865, 'To override functions'),
(3439, 865, 'To improve program performance'),
(3440, 865, 'To solve the diamond problem in multiple inheritance'),
(3441, 866, 'class A { void func(); }; class B : public A { void func(int x); };'),
(3442, 866, 'class A { void func(); }; class B : public A { void func(); };'),
(3443, 866, 'class A { virtual void func(); }; class B : public A { void func(); };'),
(3444, 866, 'class A { void func(); }; class B : public A { void func(int x, int y); };'),
(3445, 867, 'int sum(int a, int b);'),
(3446, 867, 'sum(int a, int b);'),
(3447, 867, 'int sum(a, b);'),
(3448, 867, 'int sum();'),
(3449, 868, '1 2'),
(3450, 868, '2 3'),
(3451, 868, '1 2 3'),
(3452, 868, '0 1 2'),
(3453, 869, 'Zero'),
(3454, 869, 'Positive'),
(3455, 869, 'Negative'),
(3456, 869, 'Error'),
(3457, 870, 'ifstream file(\'data.txt\', ios::in);'),
(3458, 870, 'ofstream file(\'data.txt\', ios::out);'),
(3459, 870, 'fstream file(\'data.txt\', ios::in | ios::out);'),
(3460, 870, 'file.open(\'data.txt\')'),
(3461, 871, 'To call the function again'),
(3462, 871, 'To increment the recursion depth'),
(3463, 871, 'To stop the recursion when a condition is met'),
(3464, 871, 'To return the function'),
(3465, 872, 'while loop runs infinitely, do-while does not'),
(3466, 872, 'do-while loop runs at least once, while loop may not run at all'),
(3467, 872, 'while loop always runs at least once, do-while does not'),
(3468, 872, 'do-while loops do not check conditions'),
(3469, 873, 'int arr[10];'),
(3470, 873, 'int arr();'),
(3471, 873, 'int arr[10] = 0;'),
(3472, 873, 'int[] arr;'),
(3473, 874, 'int arr[5] = {1};'),
(3474, 874, 'int arr[5] = {0};'),
(3475, 874, 'int arr[5];'),
(3476, 874, 'int arr[5] = (0);'),
(3477, 875, '5'),
(3478, 875, '6'),
(3479, 875, '8'),
(3480, 875, '10'),
(3481, 876, 'Array size can be changed dynamically'),
(3482, 876, 'Array size is fixed at compile time'),
(3483, 876, 'Array elements must all be different types'),
(3484, 876, 'Arrays are allocated in the heap by default'),
(3485, 877, 'arr[0]'),
(3486, 877, 'arr[-1]'),
(3487, 877, 'arr[size - 1]'),
(3488, 877, 'arr[last]'),
(3489, 878, '5'),
(3490, 878, '5 10 15 20'),
(3491, 878, '5 10 15'),
(3492, 878, 'Error'),
(3493, 879, 'The program crashes'),
(3494, 879, 'The compiler throws an error'),
(3495, 879, 'Undefined behavior'),
(3496, 879, 'The program throws an exception'),
(3497, 880, 'By copying the array'),
(3498, 880, 'By passing the array name as an argument'),
(3499, 880, 'By passing the array size as an argument'),
(3500, 880, 'By passing the first element of the array'),
(3501, 881, 'To get the length of the array'),
(3502, 881, 'To get the address of the array'),
(3503, 881, 'To get the size in bytes of the array'),
(3504, 881, 'To get the size of each element in the array'),
(3505, 882, '1'),
(3506, 882, '5'),
(3507, 882, '0 1 2 3 4'),
(3508, 882, '1 2 3 4 5'),
(3509, 883, 'int arr[5]; arr = 0;'),
(3510, 883, 'int arr[5] = 5;'),
(3511, 883, 'You must use a loop to assign the value to each element'),
(3512, 883, 'int arr[5] = 0;'),
(3513, 884, '10'),
(3514, 884, '40'),
(3515, 884, '20'),
(3516, 884, '30'),
(3517, 885, 'They can only hold int values'),
(3518, 885, 'They can have at most 2 dimensions'),
(3519, 885, 'They can have any number of dimensions'),
(3520, 885, 'They cannot be initialized with 0 values'),
(3521, 886, 'arr[2]'),
(3522, 886, 'arr[1][1]'),
(3523, 886, 'arr[1, 1]'),
(3524, 886, 'arr[1][0][0]'),
(3525, 887, 'int arr[2][2] = {0};'),
(3526, 887, 'int arr[2][2] = {{1, 2}, {3, 4}};'),
(3527, 887, 'int arr[2][2] = {0, 1, 2, 3};'),
(3528, 887, 'int arr[2][2] = {(1, 2), (3, 4)};'),
(3529, 888, '1'),
(3530, 888, '2'),
(3531, 888, '3'),
(3532, 888, '4'),
(3533, 889, 'It will default to 0'),
(3534, 889, 'The program will crash'),
(3535, 889, 'An exception will be thrown'),
(3536, 889, 'It will return a garbage value'),
(3537, 890, '1'),
(3538, 890, '6'),
(3539, 890, '9'),
(3540, 890, 'Error'),
(3541, 891, 'sizeof(arr)'),
(3542, 891, 'sizeof(arr) / 2'),
(3543, 891, 'sizeof(arr[0])'),
(3544, 891, 'You must calculate the size by multiplying the dimensions'),
(3545, 892, 'Arrays are passed to functions by reference'),
(3546, 892, 'Arrays are passed to functions by value'),
(3547, 892, 'Arrays cannot be passed to functions'),
(3548, 892, 'Arrays must be passed by pointer'),
(3549, 893, 'An array cannot be dereferenced'),
(3550, 893, 'A pointer cannot be used in loops'),
(3551, 893, 'Arrays cannot be resized'),
(3552, 893, 'Arrays have a fixed size, pointers can point to any memory location'),
(3553, 894, 'The array is copied'),
(3554, 894, 'The array is reversed'),
(3555, 894, 'The assignment is not allowed, leading to a compilation error'),
(3556, 894, 'Both arrays are combined'),
(3557, 895, '2'),
(3558, 895, '4'),
(3559, 895, '6'),
(3560, 895, '8'),
(3561, 896, '5 3 1'),
(3562, 896, '1 3 5'),
(3563, 896, '1 5 3'),
(3564, 896, '3 1 5'),
(3565, 897, 'Multiplies each element of the array by its index'),
(3566, 897, 'Adds each index to its corresponding element in the array'),
(3567, 897, 'Increments each element of the array'),
(3568, 897, 'Reverses the elements of the array'),
(3569, 898, '5'),
(3570, 898, '10'),
(3571, 898, '15'),
(3572, 898, 'Compilation Error'),
(3573, 899, 'foo can modify the value of x.'),
(3574, 899, 'foo cannot modify the value of x.'),
(3575, 899, 'foo cannot be called with a constant integer.'),
(3576, 899, 'foo requires the argument to be a pointer.'),
(3577, 900, '9'),
(3578, 900, '16'),
(3579, 900, '25'),
(3580, 900, '45'),
(3581, 901, 'It swaps the contents of \'src\' and \'dest\'.'),
(3582, 901, 'It copies the elements of \'src\' to \'dest\'.'),
(3583, 901, 'It reverses the elements of \'src\' into \'dest\'.'),
(3584, 901, 'It does nothing as the function is incomplete.'),
(3585, 902, '2 4 6'),
(3586, 902, '2 4 6 8'),
(3587, 902, '4 6 8'),
(3588, 902, 'Compilation Error'),
(3589, 903, '100'),
(3590, 903, '50'),
(3591, 903, 'Compilation Error'),
(3592, 903, 'Undefined Behavior'),
(3593, 904, 'int func(int a); and int func(int b);'),
(3594, 904, 'int func(int a); and int func(double a);'),
(3595, 904, 'int func(int a); and void func(int a);'),
(3596, 904, 'void func(int a, int b = 5); and void func(int a, int b);'),
(3597, 905, '10'),
(3598, 905, '20'),
(3599, 905, '30'),
(3600, 905, '40'),
(3601, 906, 'if (x > 1) return 1;'),
(3602, 906, 'if (x == 1) return 1;'),
(3603, 906, 'if (x < 1) return 1;'),
(3604, 906, 'if (x <= 1) return 1;'),
(3605, 907, 'Inheritance'),
(3606, 907, 'Polymorphism'),
(3607, 907, 'Abstraction'),
(3608, 907, 'Encapsulation'),
(3609, 908, '5'),
(3610, 908, '10'),
(3611, 908, '15'),
(3612, 908, 'Compilation Error'),
(3613, 909, 'static'),
(3614, 909, 'virtual'),
(3615, 909, 'inline'),
(3616, 909, 'abstract'),
(3617, 910, 'Faster memory access'),
(3618, 910, 'Allows arrays to change size during runtime'),
(3619, 910, 'Guarantees better performance'),
(3620, 910, 'Prevents memory leaks'),
(3621, 911, '2'),
(3622, 911, '5'),
(3623, 911, '7'),
(3624, 911, 'Compilation Error'),
(3625, 912, '\\ 0'),
(3626, 912, '0 1 2'),
(3627, 912, '1 2 3'),
(3628, 912, 'Compilation Error'),
(3629, 913, 'Indicates successful execution of the program'),
(3630, 913, 'Indicates an error occurred during execution'),
(3631, 913, 'Terminates the loop'),
(3632, 913, 'Declares the main function'),
(3633, 914, 'num = int;'),
(3634, 914, 'int num;'),
(3635, 914, 'integer num;'),
(3636, 914, 'num: int;'),
(3637, 915, 'int'),
(3638, 915, 'string'),
(3639, 915, 'char'),
(3640, 915, 'float'),
(3641, 916, '5'),
(3642, 916, '10'),
(3643, 916, '15'),
(3644, 916, '20'),
(3645, 917, 'Prints \'Positive\''),
(3646, 917, 'Prints \'Negative\''),
(3647, 917, 'Prints \'0\''),
(3648, 917, 'No output'),
(3649, 918, '11'),
(3650, 918, '21'),
(3651, 918, '15'),
(3652, 918, '10'),
(3653, 919, 'do-while loop'),
(3654, 919, 'for loop'),
(3655, 919, 'while loop'),
(3656, 919, 'Infinite loop'),
(3657, 920, 'Prints \'1 2 3\''),
(3658, 920, 'Prints \'0 1 2\''),
(3659, 920, 'Prints \'3 2 1\''),
(3660, 920, 'No output'),
(3661, 921, '5'),
(3662, 921, '10'),
(3663, 921, 'Compilation Error'),
(3664, 921, 'Undefined Behavior'),
(3665, 922, '_myVariable'),
(3666, 922, '2myVariable'),
(3667, 922, 'my Variable'),
(3668, 922, '$myVariable'),
(3669, 923, '4'),
(3670, 923, '6'),
(3671, 923, '5'),
(3672, 923, 'Compilation Error'),
(3673, 924, 'let'),
(3674, 924, 'fixed'),
(3675, 924, 'const'),
(3676, 924, 'static'),
(3677, 925, 'Prints output to the console'),
(3678, 925, 'Takes input from the user'),
(3679, 925, 'Stores data in a variable'),
(3680, 925, 'Clears the console screen'),
(3681, 926, '7 8'),
(3682, 926, '8 7'),
(3683, 926, '8 8'),
(3684, 926, '7 7'),
(3685, 927, 'cin >> number;'),
(3686, 927, 'input(number);'),
(3687, 927, 'get(number);'),
(3688, 927, 'read >> number;'),
(3689, 928, 'Includes standard input/output stream library'),
(3690, 928, 'Defines the main function'),
(3691, 928, 'Compiles the program'),
(3692, 928, 'Declares variables'),
(3693, 929, '2'),
(3694, 929, '6'),
(3695, 929, '3'),
(3696, 929, 'Compilation Error'),
(3697, 930, 'An integer data type'),
(3698, 930, 'A floating-point data type'),
(3699, 930, 'A character data type'),
(3700, 930, 'A boolean data type'),
(3701, 931, '\\ 0'),
(3702, 931, '0 1 2'),
(3703, 931, '1 2 3'),
(3704, 931, 'Compilation Error'),
(3705, 932, 'int i = 1; while (i <= 5) { cout << i; i++; }'),
(3706, 932, 'while (i <= 5) { int i = 1; cout << i; i++; }'),
(3707, 932, 'for (int i = 1; i <= 5; i++) { cout << i; }'),
(3708, 932, 'do { cout << i; i++; } while (i <= 5);'),
(3709, 933, 'Prints even numbers from 1 to 10'),
(3710, 933, 'Prints odd numbers from 1 to 10'),
(3711, 933, 'Prints 10 8 6 4 2'),
(3712, 933, 'Does not print anything'),
(3713, 934, 'Executes only when the condition is true'),
(3714, 934, 'Executes at least once regardless of the condition'),
(3715, 934, 'Does not require a condition'),
(3716, 934, 'Requires a break statement to terminate'),
(3717, 935, '\\ 0'),
(3718, 935, '0 1 2'),
(3719, 935, '1 2 3'),
(3720, 935, 'Compilation Error'),
(3721, 936, 'Initialization'),
(3722, 936, 'Condition'),
(3723, 936, 'Increment/Decrement'),
(3724, 936, 'Loop Body'),
(3725, 937, 'To continue the next iteration of the loop'),
(3726, 937, 'To exit the program'),
(3727, 937, 'To exit the loop immediately'),
(3728, 937, 'To restart the loop'),
(3729, 938, '\\ 0'),
(3730, 938, '1 2 3'),
(3731, 938, '1 2 3 4'),
(3732, 938, 'No output'),
(3733, 939, 'While loop'),
(3734, 939, 'For loop'),
(3735, 939, 'Do-while loop'),
(3736, 939, 'Infinite loop'),
(3737, 940, '0 1 2 3 4'),
(3738, 940, '0 1 2 4'),
(3739, 940, '0 1 2 4'),
(3740, 940, '0 1 2'),
(3741, 941, '\'while\' loop executes at least once, \'do-while\' loop may not execute'),
(3742, 941, '\'do-while\' loop executes at least once, \'while\' loop may not execute'),
(3743, 941, 'Both are identical in execution'),
(3744, 941, '\'while\' loop is used for counting, \'do-while\' is not'),
(3745, 942, 'Prints 5 4 3 2 1'),
(3746, 942, 'Prints 1 2 3 4 5'),
(3747, 942, 'Prints 4 3 2 1 0'),
(3748, 942, 'No output'),
(3749, 943, 'The loop will run infinitely'),
(3750, 943, 'The loop will not run'),
(3751, 943, 'Syntax error');
INSERT INTO `answers` (`AnswerID`, `QuestionID`, `AnswerText`) VALUES
(3752, 943, 'The loop will run once'),
(3753, 944, '***\\n***\\n***\\n'),
(3754, 944, '***\\n**\\n*\\n'),
(3755, 944, '*\\n**\\n***\\n'),
(3756, 944, 'No output'),
(3757, 945, 'For loop'),
(3758, 945, 'While loop'),
(3759, 945, 'Do-while loop'),
(3760, 945, 'Infinite loop'),
(3761, 946, '1 2 3 4 5'),
(3762, 946, '1 4 9 16 25'),
(3763, 946, '1 8 27 64 125'),
(3764, 946, 'Compilation Error'),
(3765, 947, '10'),
(3766, 947, '15'),
(3767, 947, '20'),
(3768, 947, 'Compilation Error'),
(3769, 948, 'Memory leaks'),
(3770, 948, 'Infinite loops'),
(3771, 948, 'Syntax errors'),
(3772, 948, 'Compilation errors'),
(3773, 949, 'Prints 0 3 6 9'),
(3774, 949, 'Prints 1 4 7 10'),
(3775, 949, 'Prints 0 1 2 3 4 5 6 7 8 9'),
(3776, 949, 'No output'),
(3777, 950, '0 1 2 3'),
(3778, 950, '0 0 0 1 0 2'),
(3779, 950, '0 0 0 1'),
(3780, 950, 'Compilation Error'),
(3781, 951, 'Greater than 3'),
(3782, 951, 'Less than or equal to 3'),
(3783, 951, 'Compilation Error'),
(3784, 951, 'No output'),
(3785, 952, 'Less than 5'),
(3786, 952, 'Between 5 and 10'),
(3787, 952, '10 or more'),
(3788, 952, 'Compilation Error'),
(3789, 953, 'Equal'),
(3790, 953, 'Not Equal'),
(3791, 953, 'Undefined Behavior'),
(3792, 953, 'No output'),
(3793, 954, 'Even'),
(3794, 954, 'Odd'),
(3795, 954, 'Compilation Error'),
(3796, 954, 'No output'),
(3797, 955, 'Executes a block of code when the if condition is false'),
(3798, 955, 'Executes a block of code when the if condition is true'),
(3799, 955, 'Terminates the program'),
(3800, 955, 'Creates a loop'),
(3801, 956, 'Within range'),
(3802, 956, 'Out of range'),
(3803, 956, 'Compilation Error'),
(3804, 956, 'No output'),
(3805, 957, 'Positive'),
(3806, 957, 'Negative'),
(3807, 957, 'No output'),
(3808, 957, 'Compilation Error'),
(3809, 958, 'Non-negative'),
(3810, 958, 'Negative'),
(3811, 958, 'No output'),
(3812, 958, 'Compilation Error'),
(3813, 959, 'Less than 10'),
(3814, 959, 'Greater than 15'),
(3815, 959, 'Between 10 and 15'),
(3816, 959, 'No output'),
(3817, 960, 'Adult'),
(3818, 960, 'Minor'),
(3819, 960, 'No output'),
(3820, 960, 'Compilation Error'),
(3821, 961, 'True'),
(3822, 961, 'False'),
(3823, 961, 'No output'),
(3824, 961, 'Compilation Error'),
(3825, 962, 'else if (x = 5)'),
(3826, 962, 'else if (x == 5)'),
(3827, 962, 'else (x > 5)'),
(3828, 962, 'if else (x < 10)'),
(3829, 963, 'A'),
(3830, 963, 'B'),
(3831, 963, 'C'),
(3832, 963, 'No output'),
(3833, 964, 'Not ten'),
(3834, 964, 'It is ten'),
(3835, 964, 'No output'),
(3836, 964, 'Compilation Error'),
(3837, 965, 'To check multiple conditions in sequence'),
(3838, 965, 'To create an infinite loop'),
(3839, 965, 'To terminate the program'),
(3840, 965, 'To initialize variables'),
(3841, 966, 'Positive'),
(3842, 966, 'Negative'),
(3843, 966, 'Zero'),
(3844, 966, 'No output'),
(3845, 967, 'if (condition) { /* code */ }'),
(3846, 967, 'if condition { /* code */ }'),
(3847, 967, 'if [condition] { /* code */ }'),
(3848, 967, 'if {condition} ( /* code */ )'),
(3849, 968, 'Positive'),
(3850, 968, 'Non-positive'),
(3851, 968, 'No output'),
(3852, 968, 'Compilation Error'),
(3853, 969, 'Between 0 and 30'),
(3854, 969, 'Out of range'),
(3855, 969, 'No output'),
(3856, 969, 'Compilation Error'),
(3857, 970, 'switch(expression) {'),
(3858, 970, 'switch {'),
(3859, 970, 'switch case:'),
(3860, 970, 'switch() { }'),
(3861, 971, 'One'),
(3862, 971, 'Two'),
(3863, 971, 'Three'),
(3864, 971, 'Default'),
(3865, 972, 'When no other case matches'),
(3866, 972, 'When the first case matches'),
(3867, 972, 'Always'),
(3868, 972, 'Only if explicitly called'),
(3869, 973, 'Case 1'),
(3870, 973, 'Case 2'),
(3871, 973, 'Default'),
(3872, 973, 'Error'),
(3873, 974, 'break'),
(3874, 974, 'exit'),
(3875, 974, 'stop'),
(3876, 974, 'end'),
(3877, 975, 'Yes'),
(3878, 975, 'No'),
(3879, 975, 'Only in C++17'),
(3880, 975, 'Only with default'),
(3881, 976, 'Excellent'),
(3882, 976, 'Good'),
(3883, 976, 'Needs Improvement'),
(3884, 976, 'Error'),
(3885, 977, 'The program continues executing subsequent cases'),
(3886, 977, 'The program terminates'),
(3887, 977, 'Only the current case runs'),
(3888, 977, 'An error occurs'),
(3889, 978, 'Nine'),
(3890, 978, 'Ten'),
(3891, 978, 'NineTen'),
(3892, 978, 'Default'),
(3893, 979, 'No, it\'s optional'),
(3894, 979, 'Yes, it\'s mandatory'),
(3895, 979, 'Only for integer cases'),
(3896, 979, 'Only in C++20 or later'),
(3897, 980, 'Two'),
(3898, 980, 'Four'),
(3899, 980, 'Default'),
(3900, 980, 'Error'),
(3901, 981, 'Yes, this is allowed'),
(3902, 981, 'No, this is not allowed'),
(3903, 981, 'Only if default is included'),
(3904, 981, 'Only in C++20 or later'),
(3905, 982, 'ThreeDefault'),
(3906, 982, 'Three'),
(3907, 982, 'Default'),
(3908, 982, 'ThreeDefaultDefault'),
(3909, 983, 'switch(5)'),
(3910, 983, 'switch(\'A\')'),
(3911, 983, 'switch(2.5)'),
(3912, 983, 'switch(variable)'),
(3913, 984, 'A'),
(3914, 984, 'B'),
(3915, 984, 'F'),
(3916, 984, 'Error'),
(3917, 985, 'Handles unmatched cases; it\'s optional'),
(3918, 985, 'Handles unmatched cases; it\'s mandatory'),
(3919, 985, 'Used as the last case; it\'s mandatory'),
(3920, 985, 'Used to exit the switch; it\'s optional'),
(3921, 986, 'One'),
(3922, 986, 'Two'),
(3923, 986, 'Unlimited'),
(3924, 986, 'None'),
(3925, 987, 'Divisible by 3'),
(3926, 987, 'Remainder 1'),
(3927, 987, 'Remainder 2'),
(3928, 987, 'No Match'),
(3929, 988, 'Five Done'),
(3930, 988, 'Default Done'),
(3931, 988, 'Five DoneDefault Done'),
(3932, 988, 'Error'),
(3933, 989, 'It can be placed anywhere'),
(3934, 989, 'It must always be last'),
(3935, 989, 'It can only be placed after the first case'),
(3936, 989, 'Only before the break statement');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `ClassID` int(11) NOT NULL,
  `ClassName` varchar(55) DEFAULT NULL,
  `LinkToIcon` varchar(255) DEFAULT NULL,
  `LinkToSyllabus` varchar(255) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1,
  `CreationDate` datetime DEFAULT current_timestamp(),
  `ClassCode` varchar(10) DEFAULT NULL,
  `OwningUserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`ClassID`, `ClassName`, `LinkToIcon`, `LinkToSyllabus`, `IsActive`, `CreationDate`, `ClassCode`, `OwningUserID`) VALUES
(1, 'CSC 211H', 'https://www.clarkson.edu/sites/default/files/2023-06/Computer-Science-Hero-1600x900.jpg', '', 1, '2024-08-29 11:31:54', 'MN2IFK', NULL),
(2, 'CSC 211 Copy', 'https://www.clarkson.edu/sites/default/files/2023-06/Computer-Science-Hero-1600x900.jpg', '', 0, '2024-12-05 17:07:18', 'JYD0MW', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `classmodules`
--

CREATE TABLE `classmodules` (
  `ClassID` int(11) NOT NULL,
  `ModuleID` int(11) NOT NULL,
  `IsActive` tinyint(1) DEFAULT 1,
  `CreationDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classmodules`
--

INSERT INTO `classmodules` (`ClassID`, `ModuleID`, `IsActive`, `CreationDate`) VALUES
(1, 1, 1, '2024-12-05 20:52:53'),
(2, 2, 1, '2024-12-05 17:07:18');

-- --------------------------------------------------------

--
-- Table structure for table `classparticipants`
--

CREATE TABLE `classparticipants` (
  `ClassID` int(11) NOT NULL,
  `ParticipantID` int(11) NOT NULL,
  `IsActive` tinyint(1) DEFAULT 1,
  `CreationDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classparticipants`
--

INSERT INTO `classparticipants` (`ClassID`, `ParticipantID`, `IsActive`, `CreationDate`) VALUES
(1, 2, 1, '2024-08-29 12:29:54'),
(1, 3, 1, '2024-08-29 12:45:06'),
(2, 2, 1, '2024-12-05 17:07:18'),
(2, 3, 1, '2024-12-05 17:07:18');

-- --------------------------------------------------------

--
-- Table structure for table `lessonplans`
--

CREATE TABLE `lessonplans` (
  `LessonPlanID` int(11) NOT NULL,
  `ModuleID` int(11) DEFAULT NULL,
  `Priority` int(11) DEFAULT NULL,
  `LinkToIcon` varchar(255) DEFAULT NULL,
  `ShortDescription` varchar(255) DEFAULT NULL,
  `CreationDate` datetime DEFAULT current_timestamp(),
  `IsActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lessonplans`
--

INSERT INTO `lessonplans` (`LessonPlanID`, `ModuleID`, `Priority`, `LinkToIcon`, `ShortDescription`, `CreationDate`, `IsActive`) VALUES
(1, 1, 0, 'https://cdn4.iconfinder.com/data/icons/business-and-finance-404/68/17-512.png', 'Control flow', '2024-08-29 11:33:36', 1),
(2, 1, 0, 'https://t3.ftcdn.net/jpg/06/54/14/70/360_F_654147004_3mnMUDadkASxqC2xJyhkuFuG0QMPIqMR.jpg', 'Functions', '2024-08-29 11:34:06', 1),
(3, 1, 0, 'https://cdn0.iconfinder.com/data/icons/software-development-flat-2/74/Untitled-4-15-512.png', 'Loops', '2024-08-29 11:34:41', 1),
(4, 2, 0, 'https://cdn4.iconfinder.com/data/icons/business-and-finance-404/68/17-512.png', 'Control flow Copy', '2024-12-05 17:07:18', 1),
(5, 2, 0, 'https://t3.ftcdn.net/jpg/06/54/14/70/360_F_654147004_3mnMUDadkASxqC2xJyhkuFuG0QMPIqMR.jpg', 'Functions Copy', '2024-12-05 17:07:18', 1),
(6, 2, 0, 'https://cdn0.iconfinder.com/data/icons/software-development-flat-2/74/Untitled-4-15-512.png', 'Loops Copy', '2024-12-05 17:07:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `LessonID` int(11) NOT NULL,
  `LessonPlanID` int(11) DEFAULT NULL,
  `ShortDescription` varchar(255) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `LinkToVideo` varchar(255) DEFAULT NULL,
  `LinkToIcon` varchar(255) DEFAULT NULL,
  `QuizTemplateID` int(11) DEFAULT NULL,
  `Priority` int(11) DEFAULT 0,
  `CreationDate` datetime DEFAULT current_timestamp(),
  `IsActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`LessonID`, `LessonPlanID`, `ShortDescription`, `Description`, `LinkToVideo`, `LinkToIcon`, `QuizTemplateID`, `Priority`, `CreationDate`, `IsActive`) VALUES
(1, 1, 'Easy if/else lesson', 'In C++, if/else statements are used to execute code based on conditions. They allow the program to choose between different paths of execution:\r\n\r\nif statement: Tests a condition. If the condition is true, the code inside the if block executes.\r\nelse statement: Provides an alternative block of code that runs if the if condition is false.', 'https://www.youtube.com/embed/TOx3tPJircc?si=B71F63VR8NZxJgiE', 'https://cdn-icons-png.flaticon.com/512/5815/5815354.png', 1, 0, '2024-08-29 11:49:53', 1),
(2, 1, 'Medium if/else lesson ', 'In C++, if/else statements are used to execute code based on conditions. They allow the program to choose between different paths of execution:\r\n\r\nif statement: Tests a condition. If the condition is true, the code inside the if block executes.\r\nelse statement: Provides an alternative block of code that runs if the if condition is false.', 'https://www.youtube.com/embed/TOx3tPJircc?si=FgKXv_Iozmmsgzxo', 'https://cdn-icons-png.flaticon.com/512/5815/5815354.png', 4, 1, '2024-08-29 11:50:51', 1),
(3, 1, 'Hard if/else lesson', 'In C++, if/else statements are used to execute code based on conditions. They allow the program to choose between different paths of execution:\r\n\r\nif statement: Tests a condition. If the condition is true, the code inside the if block executes.\r\nelse statement: Provides an alternative block of code that runs if the if condition is false.', 'https://www.youtube.com/embed/TOx3tPJircc?si=FgKXv_Iozmmsgzxo', 'https://cdn-icons-png.flaticon.com/512/5815/5815354.png', 1, 1, '2024-08-29 11:51:25', 1),
(4, 3, 'Easy For Loops lesson', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\nfor loop: Executes a block of code a specific number of times.', 'https://www.youtube.com/embed/Y0TYYEhHvIU?si=-DGQ9ASiGXjz5-md', 'https://csharp-book.softuni.org/assets/chapter-5-2-images/00.For-construction-01.png', 1, 0, '2024-08-29 11:58:00', 1),
(5, 3, 'Medium For Loops lesson', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\nfor loop: Executes a block of code a specific number of times.', 'https://www.youtube.com/embed/Y0TYYEhHvIU?si=L9rikr0Tt9vzPwiq', 'https://csharp-book.softuni.org/assets/chapter-5-2-images/00.For-construction-01.png', 7, 1, '2024-08-29 11:58:53', 1),
(6, 3, 'Hard For Loops lesson', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\nfor loop: Executes a block of code a specific number of times.', 'https://www.youtube.com/embed/Y0TYYEhHvIU?si=L9rikr0Tt9vzPwiq', 'https://csharp-book.softuni.org/assets/chapter-5-2-images/00.For-construction-01.png', 8, 1, '2024-08-29 11:59:23', 1),
(7, 3, 'Easy While Loops Lesson', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\nwhile loop: Continues to execute a block of code as long as a condition remains true.', 'https://www.youtube.com/embed/pvfUXIG6KEc?si=avoeD8AqPRCZ49lH', 'https://upload.wikimedia.org/wikipedia/commons/4/43/While-loop-diagram.svg', 9, 0, '2024-08-29 12:00:31', 1),
(8, 3, 'Medium While Loops Lesson', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\nwhile loop: Continues to execute a block of code as long as a condition remains true.', 'https://www.youtube.com/embed/pvfUXIG6KEc?si=avoeD8AqPRCZ49lH', 'https://upload.wikimedia.org/wikipedia/commons/4/43/While-loop-diagram.svg', 10, 1, '2024-08-29 12:01:01', 1),
(9, 3, 'Hard While Loops lesson', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\nfor loop: Executes a block of code a specific number of times.\r\nwhile loop: Continues to execute a block of code as long as a condition remains true.', 'https://www.youtube.com/embed/pvfUXIG6KEc?si=avoeD8AqPRCZ49lH', 'https://upload.wikimedia.org/wikipedia/commons/4/43/While-loop-diagram.svg', 11, 1, '2024-08-29 12:01:27', 1),
(10, 3, 'Easy Do-While Loops', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\ndo-while loop: Executes a block of code at least once and then continues to execute as long as a condition remains true.', 'https://www.youtube.com/embed/DSUuGn7S_oM?si=U8e_XY3ZDpAxFhgs', 'https://study.com/cimages/videopreview/videopreview-full/m1wic94dfl.jpg', 12, 0, '2024-08-29 12:03:23', 1),
(11, 3, 'Medium Do-While Loops', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\ndo-while loop: Executes a block of code at least once and then continues to execute as long as a condition remains true.', 'https://www.youtube.com/embed/DSUuGn7S_oM?si=rIhaAcDm0HdU2SAm', 'https://study.com/cimages/videopreview/videopreview-full/m1wic94dfl.jpg', 13, 1, '2024-08-29 12:03:57', 1),
(12, 3, 'Hard Do-While Loops', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\nfor loop: Executes a block of code a specific number of times.\r\nwhile loop: Continues to execute a block of code as long as a condition remains true.\r\ndo-while loop: Executes a block of code at least once and then continues to execute as long as a condition remains true.', 'https://www.youtube.com/embed/DSUuGn7S_oM?si=rIhaAcDm0HdU2SAm', 'https://study.com/cimages/videopreview/videopreview-full/m1wic94dfl.jpg', 14, 1, '2024-08-29 12:04:36', 1),
(13, 2, 'Easy Functions lesson', 'In C++, functions are blocks of code designed to perform specific tasks. They are used to:\r\n\r\nEncapsulate: Group related code into reusable units.\r\nModularize: Break down complex problems into smaller, manageable pieces.\r\nReuse: Call the same code from multiple places, avoiding repetition.', 'https://www.youtube.com/embed/WpsLyYmYPbg?si=z2_ieaFYxAOYwF9s', 'https://www.softwaretestinghelp.com/wp-content/qa/uploads/2019/05/FUNCTIONS-IN-C.png', 15, 0, '2024-08-29 12:08:27', 1),
(14, 2, 'Medium Functions Lesson', 'In C++, functions are blocks of code designed to perform specific tasks. They are used to:\r\n\r\nEncapsulate: Group related code into reusable units.\r\nModularize: Break down complex problems into smaller, manageable pieces.\r\nReuse: Call the same code from multiple places, avoiding repetition.', 'https://www.youtube.com/embed/WpsLyYmYPbg?si=z2_ieaFYxAOYwF9s', 'https://media.geeksforgeeks.org/wp-content/uploads/20220719123136/FunctionPrototypeincppmin-660x330.png', 16, 1, '2024-08-29 12:09:01', 1),
(15, 2, 'Hard Functions Lesson', 'In C++, functions are blocks of code designed to perform specific tasks. They are used to:\r\n\r\nEncapsulate: Group related code into reusable units.\r\nModularize: Break down complex problems into smaller, manageable pieces.\r\nReuse: Call the same code from multiple places, avoiding repetition.', 'https://www.youtube.com/embed/WpsLyYmYPbg?si=z2_ieaFYxAOYwF9s', 'https://zacknov.wordpress.com/wp-content/uploads/2011/09/ackermann.jpg', 17, 2, '2024-08-29 12:09:28', 1),
(16, 1, 'Easy Switch lesson', 'In C++, conditional statements control the flow of execution based on specific conditions. They allow a program to make decisions and execute different code paths:\r\n\r\nif statement: Executes a block of code if a condition is true.\r\nelse if statement: Provides additional conditions to test if the previous if condition was false.\r\nelse statement: Executes a block of code if none of the preceding conditions were true.', 'https://www.youtube.com/embed/MTjDwDHbcv0?si=Xf80npHommmDGLP7', 'https://media.licdn.com/dms/image/D4E12AQEBndV2k5Km0g/article-cover_image-shrink_720_1280/0/1718789053631?e=2147483647&v=beta&t=Cat11ntqJAwbEFTUJBYqjiYwUlfH3Nx_f_7ytS1Coos', 19, 0, '2024-08-29 12:16:34', 1),
(17, 1, 'Medium Conditionals lesson', 'In C++, conditional statements control the flow of execution based on specific conditions. They allow a program to make decisions and execute different code paths:\r\n\r\nif statement: Executes a block of code if a condition is true.\r\nelse if statement: Provides additional conditions to test if the previous if condition was false.\r\nelse statement: Executes a block of code if none of the preceding conditions were true.', 'https://www.youtube.com/embed/MTjDwDHbcv0?si=DL9vEvGnHvGTpds4', 'https://media.licdn.com/dms/image/D4E12AQEBndV2k5Km0g/article-cover_image-shrink_720_1280/0/1718789053631?e=2147483647&v=beta&t=Cat11ntqJAwbEFTUJBYqjiYwUlfH3Nx_f_7ytS1Coos', 20, 1, '2024-08-29 12:17:01', 1),
(18, 1, 'Hard Conditionals lesson', 'In C++, conditional statements control the flow of execution based on specific conditions. They allow a program to make decisions and execute different code paths:\r\n\r\nif statement: Executes a block of code if a condition is true.\r\nelse if statement: Provides additional conditions to test if the previous if condition was false.\r\nelse statement: Executes a block of code if none of the preceding conditions were true.', 'https://www.youtube.com/embed/MTjDwDHbcv0?si=DL9vEvGnHvGTpds4', 'https://media.licdn.com/dms/image/D4E12AQEBndV2k5Km0g/article-cover_image-shrink_720_1280/0/1718789053631?e=2147483647&v=beta&t=Cat11ntqJAwbEFTUJBYqjiYwUlfH3Nx_f_7ytS1Coos', 21, 1, '2024-08-29 12:17:22', 1),
(19, 4, 'Easy if/else lesson Copy', 'In C++, if/else statements are used to execute code based on conditions. They allow the program to choose between different paths of execution:\r\n\r\nif statement: Tests a condition. If the condition is true, the code inside the if block executes.\r\nelse statement: Provides an alternative block of code that runs if the if condition is false.', 'https://www.youtube.com/embed/TOx3tPJircc?si=B71F63VR8NZxJgiE', 'https://cdn-icons-png.flaticon.com/512/5815/5815354.png', 22, 0, '2024-12-05 17:07:18', 1),
(20, 4, 'Medium if/else lesson  Copy', 'In C++, if/else statements are used to execute code based on conditions. They allow the program to choose between different paths of execution:\r\n\r\nif statement: Tests a condition. If the condition is true, the code inside the if block executes.\r\nelse statement: Provides an alternative block of code that runs if the if condition is false.', 'https://www.youtube.com/embed/TOx3tPJircc?si=FgKXv_Iozmmsgzxo', 'https://cdn-icons-png.flaticon.com/512/5815/5815354.png', 23, 1, '2024-12-05 17:07:18', 1),
(21, 4, 'Hard if/else lesson Copy', 'In C++, if/else statements are used to execute code based on conditions. They allow the program to choose between different paths of execution:\r\n\r\nif statement: Tests a condition. If the condition is true, the code inside the if block executes.\r\nelse statement: Provides an alternative block of code that runs if the if condition is false.', 'https://www.youtube.com/embed/TOx3tPJircc?si=FgKXv_Iozmmsgzxo', 'https://cdn-icons-png.flaticon.com/512/5815/5815354.png', 24, 1, '2024-12-05 17:07:18', 1),
(22, 4, 'Easy Switch lesson Copy', 'In C++, conditional statements control the flow of execution based on specific conditions. They allow a program to make decisions and execute different code paths:\r\n\r\nif statement: Executes a block of code if a condition is true.\r\nelse if statement: Provides additional conditions to test if the previous if condition was false.\r\nelse statement: Executes a block of code if none of the preceding conditions were true.', 'https://www.youtube.com/embed/MTjDwDHbcv0?si=Xf80npHommmDGLP7', 'https://media.licdn.com/dms/image/D4E12AQEBndV2k5Km0g/article-cover_image-shrink_720_1280/0/1718789053631?e=2147483647&v=beta&t=Cat11ntqJAwbEFTUJBYqjiYwUlfH3Nx_f_7ytS1Coos', 25, 0, '2024-12-05 17:07:18', 1),
(23, 4, 'Medium Conditionals lesson Copy', 'In C++, conditional statements control the flow of execution based on specific conditions. They allow a program to make decisions and execute different code paths:\r\n\r\nif statement: Executes a block of code if a condition is true.\r\nelse if statement: Provides additional conditions to test if the previous if condition was false.\r\nelse statement: Executes a block of code if none of the preceding conditions were true.', 'https://www.youtube.com/embed/MTjDwDHbcv0?si=DL9vEvGnHvGTpds4', 'https://media.licdn.com/dms/image/D4E12AQEBndV2k5Km0g/article-cover_image-shrink_720_1280/0/1718789053631?e=2147483647&v=beta&t=Cat11ntqJAwbEFTUJBYqjiYwUlfH3Nx_f_7ytS1Coos', 26, 1, '2024-12-05 17:07:18', 1),
(24, 4, 'Hard Conditionals lesson Copy', 'In C++, conditional statements control the flow of execution based on specific conditions. They allow a program to make decisions and execute different code paths:\r\n\r\nif statement: Executes a block of code if a condition is true.\r\nelse if statement: Provides additional conditions to test if the previous if condition was false.\r\nelse statement: Executes a block of code if none of the preceding conditions were true.', 'https://www.youtube.com/embed/MTjDwDHbcv0?si=DL9vEvGnHvGTpds4', 'https://media.licdn.com/dms/image/D4E12AQEBndV2k5Km0g/article-cover_image-shrink_720_1280/0/1718789053631?e=2147483647&v=beta&t=Cat11ntqJAwbEFTUJBYqjiYwUlfH3Nx_f_7ytS1Coos', 27, 1, '2024-12-05 17:07:18', 1),
(25, 5, 'Easy Functions lesson Copy', 'In C++, functions are blocks of code designed to perform specific tasks. They are used to:\r\n\r\nEncapsulate: Group related code into reusable units.\r\nModularize: Break down complex problems into smaller, manageable pieces.\r\nReuse: Call the same code from multiple places, avoiding repetition.', 'https://www.youtube.com/embed/WpsLyYmYPbg?si=z2_ieaFYxAOYwF9s', 'https://www.softwaretestinghelp.com/wp-content/qa/uploads/2019/05/FUNCTIONS-IN-C.png', 28, 0, '2024-12-05 17:07:18', 1),
(26, 5, 'Medium Functions Lesson Copy', 'In C++, functions are blocks of code designed to perform specific tasks. They are used to:\r\n\r\nEncapsulate: Group related code into reusable units.\r\nModularize: Break down complex problems into smaller, manageable pieces.\r\nReuse: Call the same code from multiple places, avoiding repetition.', 'https://www.youtube.com/embed/WpsLyYmYPbg?si=z2_ieaFYxAOYwF9s', 'https://media.geeksforgeeks.org/wp-content/uploads/20220719123136/FunctionPrototypeincppmin-660x330.png', 29, 1, '2024-12-05 17:07:18', 1),
(27, 5, 'Hard Functions Lesson Copy', 'In C++, functions are blocks of code designed to perform specific tasks. They are used to:\r\n\r\nEncapsulate: Group related code into reusable units.\r\nModularize: Break down complex problems into smaller, manageable pieces.\r\nReuse: Call the same code from multiple places, avoiding repetition.', 'https://www.youtube.com/embed/WpsLyYmYPbg?si=z2_ieaFYxAOYwF9s', 'https://zacknov.wordpress.com/wp-content/uploads/2011/09/ackermann.jpg', 30, 2, '2024-12-05 17:07:18', 1),
(28, 6, 'Easy For Loops lesson Copy', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\nfor loop: Executes a block of code a specific number of times.', 'https://www.youtube.com/embed/Y0TYYEhHvIU?si=-DGQ9ASiGXjz5-md', 'https://csharp-book.softuni.org/assets/chapter-5-2-images/00.For-construction-01.png', 31, 0, '2024-12-05 17:07:18', 1),
(29, 6, 'Medium For Loops lesson Copy', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\nfor loop: Executes a block of code a specific number of times.', 'https://www.youtube.com/embed/Y0TYYEhHvIU?si=L9rikr0Tt9vzPwiq', 'https://csharp-book.softuni.org/assets/chapter-5-2-images/00.For-construction-01.png', 32, 1, '2024-12-05 17:07:18', 1),
(30, 6, 'Hard For Loops lesson Copy', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\nfor loop: Executes a block of code a specific number of times.', 'https://www.youtube.com/embed/Y0TYYEhHvIU?si=L9rikr0Tt9vzPwiq', 'https://csharp-book.softuni.org/assets/chapter-5-2-images/00.For-construction-01.png', 33, 1, '2024-12-05 17:07:18', 1),
(31, 6, 'Easy While Loops Lesson Copy', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\nwhile loop: Continues to execute a block of code as long as a condition remains true.', 'https://www.youtube.com/embed/pvfUXIG6KEc?si=avoeD8AqPRCZ49lH', 'https://upload.wikimedia.org/wikipedia/commons/4/43/While-loop-diagram.svg', 34, 0, '2024-12-05 17:07:18', 1),
(32, 6, 'Medium While Loops Lesson Copy', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\nwhile loop: Continues to execute a block of code as long as a condition remains true.', 'https://www.youtube.com/embed/pvfUXIG6KEc?si=avoeD8AqPRCZ49lH', 'https://upload.wikimedia.org/wikipedia/commons/4/43/While-loop-diagram.svg', 35, 1, '2024-12-05 17:07:18', 1),
(33, 6, 'Hard While Loops lesson Copy', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\nfor loop: Executes a block of code a specific number of times.\r\nwhile loop: Continues to execute a block of code as long as a condition remains true.', 'https://www.youtube.com/embed/pvfUXIG6KEc?si=avoeD8AqPRCZ49lH', 'https://upload.wikimedia.org/wikipedia/commons/4/43/While-loop-diagram.svg', 36, 1, '2024-12-05 17:07:18', 1),
(34, 6, 'Easy Do-While Loops Copy', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\ndo-while loop: Executes a block of code at least once and then continues to execute as long as a condition remains true.', 'https://www.youtube.com/embed/DSUuGn7S_oM?si=U8e_XY3ZDpAxFhgs', 'https://study.com/cimages/videopreview/videopreview-full/m1wic94dfl.jpg', 37, 0, '2024-12-05 17:07:18', 1),
(35, 6, 'Medium Do-While Loops Copy', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\ndo-while loop: Executes a block of code at least once and then continues to execute as long as a condition remains true.', 'https://www.youtube.com/embed/DSUuGn7S_oM?si=rIhaAcDm0HdU2SAm', 'https://study.com/cimages/videopreview/videopreview-full/m1wic94dfl.jpg', 38, 1, '2024-12-05 17:07:18', 1),
(36, 6, 'Hard Do-While Loops Copy', 'In C++, loops are used to repeatedly execute a block of code based on a condition. They help automate repetitive tasks and process data efficiently.\r\n\r\nfor loop: Executes a block of code a specific number of times.\r\nwhile loop: Continues to execute a block of code as long as a condition remains true.\r\ndo-while loop: Executes a block of code at least once and then continues to execute as long as a condition remains true.', 'https://www.youtube.com/embed/DSUuGn7S_oM?si=rIhaAcDm0HdU2SAm', 'https://study.com/cimages/videopreview/videopreview-full/m1wic94dfl.jpg', 39, 1, '2024-12-05 17:07:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `ModuleID` int(11) NOT NULL,
  `OwningUserID` int(11) DEFAULT NULL,
  `IsPublic` tinyint(1) DEFAULT 0,
  `ModuleName` varchar(255) DEFAULT NULL,
  `LinkToIcon` varchar(255) DEFAULT NULL,
  `CreationDate` datetime DEFAULT current_timestamp(),
  `IsActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`ModuleID`, `OwningUserID`, `IsPublic`, `ModuleName`, `LinkToIcon`, `CreationDate`, `IsActive`) VALUES
(1, 1, 1, 'Bridge to CSC 211H', 'https://cdn-icons-png.flaticon.com/512/2845/2845818.png', '2024-08-29 11:31:42', 1),
(2, 1, 1, 'Bridge to CSC 211 Copy', 'https://cdn-icons-png.flaticon.com/512/2845/2845818.png', '2024-12-05 17:07:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `questiondifficulty`
--

CREATE TABLE `questiondifficulty` (
  `QuestionDifficultyID` int(11) NOT NULL,
  `QuestionDifficultyDesc` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questiondifficulty`
--

INSERT INTO `questiondifficulty` (`QuestionDifficultyID`, `QuestionDifficultyDesc`) VALUES
(1, 'Easy'),
(2, 'Medium'),
(3, 'Hard');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `QuestionID` int(11) NOT NULL,
  `OwningUserID` int(11) DEFAULT NULL,
  `Prompt` varchar(1000) DEFAULT NULL,
  `CorrectAnswerID` int(11) DEFAULT NULL,
  `QuestionTypeID` int(11) DEFAULT NULL,
  `QuestionStatusID` int(11) DEFAULT NULL,
  `QuestionDifficultyID` int(11) DEFAULT NULL,
  `CreationDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`QuestionID`, `OwningUserID`, `Prompt`, `CorrectAnswerID`, `QuestionTypeID`, `QuestionStatusID`, `QuestionDifficultyID`, `CreationDate`) VALUES
(647, 1, 'What is the return type of the following function?\\nint add(int a\\, int b) {\\n return a + b;\\n}', 2566, 1, 1, 1, '2024-12-03 17:15:31'),
(648, 1, 'Which of the following is the correct syntax to define a function that does not return any value?', 2569, 1, 1, 1, '2024-12-03 17:15:31'),
(649, 1, 'What is the output of the following code?\\nvoid greet() {\\n cout << \\\"Hello\\, World!\\\" << endl;\\n}\\nint main() {\\n greet();\\n return 0;\\n}', 2574, 1, 1, 1, '2024-12-03 17:15:31'),
(650, 1, 'In C++\\, which of the following statements best describes a function prototype?', 2577, 1, 1, 2, '2024-12-03 17:15:31'),
(651, 1, 'What is the purpose of a function prototype in C++?', 2583, 1, 1, 2, '2024-12-03 17:15:31'),
(652, 1, 'What will be the result of the following code?\\nvoid sayHi(string name) {\\n cout << \\\"Hi\\, \\\" << name << endl;\\n}\\nint main() {\\n sayHi(\\\"Alice\\\");\\n return 0;\\n}', 2586, 1, 1, 1, '2024-12-03 17:15:31'),
(653, 1, 'Which of the following correctly calls the function int sum(int x\\, int y)?', 2591, 1, 1, 1, '2024-12-03 17:15:31'),
(654, 1, 'What is the difference between void and int functions in C++?', 2595, 1, 1, 1, '2024-12-03 17:15:31'),
(655, 1, 'In the following function\\, how many parameters does the function accept?\\nvoid display(int a\\, int b\\, char c) {\\n cout << a << \\\" \\\" << b << \\\" \\\" << c << endl;\\n}', 2599, 1, 1, 2, '2024-12-03 17:15:31'),
(656, 1, 'What is recursion in the context of functions?', 2603, 1, 1, 2, '2024-12-03 17:15:31'),
(657, 1, 'Which of the following is an example of a recursive function?', 2605, 1, 1, 2, '2024-12-03 17:15:31'),
(658, 1, 'What is the base case in a recursive function?', 2610, 1, 1, 2, '2024-12-03 17:15:31'),
(659, 1, 'What does the following function return when called with fact(3)?\\nint fact(int n) {\\n if (n == 0)\\n return 1;\\n return n * fact(n - 1);\\n}', 2614, 1, 1, 2, '2024-12-03 17:15:31'),
(660, 1, 'Which of the following functions has a void return type and accepts an integer argument?', 2617, 1, 1, 1, '2024-12-03 17:15:31'),
(661, 1, 'What will be the output of the following code?\\nvoid printValue(int x) {\\n cout << x * 2 << endl;\\n}\\nint main() {\\n printValue(5);\\n return 0;\\n}', 2622, 1, 1, 1, '2024-12-03 17:15:31'),
(662, 1, 'What is the default return type of main() in C++?', 2626, 1, 1, 1, '2024-12-03 17:15:31'),
(663, 1, 'How many times will the function hello() be called in the following code?\\nvoid hello() {\\n cout << \\\"Hello\\\" << endl;\\n}\\nint main() {\\n hello();\\n hello();\\n hello();\\n return 0;\\n}', 2631, 1, 1, 1, '2024-12-03 17:15:31'),
(664, 1, 'What is the correct way to return a value from a function?', 2633, 1, 1, 1, '2024-12-03 17:15:31'),
(665, 1, 'Which of the following is true about function overloading in C++?', 2640, 1, 1, 3, '2024-12-03 17:15:31'),
(666, 1, 'What is the output of the following code?\\nint x = 10;\\nif (x > 5) {\\n cout << \\\"Greater\\\";\\n} else {\\n cout << \\\"Smaller\\\";\\n}', 2641, 1, 1, 1, '2024-12-03 17:15:31'),
(667, 1, 'What is the output of the following code?\\nint x = 4;\\nif (x == 5) {\\n cout << \\\"Equal\\\";\\n} else {\\n cout << \\\"Not Equal\\\";\\n}', 2646, 1, 1, 1, '2024-12-03 17:15:31'),
(668, 1, 'What is the output of the following code?\\nint x = 10;\\nif (x < 10) {\\n cout << \\\"Less\\\";\\n} else if (x == 10) {\\n cout << \\\"Equal\\\";\\n} else {\\n cout << \\\"Greater\\\";\\n}', 2650, 1, 1, 2, '2024-12-03 17:15:31'),
(669, 1, 'What does the following code print?\\nint x = 5;\\nif (x > 3) {\\n if (x < 7) {\\n cout << \\\"Between\\\";\\n }\\n} else {\\n cout << \\\"Out of range\\\";\\n}', 2653, 1, 1, 2, '2024-12-03 17:15:31'),
(670, 1, 'What will be the output of the following code?\\nint a = 5, b = 10;\\nif (a > b) {\\n cout << \\\"a is greater\\\";\\n} else {\\n cout << \\\"b is greater\\\";\\n}', 2658, 1, 1, 1, '2024-12-03 17:15:31'),
(671, 1, 'What is the purpose of the `else if` statement in C++?', 2663, 1, 1, 1, '2024-12-03 17:15:31'),
(672, 1, 'What is the result of the following recursive function?\\nint sum(int n) {\\n if (n == 0) return 0;\\n return n + sum(n - 1);\\n}\\n\\nsum(3);', 2666, 1, 1, 2, '2024-12-03 17:15:31'),
(673, 1, 'What will be printed by the following code?\\nint n = 3;\\nvoid countDown(int n) {\\n if (n <= 0) return;\\n cout << n << endl;\\n countDown(n - 1);\\n}\\n\\ncountDown(n);', 2670, 1, 1, 2, '2024-12-03 17:15:31'),
(674, 1, 'What is the base case in a recursive function?', 2674, 1, 1, 2, '2024-12-03 17:15:31'),
(675, 1, 'What does the following code do?\\nvoid print(int n) {\\n if (n > 0) {\\n print(n - 1);\\n cout << n << \\\" \\\";\\n }\\n}\\n\\nprint(3);', 2679, 1, 1, 2, '2024-12-03 17:15:31'),
(676, 1, 'What will happen if a recursive function does not have a base case?', 2682, 1, 1, 3, '2024-12-03 17:15:31'),
(677, 1, 'What is the purpose of a base case in recursion?', 2687, 1, 1, 1, '2024-12-03 17:15:31'),
(678, 1, 'Which of the following is true about the `else` statement?', 2690, 1, 1, 1, '2024-12-03 17:15:31'),
(679, 1, 'What will be the result of the following code?\\nint a = 1;\\nif (a == 1) {\\n cout << \\\"One\\\";\\n} else if (a == 2) {\\n cout << \\\"Two\\\";\\n} else {\\n cout << \\\"Other\\\";\\n}', 2693, 1, 1, 1, '2024-12-03 17:15:31'),
(680, 1, 'What will be printed by the following code?\\nint a = 3;\\nif (a > 1) {\\n if (a < 5) {\\n cout << \\\"True\\\";\\n }\\n} else {\\n cout << \\\"False\\\";\\n}', 2697, 1, 1, 1, '2024-12-03 17:15:31'),
(681, 1, 'What is the output of the following code?\\nint x = 5;\\nswitch(x) {\\n case 1: cout << \\\"One\\\"; break;\\n case 5: cout << \\\"Five\\\"; break;\\n default: cout << \\\"None\\\";\\n}', 2702, 1, 1, 1, '2024-12-03 17:15:31'),
(682, 1, 'Which of the following is an example of a switch statement?', 2705, 1, 1, 1, '2024-12-03 17:15:31'),
(683, 1, 'What does the following recursive function return?\\nint factorial(int n) {\\n if (n <= 1) return 1;\\n return n * factorial(n - 1);\\n}\\n\\nfactorial(4);', 2711, 1, 1, 2, '2024-12-03 17:15:31'),
(684, 1, 'What will be the output of the following code?\\nint a = 0;\\nif (a) {\\n cout << \\\"True\\\";\\n} else {\\n cout << \\\"False\\\";\\n}', 2714, 1, 1, 1, '2024-12-03 17:15:31'),
(685, 1, 'What is the difference between an `if` and a `switch` statement?', 2720, 1, 1, 2, '2024-12-03 17:15:31'),
(686, 1, 'What is the output of the following code?\\nfor (int i = 0; i < 3; i++) {\\n cout << i << \\\" \\\";\\n}', 2722, 1, 1, 1, '2024-12-03 17:15:31'),
(687, 1, 'Which of the following is a valid syntax for a for loop?', 2726, 1, 1, 1, '2024-12-03 17:15:31'),
(688, 1, 'What does the following loop do?\\nint i = 0;\\nwhile (i < 5) {\\n cout << i;\\n i++;\\n}', 2730, 1, 1, 1, '2024-12-03 17:15:31'),
(689, 1, 'What is the output of the following code?\\nint i = 5;\\ndo {\\n cout << i;\\n i--;\\n} while (i > 0);', 2734, 1, 1, 2, '2024-12-03 17:15:31'),
(690, 1, 'Which of the following loops ensures the body of the loop is executed at least once?', 2739, 1, 1, 1, '2024-12-03 17:15:31'),
(691, 1, 'Which of the following is an infinite loop?', 2741, 1, 1, 3, '2024-12-03 17:15:31'),
(692, 1, 'What is the purpose of the continue statement in a loop?', 2746, 1, 1, 2, '2024-12-03 17:15:31'),
(693, 1, 'What is the output of the following loop?\\nfor (int i = 0; i < 5; i++) {\\n if (i == 3) continue;\\n cout << i;\\n}', 2750, 1, 1, 2, '2024-12-03 17:15:31'),
(694, 1, 'What is the output of this loop?\\nint i = 0;\\ndo {\\n i++;\\n if (i == 3) break;\\n cout << i;\\n} while (i < 5);', 2754, 1, 1, 2, '2024-12-03 17:15:31'),
(695, 1, 'Which of the following loops will terminate when the condition becomes false?', 2757, 1, 1, 1, '2024-12-03 17:15:31'),
(696, 1, 'What is the purpose of a loop?', 2762, 1, 1, 1, '2024-12-03 17:15:31'),
(697, 1, 'Which loop is best suited when the number of iterations is known beforehand?', 2765, 1, 1, 2, '2024-12-03 17:15:31'),
(698, 1, 'Which of the following is true about the while loop?', 2770, 1, 1, 1, '2024-12-03 17:15:31'),
(699, 1, 'What will be printed by the following code?\\nfor (int i = 1; i <= 5; i++) {\\n if (i % 2 == 0) continue;\\n cout << i;\\n}', 2775, 1, 1, 2, '2024-12-03 17:15:31'),
(700, 1, 'What is the correct syntax for a for loop that decrements?', 2777, 1, 1, 1, '2024-12-03 17:15:31'),
(701, 1, 'What does the following code do?\\nfor (int i = 0; i < 5; i++) {\\n for (int j = 0; j < 3; j++) {\\n cout << i << j << \\\" \\\";\\n }\\n}', 2782, 1, 1, 3, '2024-12-03 17:15:31'),
(702, 1, 'Which of the following best describes a nested loop?', 2787, 1, 1, 1, '2024-12-03 17:15:31'),
(703, 1, 'What is the result of this nested loop?\\nfor (int i = 0; i < 3; i++) {\\n for (int j = 0; j < 2; j++) {\\n cout << i * j << \\\" \\\";\\n }\\n}', 2790, 1, 1, 2, '2024-12-03 17:15:31'),
(704, 1, 'What is the difference between a for loop and a while loop?', 2795, 1, 1, 2, '2024-12-03 17:15:31'),
(705, 1, 'What does the following code do?\\nint i = 0;\\nwhile (i < 5) {\\n cout << i;\\n i += 2;\\n}', 2798, 1, 1, 1, '2024-12-03 17:15:31'),
(706, 1, 'What will be printed when you run this program?\\n#include <iostream>\\nint main() {\\n std::ifstream file(\\\"example.txt\\\");\\n if (!file.is_open()) {\\n  std::cerr << \\\"Error opening file.\\\\n\\\";\\n  return 1;\\n }\\n char c;\\n while (file.get(c)) {\\n  std::cout << c;\\n }\\n file.close();\\n return 0;\\n}', 2802, 1, 1, 1, '2024-12-03 17:15:31'),
(707, 1, 'What will be printed when you run this program?\\n#include <iostream>\\nint main() {\\n std::ofstream file(\\\"example.txt\\\");\\n if (!file.is_open()) {\\n  std::cerr << \\\"Error opening file.\\\\n\\\";\\n  return 1;\\n }\\n char c = \'a\';\\n for (int i = 0; i < 5; ++i) {\\n  file.put(c);\\n  c++;\\n }\\n file.close();\\n return 0;\\n}', 2806, 1, 1, 1, '2024-12-03 17:15:31'),
(708, 1, 'Which function is used to read from a binary file?', 2811, 1, 1, 1, '2024-12-03 17:15:31'),
(709, 1, 'What will happen if you use std::cin to input data into an integer variable and the user types a non-integer value?', 2814, 1, 1, 2, '2024-12-03 17:15:31'),
(710, 1, 'What is the purpose of using std::endl when printing to an output stream?', 2819, 1, 1, 1, '2024-12-03 17:15:31'),
(711, 1, 'What will be printed when you run this program?\\n#include <iostream>\\nint main() {\\n std::ifstream file(\\\"example.txt\\\");\\n if (!file.is_open()) {\\n  std::cerr << \\\"Error opening file.\\\\n\\\";\\n  return 1;\\n }\\n char c;\\n while (file.get(c)) {\\n  std::cout << c;\\n  if (c == \'\\\\n\') break;\\n }\\n file.close();\\n return 0;\\n}', 2822, 1, 1, 1, '2024-12-03 17:15:31'),
(712, 1, 'What will be printed when you run this program?\\n#include <iostream>\\nint main() {\\n std::ofstream file(\\\"example.txt\\\");\\n if (!file.is_open()) {\\n  std::cerr << \\\"Error opening file.\\\\n\\\";\\n  return 1;\\n }\\n char c = \'a\';\\n for (int i = 0; i < 5; ++i) {\\n  if (c == \'\\\\n\') break;\\n  file.put(c);\\n  c++;\\n }\\n file.close();\\n return 0;\\n}', 2826, 1, 1, 1, '2024-12-03 17:15:31'),
(713, 1, 'Which function is used to write to a text file?', 2831, 1, 1, 1, '2024-12-03 17:15:31'),
(714, 1, 'What will happen if you use std::cout to print an integer value that exceeds the maximum range of a char variable?', 2834, 1, 1, 2, '2024-12-03 17:15:31'),
(715, 1, 'What is the purpose of using std::cin.ignore() when reading from a file?', 2839, 1, 1, 1, '2024-12-03 17:15:31'),
(716, 1, 'What will be printed when you run this program?\\n#include <iostream>\\nint main() {\\n std::ifstream file(\\\"example.txt\\\");\\n if (!file.is_open()) {\\n  std::cerr << \\\"Error opening file.\\\\n\\\";\\n  return 1;\\n }\\n char c;\\n while (file.get(c)) {\\n  std::cout << c;\\n }\\n file.close();\\n return 0;\\n}', 2842, 1, 1, 1, '2024-12-03 17:15:31'),
(717, 1, 'What will be printed when you run this program?\\n#include <iostream>\\nint main() {\\n std::ofstream file(\\\"example.txt\\\");\\n if (!file.is_open()) {\\n  std::cerr << \\\"Error opening file.\\\\n\\\";\\n  return 1;\\n }\\n char c = \'a\';\\n for (int i = 0; i < 5; ++i) {\\n  file.put(c);\\n  c++;\\n }\\n file.close();\\n return 0;\\n}', 2846, 1, 1, 1, '2024-12-03 17:15:31'),
(718, 1, 'Which function is used to read from a binary file?', 2851, 1, 1, 1, '2024-12-03 17:15:31'),
(719, 1, 'What will happen if you use std::cin to input data into an integer variable and the user types a non-integer value while using std::cin >> var?', 2854, 1, 1, 2, '2024-12-03 17:15:31'),
(720, 1, 'What is the purpose of using std::endl when writing to a file using std::ofstream?', 2859, 1, 1, 1, '2024-12-03 17:15:31'),
(721, 1, 'What will be printed when you run this program?\\n#include <iostream>\\nint main() {\\n std::ifstream file(\\\"example.txt\\\");\\n if (!file.is_open()) {\\n  std::cerr << \\\"Error opening file.\\\\n\\\";\\n  return 1;\\n }\\n char c;\\n while (file.get(c)) {\\n  if (c == \'\\\\n\') break;\\n  std::cout << c;\\n }\\n file.close();\\n return 0;\\n}', 2862, 1, 1, 1, '2024-12-03 17:15:31'),
(722, 1, 'What will be printed when you run this program?\\n#include <iostream>\\nint main() {\\n std::ofstream file(\\\"example.txt\\\");\\n if (!file.is_open()) {\\n  std::cerr << \\\"Error opening file.\\\\n\\\";\\n  return 1;\\n }\\n char c = \'a\';\\n for (int i = 0; i < 5; ++i) {\\n  if (c == \'\\\\n\') break;\\n  file.put(c);\\n  c++;\\n }\\n file.close();\\n return 0;\\n}', 2866, 1, 1, 1, '2024-12-03 17:15:31'),
(723, 1, 'Which function is used to write to a binary file?', 2871, 1, 1, 1, '2024-12-03 17:15:31'),
(724, 1, 'What will happen if you use std::cout to print an integer value that exceeds the maximum range of a char variable while using std::cout << var?', 2874, 1, 1, 2, '2024-12-03 17:15:31'),
(725, 1, 'What is the purpose of using std::cin.ignore() when writing to a file?', 2879, 1, 1, 1, '2024-12-03 17:15:31'),
(726, 1, 'What will be printed when you run this program?\\n#include <iostream>\\nint main() {\\n std::ifstream file(\\\"example.txt\\\");\\n if (!file.is_open()) {\\n  std::cerr << \\\"Error opening file.\\\\n\\\";\\n  return 1;\\n }\\n char c;\\n while (file.get(c)) {\\n  std::cout << c;\\n }\\n file.close();\\n return 0;\\n}', 2882, 1, 1, 1, '2024-12-03 17:15:31'),
(727, 1, 'What will be printed when you run this program?\\n#include <iostream>\\nint main() {\\n std::ofstream file(\\\"example.txt\\\");\\n if (!file.is_open()) {\\n  std::cerr << \\\"Error opening file.\\\\n\\\";\\n  return 1;\\n }\\n char c = \'a\';\\n for (int i = 0; i < 5; ++i) {\\n  file.put(c);\\n  c++;\\n }\\n file.close();\\n return 0;\\n}', 2886, 1, 1, 1, '2024-12-03 17:15:31'),
(728, 1, 'Which function is used to read from a text file?', 2891, 1, 1, 1, '2024-12-03 17:15:31'),
(729, 1, 'What will happen if you use std::cin to input data into an integer variable and the user types a non-integer value while using std::cin >> var?', 2894, 1, 1, 2, '2024-12-03 17:15:31'),
(730, 1, 'What is the purpose of using std::endl when writing to a text file using std::ofstream?', 2899, 1, 1, 1, '2024-12-03 17:15:31'),
(731, 1, 'What will be printed when you run this program?\\n#include <iostream>\\nint main() {\\n std::ifstream file(\\\"example.txt\\\");\\n if (!file.is_open()) {\\n  std::cerr << \\\"Error opening file.\\\\n\\\";\\n  return 1;\\n }\\n char c;\\n while (file.get(c)) {\\n  if (c == \'\\\\n\') break;\\n  std::cout << c;\\n }\\n file.close();\\n return 0;\\n}', 2902, 1, 1, 1, '2024-12-03 17:15:31'),
(732, 1, 'What will be printed when you run this program?\\n#include <iostream>\\nint main() {\\n std::ofstream file(\\\"example.txt\\\");\\n if (!file.is_open()) {\\n  std::cerr << \\\"Error opening file.\\\\n\\\";\\n  return 1;\\n }\\n char c = \'a\';\\n for (int i = 0; i < 5; ++i) {\\n  if (c == \'\\\\n\') break;\\n  file.put(c);\\n  c++;\\n }\\n file.close();\\n return 0;\\n}', 2906, 1, 1, 1, '2024-12-03 17:15:31'),
(733, 1, 'Which function is used to write to a text file?', 2911, 1, 1, 1, '2024-12-03 17:15:31'),
(734, 1, 'What will happen if you use std::cout to print an integer value that exceeds the maximum range of a char variable while using std::cout << var?', 2914, 1, 1, 2, '2024-12-03 17:15:31'),
(735, 1, 'What is the purpose of using std::cin.ignore() when reading from a text file?', 2919, 1, 1, 1, '2024-12-03 17:15:31'),
(736, 1, 'What will be printed when you run this program?\\n#include <iostream>\\nint main() {\\n std::ifstream file(\\\"example.txt\\\");\\n if (!file.is_open()) {\\n  std::cerr << \\\"Error opening file.\\\\n\\\";\\n  return 1;\\n }\\n char c;\\n while (file.get(c)) {\\n  std::cout << c;\\n }\\n file.close();\\n return 0;\\n}', 2922, 1, 1, 1, '2024-12-03 17:15:31'),
(737, 1, 'What will be printed when you run this program?\\n#include <iostream>\\nint main() {\\n std::ofstream file(\\\"example.txt\\\");\\n if (!file.is_open()) {\\n  std::cerr << \\\"Error opening file.\\\\n\\\";\\n  return 1;\\n }\\n char c = \'a\';\\n for (int i = 0; i < 5; ++i) {\\n  file.put(c);\\n  c++;\\n }\\n file.close();\\n return 0;\\n}', 2926, 1, 1, 1, '2024-12-03 17:15:31'),
(738, 1, 'Which function is used to read from a binary file?', 2931, 1, 1, 1, '2024-12-03 17:15:31'),
(739, 1, 'What is the difference between std::cin and std::cout for reading and writing files?', 2934, 1, 1, 2, '2024-12-03 17:15:31'),
(740, 1, 'What will be printed when you run this program?\\n#include <iostream>\\nint main() {\\n std::ifstream file(\\\"example.txt\\\");\\n if (!file.is_open()) {\\n  std::cerr << \\\"Error opening file.\\\\n\\\";\\n  return 1;\\n }\\n char c;\\n while (file.get(c)) {\\n  std::cout << (int)c; // Cast to integer\\n }\\n file.close();\\n return 0;\\n}', 2939, 1, 1, 2, '2024-12-03 17:15:31'),
(741, 1, 'What is the purpose of using std::fstream for reading and writing files?', 2942, 1, 1, 1, '2024-12-03 17:15:31'),
(742, 1, 'Which of the following is the correct way to open a file for reading in C++?', 2946, 1, 1, 1, '2024-12-03 17:15:31'),
(743, 1, 'What is the purpose of the ifstream class in C++?', 2950, 1, 1, 1, '2024-12-03 17:15:31'),
(744, 1, 'What does the following code do?\\nifstream file(\'input.txt\');\\nif (file.is_open()) {\\n cout << \'File opened successfully\';\\n} else {\\n cout << \'Failed to open file\';\\n}', 2954, 1, 1, 1, '2024-12-03 17:15:31'),
(745, 1, 'Which of the following correctly closes a file in C++?', 2958, 1, 1, 1, '2024-12-03 17:15:31'),
(746, 1, 'What happens if you attempt to read from a file that does not exist?', 2962, 1, 1, 2, '2024-12-03 17:15:31'),
(747, 1, 'What is the purpose of the ofstream class in C++?', 2965, 1, 1, 1, '2024-12-03 17:15:31'),
(748, 1, 'How do you append data to an existing file using ofstream?', 2970, 1, 1, 2, '2024-12-03 17:15:31'),
(749, 1, 'What will happen if you try to write to a file that is opened with ios::in mode?', 2976, 1, 1, 3, '2024-12-03 17:15:31'),
(750, 1, 'What does the following code do?\\nofstream file(\'output.txt\');\\nfile << \'Hello\';\\nfile.close();', 2978, 1, 1, 1, '2024-12-03 17:15:31'),
(751, 1, 'What is the difference between ios::in and ios::out in file handling?', 2982, 1, 1, 2, '2024-12-03 17:15:31'),
(752, 1, 'Which of the following is true about file streams in C++?', 2985, 1, 1, 1, '2024-12-03 17:15:31'),
(753, 1, 'What does the following code output if the file is empty?\\nifstream file(\'input.txt\');\\nstring content;\\nfile >> content;\\ncout << content;', 2990, 1, 1, 2, '2024-12-03 17:15:31'),
(754, 1, 'How do you check if a file was successfully opened in C++?', 2995, 1, 1, 1, '2024-12-03 17:15:31'),
(755, 1, 'What happens to the content of a file when it is opened with ios::trunc mode?', 2997, 1, 1, 3, '2024-12-03 17:15:31'),
(756, 1, 'What is the result of attempting to read past the end of a file in C++?', 3002, 1, 1, 2, '2024-12-03 17:15:31'),
(757, 1, 'How do you position the file pointer at the beginning of the file after reading part of it?', 3008, 1, 1, 3, '2024-12-03 17:15:31'),
(758, 1, 'Which of the following modes will open a file for both reading and writing?', 3012, 1, 1, 2, '2024-12-03 17:15:31'),
(759, 1, 'What is the difference between ifstream and fstream?', 3014, 1, 1, 1, '2024-12-03 17:15:31'),
(760, 1, 'What happens when you try to open a non-existent file using ios::app mode?', 3020, 1, 1, 3, '2024-12-03 17:15:31'),
(761, 1, 'What is the purpose of the tellg() function in C++?', 3023, 1, 1, 3, '2024-12-03 17:15:31'),
(762, 1, 'What is the result of the following code?\\nifstream file(\'data.txt\');\\nchar c;\\nwhile (file.get(c)) {\\n cout << c;\\n}', 3026, 1, 1, 2, '2024-12-03 17:15:31'),
(763, 1, 'How can you move the file pointer to a specific location in a file?', 3031, 1, 1, 2, '2024-12-03 17:15:31'),
(764, 1, 'What does the following code do?\\nifstream file(\'input.txt\');\\nstring line;\\nwhile (getline(file, line)) {\\n cout << line << endl;\\n}', 3035, 1, 1, 2, '2024-12-03 17:15:31'),
(765, 1, 'Which of the following will open a file in binary mode for reading?', 3039, 1, 1, 3, '2024-12-03 17:15:31'),
(766, 1, 'What does the following code do?\\nifstream file(\'input.txt\');\\nfile.seekg(0, ios::end);\\nint size = file.tellg();', 3043, 1, 1, 3, '2024-12-03 17:15:31'),
(767, 1, 'Which of the following flags will prevent a file from being truncated when it is opened?', 3046, 1, 1, 2, '2024-12-03 17:15:31'),
(768, 1, 'What is the purpose of the clear() function in file handling?', 3050, 1, 1, 3, '2024-12-03 17:15:31'),
(769, 1, 'What will happen if you try to open a file with ios::out mode if the file already exists?', 3056, 1, 1, 2, '2024-12-03 17:15:31'),
(770, 1, 'How do you read a binary file into memory in C++?', 3060, 1, 1, 3, '2024-12-03 17:15:31'),
(771, 1, 'Which of the following correctly opens a file in both input and output mode?', 3063, 1, 1, 2, '2024-12-03 17:15:31'),
(772, 1, 'What is the purpose of a pointer in C++?', 3066, 1, 1, 1, '2024-12-03 17:15:31'),
(773, 1, 'What is the syntax to declare a pointer variable in C++?', 3071, 1, 1, 1, '2024-12-03 17:15:31'),
(774, 1, 'What does the expression int x = 5; int *px = &x; do?', 3074, 1, 1, 2, '2024-12-03 17:15:31'),
(775, 1, 'What is the difference between int *px and int **ppx?', 3079, 1, 1, 3, '2024-12-03 17:15:31'),
(776, 1, 'What does the expression int x = 5; int *px = &x; print when executed?', 3082, 1, 1, 2, '2024-12-03 17:15:31'),
(777, 1, 'What does the expression int *px = &x; do if x has been previously declared?', 3086, 1, 1, 2, '2024-12-03 17:15:31'),
(778, 1, 'What is the difference between int *px and &x?', 3090, 1, 1, 2, '2024-12-03 17:15:31'),
(779, 1, 'What does the expression int x; int *px = &x; do if x is declared as static int x?', 3094, 1, 1, 2, '2024-12-03 17:15:31'),
(780, 1, 'What is the result of int *px = NULL?', 3098, 1, 1, 2, '2024-12-03 17:15:31'),
(781, 1, 'What does int *px = new int do?', 3102, 1, 1, 3, '2024-12-03 17:15:31'),
(782, 1, 'What does int *px = new int[5] do?', 3106, 1, 1, 3, '2024-12-03 17:15:31'),
(783, 1, 'What does delete x; do if int *px = new int?', 3110, 1, 1, 3, '2024-12-03 17:15:31'),
(784, 1, 'What is the correct way to deallocate memory allocated using new?', 3114, 1, 1, 3, '2024-12-03 17:15:31'),
(785, 1, 'What does int *px = new int[5] print if it is not deallocated?', 3118, 1, 1, 3, '2024-12-03 17:15:31'),
(786, 1, 'What does int x = 5; int *px = new int; *px = &x do?', 3122, 1, 1, 3, '2024-12-03 17:15:31'),
(787, 1, 'What is the difference between int *px = &x and int *px = new int?', 3126, 1, 1, 3, '2024-12-03 17:15:31'),
(788, 1, 'What does int *px = new int; delete px do?', 3130, 1, 1, 2, '2024-12-03 17:15:31'),
(789, 1, 'What does int *px = new int[5]; delete [] px do?', 3134, 1, 1, 3, '2024-12-03 17:15:31'),
(790, 1, 'What does int *px = new int; delete px print if executed?', 3138, 1, 1, 3, '2024-12-03 17:15:31'),
(791, 1, 'What does int *px = new int; delete[] px do?', 3142, 1, 1, 3, '2024-12-03 17:15:31'),
(792, 1, 'What is a pointer in C++?', 3146, 1, 1, 1, '2024-12-03 17:15:31'),
(793, 1, 'What is the output of the following code?\\nint x = 5;\\nint* p = &x;\\ncout << *p;', 3150, 1, 1, 1, '2024-12-03 17:15:31'),
(794, 1, 'Which operator is used to get the address of a variable?', 3153, 1, 1, 1, '2024-12-03 17:15:31'),
(795, 1, 'Which operator is used to dereference a pointer in C++?', 3158, 1, 1, 1, '2024-12-03 17:15:31'),
(796, 1, 'How do you declare a pointer to an integer in C++?', 3162, 1, 1, 1, '2024-12-03 17:15:31'),
(797, 1, 'What is the output of the following code?\\nint x = 10;\\nint* p = &x;\\ncout << &p;', 3167, 1, 1, 2, '2024-12-03 17:15:31'),
(798, 1, 'What is the purpose of dynamic memory allocation?', 3171, 1, 1, 1, '2024-12-03 17:15:31'),
(799, 1, 'Which keyword is used to allocate memory dynamically in C++?', 3175, 1, 1, 1, '2024-12-03 17:15:31'),
(800, 1, 'Which of the following statements correctly allocates memory for an array of 10 integers?', 3179, 1, 1, 2, '2024-12-03 17:15:31'),
(801, 1, 'What must you do after dynamically allocating memory in C++?', 3182, 1, 1, 1, '2024-12-03 17:15:31'),
(802, 1, 'What happens if you fail to delete dynamically allocated memory?', 3186, 1, 1, 2, '2024-12-03 17:15:31'),
(803, 1, 'How do you deallocate memory that was allocated using new?', 3190, 1, 1, 1, '2024-12-03 17:15:31'),
(804, 1, 'How do you deallocate memory for an array allocated with new[]?', 3194, 1, 1, 1, '2024-12-03 17:15:31'),
(805, 1, 'What is a memory leak in C++?', 3199, 1, 1, 3, '2024-12-03 17:15:31'),
(806, 1, 'What is the purpose of the delete operator in C++?', 3202, 1, 1, 1, '2024-12-03 17:15:31'),
(807, 1, 'What is the purpose of the delete[] operator in C++?', 3206, 1, 1, 1, '2024-12-03 17:15:31'),
(808, 1, 'What is the difference between delete and delete[] in C++?', 3210, 1, 1, 1, '2024-12-03 17:15:31'),
(809, 1, 'What is the purpose of the malloc function in C++?', 3215, 1, 1, 1, '2024-12-03 17:15:31'),
(810, 1, 'What is the purpose of the free function in C++?', 3219, 1, 1, 1, '2024-12-03 17:15:31'),
(811, 1, 'What is a virtual function?', 3223, 1, 1, 1, '2024-12-03 17:15:31'),
(812, 1, 'What is the purpose of the `virtual` keyword in C++?', 3226, 1, 1, 1, '2024-12-03 17:15:31'),
(813, 1, 'What is the output of the following code?\\nclass A {\\n public:\\n virtual void show() { cout << \\\"A\\\"; }\\n};\\nclass B : public A {\\n public:\\n void show() { cout << \\\"B\\\"; }\\n};\\nint main() {\\n B obj;\\n obj.show();\\n}', 3230, 1, 1, 2, '2024-12-03 17:15:31'),
(814, 1, 'What is a pure virtual function?', 3234, 1, 1, 3, '2024-12-03 17:15:31'),
(815, 1, 'Which of the following correctly declares a pure virtual function?', 3239, 1, 1, 3, '2024-12-03 17:15:31'),
(816, 1, 'What is an abstract class in C++?', 3242, 1, 1, 2, '2024-12-03 17:15:31'),
(817, 1, 'What happens when a derived class does not override a virtual function?', 3246, 1, 1, 3, '2024-12-03 17:15:31'),
(818, 1, 'What is the output of the following code?\\nclass A {\\n public:\\n virtual void show() { cout << \\\"A\\\"; }\\n};\\nclass B : public A {\\n};\\nint main() {\\n B obj;\\n obj.show();\\n}', 3250, 1, 1, 3, '2024-12-03 17:15:31'),
(819, 1, 'What is multiple inheritance in C++?', 3255, 1, 1, 1, '2024-12-03 17:15:31'),
(820, 1, 'Which of the following is an example of multiple inheritance?', 3258, 1, 1, 1, '2024-12-03 17:15:31'),
(821, 1, 'What is the output of the following code?\\nclass A {\\n public:\\n int x = 10;\\n};\\nclass B : public A {\\n public:\\n int x = 5;\\n};\\nint main() {\\n B obj;\\n cout << obj.x;\\n}', 3262, 1, 1, 2, '2024-12-03 17:15:31'),
(822, 1, 'What is the order of constructor calls in multiple inheritance?', 3267, 1, 1, 3, '2024-12-03 17:15:31'),
(823, 1, 'How can you explicitly call a base class constructor in a derived class?', 3271, 1, 1, 3, '2024-12-03 17:15:31'),
(824, 1, 'What is the purpose of the `protected` keyword in inheritance?', 3274, 1, 1, 2, '2024-12-03 17:15:31'),
(825, 1, 'What is the output of the following code?\\nclass A {\\n public:\\n virtual void show() { cout << \\\"A\\\"; }\\n};\\nclass B : public A {\\n public:\\n void show() { cout << \\\"B\\\"; }\\n};\\nint main() {\\n A obj;\\n obj.show();\\n}', 3278, 1, 1, 1, '2024-12-03 17:15:31'),
(826, 1, 'What is the output of the following code?\\nclass A {\\n public:\\n virtual void show() { cout << \\\"A\\\"; }\\n};\\nclass B : public A {\\n public:\\n void show() { cout << \\\"B\\\"; }\\n};\\nint main() {\\n A* obj = new B;\\n obj->show();\\n}', 3282, 1, 1, 3, '2024-12-03 17:15:31'),
(827, 1, 'Which of the following is true about virtual destructors?', 3287, 1, 1, 3, '2024-12-03 17:15:31'),
(828, 1, 'What happens if you don\'t declare a destructor as virtual in a base class?', 3291, 1, 1, 2, '2024-12-03 17:15:31'),
(829, 1, 'What is the purpose of a virtual destructor in inheritance?', 3294, 1, 1, 3, '2024-12-03 17:15:31'),
(830, 1, 'What is the difference between static and dynamic polymorphism?', 3300, 1, 1, 3, '2024-12-03 17:15:31'),
(831, 1, 'What is the output of the following code?\\nclass A {\\n public:\\n virtual void show() { cout << \\\"A\\\"; }\\n};\\nclass B : public A {\\n public:\\n void show() { cout << \\\"B\\\"; }\\n};\\nclass C : public B {\\n public:\\n void show() { cout << \\\"C\\\"; }\\n};\\nint main() {\\n A* obj = new C;\\n obj->show();\\n}', 3302, 1, 1, 3, '2024-12-03 17:15:31'),
(832, 1, 'What is the purpose of inheritance in object-oriented programming?', 3306, 1, 1, 1, '2024-12-03 17:15:31'),
(833, 1, 'What is the term for a subclass that inherits the properties and behavior of a parent class?', 3310, 1, 1, 1, '2024-12-03 17:15:31'),
(834, 1, 'What is the term for a class that is inherited by a subclass?', 3315, 1, 1, 1, '2024-12-03 17:15:31'),
(835, 1, 'What is the purpose of polymorphism in object-oriented programming?', 3318, 1, 1, 2, '2024-12-03 17:15:31'),
(836, 1, 'What is an example of polymorphism?', 3322, 1, 1, 2, '2024-12-03 17:15:31'),
(837, 1, 'Which of the following is an example of inheritance?', 3327, 1, 1, 1, '2024-12-03 17:15:31'),
(838, 1, 'Which of the following is an example of polymorphism?', 3330, 1, 1, 2, '2024-12-03 17:15:31'),
(839, 1, 'What is the term for a method in a subclass that overrides a method in the parent class?', 3334, 1, 1, 1, '2024-12-03 17:15:31'),
(840, 1, 'What is the purpose of abstract classes in object-oriented programming?', 3338, 1, 1, 2, '2024-12-03 17:15:31'),
(841, 1, 'What is an example of abstract classes?', 3342, 1, 1, 2, '2024-12-03 17:15:31'),
(842, 1, 'Which of the following is an example of polymorphism?', 3346, 1, 1, 2, '2024-12-03 17:15:31'),
(843, 1, 'What is the term for a method in a parent class that is overridden by a subclass?', 3351, 1, 1, 1, '2024-12-03 17:15:31'),
(844, 1, 'What is the purpose of interfaces in object-oriented programming?', 3354, 1, 1, 2, '2024-12-03 17:15:31'),
(845, 1, 'What is an example of interfaces?', 3358, 1, 1, 2, '2024-12-03 17:15:31'),
(846, 1, 'Which of the following is an example of inheritance?', 3363, 1, 1, 1, '2024-12-03 17:15:31'),
(847, 1, 'Which of the following is an example of polymorphism?', 3366, 1, 1, 2, '2024-12-03 17:15:31'),
(848, 1, 'What is the term for a subclass that inherits the properties and behavior of a parent class?', 3370, 1, 1, 1, '2024-12-03 17:15:31'),
(849, 1, 'What is an example of abstract classes?', 3374, 1, 1, 2, '2024-12-03 17:15:31'),
(850, 1, 'Which of the following is an example of polymorphism?', 3378, 1, 1, 2, '2024-12-03 17:15:31'),
(851, 1, 'What is the term for a method in a subclass that overrides a method in the parent class?', 3382, 1, 1, 1, '2024-12-03 17:15:31'),
(852, 1, 'Which of the following is an example of interfaces?', 3386, 1, 1, 2, '2024-12-03 17:15:31'),
(853, 1, 'What is an example of polymorphism?', 3390, 1, 1, 2, '2024-12-03 17:15:31'),
(854, 1, 'Which of the following is an example of inheritance?', 3395, 1, 1, 1, '2024-12-03 17:15:31'),
(855, 1, 'Which of the following is an example of polymorphism?', 3398, 1, 1, 2, '2024-12-03 17:15:31'),
(856, 1, 'What is the term for a method in a parent class that is overridden by a subclass?', 3403, 1, 1, 1, '2024-12-03 17:15:31'),
(857, 1, 'What is the correct syntax to declare a class that inherits from multiple base classes?', 3407, 1, 1, 3, '2024-12-03 17:15:31'),
(858, 1, 'What will be the output of the following code?\\nclass A {\\n public:\\n virtual void show() { cout << \\\"A\\\"; }\\n};\\nclass B : public A {\\n public:\\n void show() { cout << \\\"B\\\"; }\\n};\\nint main() {\\n B b;\\n b.show();\\n}', 3410, 1, 1, 2, '2024-12-03 17:15:31'),
(859, 1, 'What is the main benefit of using polymorphism in C++?', 3415, 1, 1, 1, '2024-12-03 17:15:31'),
(860, 1, 'What is the purpose of the `override` keyword in C++?', 3418, 1, 1, 3, '2024-12-03 17:15:31'),
(861, 1, 'What is the correct way to prevent a class from being inherited in C++?', 3424, 1, 1, 3, '2024-12-03 17:15:31'),
(862, 1, 'What will be the output of the following code?\\nclass A {\\n public:\\n virtual void display() { cout << \\\"A\\\"; }\\n};\\nclass B : public A {\\n public:\\n void display() { cout << \\\"B\\\"; }\\n};\\nint main() {\\n A* obj = new A;\\n obj->display();\\n}', 3425, 1, 1, 1, '2024-12-03 17:15:31'),
(863, 1, 'What is the output of the following code?\\nclass A {\\n public:\\n virtual void display() { cout << \\\"A\\\"; }\\n};\\nclass B : public A {\\n public:\\n void display() { cout << \\\"B\\\"; }\\n};\\nclass C : public B {\\n public:\\n void display() { cout << \\\"C\\\"; }\\n};\\nint main() {\\n A* obj = new C;\\n obj->display();\\n}', 3431, 1, 1, 3, '2024-12-03 17:15:31'),
(864, 1, 'What happens if a class inherits from two base classes that both define the same function?', 3434, 1, 1, 3, '2024-12-03 17:15:31'),
(865, 1, 'Which of the following is a reason to use virtual inheritance?', 3440, 1, 1, 3, '2024-12-03 17:15:31'),
(866, 1, 'Which of the following is an example of function overriding in inheritance?', 3443, 1, 1, 2, '2024-12-03 17:15:31'),
(867, 1, 'Which of the following is a valid function declaration?', 3445, 1, 1, 1, '2024-12-03 17:15:31'),
(868, 1, 'What will be the result of the following code?\\nint arr[3] = {1, 2, 3};\\nfor (int i = 0; i < 3; i++) {\\n cout << arr[i];\\n}', 3451, 1, 1, 1, '2024-12-03 17:15:31'),
(869, 1, 'What will be printed by the following code?\\nint a = 3;\\nif (a > 0) {\\n cout << \\\"Positive\\\";\\n} else if (a == 0) {\\n cout << \\\"Zero\\\";\\n} else {\\n cout << \\\"Negative\\\";\\n}', 3454, 1, 1, 1, '2024-12-03 17:15:31'),
(870, 1, 'How do you open a file for both reading and writing?', 3459, 1, 1, 2, '2024-12-03 17:15:31'),
(871, 1, 'What is the purpose of a base case in a recursive function?', 3463, 1, 1, 2, '2024-12-03 17:15:31'),
(872, 1, 'What is the difference between a while loop and a do-while loop?', 3466, 1, 1, 1, '2024-12-03 17:15:31'),
(873, 1, 'Which of the following is the correct syntax to declare an array of 10 integers?', 3469, 1, 1, 1, '2024-12-03 17:15:31'),
(874, 1, 'Which of the following correctly initializes an array of 5 integers to 0?', 3474, 1, 1, 1, '2024-12-03 17:15:31'),
(875, 1, 'What is the output of the following code?\\nint arr[5] = {1, 2, 3, 4, 5};\\ncout << arr[2] + arr[4];', 3479, 1, 1, 2, '2024-12-03 17:15:31'),
(876, 1, 'Which of the following is true about arrays in C++?', 3482, 1, 1, 1, '2024-12-03 17:15:31'),
(877, 1, 'How do you access the last element of an array?', 3487, 1, 1, 1, '2024-12-03 17:15:31'),
(878, 1, 'What will be printed by the following code?\\nint arr[4] = {5, 10, 15, 20};\\nfor (int i = 0; i < 4; i++) {\\n cout << arr[i];\\n}', 3490, 1, 1, 1, '2024-12-03 17:15:31'),
(879, 1, 'What happens if you try to access an element outside the bounds of an array?', 3495, 1, 1, 3, '2024-12-03 17:15:31'),
(880, 1, 'How do you pass an array to a function?', 3498, 1, 1, 1, '2024-12-03 17:15:31'),
(881, 1, 'What is the purpose of the `sizeof` operator when used with arrays?', 3503, 1, 1, 2, '2024-12-03 17:15:31'),
(882, 1, 'What is the output of the following code?\\nint arr[5] = {1, 2, 3, 4, 5};\\nfor (int i = 0; i < 5; i++) {\\n cout << arr[i] << \\\" \\\";\\n}', 3508, 1, 1, 1, '2024-12-03 17:15:31'),
(883, 1, 'How do you initialize all elements of an array to a specific value?', 3511, 1, 1, 2, '2024-12-03 17:15:31'),
(884, 1, 'What is the output of the following code?\\nint arr[3] = {10, 20, 30};\\ncout << arr[0] + arr[2];', 3514, 1, 1, 2, '2024-12-03 17:15:31'),
(885, 1, 'Which of the following statements is correct about multi-dimensional arrays?', 3519, 1, 1, 3, '2024-12-03 17:15:31'),
(886, 1, 'How do you access an element in a 2D array?', 3522, 1, 1, 1, '2024-12-03 17:15:31'),
(887, 1, 'Which of the following correctly initializes a 2D array of integers?', 3526, 1, 1, 2, '2024-12-03 17:15:31'),
(888, 1, 'What is the output of the following code?\\nint arr[2][2] = {{1, 2}, {3, 4}};\\ncout << arr[1][0];', 3531, 1, 1, 2, '2024-12-03 17:15:31'),
(889, 1, 'What will happen if you try to access an uninitialized element in an array?', 3536, 1, 1, 3, '2024-12-03 17:15:31'),
(890, 1, 'What will be the result of the following code?\\nint arr[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};\\ncout << arr[2][2];', 3539, 1, 1, 2, '2024-12-03 17:15:31'),
(891, 1, 'How do you find the size of a 2D array in C++?', 3544, 1, 1, 3, '2024-12-03 17:15:31'),
(892, 1, 'Which of the following statements is true about arrays?', 3545, 1, 1, 2, '2024-12-03 17:15:31'),
(893, 1, 'What is the difference between an array and a pointer?', 3552, 1, 1, 3, '2024-12-03 17:15:31'),
(894, 1, 'What happens when you try to assign one array to another directly?', 3555, 1, 1, 3, '2024-12-03 17:15:31'),
(895, 1, 'What will be the output of the following code snippet? \\n#include <iostream>\\nusing namespace std;\\nvoid modifyArray(int arr[], int size) {\\n for (int i = 0; i < size; i++) {\\n arr[i] *= 2;\\n }\\n}\\nint main() {\\n int numbers[] = {1, 2, 3, 4};\\n modifyArray(numbers, 4);\\n cout << numbers[2];\\n return 0;\\n}', 3559, 1, 1, 2, '2024-12-03 17:15:31'),
(896, 1, 'Given the following code, what will be the output if the input is \'5\'? \\n#include <iostream>\\nusing namespace std;\\nvoid foo(int n) {\\n if (n > 0) {\\n foo(n - 2);\\n cout << n << \' \';\\n }\\n}\\nint main() {\\n foo(5);\\n return 0;\\n}', 3562, 1, 1, 2, '2024-12-03 17:15:31'),
(897, 1, 'What does the following function accomplish when called with a pointer to the first element of an integer array? \\nvoid mysteryFunction(int *p, int size) {\\n for (int i = 0; i < size; ++i) {\\n *p += i;\\n p++;\\n }\\n}', 3566, 1, 1, 2, '2024-12-03 17:15:31'),
(898, 1, 'What will be the output of the following code snippet? \\n#include <iostream>\\nusing namespace std;\\nvoid changeValue(int &x) {\\n x += 10;\\n}\\nint main() {\\n int a = 5;\\n changeValue(a);\\n cout << a;\\n return 0;\\n}', 3571, 1, 1, 1, '2024-12-03 17:15:31'),
(899, 1, 'Which of the following statements is true about the function \'void foo(const int &x)\'?', 3574, 1, 1, 1, '2024-12-03 17:15:31'),
(900, 1, 'What is the effect of the following code snippet? \\n#include <iostream>\\nusing namespace std;\\nint square(int x) {\\n return x * x;\\n}\\nint main() {\\n int y = square(3) + square(4);\\n cout << y;\\n return 0;\\n}', 3579, 1, 1, 1, '2024-12-03 17:15:31'),
(901, 1, 'What is the purpose of the following function? \\nvoid copyArray(int* dest, int* src, int size) {\\n for (int i = 0; i < size; ++i) {\\n dest[i] = src[i];\\n }\\n}', 3582, 1, 1, 2, '2024-12-03 17:15:31'),
(902, 1, 'What will be the output of the following code? \\n#include <iostream>\\nusing namespace std;\\nvoid printArray(int arr[], int size) {\\n for (int i = 0; i < size; i++) {\\n cout << arr[i] << \' \';\\n }\\n}\\nint main() {\\n int numbers[] = {2, 4, 6, 8};\\n printArray(numbers, 3);\\n return 0;\\n}', 3585, 1, 1, 1, '2024-12-03 17:15:31'),
(903, 1, 'What will be the output of the following code snippet? \\n#include <iostream>\\nusing namespace std;\\nvoid foo(int x) {\\n x = 100;\\n}\\nint main() {\\n int y = 50;\\n foo(y);\\n cout << y;\\n return 0;\\n}', 3590, 1, 1, 1, '2024-12-03 17:15:31'),
(904, 1, 'Which of the following correctly demonstrates function overloading?', 3594, 1, 1, 2, '2024-12-03 17:15:31'),
(905, 1, 'What will be the result of the following code? \\n#include <iostream>\\nusing namespace std;\\nvoid update(int* p) {\\n *p = *p + 10;\\n}\\nint main() {\\n int x = 20;\\n update(&x);\\n cout << x;\\n return 0;\\n}', 3599, 1, 1, 2, '2024-12-03 17:15:31'),
(906, 1, 'If a function \'int func(int x)\' uses recursion to compute \'x!\' (factorial of \'x\'), which of the following base cases is correct?', 3604, 1, 1, 2, '2024-12-03 17:15:31'),
(907, 1, 'Which concept allows the same function name to be used for different implementations in a class hierarchy?', 3606, 1, 1, 1, '2024-12-03 17:15:32'),
(908, 1, 'What will the following code output? \\n#include <iostream>\\nusing namespace std;\\nvoid func(int& x) {\\n x += 5;\\n}\\nint main() {\\n int a = 10;\\n func(a);\\n cout << a;\\n return 0;\\n}', 3611, 1, 1, 1, '2024-12-03 17:15:32'),
(909, 1, 'Which keyword allows for function definition even when the implementation is not provided?', 3614, 1, 1, 2, '2024-12-03 17:15:32'),
(910, 1, 'What is the primary advantage of using dynamic memory allocation for arrays in C++?', 3618, 1, 1, 2, '2024-12-03 17:15:32'),
(911, 1, 'What is the output of the following code snippet? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int a = 5;\\n int b = 2;\\n cout << a + b;\\n return 0;\\n}', 3623, 1, 1, 1, '2024-12-03 17:15:32'),
(912, 1, 'What will be printed when the following code is executed? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n for (int i = 0; i < 3; i++) {\\n cout << i << \' \';\\n }\\n return 0;\\n}', 3626, 1, 1, 1, '2024-12-03 17:15:32'),
(913, 1, 'What is the purpose of the \'return 0;\' statement in a C++ main function?', 3629, 1, 1, 1, '2024-12-03 17:15:32'),
(914, 1, 'What is the correct way to declare an integer variable named \'num\' in C++?', 3634, 1, 1, 1, '2024-12-03 17:15:32'),
(915, 1, 'In C++, which of the following data types is used to store a single character?', 3639, 1, 1, 1, '2024-12-03 17:15:32'),
(916, 1, 'What is the output of the following code snippet? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int x = 10;\\n x += 5;\\n cout << x;\\n return 0;\\n}', 3643, 1, 1, 1, '2024-12-03 17:15:32'),
(917, 1, 'What does the following code snippet do? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int num = 3;\\n if (num > 0) {\\n cout << \'Positive\';\\n } else {\\n cout << \'Negative\';\\n }\\n return 0;\\n}', 3645, 1, 1, 1, '2024-12-03 17:15:32'),
(918, 1, 'What is the result of the following expression? \\n5 + 2 * 3', 3651, 1, 1, 1, '2024-12-03 17:15:32'),
(919, 1, 'In C++, which of the following loops executes its body at least once, regardless of the condition?', 3653, 1, 1, 1, '2024-12-03 17:15:32'),
(920, 1, 'What does the following code do? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int num = 0;\\n while (num < 3) {\\n cout << num << \' \';\\n num++;\\n }\\n return 0;\\n}', 3658, 1, 1, 1, '2024-12-03 17:15:32'),
(921, 1, 'What is the output of this C++ program? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int a = 5, b = 10;\\n cout << (a > b ? a : b);\\n return 0;\\n}', 3662, 1, 1, 2, '2024-12-03 17:15:32'),
(922, 1, 'Which of the following is a valid C++ identifier?', 3665, 1, 1, 1, '2024-12-03 17:15:32'),
(923, 1, 'What is the output of the following code? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int num = 5;\\n num++;\\n cout << num;\\n return 0;\\n}', 3670, 1, 1, 1, '2024-12-03 17:15:32'),
(924, 1, 'In C++, what is the keyword used to create a constant variable?', 3675, 1, 1, 1, '2024-12-03 17:15:32'),
(925, 1, 'What does the \'cout\' statement do in C++?', 3677, 1, 1, 1, '2024-12-03 17:15:32'),
(926, 1, 'What is the output of the following code snippet? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int x = 8;\\n int y = x--;\\n cout << x << \' \' << y;\\n return 0;\\n}', 3681, 1, 1, 2, '2024-12-03 17:15:32'),
(927, 1, 'Which of the following is the correct syntax to take integer input from a user in C++?', 3686, 1, 1, 1, '2024-12-03 17:15:32'),
(928, 1, 'What is the role of the \'#include <iostream>\' directive?', 3689, 1, 1, 1, '2024-12-03 17:15:32'),
(929, 1, 'What is the output of this code? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int a = 3;\\n a *= 2;\\n cout << a;\\n return 0;\\n}', 3694, 1, 1, 1, '2024-12-03 17:15:32'),
(930, 1, 'In C++, what does \'int\' represent?', 3697, 1, 1, 1, '2024-12-03 17:15:32'),
(931, 1, 'What will be the output of the following code snippet? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n for (int i = 0; i < 3; i++) {\\n cout << i << \' \';\\n }\\n return 0;\\n}', 3702, 1, 1, 1, '2024-12-03 17:15:32'),
(932, 1, 'What is the correct syntax for a while loop that prints numbers 1 to 5 in C++?', 3705, 1, 1, 1, '2024-12-03 17:15:32'),
(933, 1, 'What does the following loop do? \\nfor (int i = 10; i > 0; i -= 2) { cout << i << \' \'; }', 3711, 1, 1, 1, '2024-12-03 17:15:32'),
(934, 1, 'Which of the following is a characteristic of a do-while loop?', 3714, 1, 1, 1, '2024-12-03 17:15:32'),
(935, 1, 'What is the output of the following code snippet? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int i = 0;\\n while (i < 3) {\\n cout << i << \' \';\\n i++;\\n }\\n return 0;\\n}', 3718, 1, 1, 1, '2024-12-03 17:15:32'),
(936, 1, 'In a for loop, which part of the loop statement is executed only once?', 3721, 1, 1, 1, '2024-12-03 17:15:32'),
(937, 1, 'What is the purpose of a break statement in a loop?', 3727, 1, 1, 1, '2024-12-03 17:15:32'),
(938, 1, 'What does the following code output? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int i = 1;\\n do {\\n cout << i << \' \';\\n i++;\\n } while (i < 4);\\n return 0;\\n}', 3731, 1, 1, 1, '2024-12-03 17:15:32'),
(939, 1, 'Which of the following loops is most appropriate for iterating through an array when the number of elements is known?', 3734, 1, 1, 1, '2024-12-03 17:15:32'),
(940, 1, 'What will be the output of the following code snippet? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n for (int i = 0; i < 5; i++) {\\n if (i == 3) continue;\\n cout << i << \' \';\\n }\\n return 0;\\n}', 3739, 1, 1, 2, '2024-12-03 17:15:32'),
(941, 1, 'What is the difference between a \'while\' loop and a \'do-while\' loop?', 3742, 1, 1, 1, '2024-12-03 17:15:32'),
(942, 1, 'What does the following code do? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int x = 5;\\n while (x > 0) {\\n cout << x << \' \';\\n x--;\\n }\\n return 0;\\n}', 3745, 1, 1, 1, '2024-12-03 17:15:32'),
(943, 1, 'What will happen if a \'for\' loop has no condition specified? \\nfor ( ; ; ) { /* code */ }', 3749, 1, 1, 2, '2024-12-03 17:15:32'),
(944, 1, 'What will the following code output? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int x = 3;\\n for (int i = 0; i < x; i++) {\\n for (int j = 0; j <= i; j++) {\\n cout << \'*\';\\n }\\n cout << endl;\\n }\\n return 0;\\n}', 3755, 1, 1, 3, '2024-12-03 17:15:32'),
(945, 1, 'Which loop is best suited for running a block of code when the number of iterations is not known beforehand?', 3758, 1, 1, 1, '2024-12-03 17:15:32'),
(946, 1, 'What does the following code output? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n for (int i = 1; i <= 5; i++) {\\n cout << i * i << \' \';\\n }\\n return 0;\\n}', 3762, 1, 1, 1, '2024-12-03 17:15:32'),
(947, 1, 'What is the output of the following loop? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int sum = 0;\\n for (int i = 1; i <= 5; i++) {\\n sum += i;\\n }\\n cout << sum;\\n return 0;\\n}', 3767, 1, 1, 1, '2024-12-03 17:15:32'),
(948, 1, 'Which of the following is a potential risk of using loops incorrectly?', 3770, 1, 1, 2, '2024-12-03 17:15:32'),
(949, 1, 'What is the effect of the following loop? \\nint i = 0;\\nwhile (i < 10) {\\n cout << i << \' \';\\n i += 3;\\n}', 3773, 1, 1, 1, '2024-12-03 17:15:32'),
(950, 1, 'What is the output of this nested loop? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n for (int i = 0; i < 3; i++) {\\n for (int j = 0; j < 2; j++) {\\n cout << i * j << \' \';\\n }\\n }\\n return 0;\\n}', 3778, 1, 1, 3, '2024-12-03 17:15:32'),
(951, 1, 'What is the output of the following code snippet? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int x = 5;\\n if (x > 3) {\\n cout << \'Greater than 3\';\\n } else {\\n cout << \'Less than or equal to 3\';\\n }\\n return 0;\\n}', 3781, 1, 1, 1, '2024-12-03 17:15:32'),
(952, 1, 'What will be printed when the following code executes? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int y = 7;\\n if (y < 5) {\\n cout << \'Less than 5\';\\n } else if (y < 10) {\\n cout << \'Between 5 and 10\';\\n } else {\\n cout << \'10 or more\';\\n }\\n return 0;\\n}', 3786, 1, 1, 1, '2024-12-03 17:15:32'),
(953, 1, 'What is the correct output for the following code? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int a = 4;\\n int b = 8;\\n if (a == b) {\\n cout << \'Equal\';\\n } else {\\n cout << \'Not Equal\';\\n }\\n return 0;\\n}', 3790, 1, 1, 1, '2024-12-03 17:15:32'),
(954, 1, 'In the following code, what will be the output if the user inputs the value 5? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int num;\\n cin >> num;\\n if (num % 2 == 0) {\\n cout << \'Even\';\\n } else {\\n cout << \'Odd\';\\n }\\n return 0;\\n}', 3794, 1, 1, 1, '2024-12-03 17:15:32'),
(955, 1, 'What is the purpose of the \'else\' keyword in C++?', 3797, 1, 1, 1, '2024-12-03 17:15:32'),
(956, 1, 'What will be the result of the following code if x is 15? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int x = 15;\\n if (x > 10 && x < 20) {\\n cout << \'Within range\';\\n } else {\\n cout << \'Out of range\';\\n }\\n return 0;\\n}', 3801, 1, 1, 1, '2024-12-03 17:15:32'),
(957, 1, 'What will be printed when this code runs? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int num = 3;\\n if (num > 0) {\\n cout << \'Positive\';\\n }\\n else {\\n cout << \'Negative\';\\n }\\n return 0;\\n}', 3805, 1, 1, 1, '2024-12-03 17:15:32');
INSERT INTO `questions` (`QuestionID`, `OwningUserID`, `Prompt`, `CorrectAnswerID`, `QuestionTypeID`, `QuestionStatusID`, `QuestionDifficultyID`, `CreationDate`) VALUES
(958, 1, 'What does the following code output when executed? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int value = -5;\\n if (value >= 0) {\\n cout << \'Non-negative\';\\n } else {\\n cout << \'Negative\';\\n }\\n return 0;\\n}', 3810, 1, 1, 1, '2024-12-03 17:15:32'),
(959, 1, 'What will happen when the following code is executed with \'x = 12\'? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int x = 12;\\n if (x < 10) {\\n cout << \'Less than 10\';\\n } else if (x > 15) {\\n cout << \'Greater than 15\';\\n } else {\\n cout << \'Between 10 and 15\';\\n }\\n return 0;\\n}', 3815, 1, 1, 1, '2024-12-03 17:15:32'),
(960, 1, 'What is the output of this C++ program? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int age = 20;\\n if (age >= 18) {\\n cout << \'Adult\';\\n } else {\\n cout << \'Minor\';\\n }\\n return 0;\\n}', 3817, 1, 1, 1, '2024-12-03 17:15:32'),
(961, 1, 'What is the result of this condition? \\nif (5 > 3 && 3 < 8) { cout << \'True\'; } else { cout << \'False\'; }', 3821, 1, 1, 1, '2024-12-03 17:15:32'),
(962, 1, 'Which of the following is a valid use of an \'else if\' statement in C++?', 3826, 1, 1, 1, '2024-12-03 17:15:32'),
(963, 1, 'What will be the output of the following code if \'score\' is 85? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int score = 85;\\n if (score >= 90) {\\n cout << \'A\';\\n } else if (score >= 80) {\\n cout << \'B\';\\n } else {\\n cout << \'C\';\\n }\\n return 0;\\n}', 3830, 1, 1, 1, '2024-12-03 17:15:32'),
(964, 1, 'What does the following code print? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int num = 10;\\n if (num != 10) {\\n cout << \'Not ten\';\\n } else {\\n cout << \'It is ten\';\\n }\\n return 0;\\n}', 3834, 1, 1, 1, '2024-12-03 17:15:32'),
(965, 1, 'What is the purpose of using nested if-else statements?', 3837, 1, 1, 1, '2024-12-03 17:15:32'),
(966, 1, 'What is the output of the following code if \'a\' is 0? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int a = 0;\\n if (a > 0) {\\n cout << \'Positive\';\\n } else if (a < 0) {\\n cout << \'Negative\';\\n } else {\\n cout << \'Zero\';\\n }\\n return 0;\\n}', 3843, 1, 1, 1, '2024-12-03 17:15:32'),
(967, 1, 'What is the correct syntax for an \'if\' statement in C++?', 3845, 1, 1, 1, '2024-12-03 17:15:32'),
(968, 1, 'What is the output if \'number\' is -3? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int number = -3;\\n if (number > 0) {\\n cout << \'Positive\';\\n } else {\\n cout << \'Non-positive\';\\n }\\n return 0;\\n}', 3850, 1, 1, 1, '2024-12-03 17:15:32'),
(969, 1, 'What does the following code output if \'x\' is 25? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int x = 25;\\n if (x > 0 && x < 30) {\\n cout << \'Between 0 and 30\';\\n } else {\\n cout << \'Out of range\';\\n }\\n return 0;\\n}', 3853, 1, 1, 1, '2024-12-03 17:15:32'),
(970, 1, 'What is the syntax to start a switch statement in C++?', 3857, 1, 1, 1, '2024-12-03 17:15:32'),
(971, 1, 'What is the output of the following code?\\ncpp\\nint x = 3;\\nswitch (x) {\\n case 1: cout << \\\"One\\\"; break;\\n case 2: cout << \\\"Two\\\"; break;\\n case 3: cout << \\\"Three\\\"; break;\\n default: cout << \\\"Default\\\";\\n}\\n', 3863, 1, 1, 1, '2024-12-03 17:15:32'),
(972, 1, 'When is the \'default\' case in a switch statement executed?', 3865, 1, 1, 1, '2024-12-03 17:15:32'),
(973, 1, 'What is the output of the following code?\\ncpp\\nint y = 5;\\nswitch (y) {\\n case 1: cout << \\\"Case 1\\\";\\n case 2: cout << \\\"Case 2\\\";\\n default: cout << \\\"Default\\\";\\n}\\n', 3871, 1, 1, 1, '2024-12-03 17:15:32'),
(974, 1, 'What keyword is used to exit a case in a switch statement?', 3873, 1, 1, 1, '2024-12-03 17:15:32'),
(975, 1, 'Can a switch statement evaluate character data types (e.g., char) in C++?', 3878, 1, 1, 1, '2024-12-03 17:15:32'),
(976, 1, 'What is the output of the following code?\\ncpp\\nchar grade = \'B\';\\nswitch (grade) {\\n case \'A\': cout << \\\"Excellent\\\"; break;\\n case \'B\': cout << \\\"Good\\\"; break;\\n default: cout << \\\"Needs Improvement\\\";\\n}\\n', 3882, 1, 1, 1, '2024-12-03 17:15:32'),
(977, 1, 'What happens if you forget to include the break statement in a switch case?', 3886, 1, 1, 1, '2024-12-03 17:15:32'),
(978, 1, 'What is the output of the following code?\\ncpp\\nint num = 9;\\nswitch (num) {\\n case 8: cout << \\\"Eight\\\"; break;\\n case 9: cout << \\\"Nine\\\";\\n case 10: cout << \\\"Ten\\\"; break;\\n default: cout << \\\"Default\\\";\\n}\\n', 3891, 1, 1, 1, '2024-12-03 17:15:32'),
(979, 1, 'Is it mandatory to include a \'default\' case in a switch statement?', 3894, 1, 1, 1, '2024-12-03 17:15:32'),
(980, 1, 'What is the output of the following code?\\ncpp\\nint x = 2;\\nswitch (x * 2) {\\n case 2: cout << \\\"Two\\\"; break;\\n case 4: cout << \\\"Four\\\"; break;\\n default: cout << \\\"Default\\\";\\n}\\n', 3898, 1, 1, 2, '2024-12-03 17:15:32'),
(981, 1, 'Can multiple cases in a switch statement have the same block of code?\\nFor example:\\ncpp\\nswitch (x) {\\n case 1:\\n case 2: cout << \\\"One or Two\\\"; break;\\n}\\n', 3901, 1, 1, 2, '2024-12-03 17:15:32'),
(982, 1, 'What will be the output of the following code?\\ncpp\\nint x = 3;\\nswitch (x) {\\n case 1: cout << \\\"One\\\";\\n case 2: cout << \\\"Two\\\";\\n case 3: cout << \\\"Three\\\";\\n default: cout << \\\"Default\\\";\\n}\\n', 3908, 1, 1, 2, '2024-12-03 17:15:32'),
(983, 1, 'Which of the following switch statement headers will result in a compilation error?', 3911, 1, 1, 2, '2024-12-03 17:15:32'),
(984, 1, 'What is the output of the following code?\\ncpp\\nint score = 90;\\nswitch (score / 10) {\\n case 10:\\n case 9: cout << \\\"A\\\"; break;\\n case 8: cout << \\\"B\\\"; break;\\n default: cout << \\\"F\\\";\\n}\\n', 3913, 1, 1, 2, '2024-12-03 17:15:32'),
(985, 1, 'What is the purpose of the default case in a switch statement, and is it mandatory?', 3917, 1, 1, 2, '2024-12-03 17:15:32'),
(986, 1, 'How many default cases are allowed in a single switch statement?', 3921, 1, 1, 2, '2024-12-03 17:15:32'),
(987, 1, 'What is the output of the following code?\\ncpp\\nint num = 7;\\nswitch (num % 3) {\\n case 0: cout << \\\"Divisible by 3\\\"; break;\\n case 1: cout << \\\"Remainder 1\\\"; break;\\n case 2: cout << \\\"Remainder 2\\\"; break;\\n default: cout << \\\"No Match\\\";\\n}\\n', 3926, 1, 1, 2, '2024-12-03 17:15:32'),
(988, 1, 'What is the result of the following code?\\ncpp\\nint x = 5;\\nswitch (x) {\\n case 5: cout << \\\"Five\\\"; break;\\n default: cout << \\\"Default\\\"; break;\\n}\\ncout << \\\" Done\\\";\\n', 3931, 1, 1, 2, '2024-12-03 17:15:32'),
(989, 1, 'In a switch statement, can the default case be placed anywhere, or does it always have to be the last case?', 3933, 1, 1, 2, '2024-12-03 17:15:32');

-- --------------------------------------------------------

--
-- Table structure for table `questionstatus`
--

CREATE TABLE `questionstatus` (
  `QuestionStatusID` int(11) NOT NULL,
  `QuestionStatusDesc` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questionstatus`
--

INSERT INTO `questionstatus` (`QuestionStatusID`, `QuestionStatusDesc`) VALUES
(0, 'Inactive'),
(1, 'Active'),
(3, 'Archived');

-- --------------------------------------------------------

--
-- Table structure for table `questiontagconnector`
--

CREATE TABLE `questiontagconnector` (
  `QuestionTagID` int(11) NOT NULL,
  `QuestionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questiontagconnector`
--

INSERT INTO `questiontagconnector` (`QuestionTagID`, `QuestionID`) VALUES
(1, 658),
(1, 659),
(1, 665),
(1, 672),
(1, 673),
(1, 674),
(1, 675),
(1, 676),
(1, 683),
(1, 701),
(1, 757),
(1, 758),
(1, 761),
(1, 763),
(1, 765),
(1, 766),
(1, 768),
(1, 770),
(1, 772),
(1, 773),
(1, 774),
(1, 775),
(1, 776),
(1, 777),
(1, 778),
(1, 779),
(1, 780),
(1, 781),
(1, 782),
(1, 783),
(1, 784),
(1, 785),
(1, 786),
(1, 787),
(1, 788),
(1, 789),
(1, 790),
(1, 791),
(1, 792),
(1, 793),
(1, 794),
(1, 795),
(1, 796),
(1, 797),
(1, 798),
(1, 799),
(1, 800),
(1, 801),
(1, 802),
(1, 803),
(1, 804),
(1, 805),
(1, 806),
(1, 807),
(1, 808),
(1, 809),
(1, 810),
(1, 811),
(1, 812),
(1, 813),
(1, 814),
(1, 815),
(1, 816),
(1, 817),
(1, 818),
(1, 819),
(1, 820),
(1, 821),
(1, 822),
(1, 823),
(1, 824),
(1, 825),
(1, 826),
(1, 827),
(1, 828),
(1, 829),
(1, 830),
(1, 831),
(1, 832),
(1, 833),
(1, 834),
(1, 835),
(1, 836),
(1, 837),
(1, 838),
(1, 839),
(1, 840),
(1, 841),
(1, 842),
(1, 843),
(1, 844),
(1, 845),
(1, 846),
(1, 847),
(1, 848),
(1, 849),
(1, 850),
(1, 851),
(1, 852),
(1, 853),
(1, 854),
(1, 855),
(1, 856),
(1, 857),
(1, 858),
(1, 859),
(1, 860),
(1, 861),
(1, 862),
(1, 863),
(1, 864),
(1, 865),
(1, 866),
(1, 895),
(1, 896),
(1, 897),
(1, 898),
(1, 899),
(1, 900),
(1, 901),
(1, 902),
(1, 903),
(1, 904),
(1, 905),
(1, 906),
(1, 907),
(1, 908),
(1, 909),
(1, 910),
(2, 647),
(2, 648),
(2, 649),
(2, 650),
(2, 651),
(2, 652),
(2, 653),
(2, 654),
(2, 655),
(2, 656),
(2, 657),
(2, 660),
(2, 661),
(2, 662),
(2, 663),
(2, 664),
(2, 666),
(2, 667),
(2, 668),
(2, 669),
(2, 670),
(2, 671),
(2, 677),
(2, 678),
(2, 679),
(2, 680),
(2, 681),
(2, 682),
(2, 684),
(2, 685),
(2, 686),
(2, 687),
(2, 688),
(2, 689),
(2, 690),
(2, 691),
(2, 692),
(2, 693),
(2, 694),
(2, 695),
(2, 696),
(2, 697),
(2, 698),
(2, 699),
(2, 700),
(2, 702),
(2, 703),
(2, 704),
(2, 705),
(2, 706),
(2, 707),
(2, 708),
(2, 709),
(2, 710),
(2, 711),
(2, 712),
(2, 713),
(2, 714),
(2, 715),
(2, 716),
(2, 717),
(2, 718),
(2, 719),
(2, 720),
(2, 721),
(2, 722),
(2, 723),
(2, 724),
(2, 725),
(2, 726),
(2, 727),
(2, 728),
(2, 729),
(2, 730),
(2, 731),
(2, 732),
(2, 733),
(2, 734),
(2, 735),
(2, 736),
(2, 737),
(2, 738),
(2, 739),
(2, 740),
(2, 741),
(2, 742),
(2, 743),
(2, 744),
(2, 745),
(2, 746),
(2, 747),
(2, 748),
(2, 749),
(2, 750),
(2, 751),
(2, 752),
(2, 753),
(2, 754),
(2, 755),
(2, 756),
(2, 759),
(2, 760),
(2, 762),
(2, 764),
(2, 767),
(2, 769),
(2, 771),
(2, 867),
(2, 868),
(2, 869),
(2, 870),
(2, 871),
(2, 872),
(2, 873),
(2, 874),
(2, 875),
(2, 876),
(2, 877),
(2, 878),
(2, 879),
(2, 880),
(2, 881),
(2, 882),
(2, 883),
(2, 884),
(2, 885),
(2, 886),
(2, 887),
(2, 888),
(2, 889),
(2, 890),
(2, 891),
(2, 892),
(2, 893),
(2, 894),
(2, 911),
(2, 912),
(2, 913),
(2, 914),
(2, 915),
(2, 916),
(2, 917),
(2, 918),
(2, 919),
(2, 920),
(2, 921),
(2, 922),
(2, 923),
(2, 924),
(2, 925),
(2, 926),
(2, 927),
(2, 928),
(2, 929),
(2, 930),
(2, 931),
(2, 932),
(2, 933),
(2, 934),
(2, 935),
(2, 936),
(2, 937),
(2, 938),
(2, 939),
(2, 940),
(2, 941),
(2, 942),
(2, 943),
(2, 944),
(2, 945),
(2, 946),
(2, 947),
(2, 948),
(2, 949),
(2, 950),
(2, 951),
(2, 952),
(2, 953),
(2, 954),
(2, 955),
(2, 956),
(2, 957),
(2, 958),
(2, 959),
(2, 960),
(2, 961),
(2, 962),
(2, 963),
(2, 964),
(2, 965),
(2, 966),
(2, 967),
(2, 968),
(2, 969),
(2, 970),
(2, 971),
(2, 972),
(2, 973),
(2, 974),
(2, 975),
(2, 976),
(2, 977),
(2, 978),
(2, 979),
(2, 980),
(2, 981),
(2, 982),
(2, 983),
(2, 984),
(2, 985),
(2, 986),
(2, 987),
(2, 988),
(2, 989),
(3, 647),
(3, 648),
(3, 649),
(3, 650),
(3, 651),
(3, 652),
(3, 653),
(3, 654),
(3, 655),
(3, 656),
(3, 657),
(3, 658),
(3, 659),
(3, 660),
(3, 661),
(3, 662),
(3, 663),
(3, 664),
(3, 665),
(3, 867),
(3, 880),
(3, 895),
(3, 896),
(3, 897),
(3, 898),
(3, 899),
(3, 900),
(3, 901),
(3, 902),
(3, 903),
(3, 904),
(3, 905),
(3, 906),
(3, 907),
(3, 908),
(3, 909),
(3, 913),
(3, 925),
(4, 647),
(4, 654),
(4, 660),
(4, 662),
(5, 648),
(5, 687),
(5, 700),
(5, 820),
(5, 857),
(5, 860),
(5, 867),
(5, 873),
(5, 914),
(5, 915),
(5, 922),
(5, 924),
(5, 927),
(5, 928),
(5, 930),
(5, 932),
(5, 936),
(5, 955),
(5, 962),
(5, 965),
(5, 967),
(6, 650),
(6, 651),
(7, 652),
(7, 655),
(7, 660),
(7, 661),
(8, 653),
(8, 663),
(9, 656),
(9, 657),
(9, 658),
(9, 659),
(9, 672),
(9, 673),
(9, 674),
(9, 675),
(9, 676),
(9, 677),
(9, 683),
(9, 871),
(9, 896),
(9, 906),
(10, 649),
(10, 661),
(10, 666),
(10, 667),
(10, 668),
(10, 670),
(10, 679),
(10, 684),
(10, 875),
(10, 884),
(10, 888),
(10, 890),
(11, 664),
(12, 665),
(13, 677),
(14, 676),
(14, 746),
(14, 749),
(14, 754),
(14, 756),
(14, 768),
(14, 802),
(14, 805),
(14, 879),
(14, 889),
(14, 948),
(15, 669),
(15, 680),
(16, 681),
(16, 682),
(16, 970),
(16, 971),
(16, 972),
(16, 973),
(16, 974),
(16, 975),
(16, 976),
(16, 977),
(16, 978),
(16, 979),
(16, 980),
(16, 981),
(16, 982),
(16, 983),
(16, 984),
(16, 985),
(16, 986),
(16, 987),
(16, 988),
(16, 989),
(17, 686),
(17, 687),
(17, 688),
(17, 689),
(17, 690),
(17, 691),
(17, 692),
(17, 693),
(17, 694),
(17, 695),
(17, 696),
(17, 697),
(17, 698),
(17, 699),
(17, 700),
(17, 701),
(17, 702),
(17, 703),
(17, 704),
(17, 705),
(18, 686),
(18, 690),
(18, 691),
(18, 692),
(18, 699),
(18, 868),
(18, 872),
(18, 878),
(18, 882),
(18, 912),
(18, 919),
(18, 920),
(18, 931),
(18, 932),
(18, 933),
(18, 934),
(18, 935),
(18, 936),
(18, 937),
(18, 938),
(18, 939),
(18, 940),
(18, 941),
(18, 942),
(18, 943),
(18, 944),
(18, 945),
(18, 946),
(18, 947),
(18, 948),
(18, 949),
(18, 950),
(19, 688),
(19, 698),
(19, 705),
(20, 689),
(21, 693),
(21, 940),
(22, 694),
(23, 697),
(24, 701),
(24, 702),
(24, 703),
(24, 944),
(24, 950),
(25, 706),
(25, 707),
(25, 708),
(25, 709),
(25, 710),
(25, 711),
(25, 712),
(25, 713),
(25, 714),
(25, 715),
(25, 716),
(25, 717),
(25, 718),
(25, 719),
(25, 720),
(25, 721),
(25, 722),
(25, 723),
(25, 724),
(25, 725),
(25, 726),
(25, 727),
(25, 728),
(25, 729),
(25, 730),
(25, 731),
(25, 732),
(25, 733),
(25, 734),
(25, 735),
(25, 736),
(25, 737),
(25, 738),
(25, 739),
(25, 740),
(25, 741),
(25, 742),
(25, 743),
(25, 744),
(25, 745),
(25, 746),
(25, 747),
(25, 748),
(25, 749),
(25, 750),
(25, 751),
(25, 752),
(25, 753),
(25, 754),
(25, 755),
(25, 756),
(25, 757),
(25, 758),
(25, 759),
(25, 760),
(25, 761),
(25, 762),
(25, 763),
(25, 764),
(25, 765),
(25, 766),
(25, 767),
(25, 768),
(25, 769),
(25, 770),
(25, 771),
(25, 870),
(26, 750),
(27, 753),
(27, 764),
(28, 757),
(28, 761),
(28, 763),
(28, 766),
(29, 765),
(29, 770),
(30, 751),
(30, 755),
(30, 758),
(30, 760),
(30, 767),
(30, 769),
(30, 771),
(31, 772),
(31, 773),
(31, 774),
(31, 775),
(31, 776),
(31, 777),
(31, 778),
(31, 779),
(31, 780),
(31, 781),
(31, 782),
(31, 783),
(31, 784),
(31, 785),
(31, 786),
(31, 787),
(31, 788),
(31, 789),
(31, 790),
(31, 791),
(31, 792),
(31, 793),
(31, 794),
(31, 795),
(31, 796),
(31, 797),
(31, 893),
(31, 895),
(31, 897),
(31, 901),
(31, 905),
(31, 910),
(32, 793),
(33, 798),
(33, 799),
(33, 800),
(33, 801),
(33, 802),
(33, 803),
(33, 804),
(33, 805),
(33, 806),
(33, 807),
(33, 808),
(33, 809),
(33, 810),
(34, 811),
(34, 812),
(34, 813),
(34, 814),
(34, 815),
(34, 816),
(34, 817),
(34, 818),
(34, 825),
(34, 826),
(34, 827),
(34, 828),
(34, 829),
(34, 830),
(34, 831),
(34, 835),
(34, 836),
(34, 838),
(34, 842),
(34, 844),
(34, 845),
(34, 847),
(34, 850),
(34, 852),
(34, 853),
(34, 855),
(34, 858),
(34, 859),
(34, 860),
(34, 862),
(34, 863),
(34, 866),
(34, 907),
(35, 829),
(37, 797),
(38, 877),
(38, 886),
(39, 874),
(39, 883),
(39, 887),
(40, 868),
(40, 873),
(40, 874),
(40, 875),
(40, 876),
(40, 877),
(40, 878),
(40, 879),
(40, 880),
(40, 881),
(40, 882),
(40, 883),
(40, 884),
(40, 885),
(40, 886),
(40, 887),
(40, 888),
(40, 889),
(40, 890),
(40, 891),
(40, 892),
(40, 893),
(40, 894),
(40, 895),
(40, 897),
(40, 901),
(40, 902),
(40, 910),
(40, 939),
(41, 819),
(41, 820),
(41, 821),
(41, 822),
(41, 823),
(41, 824),
(41, 832),
(41, 833),
(41, 834),
(41, 837),
(41, 839),
(41, 840),
(41, 841),
(41, 843),
(41, 846),
(41, 848),
(41, 849),
(41, 851),
(41, 854),
(41, 856),
(41, 857),
(41, 861),
(41, 864),
(41, 865),
(41, 907),
(42, 824),
(43, 814),
(43, 815),
(43, 816),
(44, 811),
(44, 813),
(44, 817),
(44, 818),
(44, 909),
(45, 866),
(47, 951),
(47, 952),
(47, 953),
(47, 954),
(47, 955),
(47, 956),
(47, 957),
(47, 958),
(47, 959),
(47, 960),
(47, 961),
(47, 962),
(47, 963),
(47, 964),
(47, 965),
(47, 966),
(47, 967),
(47, 968),
(47, 969),
(48, 951),
(48, 952),
(48, 953),
(48, 954),
(48, 955),
(48, 956),
(48, 957),
(48, 958),
(48, 959),
(48, 960),
(48, 961),
(48, 962),
(48, 963),
(48, 964),
(48, 965),
(48, 966),
(48, 967),
(48, 968),
(48, 969),
(50, 897),
(50, 905),
(50, 910),
(51, 898),
(51, 899),
(51, 908),
(52, 898),
(52, 908),
(53, 899),
(54, 899),
(54, 900),
(54, 902),
(54, 904),
(55, 903),
(56, 904),
(57, 906),
(58, 907),
(58, 909),
(59, 910),
(60, 911),
(60, 913),
(61, 911),
(61, 916),
(61, 918),
(61, 923),
(61, 929),
(62, 912),
(62, 919),
(62, 934),
(62, 941),
(63, 913),
(64, 914),
(64, 916),
(64, 922),
(64, 924),
(65, 914),
(65, 915),
(65, 930),
(66, 951),
(66, 952),
(66, 954),
(66, 956),
(66, 959),
(67, 917),
(67, 937),
(67, 955),
(68, 918),
(68, 923),
(68, 926),
(68, 929),
(69, 921),
(70, 922),
(71, 924),
(72, 925),
(72, 927),
(73, 928),
(74, 931),
(74, 933),
(74, 936),
(74, 939),
(74, 940),
(74, 943),
(74, 946),
(74, 947),
(75, 932),
(75, 935),
(75, 941),
(75, 942),
(75, 945),
(75, 949),
(76, 934),
(76, 938),
(76, 941),
(77, 937),
(78, 943),
(78, 948),
(84, 956),
(84, 961),
(84, 969),
(85, 965);

-- --------------------------------------------------------

--
-- Table structure for table `questiontags`
--

CREATE TABLE `questiontags` (
  `QuestionTagID` int(11) NOT NULL,
  `QuestionTagDesc` varchar(255) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questiontags`
--

INSERT INTO `questiontags` (`QuestionTagID`, `QuestionTagDesc`, `IsActive`) VALUES
(1, 'CSC211', 1),
(2, 'CSC111', 1),
(3, 'Functions', 1),
(4, 'Return Types', 1),
(5, 'Syntax', 1),
(6, 'Prototypes', 1),
(7, 'Parameters', 1),
(8, 'Calling Functions', 1),
(9, 'Recursion', 1),
(10, 'Output', 1),
(11, 'Return Statements', 1),
(12, 'Function Overloading', 1),
(13, 'Basics', 1),
(14, 'Errors', 1),
(15, 'Nested', 1),
(16, 'Switch Statements', 1),
(17, 'Iteration', 1),
(18, 'Loops', 1),
(19, 'While Loops', 1),
(20, 'Do-While Loops', 1),
(21, 'Continue Statement', 1),
(22, 'Break Statement', 1),
(23, 'For Loops', 1),
(24, 'Nested Loops', 1),
(25, 'File Input/Output', 1),
(26, 'Writing', 1),
(27, 'Reading', 1),
(28, 'File Pointers', 1),
(29, 'Binary Files', 1),
(30, 'Modes', 1),
(31, 'Pointers', 1),
(32, 'Dereferencing', 1),
(33, 'Dynamic Memory Allocation', 1),
(34, 'Polymorphism', 1),
(35, 'Virtual Destructors', 1),
(36, 'Object-Oriented Programming', 1),
(37, 'Address', 1),
(38, 'Indexing', 1),
(39, 'Initialization', 1),
(40, 'Arrays', 1),
(41, 'Inheritance', 1),
(42, 'Access Specifiers', 1),
(43, 'Abstract Classes', 1),
(44, 'Virtual Functions', 1),
(45, 'Function Overriding', 1),
(46, 'Conditionals', 1),
(47, 'If statements', 1),
(48, 'Else statements', 1),
(49, 'Code Tracing', 1),
(50, 'Dynamic Memory', 1),
(51, 'References', 1),
(52, 'Passing by Reference', 1),
(53, 'Const', 1),
(54, 'Syntax Understanding', 1),
(55, 'Passing by Value', 1),
(56, 'Overloading', 1),
(57, 'Logic Understanding', 1),
(58, 'OOP', 1),
(59, 'Memory Management', 1),
(60, 'Basic Syntax', 1),
(61, 'Arithmetic', 1),
(62, 'Control Structures', 1),
(63, 'Program Structure', 1),
(64, 'Variables', 1),
(65, 'Data Types', 1),
(66, 'Conditional Statements', 1),
(67, 'Control Flow', 1),
(68, 'Operators', 1),
(69, 'Conditional Operator', 1),
(70, 'Identifiers', 1),
(71, 'Constants', 1),
(72, 'Input/Output', 1),
(73, 'Preprocessor Directives', 1),
(74, 'For Loop', 1),
(75, 'While Loop', 1),
(76, 'Do-While Loop', 1),
(77, 'Break', 1),
(78, 'Infinite Loop', 1),
(79, 'conditional statements', 1),
(80, 'code tracing', 1),
(81, 'comparison', 1),
(82, 'input/output', 1),
(83, 'control flow', 1),
(84, 'logical operators', 1),
(85, 'nested conditions', 1),
(86, 'Pass by Reference', 1),
(87, 'Void Functions', 1),
(88, 'Value Returning', 1);

-- --------------------------------------------------------

--
-- Table structure for table `questiontypes`
--

CREATE TABLE `questiontypes` (
  `QuestionTypeID` int(11) NOT NULL,
  `QuestionTypeDesc` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questiontypes`
--

INSERT INTO `questiontypes` (`QuestionTypeID`, `QuestionTypeDesc`) VALUES
(1, 'Multiple Choice'),
(2, 'True/False');

-- --------------------------------------------------------

--
-- Table structure for table `quizanswers`
--

CREATE TABLE `quizanswers` (
  `QuizAnswerID` int(11) NOT NULL,
  `QuizQuestionID` int(11) DEFAULT NULL,
  `AnswerText` varchar(255) DEFAULT NULL,
  `CreationDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quizanswers`
--

INSERT INTO `quizanswers` (`QuizAnswerID`, `QuizQuestionID`, `AnswerText`, `CreationDate`) VALUES
(1, 1, 'else if (x = 5)', '2024-12-03 17:17:07'),
(2, 1, 'else if (x == 5)', '2024-12-03 17:17:07'),
(3, 1, 'else (x > 5)', '2024-12-03 17:17:07'),
(4, 1, 'if else (x < 10)', '2024-12-03 17:17:07'),
(5, 2, 'A', '2024-12-03 17:17:07'),
(6, 2, 'B', '2024-12-03 17:17:07'),
(7, 2, 'C', '2024-12-03 17:17:07'),
(8, 2, 'No output', '2024-12-03 17:17:07'),
(9, 3, 'Between 0 and 30', '2024-12-03 17:17:07'),
(10, 3, 'Out of range', '2024-12-03 17:17:07'),
(11, 3, 'No output', '2024-12-03 17:17:07'),
(12, 3, 'Compilation Error', '2024-12-03 17:17:07'),
(13, 4, 'Equal', '2024-12-03 17:17:07'),
(14, 4, 'Not Equal', '2024-12-03 17:17:07'),
(15, 4, 'Undefined Behavior', '2024-12-03 17:17:07'),
(16, 4, 'No output', '2024-12-03 17:17:07'),
(17, 5, 'Less than 5', '2024-12-03 17:17:07'),
(18, 5, 'Between 5 and 10', '2024-12-03 17:17:07'),
(19, 5, '10 or more', '2024-12-03 17:17:07'),
(20, 5, 'Compilation Error', '2024-12-03 17:17:07');

-- --------------------------------------------------------

--
-- Table structure for table `quizes`
--

CREATE TABLE `quizes` (
  `QuizID` int(11) NOT NULL,
  `OwningUserID` int(11) DEFAULT NULL,
  `QuizTakerID` int(11) DEFAULT NULL,
  `CreationDate` datetime DEFAULT current_timestamp(),
  `StartDate` datetime DEFAULT current_timestamp(),
  `CompletionDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quizes`
--

INSERT INTO `quizes` (`QuizID`, `OwningUserID`, `QuizTakerID`, `CreationDate`, `StartDate`, `CompletionDate`) VALUES
(1, 1, 3, '2024-12-03 17:15:42', '2024-12-03 17:15:42', NULL),
(2, 1, 3, '2024-12-03 17:15:49', '2024-12-03 17:15:49', NULL),
(3, 1, 3, '2024-12-03 17:16:54', '2024-12-03 17:16:54', NULL),
(4, 1, 3, '2024-12-03 17:16:57', '2024-12-03 17:16:57', NULL),
(5, 1, 3, '2024-12-03 17:17:07', '2024-12-03 17:17:07', '2024-12-03 17:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `quizlessonconnector`
--

CREATE TABLE `quizlessonconnector` (
  `QuizID` int(11) NOT NULL,
  `LessonID` int(11) NOT NULL,
  `ParticipatingUserID` int(11) NOT NULL,
  `IsActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quizlessonconnector`
--

INSERT INTO `quizlessonconnector` (`QuizID`, `LessonID`, `ParticipatingUserID`, `IsActive`) VALUES
(1, 1, 3, 1),
(2, 1, 3, 1),
(3, 16, 3, 1),
(4, 16, 3, 1),
(5, 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quizquestions`
--

CREATE TABLE `quizquestions` (
  `QuizQuestionID` int(11) NOT NULL,
  `QuestionID` int(11) DEFAULT NULL,
  `QuizID` int(11) DEFAULT NULL,
  `Prompt` varchar(1000) DEFAULT NULL,
  `QuestionTypeID` int(11) DEFAULT NULL,
  `QuestionDifficultyID` int(11) DEFAULT NULL,
  `CorrectAnswerID` int(11) DEFAULT NULL,
  `ChosenAnswerID` int(11) DEFAULT NULL,
  `IsSkipped` tinyint(1) DEFAULT 0,
  `CreationDate` datetime DEFAULT current_timestamp(),
  `StartDate` datetime DEFAULT current_timestamp(),
  `CompletionDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quizquestions`
--

INSERT INTO `quizquestions` (`QuizQuestionID`, `QuestionID`, `QuizID`, `Prompt`, `QuestionTypeID`, `QuestionDifficultyID`, `CorrectAnswerID`, `ChosenAnswerID`, `IsSkipped`, `CreationDate`, `StartDate`, `CompletionDate`) VALUES
(1, 962, 5, 'Which of the following is a valid use of an \'else if\' statement in C++?', 1, 1, 2, 1, 0, '2024-12-03 17:17:07', '2024-12-03 17:17:07', '2024-12-03 17:17:09'),
(2, 963, 5, 'What will be the output of the following code if \'score\' is 85? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int score = 85;\\n if (score >= 90) {\\n cout << \'A\';\\n } else if (score >= 80) {\\n cout << \'B\';\\n } else {\\n cout << \'C\';\\n }\\n return 0;\\n}', 1, 1, 6, 7, 0, '2024-12-03 17:17:07', '2024-12-03 17:17:09', '2024-12-03 17:17:11'),
(3, 969, 5, 'What does the following code output if \'x\' is 25? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int x = 25;\\n if (x > 0 && x < 30) {\\n cout << \'Between 0 and 30\';\\n } else {\\n cout << \'Out of range\';\\n }\\n return 0;\\n}', 1, 1, 9, 10, 0, '2024-12-03 17:17:07', '2024-12-03 17:17:11', '2024-12-03 17:17:12'),
(4, 953, 5, 'What is the correct output for the following code? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int a = 4;\\n int b = 8;\\n if (a == b) {\\n cout << \'Equal\';\\n } else {\\n cout << \'Not Equal\';\\n }\\n return 0;\\n}', 1, 1, 14, 15, 0, '2024-12-03 17:17:07', '2024-12-03 17:17:12', '2024-12-03 17:17:15'),
(5, 952, 5, 'What will be printed when the following code executes? \\n#include <iostream>\\nusing namespace std;\\nint main() {\\n int y = 7;\\n if (y < 5) {\\n cout << \'Less than 5\';\\n } else if (y < 10) {\\n cout << \'Between 5 and 10\';\\n } else {\\n cout << \'10 or more\';\\n }\\n return 0;\\n}', 1, 1, 18, 19, 0, '2024-12-03 17:17:07', '2024-12-03 17:17:15', '2024-12-03 17:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `quiztemplate`
--

CREATE TABLE `quiztemplate` (
  `QuizTemplateID` int(11) NOT NULL,
  `Name` varchar(55) DEFAULT NULL,
  `OwningUserID` int(11) DEFAULT NULL,
  `NumberOfQuestions` int(11) DEFAULT NULL,
  `IsPublic` tinyint(1) DEFAULT 0,
  `IsActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiztemplate`
--

INSERT INTO `quiztemplate` (`QuizTemplateID`, `Name`, `OwningUserID`, `NumberOfQuestions`, `IsPublic`, `IsActive`) VALUES
(1, 'Easy if/else statements', 1, 5, 1, 1),
(4, 'Medium if/else statements', 1, 5, 1, 1),
(5, 'Hard if/else statements', 1, 5, 1, 1),
(6, 'Easy For loops', 1, 5, 1, 1),
(7, 'Medium  For Loops', 1, 5, 1, 1),
(8, 'Hard For Loops', 1, 5, 1, 1),
(9, 'Easy While Loops', 1, 5, 1, 1),
(10, 'Medium While Loops', 1, 5, 1, 1),
(11, 'Hard While Loops', 1, 5, 1, 1),
(12, 'Easy Do-While Loops', 1, 5, 1, 1),
(13, 'Medium Do-While Loops', 1, 5, 1, 1),
(14, 'Hard Do-While Loops', 1, 5, 1, 1),
(15, 'Functions easy', 1, 5, 1, 1),
(16, 'Functions medium', 1, 5, 1, 1),
(17, 'Functions Hard', 1, 5, 1, 1),
(18, 'Easy Nested statements', 1, 5, 1, 1),
(19, 'Easy Switch statements', 1, 5, 1, 1),
(20, 'Medium Switch statements', 1, 5, 1, 1),
(21, 'Hard Switch statements ', 1, 5, 1, 1),
(22, 'Easy if/else statements Copy', NULL, NULL, 0, 1),
(23, 'Medium if/else statements Copy', NULL, NULL, 0, 1),
(24, 'Easy if/else statements Copy', NULL, NULL, 0, 1),
(25, 'Easy Switch statements Copy', NULL, NULL, 0, 1),
(26, 'Medium Switch statements Copy', NULL, NULL, 0, 1),
(27, 'Hard Switch statements  Copy', NULL, NULL, 0, 1),
(28, 'Functions easy Copy', NULL, NULL, 0, 1),
(29, 'Functions medium Copy', NULL, NULL, 0, 1),
(30, 'Functions Hard Copy', NULL, NULL, 0, 1),
(31, 'Easy if/else statements Copy', NULL, NULL, 0, 1),
(32, 'Medium  For Loops Copy', NULL, NULL, 0, 1),
(33, 'Hard For Loops Copy', NULL, NULL, 0, 1),
(34, 'Easy While Loops Copy', NULL, NULL, 0, 1),
(35, 'Medium While Loops Copy', NULL, NULL, 0, 1),
(36, 'Hard While Loops Copy', NULL, NULL, 0, 1),
(37, 'Easy Do-While Loops Copy', NULL, NULL, 0, 1),
(38, 'Medium Do-While Loops Copy', NULL, NULL, 0, 1),
(39, 'Hard Do-While Loops Copy', NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiztemplatedifficultyconnector`
--

CREATE TABLE `quiztemplatedifficultyconnector` (
  `ConnectorID` int(11) NOT NULL,
  `QuizTemplateID` int(11) DEFAULT NULL,
  `QuestionDifficultyID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiztemplatedifficultyconnector`
--

INSERT INTO `quiztemplatedifficultyconnector` (`ConnectorID`, `QuizTemplateID`, `QuestionDifficultyID`) VALUES
(4, 6, 1),
(5, 7, 1),
(6, 7, 2),
(7, 8, 1),
(8, 8, 2),
(9, 8, 3),
(10, 9, 1),
(11, 10, 1),
(12, 10, 2),
(13, 11, 1),
(14, 11, 2),
(15, 11, 3),
(16, 12, 1),
(17, 13, 1),
(18, 13, 2),
(19, 14, 1),
(20, 14, 2),
(21, 14, 3),
(22, 15, 1),
(23, 16, 1),
(24, 16, 2),
(25, 17, 1),
(26, 17, 2),
(27, 17, 3),
(28, 18, 1),
(33, 4, 2),
(34, 5, 3),
(35, 19, 1),
(37, 20, 2),
(38, 21, 3),
(39, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiztemplatetagsconnector`
--

CREATE TABLE `quiztemplatetagsconnector` (
  `ConnectorID` int(11) NOT NULL,
  `QuizTemplateID` int(11) DEFAULT NULL,
  `QuestionTagID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiztemplatetagsconnector`
--

INSERT INTO `quiztemplatetagsconnector` (`ConnectorID`, `QuizTemplateID`, `QuestionTagID`) VALUES
(7, 6, 23),
(8, 7, 23),
(9, 8, 23),
(10, 9, 19),
(11, 10, 19),
(12, 11, 19),
(13, 12, 20),
(14, 13, 20),
(15, 14, 20),
(16, 15, 3),
(17, 16, 3),
(18, 17, 3),
(19, 18, 15),
(26, 4, 46),
(27, 4, 47),
(28, 4, 48),
(29, 5, 46),
(30, 5, 47),
(31, 5, 48),
(32, 19, 16),
(33, 19, 46),
(35, 20, 16),
(36, 21, 16),
(37, 1, 2),
(38, 1, 47),
(39, 1, 48);

-- --------------------------------------------------------

--
-- Table structure for table `quiztemplatetypeconnector`
--

CREATE TABLE `quiztemplatetypeconnector` (
  `ConnectorID` int(11) NOT NULL,
  `QuizTemplateID` int(11) DEFAULT NULL,
  `QuestionTypeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiztemplatetypeconnector`
--

INSERT INTO `quiztemplatetypeconnector` (`ConnectorID`, `QuizTemplateID`, `QuestionTypeID`) VALUES
(4, 6, 1),
(5, 7, 1),
(6, 8, 1),
(7, 9, 1),
(8, 10, 1),
(9, 11, 1),
(10, 12, 1),
(11, 13, 1),
(12, 14, 1),
(13, 15, 1),
(14, 16, 1),
(15, 17, 1),
(16, 18, 1),
(21, 4, 1),
(22, 5, 1),
(23, 19, 1),
(25, 20, 1),
(26, 21, 1),
(27, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `userbasetypes`
--

CREATE TABLE `userbasetypes` (
  `UserBaseTypeID` int(11) NOT NULL,
  `UserBaseTypeDesc` varchar(100) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userbasetypes`
--

INSERT INTO `userbasetypes` (`UserBaseTypeID`, `UserBaseTypeDesc`, `IsActive`) VALUES
(1, 'Admin', 1),
(2, 'Educator', 1),
(3, 'Learner', 1);

-- --------------------------------------------------------

--
-- Table structure for table `userlessonstatus`
--

CREATE TABLE `userlessonstatus` (
  `LessonID` int(11) NOT NULL,
  `ParticipatingUserID` int(11) NOT NULL,
  `StartDate` datetime DEFAULT current_timestamp(),
  `CompletionDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usermoduleaccesslevels`
--

CREATE TABLE `usermoduleaccesslevels` (
  `AccessLevelID` int(11) NOT NULL,
  `AccessLevelDesc` varchar(55) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usermoduleaccesslevels`
--

INSERT INTO `usermoduleaccesslevels` (`AccessLevelID`, `AccessLevelDesc`, `IsActive`) VALUES
(1, 'View/Take', 1),
(2, 'Edit', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usermoduleaccesslookup`
--

CREATE TABLE `usermoduleaccesslookup` (
  `UserID` int(11) NOT NULL,
  `ModuleID` int(11) NOT NULL,
  `AccessLevelID` int(11) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userrelations`
--

CREATE TABLE `userrelations` (
  `UserFrom` int(11) NOT NULL,
  `UserTo` int(11) NOT NULL,
  `RelationTypeID` int(11) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1,
  `CreationDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userrelationtypes`
--

CREATE TABLE `userrelationtypes` (
  `RelationTypeID` int(11) NOT NULL,
  `RelationTypeDesc` varchar(50) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userrelationtypes`
--

INSERT INTO `userrelationtypes` (`RelationTypeID`, `RelationTypeDesc`, `IsActive`) VALUES
(1, 'Parent to Child', 1),
(2, 'Caretaker to Parent', 1),
(3, 'Caretaker to Child', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `UserTypeID` int(11) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1,
  `CreationDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `UserTypeID`, `Email`, `FirstName`, `LastName`, `Password`, `IsActive`, `CreationDate`) VALUES
(1, 6, 'prof.azhar001@gmail.com', 'Mohammad', 'Azhar', 'HorseVitaminOrchid', 1, '2024-08-29 11:26:44'),
(2, 5, 'test@test.com', NULL, NULL, '123', 1, '2024-08-29 12:29:30'),
(3, 5, 'apr521@gmail.com', 'Andrew', 'Rubinstein', '12345678910', 1, '2024-08-29 12:38:52'),
(4, 5, 'example@example.com', 'sergey', 'Tikhonov', '$2y$12$el8RMkohrOLkW9.Jz2pyeOzFl32nB28zNpkQkwekfqhbiY1hCOBnO', 1, '2024-12-05 16:55:24');

-- --------------------------------------------------------

--
-- Table structure for table `usertypes`
--

CREATE TABLE `usertypes` (
  `UserTypeID` int(11) NOT NULL,
  `UserTypeDesc` varchar(100) DEFAULT NULL,
  `UserBaseTypeID` int(11) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usertypes`
--

INSERT INTO `usertypes` (`UserTypeID`, `UserTypeDesc`, `UserBaseTypeID`, `IsActive`) VALUES
(5, 'Student', 3, 1),
(6, 'Professor', 2, 1),
(7, 'Admin', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`AnswerID`),
  ADD KEY `FK_QuestionID` (`QuestionID`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`ClassID`),
  ADD UNIQUE KEY `ClassCode` (`ClassCode`),
  ADD KEY `fk_classes_owninguserid` (`OwningUserID`);

--
-- Indexes for table `classmodules`
--
ALTER TABLE `classmodules`
  ADD PRIMARY KEY (`ClassID`,`ModuleID`),
  ADD KEY `ModuleID` (`ModuleID`);

--
-- Indexes for table `classparticipants`
--
ALTER TABLE `classparticipants`
  ADD PRIMARY KEY (`ClassID`,`ParticipantID`),
  ADD KEY `ParticipantID` (`ParticipantID`);

--
-- Indexes for table `lessonplans`
--
ALTER TABLE `lessonplans`
  ADD PRIMARY KEY (`LessonPlanID`),
  ADD KEY `ModuleID` (`ModuleID`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`LessonID`),
  ADD KEY `LessonPlanID` (`LessonPlanID`),
  ADD KEY `QuizTemplateID` (`QuizTemplateID`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`ModuleID`),
  ADD KEY `OwningUserID` (`OwningUserID`);

--
-- Indexes for table `questiondifficulty`
--
ALTER TABLE `questiondifficulty`
  ADD PRIMARY KEY (`QuestionDifficultyID`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`QuestionID`),
  ADD KEY `OwningUserID` (`OwningUserID`),
  ADD KEY `CorrectAnswerID` (`CorrectAnswerID`),
  ADD KEY `QuestionTypeID` (`QuestionTypeID`),
  ADD KEY `QuestionStatusID` (`QuestionStatusID`),
  ADD KEY `QuestionDifficultyID` (`QuestionDifficultyID`);

--
-- Indexes for table `questionstatus`
--
ALTER TABLE `questionstatus`
  ADD PRIMARY KEY (`QuestionStatusID`);

--
-- Indexes for table `questiontagconnector`
--
ALTER TABLE `questiontagconnector`
  ADD PRIMARY KEY (`QuestionTagID`,`QuestionID`),
  ADD KEY `QuestionID` (`QuestionID`);

--
-- Indexes for table `questiontags`
--
ALTER TABLE `questiontags`
  ADD PRIMARY KEY (`QuestionTagID`);

--
-- Indexes for table `questiontypes`
--
ALTER TABLE `questiontypes`
  ADD PRIMARY KEY (`QuestionTypeID`);

--
-- Indexes for table `quizanswers`
--
ALTER TABLE `quizanswers`
  ADD PRIMARY KEY (`QuizAnswerID`),
  ADD KEY `QuizQuestionID` (`QuizQuestionID`);

--
-- Indexes for table `quizes`
--
ALTER TABLE `quizes`
  ADD PRIMARY KEY (`QuizID`),
  ADD KEY `OwningUserID` (`OwningUserID`),
  ADD KEY `QuizTakerID` (`QuizTakerID`);

--
-- Indexes for table `quizlessonconnector`
--
ALTER TABLE `quizlessonconnector`
  ADD PRIMARY KEY (`QuizID`,`LessonID`,`ParticipatingUserID`),
  ADD KEY `LessonID` (`LessonID`),
  ADD KEY `ParticipatingUserID` (`ParticipatingUserID`);

--
-- Indexes for table `quizquestions`
--
ALTER TABLE `quizquestions`
  ADD PRIMARY KEY (`QuizQuestionID`),
  ADD KEY `QuestionID` (`QuestionID`),
  ADD KEY `QuizID` (`QuizID`),
  ADD KEY `QuestionTypeID` (`QuestionTypeID`),
  ADD KEY `QuestionDifficultyID` (`QuestionDifficultyID`),
  ADD KEY `FK_CorrectAnswerID` (`CorrectAnswerID`),
  ADD KEY `FK_ChosenAnswerID` (`ChosenAnswerID`);

--
-- Indexes for table `quiztemplate`
--
ALTER TABLE `quiztemplate`
  ADD PRIMARY KEY (`QuizTemplateID`),
  ADD KEY `OwningUserID` (`OwningUserID`);

--
-- Indexes for table `quiztemplatedifficultyconnector`
--
ALTER TABLE `quiztemplatedifficultyconnector`
  ADD PRIMARY KEY (`ConnectorID`),
  ADD KEY `QuizTemplateID` (`QuizTemplateID`),
  ADD KEY `QuestionDifficultyID` (`QuestionDifficultyID`);

--
-- Indexes for table `quiztemplatetagsconnector`
--
ALTER TABLE `quiztemplatetagsconnector`
  ADD PRIMARY KEY (`ConnectorID`),
  ADD KEY `QuizTemplateID` (`QuizTemplateID`),
  ADD KEY `QuestionTagID` (`QuestionTagID`);

--
-- Indexes for table `quiztemplatetypeconnector`
--
ALTER TABLE `quiztemplatetypeconnector`
  ADD PRIMARY KEY (`ConnectorID`),
  ADD KEY `QuizTemplateID` (`QuizTemplateID`),
  ADD KEY `QuestionTypeID` (`QuestionTypeID`);

--
-- Indexes for table `userbasetypes`
--
ALTER TABLE `userbasetypes`
  ADD PRIMARY KEY (`UserBaseTypeID`);

--
-- Indexes for table `userlessonstatus`
--
ALTER TABLE `userlessonstatus`
  ADD PRIMARY KEY (`LessonID`,`ParticipatingUserID`),
  ADD KEY `ParticipatingUserID` (`ParticipatingUserID`);

--
-- Indexes for table `usermoduleaccesslevels`
--
ALTER TABLE `usermoduleaccesslevels`
  ADD PRIMARY KEY (`AccessLevelID`);

--
-- Indexes for table `usermoduleaccesslookup`
--
ALTER TABLE `usermoduleaccesslookup`
  ADD PRIMARY KEY (`UserID`,`ModuleID`),
  ADD KEY `ModuleID` (`ModuleID`),
  ADD KEY `AccessLevelID` (`AccessLevelID`);

--
-- Indexes for table `userrelations`
--
ALTER TABLE `userrelations`
  ADD PRIMARY KEY (`UserFrom`,`UserTo`),
  ADD KEY `UserTo` (`UserTo`),
  ADD KEY `RelationTypeID` (`RelationTypeID`);

--
-- Indexes for table `userrelationtypes`
--
ALTER TABLE `userrelationtypes`
  ADD PRIMARY KEY (`RelationTypeID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `UserTypeID` (`UserTypeID`);

--
-- Indexes for table `usertypes`
--
ALTER TABLE `usertypes`
  ADD PRIMARY KEY (`UserTypeID`),
  ADD KEY `UserBaseTypeID` (`UserBaseTypeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `AnswerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3937;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `ClassID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lessonplans`
--
ALTER TABLE `lessonplans`
  MODIFY `LessonPlanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `LessonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `ModuleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `questiondifficulty`
--
ALTER TABLE `questiondifficulty`
  MODIFY `QuestionDifficultyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `QuestionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=990;

--
-- AUTO_INCREMENT for table `questionstatus`
--
ALTER TABLE `questionstatus`
  MODIFY `QuestionStatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questiontags`
--
ALTER TABLE `questiontags`
  MODIFY `QuestionTagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `questiontypes`
--
ALTER TABLE `questiontypes`
  MODIFY `QuestionTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quizanswers`
--
ALTER TABLE `quizanswers`
  MODIFY `QuizAnswerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `quizes`
--
ALTER TABLE `quizes`
  MODIFY `QuizID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quizquestions`
--
ALTER TABLE `quizquestions`
  MODIFY `QuizQuestionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quiztemplate`
--
ALTER TABLE `quiztemplate`
  MODIFY `QuizTemplateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `quiztemplatedifficultyconnector`
--
ALTER TABLE `quiztemplatedifficultyconnector`
  MODIFY `ConnectorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `quiztemplatetagsconnector`
--
ALTER TABLE `quiztemplatetagsconnector`
  MODIFY `ConnectorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `quiztemplatetypeconnector`
--
ALTER TABLE `quiztemplatetypeconnector`
  MODIFY `ConnectorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `userbasetypes`
--
ALTER TABLE `userbasetypes`
  MODIFY `UserBaseTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usermoduleaccesslevels`
--
ALTER TABLE `usermoduleaccesslevels`
  MODIFY `AccessLevelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `userrelationtypes`
--
ALTER TABLE `userrelationtypes`
  MODIFY `RelationTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usertypes`
--
ALTER TABLE `usertypes`
  MODIFY `UserTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `fk_classes_owninguserid` FOREIGN KEY (`OwningUserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `classmodules`
--
ALTER TABLE `classmodules`
  ADD CONSTRAINT `classmodules_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`),
  ADD CONSTRAINT `classmodules_ibfk_2` FOREIGN KEY (`ModuleID`) REFERENCES `modules` (`ModuleID`);

--
-- Constraints for table `classparticipants`
--
ALTER TABLE `classparticipants`
  ADD CONSTRAINT `classparticipants_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`),
  ADD CONSTRAINT `classparticipants_ibfk_2` FOREIGN KEY (`ParticipantID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `lessonplans`
--
ALTER TABLE `lessonplans`
  ADD CONSTRAINT `lessonplans_ibfk_1` FOREIGN KEY (`ModuleID`) REFERENCES `modules` (`ModuleID`);

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`LessonPlanID`) REFERENCES `lessonplans` (`LessonPlanID`),
  ADD CONSTRAINT `lessons_ibfk_2` FOREIGN KEY (`QuizTemplateID`) REFERENCES `quiztemplate` (`QuizTemplateID`);

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`OwningUserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`OwningUserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`CorrectAnswerID`) REFERENCES `answers` (`AnswerID`),
  ADD CONSTRAINT `questions_ibfk_3` FOREIGN KEY (`QuestionTypeID`) REFERENCES `questiontypes` (`QuestionTypeID`),
  ADD CONSTRAINT `questions_ibfk_4` FOREIGN KEY (`QuestionStatusID`) REFERENCES `questionstatus` (`QuestionStatusID`),
  ADD CONSTRAINT `questions_ibfk_5` FOREIGN KEY (`QuestionDifficultyID`) REFERENCES `questiondifficulty` (`QuestionDifficultyID`);

--
-- Constraints for table `questiontagconnector`
--
ALTER TABLE `questiontagconnector`
  ADD CONSTRAINT `questiontagconnector_ibfk_1` FOREIGN KEY (`QuestionTagID`) REFERENCES `questiontags` (`QuestionTagID`),
  ADD CONSTRAINT `questiontagconnector_ibfk_2` FOREIGN KEY (`QuestionID`) REFERENCES `questions` (`QuestionID`);

--
-- Constraints for table `quizanswers`
--
ALTER TABLE `quizanswers`
  ADD CONSTRAINT `quizanswers_ibfk_1` FOREIGN KEY (`QuizQuestionID`) REFERENCES `quizquestions` (`QuizQuestionID`);

--
-- Constraints for table `quizes`
--
ALTER TABLE `quizes`
  ADD CONSTRAINT `quizes_ibfk_1` FOREIGN KEY (`OwningUserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `quizes_ibfk_2` FOREIGN KEY (`QuizTakerID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `quizlessonconnector`
--
ALTER TABLE `quizlessonconnector`
  ADD CONSTRAINT `quizlessonconnector_ibfk_1` FOREIGN KEY (`QuizID`) REFERENCES `quizes` (`QuizID`),
  ADD CONSTRAINT `quizlessonconnector_ibfk_2` FOREIGN KEY (`LessonID`) REFERENCES `lessons` (`LessonID`),
  ADD CONSTRAINT `quizlessonconnector_ibfk_3` FOREIGN KEY (`ParticipatingUserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `quizquestions`
--
ALTER TABLE `quizquestions`
  ADD CONSTRAINT `FK_ChosenAnswerID` FOREIGN KEY (`ChosenAnswerID`) REFERENCES `quizanswers` (`QuizAnswerID`),
  ADD CONSTRAINT `FK_CorrectAnswerID` FOREIGN KEY (`CorrectAnswerID`) REFERENCES `quizanswers` (`QuizAnswerID`),
  ADD CONSTRAINT `quizquestions_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `questions` (`QuestionID`),
  ADD CONSTRAINT `quizquestions_ibfk_2` FOREIGN KEY (`QuizID`) REFERENCES `quizes` (`QuizID`),
  ADD CONSTRAINT `quizquestions_ibfk_3` FOREIGN KEY (`QuestionTypeID`) REFERENCES `questiontypes` (`QuestionTypeID`),
  ADD CONSTRAINT `quizquestions_ibfk_4` FOREIGN KEY (`QuestionDifficultyID`) REFERENCES `questiondifficulty` (`QuestionDifficultyID`);

--
-- Constraints for table `quiztemplate`
--
ALTER TABLE `quiztemplate`
  ADD CONSTRAINT `quiztemplate_ibfk_1` FOREIGN KEY (`OwningUserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `quiztemplatedifficultyconnector`
--
ALTER TABLE `quiztemplatedifficultyconnector`
  ADD CONSTRAINT `quiztemplatedifficultyconnector_ibfk_1` FOREIGN KEY (`QuizTemplateID`) REFERENCES `quiztemplate` (`QuizTemplateID`),
  ADD CONSTRAINT `quiztemplatedifficultyconnector_ibfk_2` FOREIGN KEY (`QuestionDifficultyID`) REFERENCES `questiondifficulty` (`QuestionDifficultyID`);

--
-- Constraints for table `quiztemplatetagsconnector`
--
ALTER TABLE `quiztemplatetagsconnector`
  ADD CONSTRAINT `quiztemplatetagsconnector_ibfk_1` FOREIGN KEY (`QuizTemplateID`) REFERENCES `quiztemplate` (`QuizTemplateID`),
  ADD CONSTRAINT `quiztemplatetagsconnector_ibfk_2` FOREIGN KEY (`QuestionTagID`) REFERENCES `questiontags` (`QuestionTagID`);

--
-- Constraints for table `quiztemplatetypeconnector`
--
ALTER TABLE `quiztemplatetypeconnector`
  ADD CONSTRAINT `quiztemplatetypeconnector_ibfk_1` FOREIGN KEY (`QuizTemplateID`) REFERENCES `quiztemplate` (`QuizTemplateID`),
  ADD CONSTRAINT `quiztemplatetypeconnector_ibfk_2` FOREIGN KEY (`QuestionTypeID`) REFERENCES `questiontypes` (`QuestionTypeID`);

--
-- Constraints for table `userlessonstatus`
--
ALTER TABLE `userlessonstatus`
  ADD CONSTRAINT `userlessonstatus_ibfk_1` FOREIGN KEY (`LessonID`) REFERENCES `lessons` (`LessonID`),
  ADD CONSTRAINT `userlessonstatus_ibfk_2` FOREIGN KEY (`ParticipatingUserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `usermoduleaccesslookup`
--
ALTER TABLE `usermoduleaccesslookup`
  ADD CONSTRAINT `usermoduleaccesslookup_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `usermoduleaccesslookup_ibfk_2` FOREIGN KEY (`ModuleID`) REFERENCES `modules` (`ModuleID`),
  ADD CONSTRAINT `usermoduleaccesslookup_ibfk_3` FOREIGN KEY (`AccessLevelID`) REFERENCES `usermoduleaccesslevels` (`AccessLevelID`);

--
-- Constraints for table `userrelations`
--
ALTER TABLE `userrelations`
  ADD CONSTRAINT `userrelations_ibfk_1` FOREIGN KEY (`UserFrom`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `userrelations_ibfk_2` FOREIGN KEY (`UserTo`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `userrelations_ibfk_3` FOREIGN KEY (`RelationTypeID`) REFERENCES `userrelationtypes` (`RelationTypeID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`UserTypeID`) REFERENCES `usertypes` (`UserTypeID`);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `workout_tracker`
--
CREATE DATABASE IF NOT EXISTS `workout_tracker` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `workout_tracker`;

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `exercise_id` int(11) NOT NULL,
  `exercise_name` varchar(100) NOT NULL,
  `exercise_description` text DEFAULT NULL,
  `muscle_group` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`exercise_id`, `exercise_name`, `exercise_description`, `muscle_group`) VALUES
(1, 'Bench Press', 'A classic chest exercise focusing on pectorals.', 'Chest'),
(2, 'Squat', 'A fundamental lower-body exercise targeting quads, hamstrings, and glutes.', 'Legs'),
(3, 'Deadlift', 'A compound lift that works the back, legs, and core.', 'Full Body'),
(4, 'Pull-Up', 'An upper-body pulling exercise focusing on the lats and biceps.', 'Back'),
(5, 'Push-Up', 'A classic bodyweight exercise targeting chest, shoulders, and triceps.', 'Chest'),
(6, 'Shoulder Press', 'An overhead pressing movement for shoulder development.', 'Shoulders'),
(7, 'Bicep Curl', 'An isolation exercise targeting the biceps.', 'Arms'),
(8, 'Tricep Dip', 'A bodyweight exercise focusing on the triceps.', 'Arms'),
(9, 'Lunges', 'A lower-body exercise for the quads, hamstrings, and glutes.', 'Legs'),
(10, 'Plank', 'A core stabilization exercise engaging the abs and back.', 'Core'),
(11, 'Bench Press', 'A classic chest exercise focusing on pectorals.', 'Chest'),
(12, 'Lat Pulldown', 'A machine exercise for the lats and upper back.', 'Back'),
(13, 'Leg Press', 'A machine-based lower-body exercise for the quads and glutes.', 'Legs'),
(14, 'Chest Fly', 'An isolation exercise for the chest using dumbbells or cables.', 'Chest'),
(15, 'Seated Row', 'A machine exercise for the back and biceps.', 'Back'),
(16, 'Calf Raise', 'An isolation exercise for the calves.', 'Legs'),
(17, 'Russian Twist', 'A core rotation exercise targeting obliques.', 'Core'),
(18, 'Arnold Press', 'A variation of the shoulder press for deltoid engagement.', 'Shoulders'),
(19, 'Cable Tricep Pushdown', 'An isolation exercise for tricep development.', 'Arms'),
(20, 'Hammer Curl', 'A variation of the bicep curl emphasizing the brachialis.', 'Arms'),
(21, 'Hanging Leg Raise', 'A core exercise targeting the lower abs.', 'Core'),
(22, 'Dumbbell Snatch', 'A full-body power exercise focusing on explosive movement.', 'Full Body'),
(23, 'Glute Bridge', 'An exercise for targeting the glutes and hamstrings.', 'Legs'),
(24, 'Incline Bench Press', 'A bench press variation targeting the upper chest.', 'Chest'),
(25, 'Face Pull', 'A cable exercise for the rear deltoids and upper back.', 'Shoulders'),
(26, 'Superman Hold', 'A bodyweight exercise to strengthen the lower back and core.', 'Back'),
(27, 'Step-Ups', 'A lower-body exercise using a platform to build leg strength.', 'Legs'),
(28, 'Side Plank', 'A core stabilization exercise focusing on the obliques.', 'Core'),
(29, 'Skull Crusher', 'A tricep isolation exercise using a barbell or dumbbells.', 'Arms'),
(30, 'Farmer\'s Walk', 'A full-body exercise improving grip, core, and overall strength.', 'Full Body'),
(31, 'Leg Extension', 'A machine-based isolation exercise for the quadriceps.', 'Legs'),
(32, 'Burpees', 'A full-body conditioning exercise combining a squat, jump, and push-up.', 'Full Body'),
(33, 'Mountain Climbers', 'A bodyweight cardio exercise that targets core and legs.', 'Core'),
(34, 'Sumo Deadlift', 'A deadlift variation targeting glutes, hamstrings, and inner thighs.', 'Legs'),
(35, 'Kettlebell Swing', 'A dynamic exercise targeting the posterior chain and core.', 'Full Body'),
(36, 'Box Jump', 'A plyometric exercise for building explosive leg power.', 'Legs'),
(37, 'Renegade Rows', 'A combination of a plank and dumbbell row for back and core strength.', 'Back'),
(38, 'Good Morning', 'A hip-hinge exercise strengthening the lower back and hamstrings.', 'Back'),
(39, 'Single-Leg Deadlift', 'A unilateral exercise for balance and posterior chain development.', 'Legs'),
(40, 'Side Lateral Raise', 'An isolation exercise for shoulder lateral deltoid development.', 'Shoulders'),
(41, 'Hollow Body Hold', 'A core stabilization exercise for abs and lower back engagement.', 'Core'),
(42, 'Reverse Lunge', 'A lower-body exercise focusing on quads, hamstrings, and glutes with less knee strain.', 'Legs'),
(43, 'Bent-Over Row', 'A compound back exercise targeting the lats, traps, and rhomboids.', 'Back'),
(44, 'Wall Sit', 'A static lower-body exercise strengthening quads and glutes.', 'Legs'),
(45, 'Dumbbell Fly', 'An isolation exercise for chest muscles using dumbbells.', 'Chest'),
(46, 'T-Bar Row', 'A back-focused exercise for mid-back and lats.', 'Back'),
(47, 'Hip Thrust', 'A glute-focused exercise for developing strength and power.', 'Legs'),
(48, 'Close-Grip Bench Press', 'A bench press variation targeting the triceps.', 'Arms'),
(49, 'Overhead Squat', 'A challenging squat variation requiring mobility and full-body strength.', 'Full Body'),
(50, 'Flutter Kicks', 'A core exercise focusing on the lower abs and hip flexors.', 'Core'),
(51, 'Battle Ropes', 'A conditioning exercise for full-body endurance and strength.', 'Full Body');

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `progress_id` int(11) NOT NULL,
  `user_exercise_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `sets` int(11) DEFAULT NULL,
  `reps` int(11) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progress`
--

INSERT INTO `progress` (`progress_id`, `user_exercise_id`, `date`, `sets`, `reps`, `weight`, `notes`) VALUES
(1, 1, '2024-11-24', 4, 10, 62.50, 'Increased weight by 2.5kg compared to last session.'),
(2, 1, '2024-11-24', 4, 11, 60.00, '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `usertype_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `date_of_birth`, `height`, `weight`, `email`, `password`, `creation_date`, `usertype_id`) VALUES
(1, 'John', 'Doe', '1990-05-15', 180.34, 75.50, 'john.doe@example.com', 'securepassword123', '2024-11-25 02:15:41', 1),
(2, 'Bryan', 'Gonzalez', '0000-00-00', NULL, NULL, 'bryan@gmail.com', '$2y$10$fEqybU4E1D920N29e.m5RulEDg56dBZFcq2/bWpN6cJjIlMsXVFuC', '2024-12-09 22:09:16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_exercises`
--

CREATE TABLE `users_exercises` (
  `user_exercise_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `exercise_id` int(11) DEFAULT NULL,
  `sets` int(11) DEFAULT NULL,
  `reps` int(11) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_exercises`
--

INSERT INTO `users_exercises` (`user_exercise_id`, `user_id`, `exercise_id`, `sets`, `reps`, `weight`, `created_date`) VALUES
(1, 1, 1, 4, 11, 60.00, '2024-11-25 02:15:41');

-- --------------------------------------------------------

--
-- Table structure for table `user_usertypes`
--

CREATE TABLE `user_usertypes` (
  `usertype_id` int(11) NOT NULL,
  `usertype_description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_usertypes`
--

INSERT INTO `user_usertypes` (`usertype_id`, `usertype_description`) VALUES
(1, 'Trainee'),
(2, 'Coach'),
(3, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `workouts`
--

CREATE TABLE `workouts` (
  `workout_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `workout_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `duration` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workout_exercises`
--

CREATE TABLE `workout_exercises` (
  `workout_exercise_id` int(11) NOT NULL,
  `workout_id` int(11) DEFAULT NULL,
  `user_exercise_id` int(11) DEFAULT NULL,
  `exercise_order` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`exercise_id`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`progress_id`),
  ADD KEY `idx_user_exercise_id` (`user_exercise_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_ibfk_2` (`usertype_id`);

--
-- Indexes for table `users_exercises`
--
ALTER TABLE `users_exercises`
  ADD PRIMARY KEY (`user_exercise_id`),
  ADD KEY `exercise_id` (`exercise_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `user_usertypes`
--
ALTER TABLE `user_usertypes`
  ADD PRIMARY KEY (`usertype_id`);

--
-- Indexes for table `workouts`
--
ALTER TABLE `workouts`
  ADD PRIMARY KEY (`workout_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `workout_exercises`
--
ALTER TABLE `workout_exercises`
  ADD PRIMARY KEY (`workout_exercise_id`),
  ADD KEY `user_exercise_id` (`user_exercise_id`),
  ADD KEY `idx_workout_id` (`workout_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `exercise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
  MODIFY `progress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_exercises`
--
ALTER TABLE `users_exercises`
  MODIFY `user_exercise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_usertypes`
--
ALTER TABLE `user_usertypes`
  MODIFY `usertype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `workouts`
--
ALTER TABLE `workouts`
  MODIFY `workout_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workout_exercises`
--
ALTER TABLE `workout_exercises`
  MODIFY `workout_exercise_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`user_exercise_id`) REFERENCES `users_exercises` (`user_exercise_id`) ON DELETE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`usertype_id`) REFERENCES `user_usertypes` (`usertype_id`) ON DELETE SET NULL;

--
-- Constraints for table `users_exercises`
--
ALTER TABLE `users_exercises`
  ADD CONSTRAINT `users_exercises_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_exercises_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`exercise_id`) ON DELETE CASCADE;

--
-- Constraints for table `workouts`
--
ALTER TABLE `workouts`
  ADD CONSTRAINT `workouts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `workout_exercises`
--
ALTER TABLE `workout_exercises`
  ADD CONSTRAINT `workout_exercises_ibfk_1` FOREIGN KEY (`workout_id`) REFERENCES `workouts` (`workout_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `workout_exercises_ibfk_2` FOREIGN KEY (`user_exercise_id`) REFERENCES `users_exercises` (`user_exercise_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
