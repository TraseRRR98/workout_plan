<?php
session_start(); // Start the session

// Destroy all session data
session_destroy();

// Redirect to the index page
header("Location: ../lib/index.php");
exit;
?>