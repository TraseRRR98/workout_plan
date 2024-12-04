<?php
require_once "../lib/accessors.php";
require_once "../lib/db_connect.php";
require_once "../lib/navbar.php"; 
include "../lib/css.php";

if (session_status() == PHP_SESSION_NONE) 
    session_start();

$user_id = get_safe('user_id') ?? 1; // Fallback to 1 for testing

$query = "SELECT user_id FROM user WHERE user_id = " . intval($user_id);

$result = $conn->query($query);
if ($result === false || $result->num_rows === 0) {
    echo "User ID {$user_id} not found in the database.";
    exit;
}

echo "
<div class='container mt-4'>
    <h1>Welcome to the Dashboard</h1>
    <p>Your user ID is: {$user_id}</p>
</div>";
?>
