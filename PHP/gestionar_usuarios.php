<?php
include 'db.php';

// Obtiene la acción a realizar
$action = $_REQUEST['action'] ?? '';

// Maneja la creación de nuevos usuarios
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $action !== 'eliminar') {
    // Obtiene y valida los datos del usuario
    $nombre = $_POST['nombre_usuario'] ?? '';
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    if ($nombre && $email && $password) {
        // Hashea la contraseña y guarda el usuario
        $hash = password_hash($password, PASSWORD_DEFAULT);
        $stmt = $conn->prepare("INSERT INTO usuarios (nombre_usuario, email, password_hash) VALUES (?, ?, ?)");
        if (!$stmt) {
            http_response_code(500);
            echo "Error en prepare(): " . $conn->error;
            exit;
        }
        $stmt->bind_param("sss", $nombre, $email, $hash);

        if ($stmt->execute()) {
            echo "Usuario añadido correctamente";
        } else {
            echo "Error al insertar: " . $stmt->error;
        }
    } else {
        echo "Faltan datos del formulario";
    }
// Maneja la eliminación de usuarios
} elseif ($action === 'eliminar') {
    $id = $_POST['id'] ?? 0;
    if ($id) {
        $stmt = $conn->prepare("DELETE FROM usuarios WHERE id = ?");
        $stmt->bind_param("i", $id);
        if ($stmt->execute()) {
            echo "Usuario eliminado";
        } else {
            echo "Error al eliminar: " . $stmt->error;
        }
    } else {
        echo "ID inválido";
    }
// Obtiene la lista de usuarios
} elseif ($action === 'obtener') {
    // Consulta y devuelve todos los usuarios en formato JSON
    $result = $conn->query("SELECT id, nombre_usuario, email FROM usuarios");
    if (!$result) {
        http_response_code(500);
        echo "Error en consulta: " . $conn->error;
        exit;
    }
    $usuarios = [];
    while ($row = $result->fetch_assoc()) {
        $usuarios[] = $row;
    }
    header('Content-Type: application/json');
    echo json_encode($usuarios);
} else {
    echo "Acción no válida";
}
