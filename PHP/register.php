<?php
include 'db.php';
session_start();

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!isset($_POST['username'], $_POST['email'], $_POST['password'])) {
        die("❌ Faltan datos.");
    }

    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    if (empty($username) || empty($email) || empty($password)) {
        die("❌ Campos vacíos.");
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("❌ Correo inválido.");
    }

    $hashed_password = password_hash($password, PASSWORD_BCRYPT);

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

    $stmt = $conn->prepare("INSERT INTO usuarios (nombre_usuario, correo, contraseña, id_rol) VALUES (?, ?, ?, 2)");
    if (!$stmt) {
        die("Error INSERT: " . $conn->error);
    }
    $stmt->bind_param("sss", $username, $email, $hashed_password);

    if (!$stmt->execute()) {
        die("❌ Error al insertar: " . $stmt->error);
    }

    echo "✅ Usuario registrado correctamente.";
    $stmt->close();
    $conn->close();
}
?>
