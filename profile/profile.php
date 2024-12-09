<?php
require_once '../lib/accessors.php';
require_once '../lib/db_connect.php';
include '../lib/navbar.php';
include '../lib/css.php';

// Function to validate session and return user ID
function get_logged_in_user_id() 
{
    if (session_status() == PHP_SESSION_NONE)
        session_start();

    if (!isset($_SESSION['user_id'])) 
    {
        header("Location: login.php");
        exit();
    }
    return $_SESSION['user_id'];
}

// Function to fetch user data
function fetch_user_data($conn, $user_id) 
{
    $query = "SELECT * FROM user WHERE user_id = " . intval($user_id);
    $result = $conn->query($query);

    if ($result === false || $result->num_rows == 0) 
        die("Error: User not found.");

    return $result->fetch_assoc();
}

// Function to update user profile
function update_user_profile($conn, $user_id) 
{
    $fields = ['first_name', 'last_name', 'email', 'weight', 'height', 'date_of_birth'];
    foreach ($fields as $field) 
        if (!is_set_with_error($field))
            return "Error: Missing required field '$field'.";
    
    $first_name = get_safe('first_name');
    $last_name = get_safe('last_name');
    $email = get_safe('email');
    $weight = get_safe('weight');
    $height = get_safe('height');
    $date_of_birth = get_safe('date_of_birth');

    // Update user data in the database
    $query = "UPDATE user 
              SET first_name = '$first_name', 
                  last_name = '$last_name', 
                  email = '$email', 
                  weight = '$weight', 
                  height = '$height', 
                  date_of_birth = '$date_of_birth' 
              WHERE user_id = '$user_id'";

    return $conn->query($query) ? "Profile updated successfully!" : "Failed to update profile: " . $conn->error;
}

$user_id = get_logged_in_user_id();
$user = fetch_user_data($conn, $user_id);

$message = null;
if ($_SERVER['REQUEST_METHOD'] == 'POST') 
{
    $message = update_user_profile($conn, $user_id);
    $user = fetch_user_data($conn, $user_id); // Refresh user data after update
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
</head>

<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Edit Your Profile</h1>

        <?php if ($message): ?>
            <div class="alert alert-info text-center"><?= htmlspecialchars($message) ?></div>
        <?php endif; ?>

        <!-- Profile Edit Form -->
        <form action="profile.php" method="POST">
            <div class="mb-3">
                <label for="first_name" class="form-label">First Name</label>
                <input type="text" id="first_name" name="first_name" class="form-control"
                    value="<?= htmlspecialchars($user['first_name']); ?>" required>
            </div>

            <div class="mb-3">
                <label for="last_name" class="form-label">Last Name</label>
                <input type="text" id="last_name" name="last_name" class="form-control"
                    value="<?= htmlspecialchars($user['last_name']); ?>" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" id="email" name="email" class="form-control"
                    value="<?= htmlspecialchars($user['email']); ?>" required>
            </div>

            <div class="mb-3">
                <label for="weight" class="form-label">Weight (kg)</label>
                <input type="number" id="weight" name="weight" class="form-control"
                    value="<?= htmlspecialchars($user['weight']); ?>" step="0.01" required>
            </div>

            <div class="mb-3">
                <label for="height" class="form-label">Height (cm)</label>
                <input type="number" id="height" name="height" class="form-control"
                    value="<?= htmlspecialchars($user['height']); ?>" step="0.01" required>
            </div>

            <div class="mb-3">
                <label for="date_of_birth" class="form-label">Date of Birth</label>
                <input type="date" id="date_of_birth" name="date_of_birth" class="form-control"
                    value="<?= htmlspecialchars($user['date_of_birth']); ?>" required>
            </div>

            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary btn-lg">Update Profile</button>
            </div>
        </form>
    </div>
</body>

</html>
