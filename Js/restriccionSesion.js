document.addEventListener("DOMContentLoaded", function() {
    // Configura la ruta para verificar la sesión
    let ruta = "PHP/session.php";
    if (window.location.pathname.includes("/HTML/")) {
        ruta = "../PHP/session.php";
    }
    // Solo aplica si existen los elementos de restricción
    const contenido = document.getElementById("contenido-restringido");
    const aviso = document.getElementById("aviso-restringido");
    if (!contenido || !aviso) return;

    // Verifica la sesión y aplica restricciones
    fetch(ruta)
        .then(res => res.json())
        .then(data => {
            // Aplica efectos visuales según el estado de la sesión
            if (!data || !data.usuario) {
                contenido.classList.add("blur-restringido");
                aviso.style.display = "flex";
            } else {
                contenido.classList.remove("blur-restringido");
                aviso.style.display = "none";
            }
        });
});
