<?php
require_once '../lib/accessors.php';
require_once './user_login_tools.php';
require_once '../lib/db_connect.php';

function attempt_login()
{
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        global $conn;

        // Sanitize and retrieve inputs
        $email = get_safe('email');
        $password = get_safe('password');

        // Attempt login
        $login_result = login_user($email, $password);

        if (!$login_result[0]) {
            // Login failed, display error message
            echo '<h3 style="color:red">Invalid login:<br><h5 style="color:red">' . $login_result[1] . '</h5></h3>';
            return;
        }

        // Redirect based on user role (e.g., trainee, coach, or administrator)
        $user_role = $_SESSION['UserTypeDescription'] ?? 'Trainee';

        switch ($user_role) {
            case 'Administrator':
                header("Location: ../admin/dashboard.php");
                break;
            case 'Coach':
                header("Location: ../coach/dashboard.php");
                break;
            case 'Trainee':
            default:
                header("Location: ../index.php");
                break;
        }
        exit;
    }
}

attempt_login();
?>
