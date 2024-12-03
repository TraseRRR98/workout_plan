<?php
function is_set($key)
    {
        return (isset($_GET[$key]) || isset($_POST[$key])) && get($key) !== null;
    }
    function is_set_with_error($field)
    {
        if (!is_set($field)) {
            echo "Error: $field is not set <br>";
            return false;
        }
        return true;
    }
    function get($key) {
        // Check if the key exists in $_POST or $_GET, default to null if not found
        return $_POST[$key] ?? $_GET[$key] ?? null;
    }
    function get_safe($key) {
        global $conn;
    
        $value = get($key);
    
        if (is_array($value)) {
            return array_map(function ($item) use ($conn) {
                return is_array($item) ? get_safe($item) : mysqli_real_escape_string($conn, $item);
            }, $value);
        }
    
        return $value !== null ? mysqli_real_escape_string($conn, $value) : null;
    }
    