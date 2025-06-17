<?php
// Inicia la sesión actual
session_start();

// Destruye todos los datos de la sesión
session_destroy();

// Redirige al usuario a la página principal
header("Location: ../Index.html");

// Asegura que no se ejecute código después de la redirección
exit();
?>
