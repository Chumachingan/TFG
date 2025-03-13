<?php
session_start();
include("db.php"); // Asegúrate de que db.php tiene conexión a la base de datos

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $emailOrUsername = $_POST['email'];
    $password = $_POST['password'];

    $stmt = $db->prepare("SELECT id, nombre_usuario, contraseña FROM usuarios WHERE correo = ? OR nombre_usuario = ?");
    $stmt->execute([$emailOrUsername, $emailOrUsername]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($password, $user['contraseña'])) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['nombre_usuario'];
        echo "Inicio de sesión exitoso";
    } else {
        echo "Credenciales incorrectas";
    }
}
?>
