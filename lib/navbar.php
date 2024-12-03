<?php
require_once "./lib/db_connect.php";
require_once "./lib/accessors.php";
require_once "./login/user_login_tools.php";

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

function navbar_generator($elements)
{
    $html = '
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="navbar">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.php">Workout Tracker</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">';

    foreach ($elements as $element) 
    {
        $html .= '<li class="nav-item">';
        $html .= '<a class="nav-link" href="' . $element[1] . '">' . $element[0] . '</a>';
        $html .= '</li>';
    }

    $html .= '
                </ul>
            </div>
        </div>
    </nav>
    <script>
        function inIframe() {
            try {
                return window.self !== window.top;
            } catch (e) {
                return true;
            }
        }
        function remove_navbar() {
            let navbar = document.getElementById("navbar");
            if (navbar) {
                navbar.remove();
            }
        }
        if (inIframe()) {
            remove_navbar();
        }
    </script>';

    return $html;
}

function generate_general_navbar()
{
    $elements = [
        ['Home', '../generic/index.php'],
    ];
    return navbar_generator($elements);
}

function generic_navbar()
{
    $user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : null;
    $generic_elements = [
        ['Home', './index.php'],
        ['Progress', $user_id ? "./progress/progress.php" : "./login/login.php"], // Link to Progress only if user_id exists
        ['Workouts', $user_id ? "./workouts/list_workouts.php" : "./login/login.php"],
        ['Login', '../login/login.php'],
        ['Signup', '../login/sign_up.php']
    ];

    return navbar_generator($generic_elements);
}

function trainee_navbar()
{
    $trainee_elements = [
        ['Home', '../generic/index.php'],
        ['Progress', '../progress/progress.php'],
        ['Workouts', '../workouts/list_workouts.php'],
        ['Logout', '../generic/logout.php'],
    ];

    return navbar_generator($trainee_elements);
}

function administrator_navbar()
{
    $administrator_elements = [
        ['Home', '../generic/index.php'],
        ['Users', '../users/list_users.php'],
        ['Workouts', '../workouts/list_workouts.php'],
        ['Exercises', '../exercises/list_exercises.php'],
        ['Logout', '../generic/logout.php']
    ];

    return navbar_generator($administrator_elements);
}

function generate_navbar()
{
    if (!is_logged_in())
        return generic_navbar();

    if (is_trainee())
        return trainee_navbar();

    if (is_administrator())
        return administrator_navbar();

    return generic_navbar(); // Fallback
}

echo generate_navbar();
?>
