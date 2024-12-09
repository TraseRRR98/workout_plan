<?php
require_once '../lib/db_connect.php'; // Database connection
require_once '../lib/accessors.php';
session_start();

function validate_user_input()
{
    $email = get_safe('email');
    $password = get_safe('password');

    if (empty($email) || empty($password)) 
        return ['error' => "Both email and password are required."];

    return ['email' => $email, 'password' => $password];
}

function fetch_user_by_email($conn, $email)
{
    $email = $conn->real_escape_string($email);
    $query = "SELECT user_id, password, usertype_id FROM user WHERE email = '$email'";
    $result = $conn->query($query);

    return ($result && $result->num_rows > 0) ? $result->fetch_assoc() : null;
}

function handle_login($conn, $email, $password)
{
    $user = fetch_user_by_email($conn, $email);

    if ($user && password_verify($password, $user['password'])) 
    {
        // Set session variables
        $_SESSION['user_id'] = $user['user_id'];
        $_SESSION['usertype_id'] = $user['usertype_id'];
        header("Location: ../lib/index.php");
        exit;
    }
    return "Invalid email or password.";
}

$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') 
{
    $input = validate_user_input();

    if (isset($input['error'])) 
        $error = $input['error'];
    else 
        $error = handle_login($conn, $input['email'], $input['password']);
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
