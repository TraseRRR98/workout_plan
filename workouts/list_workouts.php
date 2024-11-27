<?php
require_once '../lib/accessors.php';
require_once '../lib/db_connect.php';
require_once '../lib/css.php'; // Include Bootstrap CSS

if (!is_set_with_error('user_id'))
    die("Error: user_id is required.");

// $user_id = get_safe('user_id');
$user_id = 1;

$query = "
SELECT 
    workout_id, 
    workout_date, 
    duration, 
    notes 
FROM workouts
WHERE user_id = '$user_id'
ORDER BY workout_date DESC";

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
        <?php if ($result->num_rows > 0): ?>
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>#</th>
                        <th>Date</th>
                        <th>Duration (min)</th>
                        <th>Notes</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td><?= htmlspecialchars($row['workout_id']) ?></td>
                            <td><?= htmlspecialchars($row['workout_date']) ?></td>
                            <td><?= htmlspecialchars($row['duration']) ?></td>
                            <td><?= htmlspecialchars($row['notes']) ?></td>
                            <td>
                                <a href="../exercises/list_workout_exercises.php?workout_id=<?= htmlspecialchars($row['workout_id']) ?>" class="btn btn-primary btn-sm">View Exercises</a>
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
