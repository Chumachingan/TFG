<?php
header('Content-Type: application/json');

// Incluir la conexión a la base de datos
require $_SERVER['DOCUMENT_ROOT'] . '/TFG/PHP/db.php';

// Verificar que no haya salida previa
if (ob_get_length()) {
    ob_clean();
}

// Consulta SQL
$sql = "SELECT id, nombre, daño, distanciaMax, distanciaEf, precision_bala, penetracion, retroceso, frag_percent, tier_id FROM balas";
$result = $conn->query($sql);

$balas = [];

// Verificar si la consulta fue exitosa
if ($result) {
    while ($row = $result->fetch_assoc()) {
        $balas[] = [
            "id" => (int)$row["id"],
            "nombre" => $row["nombre"],
            "daño" => (int)$row["daño"],
            "distanciaMax" => (float)$row["distanciaMax"],
            "distanciaEf" => (float)$row["distanciaEf"],
            "precision_bala" => (float)$row["precision_bala"],
            "penetracion" => (float)$row["penetracion"],
            "retroceso" => (float)$row["retroceso"],
            "frag_percent" => (float)$row["frag_percent"],
            "tier_id" => (int)$row["tier_id"]
        ];
    }
    echo json_encode($balas, JSON_PRETTY_PRINT);
} else {
    echo json_encode(["error" => "Error en la consulta SQL: " . $conn->error]);
}
?>
