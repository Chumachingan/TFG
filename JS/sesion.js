document.addEventListener("DOMContentLoaded", () => {
    // Determina la ruta correcta para acceder a session.php
    let ruta = "PHP/session.php";
    if (window.location.pathname.includes("/HTML/")) {
        ruta = "../PHP/session.php";
    }

    // Verifica el estado de la sesión y actualiza la UI
    fetch(ruta)
        .then(res => res.json())
        .then(data => {
            // Obtiene referencias a elementos de UI
            const btnLogin = document.getElementById("btn-login");
            const btnRegister = document.getElementById("btn-register");
            const logoutForm = document.getElementById("logout-form");
            const adminLink = document.getElementById("nav-admin-link");

            if (data && data.usuario) {
                if (btnLogin) btnLogin.style.display = "none";
                if (btnRegister) btnRegister.style.display = "none";
                if (logoutForm) logoutForm.style.display = "block";
                if (adminLink) {
                    if (data.es_admin == 1) {
                        adminLink.style.display = "inline-block";
                    } else {
                        adminLink.style.display = "none";
                    }
                }
            } else {
                if (btnLogin) btnLogin.style.display = "block";
                if (btnRegister) btnRegister.style.display = "block";
                if (logoutForm) logoutForm.style.display = "none";
                if (adminLink) adminLink.style.display = "none";
            }
        });
});
