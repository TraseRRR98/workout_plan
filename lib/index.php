<?php
require_once "../lib/accessors.php";
require_once "../lib/db_connect.php";
include "../lib/navbar.php"; 
include "../lib/css.php";

if (session_status() == PHP_SESSION_NONE) 
    session_start();

$query = "SELECT user_id FROM user WHERE user_id = " . intval($user_id);

$result = $conn->query($query);
if ($result === false || $result->num_rows === 0) {
    echo "User ID {$user_id} not found in the database.";
    exit;
}
?>
