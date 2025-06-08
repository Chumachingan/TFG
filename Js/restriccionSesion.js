document.addEventListener("DOMContentLoaded", function() {
    // Detecta la ruta correcta para session.php según la ubicación del HTML
    let ruta = "PHP/session.php";
    if (window.location.pathname.includes("/HTML/")) {
        ruta = "../PHP/session.php";
    }
    // Solo aplica si existen los elementos de restricción
    const contenido = document.getElementById("contenido-restringido");
    const aviso = document.getElementById("aviso-restringido");
    if (!contenido || !aviso) return;

    fetch(ruta)
        .then(res => res.json())
        .then(data => {
            if (!data || !data.usuario) {
                contenido.classList.add("blur-restringido");
                aviso.style.display = "flex";
            } else {
                contenido.classList.remove("blur-restringido");
                aviso.style.display = "none";
            }
        });
});
