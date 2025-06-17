<?php
// Inicia la sesión e incluye la configuración de la base de datos
session_start();
include 'conexion.php';

// Procesa el formulario de login
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtiene credenciales del formulario
    $nombre_usuario = $_POST['nombre_usuario'];
    $password = $_POST['password'];

    // Consulta el usuario en la base de datos
    $sql = "SELECT * FROM usuarios WHERE nombre_usuario = ?";
    $stmt = $conexion->prepare($sql);
    $stmt->execute([$nombre_usuario]);
    $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

    // Verifica las credenciales
    if ($usuario && password_verify($password, $usuario['password_hash'])) {
        // Establece la sesión del usuario
        $_SESSION['usuario'] = $usuario['nombre_usuario'];
        $_SESSION['es_admin'] = $usuario['es_admin'];
        header("Location: ../Index.html?login=ok");
        exit();
    } else {
        // Error de autenticación
        header("Location: ../Index.html?error=1");
        exit();
    }
}
?>
