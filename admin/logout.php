<?php 



// remove all session variables
session_start();

unset($_SESSION["uid"]);

unset($_SESSION["name"]);

// destroy the session 



header('location: http://127.0.0.1/online-shopping-system/index.php');
session_distroy();
?>