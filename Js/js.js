// Espera a que el DOM esté completamente cargado antes de ejecutar el código
document.addEventListener("DOMContentLoaded", () => {
    // Verifica el estado de la sesión al cargar la página
    verificarSesion();

    // Obtiene referencias a los formularios de login y registro
    const loginForm = document.getElementById("loginForm");
    const registerForm = document.getElementById("registerForm");

    // Configura los manejadores de eventos para los formularios si existen
    if (loginForm) {
        setupFormHandler("loginForm", getPHPPath("login.php"), "loginMessage");
    }

    if (registerForm) {
        setupFormHandler("registerForm", getPHPPath("register.php"), "registerMessage");
    }

    // Configura los botones de la interfaz
    const loginBtn = document.getElementById("loginBtn");
    const registerBtn = document.getElementById("registerBtn");
    const logoutBtn = document.getElementById("logoutBtn");

    // Añade event listeners a los botones para abrir modales y cerrar sesión
    if (loginBtn) loginBtn.addEventListener("click", () => abrirModal("loginModal"));
    if (registerBtn) registerBtn.addEventListener("click", () => abrirModal("registerModal"));
    if (logoutBtn) logoutBtn.addEventListener("click", cerrarSesion);
});

// Función para obtener la ruta correcta a los archivos PHP
function getPHPPath(file) {
    // Calcular la ruta correcta según la profundidad de carpetas
    const depth = location.pathname.split("/").filter(p => p).length - 1;
    return "../".repeat(depth) + "PHP/" + file;
}

// Función para manejar la visibilidad de botones según el estado de la sesión
function verificarSesion() {
    const usuario = localStorage.getItem('sesionActiva');
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

// Función para cerrar la sesión del usuario
function cerrarSesion() {
    // Elimina la sesión del almacenamiento local
    localStorage.removeItem('sesionActiva');
    
    // Hace una petición al servidor para cerrar la sesión
    fetch(getPHPPath("logout.php"))
        .then(() => {
            verificarSesion();
            window.location.href = "index.html";
        })
        .catch((error) => {
            console.error("Error al cerrar sesión:", error);
        });
}

// Funciones para manejar los modales
function abrirModal(id) {
    document.getElementById("overlay")?.style.setProperty("display", "block");
    document.getElementById(id)?.style.setProperty("display", "block");
}

function cerrarModal() {
    document.getElementById("overlay")?.style.setProperty("display", "none");
    document.querySelectorAll(".modal").forEach(modal => modal.style.display = "none");
}

// Configura el manejo de envío de formularios
function setupFormHandler(formId, url, messageContainerId) {
    const form = document.getElementById(formId);
    const messageContainer = document.getElementById(messageContainerId);

    if (form) {
        form.addEventListener("submit", event => {
            event.preventDefault();
            console.log("🔁 Enviando formulario:", formId);

            const formData = new FormData(form);

            // Realiza la petición al servidor
            fetch(url, {
                method: "POST",
                body: formData,
            })
            .then(response => response.text())
            .then(data => {
                if (messageContainer) messageContainer.innerHTML = data;

                if (data.includes("✅ Usuario registrado correctamente") || data.includes("✅ Bienvenido")) {
                    localStorage.setItem("sesionActiva", "true");
                    cerrarModal();
                    verificarSesion();
                    setTimeout(() => {
                        window.location.href = "index.html";
                    }, 1000);
                }

                alert(data);
            })
            .catch(error => {
                if (messageContainer) messageContainer.innerHTML = "❌ Error en la solicitud.";
                console.error(error);
            });

            form.reset();
        });
    }
}
