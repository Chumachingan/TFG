<?php
session_start();
include 'conexion.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre_usuario = $_POST['nombre_usuario'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM usuarios WHERE nombre_usuario = ?";
    $stmt = $conexion->prepare($sql);
    $stmt->execute([$nombre_usuario]);
    $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($usuario && password_verify($password, $usuario['password_hash'])) {
        $_SESSION['usuario'] = $usuario['nombre_usuario'];
        header("Location: ../Index.html?login=ok");
        exit();
    } else {
        header("Location: ../Index.html?error=1");
        exit();
    }
}
?>
