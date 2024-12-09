<?php
require_once '../lib/db_connect.php';
require_once '../lib/accessors.php';
include '../lib/css.php';
session_start();

$error = '';
$success = '';

function validate_registration_inputs()
{
    $first_name = get_safe('first_name');
    $last_name = get_safe('last_name');
    $email = get_safe('email');
    $password = get_safe('password');
    $confirm_password = get_safe('confirm_password');

    if (empty($first_name) || empty($last_name) || empty($email) || empty($password) || empty($confirm_password))
        return ['error' => "All fields are required."];
    if (!filter_var($email, FILTER_VALIDATE_EMAIL))
        return ['error' => "Invalid email format."];
    if ($password !== $confirm_password)
        return ['error' => "Passwords do not match."];

    return [
        'first_name' => $first_name,
        'last_name' => $last_name,
        'email' => $email,
        'password' => $password
    ];
}

function email_exists($conn, $email)
{
    $email = $conn->real_escape_string($email);
    $query = "SELECT 1 FROM user WHERE email = '$email'";
    $result = $conn->query($query);

    return ($result && $result->num_rows > 0);
}

function register_user($conn, $data)
{
    $first_name = $conn->real_escape_string($data['first_name']);
    $last_name = $conn->real_escape_string($data['last_name']);
    $email = $conn->real_escape_string($data['email']);
    $hashed_password = password_hash($data['password'], PASSWORD_BCRYPT);

    // Start transaction
    $conn->begin_transaction();

    try 
    {
        // Insert user into the database
        $query = "INSERT INTO user (first_name, last_name, email, password, usertype_id) 
                  VALUES ('$first_name', '$last_name', '$email', '$hashed_password', 1)";
        $conn->query($query);

        // Commit transaction
        $conn->commit();
        return null; // Success
    } catch (Exception $e) 
    {
        // Rollback transaction in case of error
        $conn->rollback();
        return "Registration failed: " . $e->getMessage();
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') 
{
    $input = validate_registration_inputs();

    if (isset($input['error']))
        $error = $input['error'];
    else 
    {
        if (email_exists($conn, $input['email'])) 
            $error = "An account with this email already exists.";
        else 
        {
            $error = register_user($conn, $input);

            if (!$error) 
                $success = "Registration successful! You can now <a href='login.php'>Login</a>.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Register</h2>
        <?php if (!empty($error)): ?>
            <div class="alert alert-danger text-center">
                <?= htmlspecialchars($error) ?>
            </div>
        <?php elseif (!empty($success)): ?>
            <div class="alert alert-success text-center">
                <?= $success ?>
            </div>
        <?php endif; ?>

        <form method="post" action="">
            <div class="mb-3">
                <label for="first_name" class="form-label">First Name</label>
                <input type="text" class="form-control" id="first_name" name="first_name" required>
            </div>
            <div class="mb-3">
                <label for="last_name" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="last_name" name="last_name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="mb-3">
                <label for="confirm_password" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Register</button>
        </form>
        <div class="text-center mt-3">
            <p>Already have an account? <a href="login.php">Login here</a>.</p>
        </div>
    </div>
</body>
</html>
