<?php
session_start();
header('Content-Type: application/json');

$response = [];

if (isset($_SESSION['usuario'])) {
    $response['usuario'] = $_SESSION['usuario'];
    // Añade el campo es_admin si existe en la sesión
    if (isset($_SESSION['es_admin'])) {
        $response['es_admin'] = $_SESSION['es_admin'];
    }
}

echo json_encode($response);
?>
