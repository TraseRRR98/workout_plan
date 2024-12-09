-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2024 at 11:13 PM
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
(2, 'Bryan', 'Gonzalez', '0000-00-00', NULL, NULL, 'bryan@gmail.com', '$2y$10$3iIObkunStbO.duvXwAQheX3oAZMo8.L8JBy.VoKe2rhjhYqcMUjW', '2024-12-09 22:13:23', 1);

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
