function validarLogin(event) {
    const emailOrUsername = document.querySelector("#loginModal input[type='email']");
    const passwordLogin = document.querySelector("#loginModal input[type='password']");
    const passwordRegister = document.querySelector("#registerPassword input[type='password']");

    if (!emailOrUsername.value) {
        alert("Por favor, ingresa tu correo o nombre de usuario.");
        event.preventDefault();
        return;
    } else if (!validarCorreo(emailOrUsername.value) && !validarNombreUsuario(emailOrUsername.value)) {
        alert("Correo electrónico o nombre de usuario inválido.");
        event.preventDefault();
        return;
    }

    if (!validarContraseña(passwordLogin.value)) {
        alert("La contraseña debe tener al menos un carácter especial (por ejemplo, !, @, #, etc.).");
        event.preventDefault();
    }

    if (!validarContraseña(passwordRegister.value)) {
        alert("La contraseña debe tener al menos un carácter especial (por ejemplo, !, @, #, etc.).");
        event.preventDefault();
    }
}

function validarCorreo(correo) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(correo);
}

function validarNombreUsuario(nombre) {
    return /^[a-zA-Z0-9]+$/.test(nombre);
}

function validarContraseña(contraseña) {
    return /[!@#$%^&*(),.?":{}|<>]/.test(contraseña);
}