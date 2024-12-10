<?php ob_start();
require_once '../lib/accessors.php';
require_once '../lib/db_connect.php';
include '../lib/navbar.php';
include '../lib/css.php';

if (session_status() == PHP_SESSION_NONE) 
    session_start();
function get_workout_id() 
{
    if (!is_set_with_error('workout_id')) 
        die("Error: workout_id is required.");

    return get_safe('workout_id');
}

function fetch_workout_details($conn, $workout_id) 
{
    $query = "SELECT workout_id, notes, duration 
              FROM workouts 
              WHERE workout_id = '$workout_id'";
        
    $result = $conn->query($query);

    if (!$result || $result->num_rows == 0) 
        die("Error: Unable to fetch workout details.");

    return $result->fetch_assoc();
}

function fetch_exercises($conn, $workout_id) 
{
    $query = "SELECT 
                e.exercise_id, 
                e.exercise_name, 
                (SELECT COUNT(*) 
              FROM workout_exercises we 
              JOIN users_exercises ue ON we.user_exercise_id = ue.user_exercise_id 
              WHERE we.workout_id = '$workout_id' AND ue.exercise_id = e.exercise_id) AS selected 
              FROM exercises e";
        
    $result = $conn->query($query);

    if (!$result) 
        die("Error retrieving exercises: " . $conn->error);

    return $result;
}

function handle_form_submission($conn, $workout_id, $user_id) 
{
    $workout_name = get_safe('notes');
    $duration = get_safe('duration');
    $selected_exercises = isset($_POST['exercises']) ? $_POST['exercises'] : [];

    $update_query = "UPDATE workouts 
                     SET notes = '$workout_name', duration = '$duration' 
                     WHERE workout_id = '$workout_id'";
        
    if (!$conn->query($update_query)) 
        die("Error updating workout: " . $conn->error);
    
    $conn->begin_transaction();
    try 
    {
        $delete_query = "DELETE we FROM workout_exercises we
                         JOIN users_exercises ue ON we.user_exercise_id = ue.user_exercise_id
                         WHERE we.workout_id = '$workout_id'";
            
        $conn->query($delete_query);

        foreach ($selected_exercises as $exercise_id) 
        {
            $user_exercise_query = "SELECT user_exercise_id 
                                    FROM users_exercises 
                                    WHERE exercise_id = '$exercise_id' AND user_id = '$user_id'";
                
            $user_exercise_result = $conn->query($user_exercise_query);

            if ($user_exercise_result->num_rows > 0) 
            {
                $user_exercise = $user_exercise_result->fetch_assoc();
                $user_exercise_id = $user_exercise['user_exercise_id'];
            } else 
            {
                $insert_user_exercise_query = "INSERT INTO users_exercises (user_id, exercise_id, sets, reps, weight, created_date)
                                               VALUES ('$user_id', '$exercise_id', NULL, NULL, NULL, NOW())";
                    
                $conn->query($insert_user_exercise_query);
                $user_exercise_id = $conn->insert_id;
            }

            $insert_workout_exercise_query = "INSERT INTO workout_exercises (workout_id, user_exercise_id, exercise_order, created_date)
                                              VALUES ('$workout_id', '$user_exercise_id', 1, NOW())";
                
            $conn->query($insert_workout_exercise_query);
        }

        $conn->commit();
        header("Location: ../workouts/list_workouts.php");
        exit;
    } catch (Exception $e) 
    {
        $conn->rollback();
        die("Error updating workout exercises: " . $e->getMessage());
    }
}

$user_id = $_SESSION['user_id'] ?? die("Error: User is not logged in.");
$workout_id = get_workout_id();

$workout = fetch_workout_details($conn, $workout_id);
$exercises_result = fetch_exercises($conn, $workout_id);

if ($_SERVER['REQUEST_METHOD'] === 'POST') 
    handle_form_submission($conn, $workout_id, $user_id);
    ob_end_flush();
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
