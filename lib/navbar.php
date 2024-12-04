<?php
require_once '../lib/db_connect.php'; // Your DB connection
require_once '../lib/accessors.php'; // Your accessor functions
session_start();

// Redirect to login if user is not logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: ../login/login.php'); // Redirect to login page
    exit;
}

// Fetch the user's type from the database
$user_id = $_SESSION['user_id'];

$query = "
SELECT 
    u.user_id, 
    uu.usertype_description 
FROM user u 
JOIN user_usertypes uu ON u.usertype_id = uu.usertype_id 
WHERE u.user_id = '$user_id'
";

$result = $conn->query($query);

if (!$result) {
    die("Error fetching user type: " . mysqli_error($conn));
}

$user_type = null;

if ($row = $result->fetch_assoc()) {
    $user_type = $row['usertype_description'];
}
?>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="../index.php">Workout Tracker</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="../dashboard.php">Dashboard</a>
                </li>
                <?php if ($user_type === 'Trainee'): ?>
                    <li class="nav-item">
                        <a class="nav-link" href="../my_workouts.php">My Workouts</a>
                    </li>
                <?php elseif ($user_type === 'Coach'): ?>
                    <li class="nav-item">
                        <a class="nav-link" href="../manage_trainees.php">Manage Trainees</a>
                    </li>
                <?php elseif ($user_type === 'Administrator'): ?>
                    <li class="nav-item">
                        <a class="nav-link" href="../admin_panel.php">Admin Panel</a>
                    </li>
                <?php endif; ?>
                <li class="nav-item">
                    <a class="nav-link" href="../logout.php">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
