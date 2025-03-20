document.addEventListener("DOMContentLoaded", () => {
    cargarModales();
    verificarSesion();

    const loginBtn = document.getElementById("loginBtn");
    const registerBtn = document.getElementById("registerBtn");
    const logoutBtn = document.getElementById("logoutBtn");

    if (loginBtn) {
        loginBtn.style.display = "block";
        loginBtn.addEventListener("click", () => abrirModal("loginModal"));
    } else {
        console.error("Elemento loginBtn no encontrado.");
    }

    if (registerBtn) {
        registerBtn.style.display = "block";
        registerBtn.addEventListener("click", () => abrirModal("registerModal"));
    } else {
        console.error("Elemento registerBtn no encontrado.");
    }

    if (logoutBtn) {
        logoutBtn.style.display = "none";
        logoutBtn.addEventListener("click", cerrarSesion);
    } else {
        console.error("Elemento logoutBtn no encontrado.");
    }

    setupFormHandler("loginForm", "http://localhost/TFG/PHP/login.php", "loginMessage");
    setupFormHandler("registerForm", "http://localhost/TFG/PHP/register.php", "registerMessage");
});

// ================== FUNCIONES MODALES ================== //
function cargarModales() {
    document.getElementById("modal-container").innerHTML = `
        <div class="overlay" id="overlay" onclick="cerrarModal()"></div>

        <!-- Modal Login -->
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
                <p id="loginMessage"></p>
            </form>
        </div>

        <!-- Modal Register -->
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
                <p id="registerMessage"></p>
            </form>
        </div>

        <!-- Modal Recuperar Contraseña -->
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

    // Agregar el evento después de que los elementos estén en el DOM
    document.getElementById("loginForm").addEventListener("submit", validarLogin);
}

// ================== FUNCIONALIDAD SESIÓN ================== //
function verificarSesion() {
    const usuario = localStorage.getItem('sesionActiva');
    console.log("Sesión Activa:", usuario);
    const loginBtn = document.getElementById("loginBtn");
    const registerBtn = document.getElementById("registerBtn");
    const logoutBtn = document.getElementById("logoutBtn");

    if (usuario) {
        if (loginBtn) loginBtn.style.display = "none";
        if (registerBtn) registerBtn.style.display = "none";
        if (logoutBtn) logoutBtn.style.display = "block";
    } else {
        if (loginBtn) loginBtn.style.display = "block";
        if (registerBtn) registerBtn.style.display = "block";
        if (logoutBtn) logoutBtn.style.display = "none";
    }
}

function cerrarSesion() {
    localStorage.removeItem('sesionActiva');
    alert("Sesión cerrada.");
    verificarSesion();
    location.reload();
}

// ================== FUNCIONES AUXILIARES ================== //
function abrirModal(id) {
    document.getElementById("overlay").style.display = "block";
    document.getElementById(id).style.display = "block";
}

function cerrarModal() {
    document.getElementById("overlay").style.display = "none";
    document.querySelectorAll(".modal").forEach(modal => {
        modal.style.display = "none";
    });
}

function mostrarModalRegistro() {
    cerrarModal();
    abrirModal("registerModal");
}

function modalRecuperarContraseña() {
    cerrarModal();
    abrirModal("forgotPasswordModal");
}

function setupFormHandler(formId, url, messageContainerId) {
    const form = document.getElementById(formId);
    if (form) {
        form.addEventListener("submit", event => {
            event.preventDefault();
            const formData = new FormData(form);

            localStorage.setItem('sesionActiva', 'true');
            console.log("Sesión iniciada.");

            document.getElementById(messageContainerId).innerHTML = "¡Operación exitosa!";
            cerrarModal();
            verificarSesion();
            alert("Redirigiendo...");

            form.reset();
        });
    } else {
        console.error(`Formulario con ID ${formId} no encontrado.`);
    }
}