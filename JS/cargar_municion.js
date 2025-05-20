document.addEventListener("DOMContentLoaded", () => {
  fetch("../PHP/cargar_municiones.php")
    .then(response => response.json())
    .then(data => {
      const contenedor = document.getElementById("contenedor-tablas");

      // 1. Tabla de tier_municion (SIEMPRE visible)
      if (Array.isArray(data.tiers)) {
        const tablaTiers = document.createElement("table");
        tablaTiers.className = "tabla-municion";

        const encabezadosTiers = Object.keys(data.tiers[0]).filter(k => k !== "id");
        const theadTiers = document.createElement("thead");
        const trTiers = document.createElement("tr");

        encabezadosTiers.forEach(col => {
          const th = document.createElement("th");
          th.textContent = col.charAt(0).toUpperCase() + col.slice(1);
          trTiers.appendChild(th);
        });

        theadTiers.appendChild(trTiers);
        tablaTiers.appendChild(theadTiers);

        const tbodyTiers = document.createElement("tbody");
        data.tiers.forEach(row => {
          const tr = document.createElement("tr");
          encabezadosTiers.forEach(col => {
            const td = document.createElement("td");
            const valor = row[col];
            // Si la columna es 'tier', aplicar clase de color
            if (col === "tier") {
            td.classList.add("clase", `clase-${valor}`);
            }
            td.textContent = valor;
            tr.appendChild(td);
          });
          tbodyTiers.appendChild(tr);
        });

        tablaTiers.appendChild(tbodyTiers);

        const tituloTier = document.createElement("h2");
        tituloTier.textContent = "Tiers de Munición";
        contenedor.appendChild(tituloTier);
        contenedor.appendChild(tablaTiers);
      }


      // 2. Tablas de municiones agrupadas por tipo_municion (con botón plegable)
      if (Array.isArray(data.municiones)) {
        const tipos = [...new Set(data.municiones.map(row => row.tipo_municion))];

        tipos.forEach(tipo => {
          const tabla = document.createElement("table");
          tabla.className = "tabla-municion";

          const encabezados = Object.keys(data.municiones[0])
            .filter(k => k !== "tipo_municion" && k !== "tier" && k !== "id");

          const thead = document.createElement("thead");
          const headerRow = document.createElement("tr");

          encabezados.forEach(col => {
            const th = document.createElement("th");
            th.textContent = col.charAt(0).toUpperCase() + col.slice(1);
            headerRow.appendChild(th);
          });

          thead.appendChild(headerRow);
          tabla.appendChild(thead);

          const tbody = document.createElement("tbody");
          data.municiones
            .filter(row => row.tipo_municion === tipo)
            .forEach(row => {
              const tr = document.createElement("tr");
              encabezados.forEach(col => {
                const td = document.createElement("td");
                const valor = row[col];

                if (col.startsWith("clase")) {
                  td.classList.add("clase", `clase-${valor}`);
                }

                td.textContent = valor;
                tr.appendChild(td);
              });
              tbody.appendChild(tr);
            });

          tabla.appendChild(tbody);

          const wrapper = document.createElement("div");
          wrapper.className = "tabla-plegable";

          const toggle = document.createElement("button");
          toggle.className = "toggle-tabla";
          toggle.textContent = tipo;
          toggle.addEventListener("click", () => {
            tabla.classList.toggle("oculto");
          });

          tabla.classList.add("oculto");
          wrapper.appendChild(toggle);
          wrapper.appendChild(tabla);
          contenedor.appendChild(wrapper);
        });
      }
    })
    .catch(error => {
      console.error("Error al cargar los datos:", error);
    });
});
