<?php
if (session_status() == PHP_SESSION_NONE) 
    session_start();

require_once 'db_connect.php';

function login_user($email, $password) {
    global $conn;

    // Sanitize inputs
    $email = mysqli_real_escape_string($conn, $email);

    // Query the user table with a join to get user type
    $query = "
        SELECT 
            u.user_id, 
            u.usertype_id, 
            uu.usertype_description, 
            u.password 
        FROM 
            user u
        LEFT JOIN 
            user_usertypes uu ON u.usertype_id = uu.usertype_id
        WHERE 
            u.email = '$email'
    ";
    $result = $conn->query($query);
    
    if (!($result && $result->num_rows > 0)) 
        return [false, "User not found."]; // User not found

    $row = $result->fetch_assoc();

    // Set session variables
    $_SESSION['UserID'] = $row['user_id'];
    $_SESSION['UserTypeID'] = $row['usertype_id'];
    $_SESSION['UserTypeDescription'] = $row['usertype_description'];

    return [true, ""]; // Login successful
}

function is_user_type($type) 
{
    return isset($_SESSION['UserTypeDescription']) && $_SESSION['UserTypeDescription'] === $type;
}

function is_trainee() 
{
    return is_user_type('Trainee');
}

function is_coach() 
{
    return is_user_type('Coach');
}

function is_administrator() 
{
    return is_user_type('Administrator');
}

function get_uid()
{
    return $_SESSION["UserID"];
}

function is_logged_in()
{
    return isset($_SESSION["UserID"]);
}

function handle_user_not_logged_in()
{
    if (!is_logged_in()) {
        header("Location: ../generic/login.php");
        exit();
    }
}

function handle_permission_level($required_type)
{
    handle_user_not_logged_in();

    if (!is_user_type($required_type)) {
        header("Location: ../generic/unauthorized.php");
        exit();
    }
}

function handle_permission_level_not_trainee()
{
    handle_permission_level('Trainee');
}

function handle_permission_level_not_coach()
{
    handle_permission_level('Coach');
}

function handle_permission_level_not_administrator()
{
    handle_permission_level('Administrator');
}
?>
