<?php
header('Content-Type: application/json');
require $_SERVER['DOCUMENT_ROOT'] . '/TFG/PHP/db.php';

if (ob_get_length()) ob_clean();

$sql = "SELECT 
            b.id, b.nombre, b.daño, b.penetracion, b.frag_percent, 
            b.retroceso, b.precision_bala, b.distanciaEf, b.distanciaMax, 
            b.velocidad, t.nivel AS tier_nivel, t.efectividad AS tier_efectividad
        FROM balas b
        LEFT JOIN tiers t ON b.tier_id = t.id";

$result = $conn->query($sql);

$balas = [];

if (!$result) {
    echo json_encode(["error" => "Error SQL: ".$conn->error]);
    exit;
}

while ($row = $result->fetch_assoc()) {
    $idBala = $row["id"];
    $bala = [
        "id" => (int)$row["id"],
        "nombre" => $row["nombre"],
        "daño" => (int)$row["daño"],
        "penetracion" => (float)$row["penetracion"],
        "frag_percent" => (float)$row["frag_percent"],
        "retroceso" => (float)$row["retroceso"],
        "precision_bala" => (float)$row["precision_bala"],
        "distanciaEf" => $row["distanciaEf"],
        "distanciaMax" => $row["distanciaMax"],
        "velocidad" => $row["velocidad"],
        "tier" => [
            "nivel" => (int)$row["tier_nivel"],
            "efectividad" => $row["tier_efectividad"]
        ],
        "clases" => []
    ];

    // Obtener los datos de eficacia_clases
    $sqlClases = "SELECT clase, valor FROM eficacia_clases WHERE bala_id = $idBala";
    $resClases = $conn->query($sqlClases);

    if($resClases && $resClases->num_rows > 0){
        while($claseRow = $resClases->fetch_assoc()){
            $bala["clases"]["Clase".$claseRow["clase"]] = (int)$claseRow["valor"];
        }
    } else {
        $bala["clases"] = [
            "Clase1" => "-",
            "Clase2" => "-",
            "Clase3" => "-",
            "Clase4" => "-",
            "Clase5" => "-",
            "Clase6" => "-"
        ];
    }

    $balas[] = $bala;
}

echo json_encode($balas, JSON_PRETTY_PRINT);
