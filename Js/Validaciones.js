// Función de validación para el formulario de inicio de sesión
function validarLogin(event) {
    const emailOrUsername = document.querySelector("#loginModal input[type='email']");
    const password = document.querySelector("#loginModal input[type='password']");

    if (!emailOrUsername.value) {
        alert("Por favor, ingresa tu correo o nombre de usuario.");
        event.preventDefault();
        return;
    } else if (!validarCorreo(emailOrUsername.value) && !validarNombreUsuario(emailOrUsername.value)) {
        alert("Correo electrónico o nombre de usuario inválido.");
        event.preventDefault();
        return;
    }

    if (!validarContraseña(password.value)) {
        alert("La contraseña debe tener al menos un carácter especial (por ejemplo, !, @, #, etc.).");
        event.preventDefault();
    }
}

function validarCorreo(correo) {
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(correo);
}

function validarNombreUsuario(nombre) {
    const regex = /^[a-zA-Z0-9]+$/;
    return regex.test(nombre);
}

function validarContraseña(contraseña) {
    const regex = /[!@#$%^&*(),.?":{}|<>]/;
    return regex.test(contraseña);
}

document.getElementById("loginForm").addEventListener("submit", validarLogin);

