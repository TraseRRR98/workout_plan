<?php
require_once './lib/accessors.php';
require_once './lib/db_connect.php';
require_once './lib/user_login_tools.php';
require_once './lib/navbar.php'; // Include the navbar first
include './lib/css.php'; // Then include CSS for styling

if (session_status() == PHP_SESSION_NONE) 
    session_start();

// Retrieve a safe version of user_id
$user_id = get_safe('user_id') ?? 1; // Fallback to 1 for testing

// Use the sanitized value in a query
$query = "SELECT user_id FROM user WHERE user_id = " . intval($user_id);

$result = $conn->query($query);
if ($result === false || $result->num_rows === 0) {
    echo "User ID {$user_id} not found in the database.";
    exit;
}

// Display content
echo "
<div class='container mt-4'>
    <h1>Welcome to the Dashboard</h1>
    <p>Your user ID is: {$user_id}</p>
</div>";
?>
