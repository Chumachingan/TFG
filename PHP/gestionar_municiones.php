<?php
include 'db.php';

// Obtiene la acción a realizar desde la petición
$action = $_REQUEST['action'] ?? '';

// Manejo de inserción de nuevas municiones
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $action !== 'eliminar') {
    // Define los campos necesarios para la munición
    $campos = [
        'nombre', 'danio', 'penetracion', 'frag', 'retroceso', 'precision',
        'distancia_efectiva', 'distancia_max', 'velocidad',
        'tipo_municion', 'clase1', 'clase2', 'clase3', 'clase4', 'clase5', 'clase6'
    ];

    $valores = [];
    foreach ($campos as $campo) {
        $valores[$campo] = $_POST[$campo] ?? null;
    }

    // Prepara y ejecuta la consulta de inserción
    $stmt = $conn->prepare("
        INSERT INTO municiones 
        (nombre, danio, penetracion, frag, retroceso, `precision`, distancia_efectiva, distancia_max,
         velocidad, tipo_municion, clase1, clase2, clase3, clase4, clase5, clase6)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ");

    if (!$stmt) {
        http_response_code(500);
        echo "Error en prepare(): " . $conn->error;
        exit;
    }

    $stmt->bind_param(
        "siisssssiiiiiiii",
        $valores['nombre'],
        $valores['danio'],
        $valores['penetracion'],
        $valores['frag'],
        $valores['retroceso'],
        $valores['precision'],
        $valores['distancia_efectiva'],
        $valores['distancia_max'],
        $valores['velocidad'],
        $valores['tipo_municion'],
        $valores['clase1'],
        $valores['clase2'],
        $valores['clase3'],
        $valores['clase4'],
        $valores['clase5'],
        $valores['clase6']
    );

    if ($stmt->execute()) {
        echo "Munición añadida correctamente";
    } else {
        echo "Error al insertar: " . $stmt->error;
    }

// Manejo de eliminación de municiones
} elseif ($action === 'eliminar') {
    $id = $_POST['id'] ?? 0;
    if ($id) {
        $stmt = $conn->prepare("DELETE FROM municiones WHERE id = ?");
        $stmt->bind_param("i", $id);
        if ($stmt->execute()) {
            echo "Munición eliminada";
        } else {
            echo "Error al eliminar: " . $stmt->error;
        }
    } else {
        echo "ID inválido";
    }

// Obtención de lista de municiones
} elseif ($action === 'obtener') {
    // Consulta y devuelve todas las municiones en formato JSON
    $result = $conn->query("SELECT id, nombre, danio, penetracion, tipo_municion FROM municiones ORDER BY id DESC");
    if (!$result) {
        http_response_code(500);
        echo "Error en consulta: " . $conn->error;
        exit;
    }

    $municiones = [];
    while ($row = $result->fetch_assoc()) {
        $municiones[] = $row;
    }
    header('Content-Type: application/json');
    echo json_encode($municiones);

} else {
    echo "Acción no válida";
}
