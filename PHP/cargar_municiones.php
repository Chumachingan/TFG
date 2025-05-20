<?php
require_once "conexion.php";
header('Content-Type: application/json');

try {
    // Escapamos `precision` con backticks
    $stmtMuniciones = $conexion->query("SELECT id, nombre, danio, penetracion, frag, retroceso, `precision`, distancia_efectiva, distancia_max, velocidad, tipo_municion, clase1, clase2, clase3, clase4, clase5, clase6 FROM municiones");
    $municiones = $stmtMuniciones->fetchAll(PDO::FETCH_ASSOC);

    $stmtTiers = $conexion->query("SELECT * FROM tier_municion");
    $tiers = $stmtTiers->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        "municiones" => $municiones,
        "tiers" => $tiers
    ]);
} catch (PDOException $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>
