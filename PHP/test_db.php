<?php
$servername = "localhost"; // O el que uses
$username = "root"; // O el usuario de tu BD
$password = ""; // Si tienes contraseña, agrégala aquí
$dbname = "tfg_db"; // Asegúrate de que es el nombre correcto de tu BD

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
} else {
    echo "Conexión exitosa a la base de datos.";
}
?>
