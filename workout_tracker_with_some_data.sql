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

INSERT INTO `exercises` (`exercise_name`, `exercise_description`, `muscle_group`) VALUES
('Squat', 'A fundamental lower-body exercise targeting quads, hamstrings, and glutes.', 'Legs'),
('Deadlift', 'A compound lift that works the back, legs, and core.', 'Full Body'),
('Pull-Up', 'An upper-body pulling exercise focusing on the lats and biceps.', 'Back'),
('Push-Up', 'A classic bodyweight exercise targeting chest, shoulders, and triceps.', 'Chest'),
('Shoulder Press', 'An overhead pressing movement for shoulder development.', 'Shoulders'),
('Bicep Curl', 'An isolation exercise targeting the biceps.', 'Arms'),
('Tricep Dip', 'A bodyweight exercise focusing on the triceps.', 'Arms'),
('Lunges', 'A lower-body exercise for the quads, hamstrings, and glutes.', 'Legs'),
('Plank', 'A core stabilization exercise engaging the abs and back.', 'Core'),
('Bench Press', 'A classic chest exercise focusing on pectorals.', 'Chest'),
('Lat Pulldown', 'A machine exercise for the lats and upper back.', 'Back'),
('Leg Press', 'A machine-based lower-body exercise for the quads and glutes.', 'Legs'),
('Chest Fly', 'An isolation exercise for the chest using dumbbells or cables.', 'Chest'),
('Seated Row', 'A machine exercise for the back and biceps.', 'Back'),
('Calf Raise', 'An isolation exercise for the calves.', 'Legs'),
('Russian Twist', 'A core rotation exercise targeting obliques.', 'Core'),
('Arnold Press', 'A variation of the shoulder press for deltoid engagement.', 'Shoulders'),
('Cable Tricep Pushdown', 'An isolation exercise for tricep development.', 'Arms'),
('Hammer Curl', 'A variation of the bicep curl emphasizing the brachialis.', 'Arms'),
('Hanging Leg Raise', 'A core exercise targeting the lower abs.', 'Core'),
('Dumbbell Snatch', 'A full-body power exercise focusing on explosive movement.', 'Full Body'),
('Glute Bridge', 'An exercise for targeting the glutes and hamstrings.', 'Legs'),
('Incline Bench Press', 'A bench press variation targeting the upper chest.', 'Chest'),
('Face Pull', 'A cable exercise for the rear deltoids and upper back.', 'Shoulders'),
('Superman Hold', 'A bodyweight exercise to strengthen the lower back and core.', 'Back'),
('Step-Ups', 'A lower-body exercise using a platform to build leg strength.', 'Legs'),
('Side Plank', 'A core stabilization exercise focusing on the obliques.', 'Core'),
('Skull Crusher', 'A tricep isolation exercise using a barbell or dumbbells.', 'Arms'),
('Farmer\'s Walk', 'A full-body exercise improving grip, core, and overall strength.', 'Full Body'),
('Leg Extension', 'A machine-based isolation exercise for the quadriceps.', 'Legs'),
('Burpees', 'A full-body conditioning exercise combining a squat, jump, and push-up.', 'Full Body'),
('Mountain Climbers', 'A bodyweight cardio exercise that targets core and legs.', 'Core'),
('Sumo Deadlift', 'A deadlift variation targeting glutes, hamstrings, and inner thighs.', 'Legs'),
('Kettlebell Swing', 'A dynamic exercise targeting the posterior chain and core.', 'Full Body'),
('Box Jump', 'A plyometric exercise for building explosive leg power.', 'Legs'),
('Renegade Rows', 'A combination of a plank and dumbbell row for back and core strength.', 'Back'),
('Good Morning', 'A hip-hinge exercise strengthening the lower back and hamstrings.', 'Back'),
('Single-Leg Deadlift', 'A unilateral exercise for balance and posterior chain development.', 'Legs'),
('Side Lateral Raise', 'An isolation exercise for shoulder lateral deltoid development.', 'Shoulders'),
('Hollow Body Hold', 'A core stabilization exercise for abs and lower back engagement.', 'Core'),
('Reverse Lunge', 'A lower-body exercise focusing on quads, hamstrings, and glutes with less knee strain.', 'Legs'),
('Bent-Over Row', 'A compound back exercise targeting the lats, traps, and rhomboids.', 'Back'),
('Wall Sit', 'A static lower-body exercise strengthening quads and glutes.', 'Legs'),
('Dumbbell Fly', 'An isolation exercise for chest muscles using dumbbells.', 'Chest'),
('T-Bar Row', 'A back-focused exercise for mid-back and lats.', 'Back'),
('Hip Thrust', 'A glute-focused exercise for developing strength and power.', 'Legs'),
('Close-Grip Bench Press', 'A bench press variation targeting the triceps.', 'Arms'),
('Overhead Squat', 'A challenging squat variation requiring mobility and full-body strength.', 'Full Body'),
('Flutter Kicks', 'A core exercise focusing on the lower abs and hip flexors.', 'Core'),
('Battle Ropes', 'A conditioning exercise for full-body endurance and strength.', 'Full Body');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
