<?php
require_once '../lib/db_connect.php';

if (session_status() == PHP_SESSION_NONE) 
    session_start();

function get_user_type($conn)
{
    if (!isset($_SESSION['user_id'])) 
        return null; // User not logged in

    // Enforce user_id as an integer
    $user_id = intval($_SESSION['user_id']);
    if ($user_id <= 0) 
        return null; // Invalid user_id


    $safe_user_id = $user_id; 

    $query = "SELECT uu.usertype_description 
              FROM user u
              JOIN user_usertypes uu ON u.usertype_id = uu.usertype_id 
              WHERE u.user_id = $safe_user_id";

    $result = $conn->query($query);
    if ($result && $result->num_rows > 0) 
    {
        $row = $result->fetch_assoc();
        return $row['usertype_description'];
    }
    return null; // No match found
}


function render_navigation_links($user_type)
{
    if ($user_type === 'Trainee') 
    {
        echo '<li class="nav-item"><a class="nav-link" href="../profile/profile.php">Profile</a></li>
              <li class="nav-item"><a class="nav-link" href="../workouts/list_workouts.php">My Workouts</a></li>
              <li class="nav-item"><a class="nav-link" href="../progress/progress.php">Progress</a></li>';
    } elseif ($user_type === 'Coach') 
    {
        echo '<li class="nav-item"><a class="nav-link" href="../coach/manage_trainees.php">Manage Trainees</a></li>
              <li class="nav-item"><a class="nav-link" href="../coach/create_programs.php">Create Programs</a></li>'; 
    } elseif ($user_type === 'Administrator') 
    {
        echo '<li class="nav-item"><a class="nav-link" href="../admin/admin_panel.php">Admin Panel</a></li>
              <li class="nav-item"><a class="nav-link" href="../admin/manage_users.php">Manage Users</a></li>';         
    }
}

$user_type = get_user_type($conn);
?>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="../lib/index.php">FLEX FLOW</a>
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
                    <?php render_navigation_links($user_type); ?>
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
