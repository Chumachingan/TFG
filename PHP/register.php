<?php
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verificar si los datos fueron enviados correctamente
    if (!isset($_POST['username'], $_POST['email'], $_POST['password'])) {
        die("❌ Error: Datos incompletos.");
    }

    // Recibir los datos del formulario
    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    // Validaciones básicas
    if (empty($username) || empty($email) || empty($password)) {
        die("❌ Error: No se permiten campos vacíos.");
    }
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("❌ Error: Formato de correo inválido.");
    }

    // Encriptar la contraseña
    $hashed_password = password_hash($password, PASSWORD_BCRYPT);

    // Verificar si el correo o nombre de usuario ya existen
    $stmt = $conn->prepare("SELECT id FROM Usuarios WHERE nombre_usuario = ? OR correo = ?");
    $stmt->bind_param("ss", $username, $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        die("❌ Error: El usuario o correo ya están registrados.");
    }

    $stmt->close();

    // Insertar el nuevo usuario en la base de datos
    $stmt = $conn->prepare("INSERT INTO Usuarios (nombre_usuario, correo, contraseña, id_rol) VALUES (?, ?, ?, 2)");
    $stmt->bind_param("sss", $username, $email, $hashed_password);

    if ($stmt->execute()) {
        echo "✅ Registro exitoso. <a href='login.html'>Iniciar sesión</a>";
    } else {
        echo "❌ Error al registrar usuario: " . $stmt->error;
    }

    // Cerrar conexiones
    $stmt->close();
    $conn->close();
}
?>
