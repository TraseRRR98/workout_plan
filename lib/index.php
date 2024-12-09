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
    if (!isset($_SESSION['user_id'])) 
    {
        // If not logged in, show the home page or redirect to a public landing page
        echo "<h1>Welcome to Workout Plan!</h1>";
        echo "<p>Please <a href='login.php'>log in</a> to access your workout plans.</p>";
        exit;
    }

    // If logged in, retrieve the user ID from the session
    $user_id = $_SESSION['user_id'];

    // Query to check if the user exists
    $query = "SELECT user_id FROM user WHERE user_id = " . intval($user_id);
    $result = $conn->query($query);

    if ($result === false || $result->num_rows === 0) 
    {
        echo "User ID {$user_id} not found in the database.";
        exit;
    }

    // Add your main page logic for logged-in users here
    echo "<h1>Welcome Back!</h1>";
    ?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing Page</title>
</head>

<body>
    <div class="container">
        <div class="half background">
            <h1>Welcome to <strong>FlexFlow</strong></h1>
        </div>
        <div class="half text">
             <p>This is a fitness application for BMCC students that empowers students to achieve their fitness goals. Through a calendar application where students are able to organize their own fitness regiment through an integrated calendar.</p>
            <br>
            <button onclick="location.href='login.html'">Login</button>
            <button onclick="location.href='register.html'">Register</button>
        </div>
    </div>
</body>

</html>