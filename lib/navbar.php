<?php
require_once '../lib/db_connect.php'; // Your DB connection
session_start();

$user_type = null;

// Check if the user is logged in
if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];

    // Fetch the user's type from the database
    $query = "
    SELECT 
        uu.usertype_description 
    FROM user u 
    JOIN user_usertypes uu ON u.usertype_id = uu.usertype_id 
    WHERE u.user_id = '$user_id'
    ";

    $result = $conn->query($query);

    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $user_type = $row['usertype_description'];
    }
}
?>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.php">Workout Tracker</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <!-- Home Link -->
                <li class="nav-item">
                    <a class="nav-link" href="../lib/index.php">Home</a>
                </li>

                <?php if (isset($_SESSION['user_id'])): ?>
                    <!-- Links for Trainee -->
                    <?php if ($user_type === 'Trainee'): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="../workouts/list_workouts.php">My Workouts</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../progress/progress.php">Progress</a>
                        </li>

                    <!-- Links for Coach -->
                    <?php elseif ($user_type === 'Coach'): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="manage_trainees.php">Manage Trainees</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="create_programs.php">Create Programs</a>
                        </li>

                    <!-- Links for Administrator -->
                    <?php elseif ($user_type === 'Administrator'): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="admin_panel.php">Admin Panel</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="manage_users.php">Manage Users</a>
                        </li>
                    <?php endif; ?>

                    <!-- Logout Button for All Logged-In Users -->
                    <li class="nav-item">
                        <a class="nav-link" href="../login/logout.php">Logout</a>
                    </li>
                <?php else: ?>
                    <!-- Links for Guests -->
                    <li class="nav-item">
                        <a class="nav-link" href="../login/login.php">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../login/register.php">Register</a>
                    </li>
                <?php endif; ?>
            </ul>
        </div>
    </div>
</nav>
