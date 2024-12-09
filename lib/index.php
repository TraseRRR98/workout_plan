<!DOCTYPE html>
<html lang="en">
<?php
require_once "../lib/accessors.php";
require_once "../lib/db_connect.php";
include "../lib/navbar.php";
include "../lib/css.php";

if (session_status() == PHP_SESSION_NONE)
    session_start();

// Check if the user is logged in
$user_logged_in = isset($_SESSION['user_id']);
$user_id = $user_logged_in ? $_SESSION['user_id'] : null;

// If user is logged in, verify the user exists in the database
if ($user_logged_in) 
{
    $query = "SELECT user_id FROM user WHERE user_id = " . intval($user_id);
    $result = $conn->query($query);

    if ($result === false || $result->num_rows === 0) 
    {
        echo "User ID {$user_id} not found in the database.";
        exit;
    }
}
?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing Page</title>
    <style>
        h1 {
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
            font-size: 48px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .container {
        display: flex;
        height: calc(100vh - 60px);
        /* Adjust height to account for nav */
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="half background">
            <h1>Welcome to <strong>FlexFlow</strong></h1>
        </div>
        <div class="half text">
            <?php if (!$user_logged_in): ?>
                <!-- Buttons for guests -->
                <p>This is a fitness application for BMCC students that empowers students to achieve their fitness goals. Through a calendar application where students are able to organize their own fitness regiment through an integrated calendar.</p>
                <br>
                <button onclick="location.href='../login/login.php'">Login</button>
                <button onclick="location.href='../login/register.php'">Register</button>
            <?php else: ?>
                <!-- Message for logged-in users -->
                <p>Welcome back! You are logged in and can start planning your fitness journey.</p>
                <br>
                <button onclick="location.href='../workouts/list_workouts.php'">Go to My Workouts</button>
            <?php endif; ?>
        </div>
    </div>
</body>

</html>
