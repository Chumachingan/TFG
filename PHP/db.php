<?php
$servername = "localhost";
$username = "root"; // Cambia si usas otro usuario
$password = ""; // Cambia si tienes contraseña
$dbname = "tfg_db2";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

?>
