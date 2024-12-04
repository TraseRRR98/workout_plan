<?php
require_once '../lib/accessors.php';
require_once '../lib/db_connect.php';
include '../lib/navbar.php';
include '../lib/css.php';

if (session_status() == PHP_SESSION_NONE) 
    session_start();

if (!isset($_SESSION['user_id'])) 
    die("Error: user_id is not set.");

$query = "
SELECT 
    workout_id, 
    duration, 
    notes 
FROM workouts
WHERE user_id = '$user_id'
ORDER BY workout_id ASC";

$result = $conn->query($query);

if (!$result) 
    die("Error retrieving workouts: " . $conn->error);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Workouts</title>
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4 text-center">Your Workouts</h2>
        <div class="mt-4">
            <a href="../workouts/add_workouts.php" class="btn btn-primary btn-lg">Add Workout</a>
        </div>
        <?php if ($result->num_rows > 0): ?>
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Workout Name</th>
                        <th>Duration (min)</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td><?= htmlspecialchars($row['notes']) ?></td> 
                            <td><?= htmlspecialchars($row['duration']) ?></td>
                            <td>
                                <a href="../exercises/list_workout_exercises.php?workout_id=<?= htmlspecialchars($row['workout_id']) ?>" class="btn btn-success btn-sm">View Exercises</a>
                                <a href="../workouts/edit_workouts.php?workout_id=<?= htmlspecialchars($row['workout_id']) ?>" class="btn btn-primary btn-sm">Edit</a>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        <?php else: ?>
            <div class="alert alert-info text-center" role="alert">
                No workouts found for this user.
            </div>
        <?php endif; ?>
    </div>
</body>
</html>
<?php
$conn->close();
?>
