<?php
require_once '../lib/accessors.php';
require_once '../lib/db_connect.php';
include '../lib/navbar.php';
include '../lib/css.php';

// Start session and verify user login
function start_session_and_validate_user() 
{
    if (session_status() == PHP_SESSION_NONE) 
        session_start();

    if (!isset($_SESSION['user_id'])) 
        die("Error: User is not logged in.");

    return $_SESSION['user_id'];
}

// Retrieve workout name (notes) for the given workout_id and user_id
function get_workout_name($conn, $workout_id, $user_id) 
{
    $query = " SELECT notes 
               FROM workouts 
               WHERE workout_id = '$workout_id' AND user_id = '$user_id'";
    
    $result = $conn->query($query);
    if (!$result || $result->num_rows == 0) 
        die("Error: Workout not found or you are not authorized to view it.");

    $row = $result->fetch_assoc();
    return $row['notes'];
}

// Fetch exercises associated with the selected workout
function get_workout_exercises($conn, $workout_id) 
{
    $query = "SELECT 
                we.workout_exercise_id,
                ue.user_exercise_id,
                e.exercise_name,
                ue.sets,
                ue.reps,
                ue.weight 
              FROM workout_exercises we
              JOIN users_exercises ue ON we.user_exercise_id = ue.user_exercise_id
              JOIN exercises e ON ue.exercise_id = e.exercise_id
              WHERE we.workout_id = '$workout_id'
              ORDER BY we.exercise_order ASC";
    
    $result = $conn->query($query);
    if (!$result) 
        die("Error retrieving workout exercises: " . $conn->error);

    return $result;
}

$user_id = start_session_and_validate_user();

if (!is_set_with_error('workout_id')) 
    die("Error: workout_id is required.");

$workout_id = get_safe('workout_id');
$workout_name = get_workout_name($conn, $workout_id, $user_id);
$exercises = get_workout_exercises($conn, $workout_id);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($workout_name) ?> - Workout Exercises</title>
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4 text-center"><?= htmlspecialchars($workout_name) ?></h1>
        <?php if ($exercises->num_rows > 0): ?>
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Exercise</th>
                        <th>Sets</th>
                        <th>Reps</th>
                        <th>Weight (kg)</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $exercises->fetch_assoc()): ?>
                        <tr>
                            <td><?= htmlspecialchars($row['exercise_name']) ?></td>
                            <td><?= htmlspecialchars($row['sets']) ?></td>
                            <td><?= htmlspecialchars($row['reps']) ?></td>
                            <td><?= htmlspecialchars($row['weight']) ?></td>
                            <td>
                                <a href="modify_exercise.php?user_exercise_id=<?= htmlspecialchars($row['user_exercise_id']) ?>" 
                                class="btn btn-primary btn-sm">Add Progression</a>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        <?php else: ?>
            <div class="alert alert-info text-center" role="alert">
                No exercises found for this workout.
            </div>
        <?php endif; ?>
        <div class="text-center mt-4">
            <a href="../workouts/list_workouts.php" class="btn btn-secondary">Back to Workouts</a>
        </div>
    </div>
</body>
</html>
<?php
$conn->close();
?>
