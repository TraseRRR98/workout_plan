<?php
require_once '../lib/accessors.php';
require_once '../lib/db_connect.php';
include '../lib/navbar.php';
include '../lib/css.php';

function get_logged_in_user_id() 
{
    if (session_status() == PHP_SESSION_NONE) 
        session_start();

    if (!isset($_SESSION['user_id'])) 
        die("Error: user_id is not set.");

    return $_SESSION['user_id'];
}

function fetch_exercises($conn) 
{
    $query = "SELECT exercise_id, exercise_name FROM exercises";
    $result = $conn->query($query);

    if (!$result) 
        die("Error fetching exercises: " . $conn->error);
    return $result;
}

function process_workout_submission($conn, $user_id) 
{
    $error = '';
    $success = '';

    if ($_SERVER['REQUEST_METHOD'] === 'POST') 
    {
        $workout_date = get_safe('workout_date');
        $duration = get_safe('duration');
        $notes = get_safe('notes');
        $selected_exercises = isset($_POST['exercises']) ? $_POST['exercises'] : [];

        if (empty($workout_date) || empty($duration) || empty($selected_exercises))
            $error = "Workout date, duration, and at least one exercise are required.";
        elseif (!is_numeric($duration) || $duration <= 0) 
            $error = "Duration must be a positive number.";
        else 
        {
            $conn->begin_transaction();
            try 
            {
                // Insert workout into the workouts table
                $insert_workout = "INSERT INTO workouts (user_id, workout_date, duration, notes) 
                                   VALUES ('$user_id', '$workout_date', '$duration', '$notes')";
                    
                if (!$conn->query($insert_workout)) 
                    throw new Exception("Error adding workout: " . $conn->error);

                $workout_id = $conn->insert_id;

                // Insert exercises and link them to the workout
                foreach ($selected_exercises as $exercise_id) 
                {
                    $insert_users_exercises = "INSERT INTO users_exercises (user_id, exercise_id, sets, reps, weight, created_date) 
                                               VALUES ('$user_id', '$exercise_id', NULL, NULL, NULL, NOW())";
                        
                    if (!$conn->query($insert_users_exercises)) 
                        throw new Exception("Error adding exercise to user: " . $conn->error);

                    // Get user_exercise_id and link it to the workout
                    $user_exercise_id = $conn->insert_id;
                    $insert_workout_exercise = " INSERT INTO workout_exercises (workout_id, user_exercise_id, exercise_order, created_date) 
                                                 VALUES ('$workout_id', '$user_exercise_id', 1, NOW())";

                    if (!$conn->query($insert_workout_exercise)) 
                        throw new Exception("Error linking exercise to workout: " . $conn->error);
                }

                $conn->commit();
                $success = "Workout and exercises added successfully!";
            } catch (Exception $e) 
            {
                $conn->rollback();
                $error = $e->getMessage();
            }
        }
    }
    return ['error' => $error, 'success' => $success];
}

$user_id = get_logged_in_user_id();
$exercise_result = fetch_exercises($conn);
$form_result = process_workout_submission($conn, $user_id);

$error = $form_result['error'];
$success = $form_result['success'];
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
        <form method="post" action="add_workouts.php">
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
                <label for="exerciseSearch" class="form-label">Search Exercises</label>
                <input type="text" id="exerciseSearch" class="form-control" onkeyup="filterExercises()" placeholder="Search for exercises...">
            </div>
            <div id="exerciseList" class="mb-3">
                <label class="form-label">Select Exercises</label>
                <div class="form-check">
                    <?php while ($exercise = $exercise_result->fetch_assoc()): ?>
                        <div class="exercise-item">
                            <input 
                                type="checkbox" 
                                id="exercise_<?= $exercise['exercise_id'] ?>" 
                                name="exercises[]" 
                                class="form-check-input" 
                                value="<?= $exercise['exercise_id'] ?>">
                            <label for="exercise_<?= $exercise['exercise_id'] ?>" class="form-check-label">
                                <?= htmlspecialchars($exercise['exercise_name']) ?>
                            </label>
                        </div>
                    <?php endwhile; ?>
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Add Workout</button>
                <a href="list_workouts.php" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
<script>
    // Live search filter function
    function filterExercises() 
    {
        const searchInput = document.getElementById('exerciseSearch').value.toLowerCase();
        const exerciseList = document.getElementById('exerciseList');
        const exercises = exerciseList.getElementsByClassName('exercise-item');

        for (let exercise of exercises) 
        {
            const exerciseName = exercise.getElementsByTagName('label')[0].innerText.toLowerCase();
            exercise.style.display = exerciseName.includes(searchInput) ? '' : 'none';
        }
    }
</script>
<?php
$conn->close();
?>
