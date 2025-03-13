<?php
header('Content-Type: application/json');
require $_SERVER['DOCUMENT_ROOT'] . '/TFG/PHP/db.php';

// Limpiar cualquier salida previa
if (ob_get_length()) {
    ob_clean();
}

// Nueva consulta SQL para obtener balas con su tier y clases correctas
$sql = "SELECT 
    b.id, b.nombre, b.daño, b.penetracion, b.frag_percent, 
    b.retroceso, b.precision_bala, b.distanciaEf, b.distanciaMax, 
    b.velocidad, t.nivel AS tier_nivel, t.efectividad AS tier_efectividad,
    c.Clase1, c.Clase2, c.Clase3, c.Clase4, c.Clase5, c.Clase6
FROM balas AS b
LEFT JOIN tiers AS t ON b.tier_id = t.id
LEFT JOIN balas_clases AS bc ON b.id = bc.bala_id
LEFT JOIN clases AS c ON bc.clase_id = c.id"; 

$result = $conn->query($sql);
$balas = [];

if (!$result) {
    echo json_encode(["error" => "Error en la consulta SQL: " . $conn->error]);
    exit;
}

while ($row = $result->fetch_assoc()) {
    $balas[] = [
        "id" => (int)$row["id"],
        "nombre" => $row["nombre"],
        "daño" => (int)$row["daño"],
        "penetracion" => (float)$row["penetracion"],
        "frag_percent" => (float)$row["frag_percent"],
        "retroceso" => (float)$row["retroceso"],
        "precision_bala" => (float)$row["precision_bala"],
        "distanciaEf" => (float)$row["distanciaEf"],
        "distanciaMax" => (float)$row["distanciaMax"],
        "velocidad" => (float)$row["velocidad"],
        "tier" => [
            "nivel" => (int)$row["tier_nivel"],
            "efectividad" => $row["tier_efectividad"]
        ],
        "clases" => [
            "Clase1" => $row["Clase1"] ?? "-",
            "Clase2" => $row["Clase2"] ?? "-",
            "Clase3" => $row["Clase3"] ?? "-",
            "Clase4" => $row["Clase4"] ?? "-",
            "Clase5" => $row["Clase5"] ?? "-",
            "Clase6" => $row["Clase6"] ?? "-"
        ]
    ];
}

// Enviar el JSON correctamente
echo json_encode($balas, JSON_PRETTY_PRINT);
?>
