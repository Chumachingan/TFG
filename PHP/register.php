<?php
// Incluye la configuración de la base de datos y inicia la sesión
include 'db.php';
session_start();

// Configura la visualización de errores para debugging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Procesa el formulario de registro cuando se envía por POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verifica que todos los campos necesarios existan
    if (!isset($_POST['username'], $_POST['email'], $_POST['password'])) {
        die("❌ Faltan datos.");
    }

    // Limpia los datos de entrada
    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    // Verifica que ningún campo esté vacío
    if (empty($username) || empty($email) || empty($password)) {
        die("❌ Campos vacíos.");
    }

    // Valida el formato del email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("❌ Correo inválido.");
    }

    // Hashea la contraseña
    $hashed_password = password_hash($password, PASSWORD_BCRYPT);

    // Verifica si el usuario o email ya existen
    $stmt = $conn->prepare("SELECT id FROM usuarios WHERE nombre_usuario = ? OR correo = ?");
    if (!$stmt) {
        die("Error SELECT: " . $conn->error);
    }
    $stmt->bind_param("ss", $username, $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        die("❌ Usuario o correo ya existe.");
    }
    $stmt->close();

    // Inserta el nuevo usuario
    $stmt = $conn->prepare("INSERT INTO usuarios (nombre_usuario, correo, contraseña, id_rol) VALUES (?, ?, ?, 2)");
    if (!$stmt) {
        die("Error INSERT: " . $conn->error);
    }
    $stmt->bind_param("sss", $username, $email, $hashed_password);

    // Ejecuta la inserción y maneja errores
    if (!$stmt->execute()) {
        die("❌ Error al insertar: " . $stmt->error);
    }

    echo "✅ Usuario registrado correctamente.";
    $stmt->close();
    $conn->close();
}
?>
