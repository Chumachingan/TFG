// Función de validación para el formulario de inicio de sesión
function validarLogin(event) {
    const emailOrUsername = document.querySelector("#loginModal input[type='email']");
    const password = document.querySelector("#loginModal input[type='password']");

    // Validación del correo o nombre de usuario
    if (!emailOrUsername.value) {
        alert("Por favor, ingresa tu correo o nombre de usuario.");
        event.preventDefault(); // Evita el envío del formulario
        return;
    } else if (!validarCorreo(emailOrUsername.value) && !validarNombreUsuario(emailOrUsername.value)) {
        alert("Correo electrónico o nombre de usuario inválido.");
        event.preventDefault();
        return;
    }

    // Validación de la contraseña (debe tener al menos un carácter especial)
    if (!validarContraseña(password.value)) {
        alert("La contraseña debe tener al menos un carácter especial (por ejemplo, !, @, #, etc.).");
        event.preventDefault(); // Evita el envío del formulario
    }
}

// Función para validar el correo electrónico
function validarCorreo(correo) {
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(correo);
}

// Función para validar el nombre de usuario (solo letras y números)
function validarNombreUsuario(nombre) {
    const regex = /^[a-zA-Z0-9]+$/; // Solo letras y números
    return regex.test(nombre);
}

// Función para validar la contraseña (al menos un carácter especial)
function validarContraseña(contraseña) {
    const regex = /[!@#$%^&*(),.?":{}|<>]/; // Caracteres especiales
    return regex.test(contraseña);
}

// Asociar la validación con el formulario de inicio de sesión
document.getElementById("loginForm").addEventListener("submit", validarLogin);
