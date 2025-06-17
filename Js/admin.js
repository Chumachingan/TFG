// Panel de administración para gestionar usuarios, municiones y auriculares

// Gestión de Usuarios
async function cargarUsuarios() {
  try {
    const res = await fetch("../PHP/gestionar_usuarios.php?action=obtener");
    const data = await res.text();

    try {
      const usuarios = JSON.parse(data);
      const lista = document.getElementById("usuarios-lista");
      lista.innerHTML = "<h3 class='titulo-usuarios'>Usuarios registrados</h3>";

      usuarios.forEach(u => {
        const card = document.createElement("div");
        card.className = "usuario-card";
        card.innerHTML = `
          <span>${u.nombre_usuario}<br><small>${u.email}</small></span>
          <button onclick="eliminarUsuario(${u.id})">Eliminar</button>
        `;
        lista.appendChild(card);
      });

    } catch (jsonErr) {
      console.error("Respuesta no válida:", data);
      alert("Error al procesar la lista de usuarios.");
    }
  } catch (err) {
    console.error("Error de red:", err);
  }
}

document.getElementById("form-usuarios").addEventListener("submit", async e => {
  e.preventDefault();
  const formData = new FormData(e.target);
  const res = await fetch("../PHP/gestionar_usuarios.php", {
    method: "POST",
    body: formData
  });
  const msg = await res.text();
  alert(msg);
  e.target.reset();
  cargarUsuarios();
});

async function eliminarUsuario(id) {
  if (!confirm("¿Seguro que deseas eliminar este usuario?")) return;
  const formData = new FormData();
  formData.append("id", id);
  formData.append("action", "eliminar");

  const res = await fetch("../PHP/gestionar_usuarios.php", {
    method: "POST",
    body: formData
  });
  const msg = await res.text();
  alert(msg);
  cargarUsuarios();
}

// Gestión de Municiones
async function cargarMuniciones() {
  try {
    const res = await fetch("../PHP/gestionar_municiones.php?action=obtener");
    const data = await res.text();

    try {
      const municiones = JSON.parse(data);
      const lista = document.getElementById("municiones-lista");
      lista.innerHTML = "<h3 class='titulo-usuarios'>Municiones registradas</h3>";

      municiones.forEach(m => {
        const card = document.createElement("div");
        card.className = "usuario-card";
        card.innerHTML = `
          <span>${m.nombre} | Daño: ${m.danio} | Pen: ${m.penetracion}<br><small>${m.tipo_municion}</small></span>
          <button onclick="eliminarMunicion(${m.id})">Eliminar</button>`;
        lista.appendChild(card);
      });
    } catch {
      console.error("Respuesta inválida:", data);
      alert("Error al cargar municiones");
    }
  } catch (err) {
    console.error("Error de red:", err);
  }
}

document.getElementById("form-municiones").addEventListener("submit", async e => {
  e.preventDefault();
  const formData = new FormData(e.target);
  const res = await fetch("../PHP/gestionar_municiones.php", {
    method: "POST",
    body: formData
  });
  const msg = await res.text();
  alert(msg);
  e.target.reset();
  cargarMuniciones();
});

async function eliminarMunicion(id) {
  if (!confirm("¿Eliminar esta munición?")) return;
  const formData = new FormData();
  formData.append("id", id);
  formData.append("action", "eliminar");

  const res = await fetch("../PHP/gestionar_municiones.php", {
    method: "POST",
    body: formData
  });
  const msg = await res.text();
  alert(msg);
  cargarMuniciones();
}

// Gestión de Auriculares
async function cargarAuriculares() {
  try {
    const res = await fetch("../PHP/gestionar_auriculares.php?action=obtener");
    const data = await res.text();

    try {
      const auriculares = JSON.parse(data);
      const lista = document.getElementById("auriculares-lista");
      lista.innerHTML = "<h3 class='titulo-usuarios'>Auriculares registrados</h3>";

      auriculares.forEach(a => {
        const card = document.createElement("div");
        card.className = "usuario-card";
        card.innerHTML = `
          <span>${a.nombre}<br><small>${a.descripcion}</small></span>
          <button onclick="eliminarAuricular(${a.id})">Eliminar</button>`;
        lista.appendChild(card);
      });
    } catch {
      console.error("Respuesta inválida:", data);
      alert("Error al cargar auriculares");
    }
  } catch (err) {
    console.error("Error de red:", err);
  }
}

document.getElementById("form-auriculares").addEventListener("submit", async e => {
  e.preventDefault();
  const formData = new FormData(e.target);
  const res = await fetch("../PHP/gestionar_auriculares.php", {
    method: "POST",
    body: formData
  });
  const msg = await res.text();
  alert(msg);
  e.target.reset();
  cargarAuriculares();
});

async function eliminarAuricular(id) {
  if (!confirm("¿Eliminar este auricular?")) return;
  const formData = new FormData();
  formData.append("id", id);
  formData.append("action", "eliminar");

  const res = await fetch("../PHP/gestionar_auriculares.php", {
    method: "POST",
    body: formData
  });
  const msg = await res.text();
  alert(msg);
  cargarAuriculares();
}

// Event Listeners para los formularios
document.addEventListener("DOMContentLoaded", () => {
  cargarUsuarios();
  cargarMuniciones();
  cargarAuriculares();
});
