<?php
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);

    $stmt = $conn->prepare("INSERT INTO Usuarios (nombre_usuario, correo, contraseña, id_rol) VALUES (?, ?, ?, 2)");
    $stmt->bind_param("sss", $username, $email, $password);
    
    if ($stmt->execute()) {
        echo "Registro exitoso. <a href='login.html'>Iniciar sesión</a>";
    } else {
        echo "Error al registrar usuario.";
    }
    $stmt->close();
    $conn->close();
}
?>
