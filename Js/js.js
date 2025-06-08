document.addEventListener("DOMContentLoaded", () => {
    verificarSesion();

    const loginForm = document.getElementById("loginForm");
    const registerForm = document.getElementById("registerForm");

    if (loginForm) {
        setupFormHandler("loginForm", getPHPPath("login.php"), "loginMessage");
    }

    if (registerForm) {
        setupFormHandler("registerForm", getPHPPath("register.php"), "registerMessage");
    }

    const loginBtn = document.getElementById("loginBtn");
    const registerBtn = document.getElementById("registerBtn");
    const logoutBtn = document.getElementById("logoutBtn");

    if (loginBtn) loginBtn.addEventListener("click", () => abrirModal("loginModal"));
    if (registerBtn) registerBtn.addEventListener("click", () => abrirModal("registerModal"));
    if (logoutBtn) logoutBtn.addEventListener("click", cerrarSesion);
});

function getPHPPath(file) {
    // Calcular la ruta correcta según la profundidad de carpetas
    const depth = location.pathname.split("/").filter(p => p).length - 1;
    return "../".repeat(depth) + "PHP/" + file;
}

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

function cerrarSesion() {
    localStorage.removeItem('sesionActiva');
    fetch(getPHPPath("logout.php"))
        .then(() => {
            verificarSesion();
            window.location.href = "index.html";
        })
        .catch((error) => {
            console.error("Error al cerrar sesión:", error);
        });
}

function abrirModal(id) {
    document.getElementById("overlay")?.style.setProperty("display", "block");
    document.getElementById(id)?.style.setProperty("display", "block");
}

function cerrarModal() {
    document.getElementById("overlay")?.style.setProperty("display", "none");
    document.querySelectorAll(".modal").forEach(modal => modal.style.display = "none");
}

function setupFormHandler(formId, url, messageContainerId) {
    const form = document.getElementById(formId);
    const messageContainer = document.getElementById(messageContainerId);

    if (form) {
        form.addEventListener("submit", event => {
            event.preventDefault();
            console.log("🔁 Enviando formulario:", formId);

            const formData = new FormData(form);

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
