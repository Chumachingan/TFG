document.addEventListener("DOMContentLoaded", () => {
    cargarModales(); // Cargar los modales dinámicamente

    document.getElementById("loginBtn").addEventListener("click", () => abrirModal("loginModal"));
    document.getElementById("registerBtn").addEventListener("click", () => abrirModal("registerModal"));

    setupFormHandler("loginForm", "http://localhost/TFG/PHP/login.php", "loginMessage");
    setupFormHandler("registerForm", "http://localhost/TFG/PHP/register.php", "registerMessage");
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
            <form>
                <input type="email" placeholder="Correo Electrónico / Usuario" required>
                <input type="password" placeholder="Contraseña" required>
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
