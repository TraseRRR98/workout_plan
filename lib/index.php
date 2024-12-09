
<?php
require_once "../lib/accessors.php";
require_once "../lib/db_connect.php";
include "../lib/navbar.php";
include "../lib/css.php";

function get_logged_in_user_id() 
{
    if (session_status() == PHP_SESSION_NONE)
        session_start();

    if (!isset($_SESSION['user_id'])) 
        return null; // User is not logged in

    return $_SESSION['user_id'];
}

// Function to verify if the logged-in user exists in the database
function verify_user_exists($conn, $user_id) 
{
    $query = "SELECT user_id FROM user WHERE user_id = " . intval($user_id);
    $result = $conn->query($query);

    if ($result === false || $result->num_rows === 0) 
        die("User ID {$user_id} not found in the database.");
}

// Main Logic
$user_id = get_logged_in_user_id();
$user_logged_in = $user_id !== null;

if ($user_logged_in) 
    verify_user_exists($conn, $user_id);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing Page</title>
    <style>
        h1 
        {
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
            font-size: 48px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .container 
        {
            display: flex;
            height: calc(100vh - 60px);
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
