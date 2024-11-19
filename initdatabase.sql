DROP DATABASE IF EXISTS workout_tracker;
CREATE DATABASE IF NOT EXISTS workout_tracker;
USE workout_tracker;

-- Creating the 'user' table
CREATE TABLE IF NOT EXISTS user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    height DECIMAL(5,2),
    weight DECIMAL(5,2),
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creating the 'exercises' table
CREATE TABLE IF NOT EXISTS exercises (
    exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    exercise_name VARCHAR(100) NOT NULL,
    exercise_description TEXT,
    muscle_group VARCHAR(50)
);

-- Creating the 'users_exercises' table to associate users with specific exercises
CREATE TABLE IF NOT EXISTS users_exercises (
    user_exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    exercise_id INT,
    sets INT,
    reps INT,
    weight DECIMAL(5,2),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (exercise_id) REFERENCES exercises(exercise_id) ON DELETE CASCADE
);

-- Creating the 'progress' table for tracking exercise performance over time
CREATE TABLE IF NOT EXISTS progress (
    progress_id INT AUTO_INCREMENT PRIMARY KEY,
    user_exercise_id INT,
    date DATE NOT NULL,
    sets INT,
    reps INT,
    weight DECIMAL(5,2),
    notes TEXT,
    FOREIGN KEY (user_exercise_id) REFERENCES users_exercises(user_exercise_id) ON DELETE CASCADE
);

-- Creating the 'workouts' table to record workout sessions
CREATE TABLE IF NOT EXISTS workouts (
    workout_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    workout_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    duration INT,  -- in minutes
    notes TEXT,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

-- Creating the 'workout_exercises' table to associate exercises with specific workouts
CREATE TABLE IF NOT EXISTS workout_exercises (
    workout_exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    workout_id INT,
    user_exercise_id INT,
    exercise_order INT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (workout_id) REFERENCES workouts(workout_id) ON DELETE CASCADE,
    FOREIGN KEY (user_exercise_id) REFERENCES users_exercises(user_exercise_id) ON DELETE CASCADE
);

-- Adding indices for performance
CREATE INDEX idx_user_id ON users_exercises(user_id);
CREATE INDEX idx_user_exercise_id ON progress(user_exercise_id);
CREATE INDEX idx_workout_id ON workout_exercises(workout_id);
