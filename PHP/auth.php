<?php
// Inicia la sesión para manejar variables de sesión entre páginas
session_start();

// Verifica si el usuario está autenticado
// Si no hay user_id en la sesión, redirige al login
if (!isset($_SESSION['user_id'])) {
    header("Location: login.html");
    exit(); // Termina la ejecución del script
}
?>
