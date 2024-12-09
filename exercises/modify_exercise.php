<?php ob_start();
require_once '../lib/accessors.php';
require_once '../lib/db_connect.php';
include '../lib/css.php';
include '../lib/navbar.php';

function get_logged_in_user_id() 
{
    if (session_status() == PHP_SESSION_NONE) 
        session_start();

    if (!isset($_SESSION['user_id'])) 
        die("Error: User is not logged in.");

    return $_SESSION['user_id'];
}

function validate_user_exercise_id() 
{
    if (!is_set_with_error('user_exercise_id')) 
        die("Error: user_exercise_id is required.");

    return get_safe('user_exercise_id');
}

function get_exercise_details($conn, $user_exercise_id, $user_id) 
{
    $query = "SELECT 
                ue.user_exercise_id,
                e.exercise_name,
                ue.sets,
                ue.reps,
                ue.weight,
                ue.user_id,
                we.workout_id
              FROM users_exercises ue
              JOIN exercises e ON ue.exercise_id = e.exercise_id
              JOIN workout_exercises we ON we.user_exercise_id = ue.user_exercise_id
              WHERE ue.user_exercise_id = '$user_exercise_id' AND ue.user_id = '$user_id'";
        
    $result = $conn->query($query);

    if (!$result || $result->num_rows == 0)
        die("Error: You are not authorized to modify this exercise.");

    return $result->fetch_assoc();
}

function handle_form_submission($conn, $user_exercise_id, $user_id) 
{
    $sets = get_safe('sets');
    $reps = get_safe('reps');
    $weight = get_safe('weight');
    $notes = get_safe('notes');

    $update_query = "UPDATE users_exercises
                     SET sets = '$sets', reps = '$reps', weight = '$weight'
                     WHERE user_exercise_id = '$user_exercise_id' AND user_id = '$user_id'";
        
    if (!$conn->query($update_query))
        die("Error updating exercise: " . $conn->error);

    $insert_query = "INSERT INTO progress (user_exercise_id, date, sets, reps, weight, notes)
                     VALUES ('$user_exercise_id', CURDATE(), '$sets', '$reps', '$weight', '$notes')";
        
    if (!$conn->query($insert_query))
        die("Error recording progress: " . $conn->error);

    header("Location: ../progress/progress.php?user_id=" . $user_id);
    exit;
}

$user_id = get_logged_in_user_id();
$user_exercise_id = validate_user_exercise_id();
$exercise = get_exercise_details($conn, $user_exercise_id, $user_id);

if ($_SERVER['REQUEST_METHOD'] === 'POST') 
    handle_form_submission($conn, $user_exercise_id, $user_id);
ob_end_flush();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modify Exercise</title>
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4 text-center">Modify Exercise</h2>
        <form action="modify_exercise.php?user_exercise_id=<?= htmlspecialchars($user_exercise_id) ?>" method="POST">
            <div class="mb-3">
                <label for="exercise_name" class="form-label">Exercise</label>
                <input type="text" id="exercise_name" class="form-control" 
                    value="<?= htmlspecialchars($exercise['exercise_name']) ?>" readonly>
            </div>
            <div class="mb-3">
                <label for="sets" class="form-label">Sets</label>
                <input type="number" id="sets" name="sets" class="form-control" 
                    value="<?= htmlspecialchars($exercise['sets']) ?>" required>
            </div>
            <div class="mb-3">
                <label for="reps" class="form-label">Reps</label>
                <input type="number" id="reps" name="reps" class="form-control" 
                    value="<?= htmlspecialchars($exercise['reps']) ?>" required>
            </div>
            <div class="mb-3">
                <label for="weight" class="form-label">Weight (kg)</label>
                <input type="number" step="0.01" id="weight" name="weight" class="form-control" 
                    value="<?= htmlspecialchars($exercise['weight']) ?>" required>
            </div>
            <div class="mb-3">
                <label for="notes" class="form-label">Notes</label>
                <textarea id="notes" name="notes" class="form-control" rows="3" 
                    placeholder="Add any notes about this workout"></textarea>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Save Changes & Record Progress</button>
                <a href="../exercises/list_workout_exercises.php?workout_id=<?= htmlspecialchars($exercise['workout_id']) ?>" 
                   class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
<?php
$conn->close();
?>
