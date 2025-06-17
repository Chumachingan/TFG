<?php
include 'db.php';

// Obtiene la acción a realizar
$action = $_REQUEST['action'] ?? '';

// Maneja la inserción de nuevos auriculares
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $action !== 'eliminar') {
    // Obtiene y valida los datos del formulario
    $nombre = $_POST['nombre'] ?? '';
    $descripcion = $_POST['descripcion'] ?? '';
    $imagen = $_POST['imagen'] ?? '';

    if ($nombre && $descripcion && $imagen) {
        $stmt = $conn->prepare("INSERT INTO auriculares (nombre, descripcion, imagen) VALUES (?, ?, ?)");
        if (!$stmt) {
            http_response_code(500);
            echo "Error en prepare(): " . $conn->error;
            exit;
        }
        $stmt->bind_param("sss", $nombre, $descripcion, $imagen);

        if ($stmt->execute()) {
            echo "Auricular añadido correctamente";
        } else {
            echo "Error al insertar: " . $stmt->error;
        }
    } else {
        echo "Faltan datos del formulario";
    }

// Maneja la eliminación de auriculares
} elseif ($action === 'eliminar') {
    $id = $_POST['id'] ?? 0;
    if ($id) {
        $stmt = $conn->prepare("DELETE FROM auriculares WHERE id = ?");
        $stmt->bind_param("i", $id);
        if ($stmt->execute()) {
            echo "Auricular eliminado";
        } else {
            echo "Error al eliminar: " . $stmt->error;
        }
    } else {
        echo "ID inválido";
    }

// Obtiene la lista de auriculares
} elseif ($action === 'obtener') {
    // Consulta y devuelve todos los auriculares en formato JSON
    $result = $conn->query("SELECT id, nombre, descripcion FROM auriculares ORDER BY id DESC");
    if (!$result) {
        http_response_code(500);
        echo "Error en consulta: " . $conn->error;
        exit;
    }

    $auriculares = [];
    while ($row = $result->fetch_assoc()) {
        $auriculares[] = $row;
    }
    header('Content-Type: application/json');
    echo json_encode($auriculares);

} else {
    echo "Acción no válida";
}
