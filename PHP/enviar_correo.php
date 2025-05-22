<?php
// Para depuración, muestra errores de PHP y PHPMailer
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require_once __DIR__ . '/../PHPMailer/src/Exception.php';
require_once __DIR__ . '/../PHPMailer/src/PHPMailer.php';
require_once __DIR__ . '/../PHPMailer/src/SMTP.php';

// Cambia este correo por el tuyo
$destinatario = "ivanvilac@gmail.com";

// Recoge los datos del formulario
$correoUsuario = isset($_POST['correoUsuario']) ? trim($_POST['correoUsuario']) : '';
$mensaje = isset($_POST['mensaje']) ? trim($_POST['mensaje']) : '';

if (!$correoUsuario || !$mensaje) {
    http_response_code(400);
    echo "Faltan datos obligatorios.";
    exit;
}

if (!filter_var($correoUsuario, FILTER_VALIDATE_EMAIL)) {
    http_response_code(400);
    echo "Correo electrónico no válido.";
    exit;
}

$mail = new PHPMailer(true);
try {
    // Configuración SMTP de Gmail
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'ivanvilac@gmail.com'; // Cambia por tu correo Gmail
    // Usa una contraseña de aplicación de Gmail, NO tu contraseña normal
    $mail->Password = 'wylz vmtn gzbf rocy'; // Reemplaza esto por una contraseña de aplicación real
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
    $mail->Port = 587;

    // Opcional: Mostrar errores de PHPMailer para depuración
    // $mail->SMTPDebug = 2; // Descomenta para ver mensajes de depuración detallados en la respuesta

    $mail->setFrom($correoUsuario, 'Contacto Web');
    $mail->addAddress($destinatario);
    $mail->addReplyTo($correoUsuario);

    $mail->Subject = "Problema/Dudas";
    $mail->Body = "Mensaje enviado desde el formulario de contacto:\n\nCorreo del usuario: $correoUsuario\n\nMensaje:\n$mensaje\n";

    $mail->send();
    echo "¡Mensaje enviado correctamente!";
} catch (Exception $e) {
    http_response_code(500);
    echo "Error al enviar el mensaje: {$mail->ErrorInfo}";
}
?>
