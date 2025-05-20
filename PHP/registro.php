<?php
session_start();
include 'conexion.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre_usuario = $_POST['nombre_usuario'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $sql = "INSERT INTO usuarios (nombre_usuario, email, password_hash) VALUES (?, ?, ?)";
    $stmt = $conexion->prepare($sql);

    try {
        $stmt->execute([$nombre_usuario, $email, $password]);
        $_SESSION['usuario'] = $nombre_usuario;
        header("Location: ../Index.html");
        exit();
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>
