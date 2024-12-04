<?php
require_once '../lib/db_connect.php'; // Database connection
require_once '../lib/accessors.php'; // Accessor functions
session_start();

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = get_safe('email');
    $password = get_safe('password');

    // Validate inputs
    if (empty($email) || empty($password)) {
        $error = "Both email and password are required.";
    } else {
        // Query the database for the user
        $query = "SELECT user_id, password, usertype_id FROM user WHERE email = '$email'";
        $result = $conn->query($query);

        if ($result && $result->num_rows > 0) {
            $user = $result->fetch_assoc();

            // Compare passwords directly
            if ($password === $user['password']) { // Replace with password_verify if using hashed passwords
                $_SESSION['user_id'] = $user['user_id']; // Store user_id in session
                $_SESSION['usertype_id'] = $user['usertype_id']; // Store usertype_id in session

                // Redirect to the dashboard
                header("Location: ../lib/index.php");
                exit;
            } else {
                $error = "Invalid email or password.";
            }
        } else {
            $error = "Invalid email or password.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Login</h2>
        <?php if (!empty($error)): ?>
            <div class="alert alert-danger text-center">
                <?= htmlspecialchars($error) ?>
            </div>
        <?php endif; ?>
        <form method="post" action="">
            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
    </div>
</body>
</html>
