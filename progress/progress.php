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
    p.progress_id, 
    e.exercise_name, 
    p.date, 
    p.sets, 
    p.reps, 
    p.weight, 
    p.notes 
FROM progress p
JOIN users_exercises ue ON p.user_exercise_id = ue.user_exercise_id
JOIN exercises e ON ue.exercise_id = e.exercise_id
WHERE ue.user_id = '$user_id'
ORDER BY p.date DESC";

$result = $conn->query($query);

if (!$result)
    die("Error retrieving progress: " . mysqli_error($conn));
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Progress</title>
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4 text-center">Your Workout Progress</h2>
        <?php if ($result->num_rows > 0): ?>
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>#</th>
                        <th>Exercise</th>
                        <th>Date</th>
                        <th>Sets</th>
                        <th>Reps</th>
                        <th>Weight (kg)</th>
                        <th>Notes</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td><?= htmlspecialchars($row['progress_id']) ?></td>
                            <td><?= htmlspecialchars($row['exercise_name']) ?></td>
                            <td><?= htmlspecialchars($row['date']) ?></td>
                            <td><?= htmlspecialchars($row['sets']) ?></td>
                            <td><?= htmlspecialchars($row['reps']) ?></td>
                            <td><?= htmlspecialchars($row['weight']) ?></td>
                            <td><?= htmlspecialchars($row['notes']) ?></td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        <?php else: ?>
            <div class="alert alert-info text-center" role="alert">
                No progress data found for this user.
            </div>
        <?php endif; ?>
        <div class="text-center mt-4">
            <a href="../index.php" class="btn btn-primary">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
<?php
$conn->close();
?>