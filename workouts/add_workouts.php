<?php
require_once '../lib/accessors.php';
require_once '../lib/db_connect.php';
include '../lib/navbar.php';
include '../lib/css.php';

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['user_id'])) {
    die("Error: user_id is not set.");
}

$user_id = $_SESSION['user_id'];

$error = '';
$success = '';

// Fetch all exercises
$exercise_query = "SELECT exercise_id, exercise_name FROM exercises";
$exercise_result = $conn->query($exercise_query);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $workout_date = get_safe('workout_date');
    $duration = get_safe('duration');
    $notes = get_safe('notes');
    $selected_exercises = get_safe('exercises');

    // Validate inputs
    if (empty($workout_date) || empty($duration) || empty($selected_exercises)) {
        $error = "Workout date, duration, and at least one exercise are required.";
    } elseif (!is_numeric($duration) || $duration <= 0) {
        $error = "Duration must be a positive number.";
    } else {
        // Proceed with database operations
        $conn->begin_transaction();
        try {
            // Insert workout into the workouts table
            $query = "
                INSERT INTO workouts (user_id, workout_date, duration, notes) 
                VALUES ('$user_id', '$workout_date', '$duration', '$notes')
            ";
            if (!$conn->query($query)) {
                throw new Exception("Error adding workout: " . $conn->error);
            }

            // Get the newly inserted workout_id
            $workout_id = $conn->insert_id;

            // Insert selected exercises into users_exercises table and link them to the workout
            foreach ($selected_exercises as $exercise_id) {
                // Insert exercise into users_exercises table
                $users_exercises_query = "
                    INSERT INTO users_exercises (user_id, exercise_id, sets, reps, weight, created_date) 
                    VALUES ('$user_id', '$exercise_id', NULL, NULL, NULL, NOW())
                ";
                if (!$conn->query($users_exercises_query)) {
                    throw new Exception("Error adding exercise to user: " . $conn->error);
                }

                // Get the newly inserted user_exercise_id
                $user_exercise_id = $conn->insert_id;

                // Link exercise to the workout in workout_exercises table
                $workout_exercise_query = "
                    INSERT INTO workout_exercises (workout_id, user_exercise_id, exercise_order, created_date) 
                    VALUES ('$workout_id', '$user_exercise_id', 1, NOW())
                ";
                if (!$conn->query($workout_exercise_query)) {
                    throw new Exception("Error linking exercise to workout: " . $conn->error);
                }
            }

            $conn->commit();
            $success = "Workout and exercises added successfully!";
        } catch (Exception $e) {
            $conn->rollback();
            $error = $e->getMessage();
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Workout</title>
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center">Add Workout</h2>
        <?php if (!empty($error)): ?>
            <div class="alert alert-danger text-center">
                <?= htmlspecialchars($error) ?>
            </div>
        <?php elseif (!empty($success)): ?>
            <div class="alert alert-success text-center">
                <?= htmlspecialchars($success) ?>
            </div>
        <?php endif; ?>
        <form method="post" action="">
            <div class="mb-3">
                <label for="workout_date" class="form-label">Workout Date</label>
                <input type="date" class="form-control" id="workout_date" name="workout_date" required>
            </div>
            <div class="mb-3">
                <label for="duration" class="form-label">Duration (minutes)</label>
                <input type="number" class="form-control" id="duration" name="duration" required>
            </div>
            <div class="mb-3">
                <label for="notes" class="form-label">Workout Name</label>
                <textarea class="form-control" id="notes" name="notes" rows="3"></textarea>
            </div>
            <div class="mb-3">
                <label for="exercises" class="form-label">Select Exercises</label>
                <select class="form-control" id="exercises" name="exercises[]" multiple required>
                    <?php while ($exercise = $exercise_result->fetch_assoc()): ?>
                        <option value="<?= htmlspecialchars($exercise['exercise_id']) ?>">
                            <?= htmlspecialchars($exercise['exercise_name']) ?>
                        </option>
                    <?php endwhile; ?>
                </select>
                <small class="form-text text-muted">Hold Ctrl (Cmd on Mac) to select multiple exercises.</small>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Add Workout</button>
                <a href="list_workouts.php" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
<?php
$conn->close();
?>
