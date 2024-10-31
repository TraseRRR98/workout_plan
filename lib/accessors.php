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
    function get($key)
    {
        return isset($_POST[$key]) ? $_POST[$key] : $_GET[$key];
    }
    function get_safe($key)
    {
        global $conn;
        if (is_array(get($key))) {
            $safe_array = [];
            foreach (get($key) as $value) {
                if (is_array($value)) {
                    $value = get_safe($value);
                }
                array_push($safe_array, mysqli_real_escape_string($conn, $value));
            }
            return $safe_array;
        }
        return  mysqli_real_escape_string($conn, get($key));
    }