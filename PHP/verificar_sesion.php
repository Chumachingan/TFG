<?php
// Inicia la sesión y establece el tipo de contenido como JSON
session_start();
header("Content-Type: application/json");

// Verifica si existe una sesión de usuario activa
// Devuelve true o false según exista la sesión
if (isset($_SESSION["usuario"])) {
    echo json_encode(["sesion" => true]);
} else {
    echo json_encode(["sesion" => false]);
}
?>
