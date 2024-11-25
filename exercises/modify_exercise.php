<?php
require_once '../lib/accessors.php';
require_once '../lib/db_connect.php';
require_once '../lib/css.php'; // Include Bootstrap CSS

if (!is_set_with_error('user_exercise_id')) {
    die("Error: user_exercise_id is required.");
}

$user_exercise_id = get_safe('user_exercise_id');

// Fetch the current exercise details
$query = "
SELECT 
    ue.user_exercise_id,
    e.exercise_name,
    ue.sets,
    ue.reps,
    ue.weight
FROM users_exercises ue
JOIN exercises e ON ue.exercise_id = e.exercise_id
WHERE ue.user_exercise_id = '$user_exercise_id'
";

$result = $conn->query($query);

if (!$result || $result->num_rows == 0) {
    die("Error: Unable to fetch exercise details.");
}

$exercise = $result->fetch_assoc();

// Handle form submission to update and record progress
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $sets = get_safe('sets');
    $reps = get_safe('reps');
    $weight = get_safe('weight');
    $notes = get_safe('notes');

    // Update the `users_exercises` table
    $update_query = "
        UPDATE users_exercises
        SET sets = '$sets', reps = '$reps', weight = '$weight'
        WHERE user_exercise_id = '$user_exercise_id'
    ";
    if (!$conn->query($update_query)) {
        die("Error updating exercise: " . $conn->error);
    }

    // Insert into the `progress` table
    $insert_query = "
        INSERT INTO progress (user_exercise_id, date, sets, reps, weight, notes)
        VALUES ('$user_exercise_id', CURDATE(), '$sets', '$reps', '$weight', '$notes')
    ";
    if (!$conn->query($insert_query)) {
        die("Error recording progress: " . $conn->error);
    }

    // Redirect back to progress page
    header("Location: progress.php?user_id=" . $exercise['user_id']);
    exit;
}
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
                <input type="text" id="exercise_name" class="form-control" value="<?= htmlspecialchars($exercise['exercise_name']) ?>" readonly>
            </div>
            <div class="mb-3">
                <label for="sets" class="form-label">Sets</label>
                <input type="number" id="sets" name="sets" class="form-control" value="<?= htmlspecialchars($exercise['sets']) ?>" required>
            </div>
            <div class="mb-3">
                <label for="reps" class="form-label">Reps</label>
                <input type="number" id="reps" name="reps" class="form-control" value="<?= htmlspecialchars($exercise['reps']) ?>" required>
            </div>
            <div class="mb-3">
                <label for="weight" class="form-label">Weight (kg)</label>
                <input type="number" step="0.01" id="weight" name="weight" class="form-control" value="<?= htmlspecialchars($exercise['weight']) ?>" required>
            </div>
            <div class="mb-3">
                <label for="notes" class="form-label">Notes</label>
                <textarea id="notes" name="notes" class="form-control" rows="3" placeholder="Add any notes about this workout"></textarea>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Save Changes & Record Progress</button>
                <a href="progress.php?user_id=<?= htmlspecialchars($exercise['user_id']) ?>" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
<?php
$conn->close();
?>
