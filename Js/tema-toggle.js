function animarYcambiarEstilo() {
  const loginBtn = document.getElementById("btn-login");
  const registerBtn = document.getElementById("btn-register");

  if (loginBtn) loginBtn.classList.add("destello");
  if (registerBtn) registerBtn.classList.add("destello");

  setTimeout(() => {
    const body = document.body;
    const nuevoTema = body.classList.contains("estilo1") ? "estilo2" : "estilo1";

    body.classList.remove("estilo1", "estilo2");
    body.classList.add(nuevoTema);

    localStorage.setItem("temaPreferido", nuevoTema); // 🔐 guardar preferencia

    if (loginBtn) loginBtn.classList.remove("destello");
    if (registerBtn) registerBtn.classList.remove("destello");
  }, 1000);
}

// Aplicar el tema guardado al cargar la página
document.addEventListener("DOMContentLoaded", () => {
  const temaGuardado = localStorage.getItem("temaPreferido");
  const body = document.body;

  if (temaGuardado === "estilo2") {
    body.classList.remove("estilo1");
    body.classList.add("estilo2");
  } else {
    body.classList.add("estilo1"); // valor por defecto
  }

  // Insertar el botón flotante
  const botonEstilo = document.createElement("button");
  botonEstilo.id = "toggle-style-btn";
  botonEstilo.title = "Cambiar estilo";
  botonEstilo.onclick = animarYcambiarEstilo;
  botonEstilo.innerHTML = `<img src="https://cdn-icons-png.flaticon.com/512/1828/1828919.png" alt="Cambiar estilo" style="width:20px;height:20px;">`;
  document.body.appendChild(botonEstilo);
});
