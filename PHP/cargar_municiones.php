<?php
// Incluye el archivo de conexión y configura la respuesta como JSON
require_once "conexion.php";
header('Content-Type: application/json');

try {
    // Obtiene todas las municiones de la base de datos
    $stmtMuniciones = $conexion->query("SELECT id, nombre, danio, penetracion, frag, retroceso, `precision`, distancia_efectiva, distancia_max, velocidad, tipo_municion, clase1, clase2, clase3, clase4, clase5, clase6 FROM municiones");
    $municiones = $stmtMuniciones->fetchAll(PDO::FETCH_ASSOC);

    // Obtiene información de los tiers de munición
    $stmtTiers = $conexion->query("SELECT * FROM tier_municion");
    $tiers = $stmtTiers->fetchAll(PDO::FETCH_ASSOC);

    // Devuelve ambos conjuntos de datos
    echo json_encode([
        "municiones" => $municiones,
        "tiers" => $tiers
    ]);
} catch (PDOException $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>
