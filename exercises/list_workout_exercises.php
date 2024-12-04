<?php
require_once '../lib/accessors.php';
require_once '../lib/db_connect.php';
include '../lib/navbar.php';
include '../lib/css.php';

if (session_status() == PHP_SESSION_NONE) 
    session_start();

// Ensure the user is logged in
if (!isset($_SESSION['user_id'])) 
    die("Error: User is not logged in.");

$user_id = $_SESSION['user_id'];

// Validate and retrieve the workout_id
if (!is_set_with_error('workout_id')) {
    die("Error: workout_id is required.");
}

$workout_id = get_safe('workout_id');

// Fetch all exercises for the selected workout
$query = "
SELECT 
    we.workout_exercise_id,
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

if (!$result) {
    die("Error retrieving workout exercises: " . $conn->error);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Workout Exercises</title>
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4 text-center">Workout Exercises</h2>
        <?php if ($result->num_rows > 0): ?>
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
                    <?php while ($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td><?= htmlspecialchars($row['exercise_name']) ?></td>
                            <td><?= htmlspecialchars($row['sets']) ?></td>
                            <td><?= htmlspecialchars($row['reps']) ?></td>
                            <td><?= htmlspecialchars($row['weight']) ?></td>
                            <td>
                                <a href="modify_exercise.php?user_exercise_id=<?= htmlspecialchars($row['workout_exercise_id']) ?>" class="btn btn-warning btn-sm">Add Progression</a>
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
