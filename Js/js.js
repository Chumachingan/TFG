document.addEventListener("DOMContentLoaded", () => {
    cargarModales(); // Cargar los modales dinámicamente

    document.getElementById("loginBtn").addEventListener("click", () => abrirModal("loginModal"));
    document.getElementById("registerBtn").addEventListener("click", () => abrirModal("registerModal"));

    setupFormHandler("loginForm", "http://localhost/TFG/PHP/login.php", "loginMessage");
    setupFormHandler("registerForm", "http://localhost/TFG/PHP/register.php", "registerMessage");

    // Comprobar si el usuario está autenticado
    if (localStorage.getItem("isAuthenticated") === "true") {
        mostrarBotonCerrarSesion(); // Mostrar el botón de cerrar sesión si ya está autenticado
    }

    document.getElementById("logoutBtn").addEventListener("click", cerrarSesion); // Agregar el evento de cerrar sesión
});

// Función para cargar los modales dinámicamente en el contenedor
function cargarModales() {
    document.getElementById("modal-container").innerHTML = `
        <!-- Overlay para los modales -->
        <div class="overlay" id="overlay" onclick="cerrarModal()"></div>

        <!-- Modal de inicio de sesión -->
        <div class="modal" id="loginModal">
            <span class="close-btn" onclick="cerrarModal()">&times;</span>
            <h2>Iniciar Sesión</h2>
            <form id="loginForm">
                <input type="email" placeholder="Correo Electrónico / Usuario" name="email" required>
                <input type="password" placeholder="Contraseña" name="password" required>
                <div class="remember-me">
                    <input type="checkbox" id="remember-password">
                    <label for="remember-password">Recordar contraseña</label>
                </div>
                <button type="submit">Acceder</button>
                <div class="links-container">
                    <h5 class="registrarse" onclick="mostrarModalRegistro()">Registrarse</h5>
                    <h5 class="contrasena" onclick="modalRecuperarContraseña()">¿Olvidaste tu Contraseña?</h5>
                </div>
            </form>
        </div>

        <!-- Modal de registro -->
        <div class="modal" id="registerModal">
            <span class="close-btn" onclick="cerrarModal()">&times;</span>
            <h2>Registrarse</h2>
            <form id="registerForm">
                <label for="registerUsername">Usuario:</label>
                <input type="text" id="registerUsername" name="username" placeholder="Usuario" required>

                <label for="registerEmail">Correo Electrónico:</label>
                <input type="email" id="registerEmail" name="email" placeholder="Correo Electrónico" required>

                <label for="registerPassword">Contraseña:</label>
                <input type="password" id="registerPassword" name="password" placeholder="Contraseña" required>

                <button type="submit">Registrarse</button>
            </form>
            <p id="registerMessage"></p>
        </div>

        <!-- Modal para Olvidaste tu Contraseña -->
        <div class="modal" id="forgotPasswordModal">
            <span class="close-btn" onclick="cerrarModal()">&times;</span>
            <h2>Recuperar Contraseña</h2>
            <form id="forgotPasswordForm">
                <label for="forgotPasswordEmail">Correo Electrónico:</label>
                <input type="email" id="forgotPasswordEmail" name="email" placeholder="Correo Electrónico" required>
                <button type="submit">Recuperar Contraseña</button>
            </form>
            <p id="forgotPasswordMessage"></p>
        </div>
    `;
}

// Función para abrir el modal
function abrirModal(id) {
    document.getElementById("overlay").style.display = "block";
    document.getElementById(id).style.display = "block";
}

// Función para cerrar el modal
function cerrarModal() {
    document.getElementById("overlay").style.display = "none";
    document.querySelectorAll(".modal").forEach(modal => {
        modal.style.display = "none";
    });
}

// Funciones para cambiar entre modales
function mostrarModalRegistro() {
    cerrarModal();
    abrirModal("registerModal");
}

function modalRecuperarContraseña() {
    cerrarModal();
    abrirModal("forgotPasswordModal");
}

// Función para manejar formularios y enviarlos mediante AJAX
function setupFormHandler(formId, url, messageContainerId) {
    const form = document.getElementById(formId);
    form.addEventListener("submit", event => {
        event.preventDefault();
        const formData = new FormData(form);
        fetch(url,"http:localhost/TFG/PHP/login.php", {
            method: 'POST',
            body: formData
        })
        .then(response => response.text())
        .then(text => document.getElementById(messageContainerId).innerHTML = text)
        .catch(error => document.getElementById(messageContainerId).innerHTML = 'Error al enviar los datos.');
    });
}

// Función para mostrar los botones correspondientes cuando el usuario está autenticado
function mostrarBotonCerrarSesion() {
    document.getElementById("loginBtn").style.display = "none";
    document.getElementById("registerBtn").style.display = "none";
    document.getElementById("logoutBtn").style.display = "block";
}

// Función para iniciar sesión
function iniciarSesion() {
    // Aquí harías la validación de los datos del formulario de login
    // Si la validación es correcta, almacenamos el estado de autenticación en el localStorage
    localStorage.setItem("isAuthenticated", "true");
    mostrarBotonCerrarSesion();
}

// Función para cerrar sesión
function cerrarSesion() {
    localStorage.removeItem("isAuthenticated"); // Removemos el estado de autenticación
    document.getElementById("loginBtn").style.display = "block";
    document.getElementById("registerBtn").style.display = "block";
    document.getElementById("logoutBtn").style.display = "none";
}
