<?php
// Inicia la sesión y establece el tipo de contenido como JSON
session_start();
header('Content-Type: application/json');

// Prepara el array de respuesta
$response = [];

// Verifica si existe una sesión de usuario
if (isset($_SESSION['usuario'])) {
    // Añade el nombre de usuario a la respuesta
    $response['usuario'] = $_SESSION['usuario'];
    
    // Si el usuario es admin, añade esa información
    if (isset($_SESSION['es_admin'])) {
        $response['es_admin'] = $_SESSION['es_admin'];
    }
}

// Devuelve la respuesta en formato JSON
echo json_encode($response);
?>
