<?php
header('Content-Type: application/json');
require $_SERVER['DOCUMENT_ROOT'] . '/TFG/PHP/db.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);

if (ob_get_length()) ob_clean();

$sql = "SELECT 
            b.id, b.nombre, b.daño, b.penetracion, b.frag_percent, 
            b.retroceso, b.precision_bala, b.distanciaEf, b.distanciaMax, 
            b.velocidad, b.tipo, t.nivel AS tier_nivel
        FROM balas b
        LEFT JOIN tiers t ON b.tier_id = t.id
        ORDER BY b.tipo, b.id";

$result = $conn->query($sql);

$balas = [];

if (!$result) {
    echo json_encode(["error" => "Error SQL: " . $conn->error]);
    exit;
}

while ($row = $result->fetch_assoc()) {
    $idBala = $row["id"];
    if (!isset($balas[$row["tipo"]])) {
        $balas[$row["tipo"]] = [];
    }

    $balas[$row["tipo"]][$idBala] = [
        "id" => (int)$row["id"],
        "nombre" => $row["nombre"],
        "daño" => (int)$row["daño"],
        "penetracion" => (float)$row["penetracion"],
        "frag_percent" => (float)$row["frag_percent"],
        "retroceso" => $row["retroceso"] ?? "-",
        "precision_bala" => $row["precision_bala"] ?? "-",
        "distanciaEf" => $row["distanciaEf"],
        "distanciaMax" => $row["distanciaMax"],
        "velocidad" => (int)$row["velocidad"],
        "tier" => (int)$row["tier_nivel"],
        "clases" => [
            "Clase1" => "-",
            "Clase2" => "-",
            "Clase3" => "-",
            "Clase4" => "-",
            "Clase5" => "-",
            "Clase6" => "-"
        ]
    ];
}

// Obtener los datos de eficacia_clases
$sqlClases = "SELECT bala_id, clase, valor FROM eficacia_clases";
$resClases = $conn->query($sqlClases);

if ($resClases && $resClases->num_rows > 0) {
    while ($claseRow = $resClases->fetch_assoc()) {
        $idBala = $claseRow["bala_id"];
        $clase = "Clase" . $claseRow["clase"];
        $valor = (int)$claseRow["valor"];

        foreach ($balas as $tipo => &$balasTipo) {
            if (isset($balasTipo[$idBala])) {
                $balasTipo[$idBala]["clases"][$clase] = $valor;
            }
        }
    }
}

echo json_encode($balas, JSON_PRETTY_PRINT);
?>
