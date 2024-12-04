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
    w.workout_id,
    w.workout_date,
    w.notes AS workout_notes,
    e.exercise_name,
    p.progress_id,
    p.date,
    p.sets,
    p.reps,
    p.weight,
    p.notes AS progress_notes
FROM progress p
JOIN users_exercises ue ON p.user_exercise_id = ue.user_exercise_id
JOIN exercises e ON ue.exercise_id = e.exercise_id
JOIN workout_exercises we ON ue.user_exercise_id = we.user_exercise_id
JOIN workouts w ON we.workout_id = w.workout_id
WHERE w.user_id = '$user_id'
ORDER BY w.workout_date DESC, e.exercise_name, p.date DESC";

$result = $conn->query($query);

if (!$result)
    die("Error retrieving progress: " . mysqli_error($conn));

// Organize progress data by workout and then by exercise
$workouts = [];
while ($row = $result->fetch_assoc()) {
    $workouts[$row['workout_id']]['workout_date'] = $row['workout_date'];
    $workouts[$row['workout_id']]['workout_notes'] = $row['workout_notes'];
    $workouts[$row['workout_id']]['exercises'][$row['exercise_name']][] = $row;
}
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
        <?php if (!empty($workouts)): ?>
            <?php foreach ($workouts as $workout_id => $workout): ?>
                <div class="workout-container">
                    <h4><strong>Workout name:</strong> <?= htmlspecialchars($workout['workout_notes']) ?></h4>
                    <?php foreach ($workout['exercises'] as $exercise_name => $rows): ?>
                        <div class="exercise-section">
                            <h5 class="exercise-name" onclick="toggleTable('workout-<?= $workout_id ?>-<?= htmlspecialchars($exercise_name) ?>')">
                                <?= htmlspecialchars($exercise_name) ?>
                            </h5>
                            <table id="workout-<?= $workout_id ?>-<?= htmlspecialchars($exercise_name) ?>" class="table table-bordered table-hover progress-table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Date</th>
                                        <th>Sets</th>
                                        <th>Reps</th>
                                        <th>Weight (kg)</th>
                                        <th>Notes</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($rows as $row): ?>
                                        <tr>
                                            <td><?= htmlspecialchars($row['date']) ?></td>
                                            <td><?= htmlspecialchars($row['sets']) ?></td>
                                            <td><?= htmlspecialchars($row['reps']) ?></td>
                                            <td><?= htmlspecialchars($row['weight']) ?></td>
                                            <td><?= htmlspecialchars($row['progress_notes']) ?></td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <div class="alert alert-info text-center" role="alert">
                No progress data found for this user.
            </div>
        <?php endif; ?>
        <div class="text-center mt-4">
            <a href="../lib/index.php" class="btn btn-primary">Back to Home</a>
        </div>
    </div>

    <script>
        function toggleTable(tableId) {
            const table = document.getElementById(tableId);
            if (table.style.display === 'none' || table.style.display === '') {
                table.style.display = 'table';
            } else {
                table.style.display = 'none';
            }
        }
    </script>
</body>
</html>
<?php
$conn->close();
?>
