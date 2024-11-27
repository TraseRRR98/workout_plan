<?php
include '../lib/accessors.php';
include '../lib/db_connect.php';
include '../lib/css.php';

// Check if the user is logged in
if (!is_set_with_error('user_id')) 
{
    header("Location: login.php");
    exit;
}

$user_id = get_safe('user_id');
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Exercises List</title>
    </head>
</html>