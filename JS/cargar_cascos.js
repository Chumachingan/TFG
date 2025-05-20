document.addEventListener("DOMContentLoaded", () => {
  fetch("../PHP/cargar_cascos.php")
    .then(response => response.json())
    .then(data => {
      const contenedor = document.getElementById("contenedor-cascos");

      data.forEach(casco => {
        const card = document.createElement("div");
        card.className = "casco-card";

        const imagen = document.createElement("img");
        imagen.src = casco.imagen;
        imagen.alt = casco.nombre;

        const titulo = document.createElement("h3");
        titulo.textContent = casco.nombre;

        const descripcion = document.createElement("p");
        descripcion.textContent = casco.descripcion;

        card.appendChild(imagen);
        card.appendChild(titulo);
        card.appendChild(descripcion);

        contenedor.appendChild(card);
      });
    })
    .catch(err => {
      console.error("Error cargando cascos:", err);
    });
});
