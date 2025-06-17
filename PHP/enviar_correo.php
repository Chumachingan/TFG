<?php
// Importación de las clases necesarias de PHPMailer
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Inclusión de los archivos necesarios para PHPMailer
require '../PHPMailer/src/PHPMailer.php';
require '../PHPMailer/src/SMTP.php';
require '../PHPMailer/src/Exception.php';

// Verifica si la petición es POST
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Limpia y valida los datos del formulario
    $correo = filter_var($_POST['correoUsuario'], FILTER_SANITIZE_EMAIL);
    $mensaje = htmlspecialchars($_POST['mensaje']);

    $mail = new PHPMailer(true);

    try {
        // Configuración del servidor SMTP de Gmail
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'wikiecapefromtarkov@gmail.com';
        $mail->Password = 'fret svpq zkcy iigh';
        $mail->SMTPSecure = 'tls';
        $mail->Port = 587;

        // Remitente y destinatario
        $mail->setFrom('wikiecapefromtarkov@gmail.com', 'Formulario de contacto');
        $mail->addReplyTo($correo);
        $mail->addAddress('wikiecapefromtarkov@gmail.com', 'Wiki EFT');

        // Contenido del correo
        $mail->isHTML(true);
        $mail->Subject = 'Mensaje desde el formulario de contacto';
        $mail->Body = "<h3>Mensaje del usuario:</h3><p>$mensaje</p><br><strong>Correo:</strong> $correo";

        $mail->send();
        echo "Mensaje enviado correctamente.";
    } catch (Exception $e) {
        echo "Error al enviar el mensaje.";
    }
} else {
    echo "Acceso no autorizado.";
}
?>
