-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2024 at 03:33 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12


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
-- Database: `workout_tracker`
--

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
(1, 'Bench Press', 'A classic chest exercise focusing on pectorals.', 'Chest');

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
(1, 1, '2024-11-24', 4, 10, '62.50', 'Increased weight by 2.5kg compared to last session.'),
(2, 1, '2024-11-24', 4, 11, '60.00', '');

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
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `date_of_birth`, `height`, `weight`, `email`, `password`, `creation_date`) VALUES
(1, 'John', 'Doe', '1990-05-15', '180.34', '75.50', 'john.doe@example.com', 'securepassword123', '2024-11-25 02:15:41');

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
(1, 1, 1, 4, 11, '60.00', '2024-11-25 02:15:41');

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
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users_exercises`
--
ALTER TABLE `users_exercises`
  ADD PRIMARY KEY (`user_exercise_id`),
  ADD KEY `exercise_id` (`exercise_id`),
  ADD KEY `idx_user_id` (`user_id`);

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
  MODIFY `exercise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
  MODIFY `progress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_exercises`
--
ALTER TABLE `users_exercises`
  MODIFY `user_exercise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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

-- Add the user_usertypes table
CREATE TABLE `user_usertypes` (
  `usertype_id` int(11) NOT NULL AUTO_INCREMENT,
  `usertype_description` varchar(50) NOT NULL,
  PRIMARY KEY (`usertype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert predefined user types
INSERT INTO `user_usertypes` (`usertype_id`, `usertype_description`) VALUES
(1, 'Trainee'),
(2, 'Coach'),
(3, 'Administrator');

-- Modify the user table to add usertype_id
ALTER TABLE `user`
ADD COLUMN `usertype_id` int(11) DEFAULT NULL,
ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`usertype_id`) REFERENCES `user_usertypes` (`usertype_id`) ON DELETE SET NULL;

-- Assign default user type (Trainee) to existing users
UPDATE `user` SET `usertype_id` = 1 WHERE `usertype_id` IS NULL;

-- Adjust the AUTO_INCREMENT value for user_usertypes
ALTER TABLE `user_usertypes`
MODIFY `usertype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
