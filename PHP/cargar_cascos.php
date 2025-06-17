<?php
// Incluye el archivo de conexión y configura la respuesta como JSON
require_once "conexion.php";
header('Content-Type: application/json');

try {
    // Obtiene todos los auriculares de la base de datos
    $stmt = $conexion->query("SELECT nombre, descripcion, imagen FROM auriculares");
    $datos = $stmt->fetchAll(PDO::FETCH_ASSOC);
    // Devuelve los datos en formato JSON
    echo json_encode($datos);
} catch (PDOException $e) {
    // Manejo de errores
    echo json_encode(["error" => $e->getMessage()]);
}
?>
