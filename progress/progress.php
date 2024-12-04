<?php
require_once '../lib/accessors.php';
require_once '../lib/db_connect.php';
include '../lib/navbar.php';
include '../lib/css.php';

if (session_status() == PHP_SESSION_NONE) 
    session_start();

if (!isset($_SESSION['user_id'])) 
    die("Error: user_id is not set.");
  // -- LAG to Fetch previous progress
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
    p.notes AS progress_notes,
    LAG(p.sets) OVER (PARTITION BY ue.exercise_id ORDER BY p.date DESC) AS prev_sets,
    LAG(p.reps) OVER (PARTITION BY ue.exercise_id ORDER BY p.date DESC) AS prev_reps,
    LAG(p.weight) OVER (PARTITION BY ue.exercise_id ORDER BY p.date DESC) AS prev_weight
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
        <h1 class="mb-4 text-center">Your Workout Progress</h1>
        <?php if (!empty($workouts)): ?>
            <?php foreach ($workouts as $workout_id => $workout): ?>
                <div class="workout-container mb-4 p-3 border rounded">
                    <div class="d-flex justify-content-between align-items-center">
                        <h4><strong>Workout name:</strong> <?= htmlspecialchars($workout['workout_notes'])?></h4>
                        <!-- Add "See Workout" button -->
                        <a href="../exercises/list_workout_exercises.php?workout_id=<?= htmlspecialchars($workout_id) ?>"class="btn btn-primary btn-sm">See Workout</a>
                        
                    </div>
                    <?php foreach ($workout['exercises'] as $exercise_name => $rows): ?>
                        <div class="exercise-section mt-3">
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
                                        <?php
                                        // Calculate differences
                                        $diff_sets = $row['sets'] - ($row['prev_sets'] ?? 0);
                                        $diff_reps = $row['reps'] - ($row['prev_reps'] ?? 0);
                                        $diff_weight = $row['weight'] - ($row['prev_weight'] ?? 0);

                                        // Determine classes for styling
                                        $sets_class = $diff_sets > 0 ? 'progress-positive' : ($diff_sets < 0 ? 'progress-negative' : 'progress-neutral');
                                        $reps_class = $diff_reps > 0 ? 'progress-positive' : ($diff_reps < 0 ? 'progress-negative' : 'progress-neutral');
                                        $weight_class = $diff_weight > 0 ? 'progress-positive' : ($diff_weight < 0 ? 'progress-negative' : 'progress-neutral');
                                        ?>
                                        <tr>
                                            <td><?= htmlspecialchars($row['date']) ?></td>
                                            <td class="<?= $sets_class ?>">
                                                <?= htmlspecialchars($row['sets']) ?>
                                                <?= $diff_sets !== 0 ? " (" . ($diff_sets > 0 ? "+" : "") . $diff_sets . ")" : "" ?>
                                            </td>
                                            <td class="<?= $reps_class ?>">
                                                <?= htmlspecialchars($row['reps']) ?>
                                                <?= $diff_reps !== 0 ? " (" . ($diff_reps > 0 ? "+" : "") . $diff_reps . ")" : "" ?>
                                            </td>
                                            <td class="<?= $weight_class ?>">
                                                <?= htmlspecialchars($row['weight']) ?>
                                                <?= $diff_weight !== 0 ? " (" . ($diff_weight > 0 ? "+" : "") . number_format($diff_weight, 2) . "kg)" : "" ?>
                                            </td>
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
