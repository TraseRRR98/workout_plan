<?php
require_once '../lib/accessors.php';
require_once '../lib/db_connect.php';
include '../lib/navbar.php';
include '../lib/css.php';

if (session_status() == PHP_SESSION_NONE) 
    session_start();

if (!isset($_GET['workout_id'])) 
    die("Error: workout_id is required.");

$workout_id = get_safe('workout_id');

// Fetch the workout details
$query = "
SELECT 
    workout_id, 
    notes, 
    duration 
FROM workouts 
WHERE workout_id = '$workout_id'";

$result = $conn->query($query);

if (!$result || $result->num_rows == 0) 
    die("Error: Unable to fetch workout details.");

$workout = $result->fetch_assoc();

// Fetch all exercises
$exercises_query = "
SELECT 
    e.exercise_id, 
    e.exercise_name, 
    (SELECT COUNT(*) FROM workout_exercises we 
     JOIN users_exercises ue ON we.user_exercise_id = ue.user_exercise_id 
     WHERE we.workout_id = '$workout_id' AND ue.exercise_id = e.exercise_id) AS selected 
FROM exercises e";

$exercises_result = $conn->query($exercises_query);

if (!$exercises_result)
    die("Error retrieving exercises: " . $conn->error);

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $workout_name = get_safe('notes');
    $duration = get_safe('duration');
    $selected_exercises = isset($_POST['exercises']) ? $_POST['exercises'] : [];

    // Update workout details
    $update_query = "
        UPDATE workouts 
        SET notes = '$workout_name', duration = '$duration' 
        WHERE workout_id = '$workout_id'";

    if (!$conn->query($update_query)) 
        die("Error updating workout: " . $conn->error);

    // Update workout exercises
    $conn->begin_transaction();
    try {
        // Delete existing exercises for this workout
        $delete_query = "
            DELETE we FROM workout_exercises we
            JOIN users_exercises ue ON we.user_exercise_id = ue.user_exercise_id
            WHERE we.workout_id = '$workout_id'";
        $conn->query($delete_query);

        // Insert selected exercises
        foreach ($selected_exercises as $exercise_id) {
            // Check if the exercise already exists for the user
            $user_exercise_query = "
                SELECT user_exercise_id 
                FROM users_exercises 
                WHERE exercise_id = '$exercise_id' AND user_id = '{$_SESSION['user_id']}'";
            $user_exercise_result = $conn->query($user_exercise_query);

            if ($user_exercise_result->num_rows > 0) {
                $user_exercise = $user_exercise_result->fetch_assoc();
                $user_exercise_id = $user_exercise['user_exercise_id'];
            } else {
                // Add exercise to the user's list
                $insert_user_exercise_query = "
                    INSERT INTO users_exercises (user_id, exercise_id, sets, reps, weight, created_date)
                    VALUES ('{$_SESSION['user_id']}', '$
                    exercise_id', NULL, NULL, NULL, NOW())";
                $conn->query($insert_user_exercise_query);
                $user_exercise_id = $conn->insert_id;
            }

            // Link exercise to the workout
            $insert_workout_exercise_query = "
                INSERT INTO workout_exercises (workout_id, user_exercise_id, exercise_order, created_date)
                VALUES ('$workout_id', '$user_exercise_id', 1, NOW())";
            $conn->query($insert_workout_exercise_query);
        }

        $conn->commit();
        header("Location: list_workouts.php");
        exit;
    } catch (Exception $e) {
        $conn->rollback();
        die("Error updating workout exercises: " . $e->getMessage());
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Workout</title>
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4 text-center">Edit Workout</h2>
        <form method="POST" action="edit_workouts.php?workout_id=<?= htmlspecialchars($workout_id) ?>">
            <div class="mb-3">
                <label for="notes" class="form-label">Workout Name</label>
                <input type="text" id="notes" name="notes" class="form-control" value="<?= htmlspecialchars($workout['notes']) ?>" required>
            </div>
            <div class="mb-3">
                <label for="duration" class="form-label">Duration (minutes)</label>
                <input type="number" id="duration" name="duration" class="form-control" value="<?= htmlspecialchars($workout['duration']) ?>" required>
            </div>
            <div class="mb-3">
                <label for="exerciseSearch" class="form-label">Search Exercises</label>
                <input type="text" id="exerciseSearch" class="form-control" onkeyup="filterExercises()" placeholder="Search for exercises...">
            </div>
            <div id="exerciseList" class="mb-3">
                <label class="form-label">Select Exercises</label>
                <div class="form-check">
                    <?php while ($exercise = $exercises_result->fetch_assoc()): ?>
                        <div class="exercise-item">
                            <input 
                                type="checkbox" 
                                id="exercise_<?= $exercise['exercise_id'] ?>" 
                                name="exercises[]" 
                                class="form-check-input" 
                                value="<?= $exercise['exercise_id'] ?>" 
                                <?= $exercise['selected'] > 0 ? 'checked' : '' ?>>
                            <label for="exercise_<?= $exercise['exercise_id'] ?>" class="form-check-label">
                                <?= htmlspecialchars($exercise['exercise_name']) ?>
                            </label>
                        </div>
                    <?php endwhile; ?>
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Save Changes</button>
                <a href="list_workouts.php" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
<script>
        // Live search filter function
        function filterExercises() {
            const searchInput = document.getElementById('exerciseSearch').value.toLowerCase();
            const exerciseList = document.getElementById('exerciseList');
            const exercises = exerciseList.getElementsByClassName('exercise-item');

            for (let exercise of exercises) {
                const exerciseName = exercise.getElementsByTagName('label')[0].innerText.toLowerCase();
                if (exerciseName.includes(searchInput)) {
                    exercise.style.display = '';
                } else {
                    exercise.style.display = 'none';
                }
            }
        }
    </script>
<?php
$conn->close();
?>
