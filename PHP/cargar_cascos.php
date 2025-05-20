<?php
require_once "conexion.php";
header('Content-Type: application/json');

try {
    $stmt = $conexion->query("SELECT nombre, descripcion, imagen FROM auriculares");
    $datos = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($datos);
} catch (PDOException $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>
