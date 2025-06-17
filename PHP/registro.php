<?php
// Inicia la sesión y conecta a la base de datos
session_start();
include 'conexion.php';

// Procesa el formulario de registro cuando se envía por POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene y procesa los datos del formulario
    $nombre_usuario = $_POST['nombre_usuario'];
    $email = $_POST['email'];
    // Hashea la contraseña para almacenamiento seguro
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    // Prepara la consulta SQL para insertar nuevo usuario
    $sql = "INSERT INTO usuarios (nombre_usuario, email, password_hash) VALUES (?, ?, ?)";
    $stmt = $conexion->prepare($sql);

    try {
        // Intenta ejecutar la inserción
        $stmt->execute([$nombre_usuario, $email, $password]);
        // Si es exitoso, inicia sesión y redirige
        $_SESSION['usuario'] = $nombre_usuario;
        header("Location: ../Index.html");
        exit();
    } catch (PDOException $e) {
        // Maneja cualquier error durante el proceso
        echo "Error: " . $e->getMessage();
    }
}
?>
