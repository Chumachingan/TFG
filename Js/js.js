document.addEventListener("DOMContentLoaded", () => {
    setupFormHandler("registerForm", "http://localhost/TFG/PHP/register.php", "registerMessage");
    setupFormHandler("loginForm", "login.php", "loginMessage");

    document.getElementById("loginBtn").addEventListener("click", () => abrirModal("loginModal"));
    document.getElementById("registerBtn").addEventListener("click", () => abrirModal("registerModal"));
});

// Función para abrir el modal de registro
function mostrarModalRegistro() {
    // Cerrar el modal de login
    cerrarModal();

    // Abrir el modal de registro
    abrirModal("registerModal");
}

// Función para abrir el modal de recuperar contraseña
function modalRecuperarContraseña() {
    // Cerrar el modal de login
    cerrarModal();

    // Abrir el modal de registro
    abrirModal("forgotPasswordModal");
}

// Función para abrir el modal
function abrirModal(id) {
    document.getElementById("overlay").style.display = "block";
    document.getElementById(id).style.display = "block";
}

// Función para cerrar el modal
function cerrarModal() {
    document.getElementById("overlay").style.display = "none";
    document.getElementById("loginModal").style.display = "none";
    document.getElementById("registerModal").style.display = "none";
    document.getElementById("forgotPasswordModal").style.display = "none";
}

// Función para manejar el envío del formulario
function setupFormHandler(formId, url, messageId) {
    let form = document.getElementById(formId);
    if (!form) return; // Si el formulario no existe, no hace nada

    form.addEventListener("submit", function (e) {
        e.preventDefault();

        let formData = new FormData(this);

        fetch(url, {
            method: "POST",
            body: new URLSearchParams(formData)
        })
        .then(response => response.text())
        .then(data => {
            document.getElementById(messageId).innerText = data;
            if (data.includes("Registro exitoso") || data.includes("Bienvenido")) {
                setTimeout(() => window.location.reload(), 1000);
            }
        });
    });
}
