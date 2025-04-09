document.addEventListener("DOMContentLoaded", () => {
    fetch("../PHP/balas.json.php")
        .then(res => res.json())
        .then(data => {
            const divContenedor = document.getElementById("DivBalas");

            if (!divContenedor) {
                console.error("No se encontró el contenedor de tablas.");
                return;
            }

            divContenedor.innerHTML = ""; // Limpiar contenido anterior

            // 🔹 Generar las tablas de balas con desplegables
            Object.keys(data.balas).forEach(tipo => {
                const tablaHTML = `
                    <details>
                        <summary><strong>${tipo}</strong></summary>
                        <table class="InfoBalas">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Daño</th>
                                    <th>Penetración</th>
                                    <th>Frag%</th>
                                    <th>Retroceso</th>
                                    <th>Precisión</th>
                                    <th>Distancia Efectiva</th>
                                    <th>Distancia Máx</th>
                                    <th>Velocidad</th>
                                    <th>Clase1</th>
                                    <th>Clase2</th>
                                    <th>Clase3</th>
                                    <th>Clase4</th>
                                    <th>Clase5</th>
                                    <th>Clase6</th>
                                </tr>
                            </thead>
                            <tbody id="tabla-${tipo.replace(/\s/g, '')}"></tbody>
                        </table>
                    </details>
                `;

                divContenedor.innerHTML += tablaHTML;
                const tbody = document.getElementById(`tabla-${tipo.replace(/\s/g, '')}`);

                Object.values(data.balas[tipo]).forEach(bala => {
                    tbody.innerHTML += `
                        <tr>
                            <td>${bala.id}</td>
                            <td>${bala.nombre}</td>
                            <td>${bala.daño}</td>
                            <td>${bala.penetracion}</td>
                            <td>${bala.frag_percent}%</td>
                            <td>${bala.retroceso}</td>
                            <td>${bala.precision_bala}</td>
                            <td>${bala.distanciaEf}</td>
                            <td>${bala.distanciaMax}</td>
                            <td>${bala.velocidad}</td>
                            ${[1, 2, 3, 4, 5, 6].map(num => {
                                const valorClase = bala.clases && bala.clases[num] !== '-' ? bala.clases[num] : '-';
                                return `
                                    <td class="clase-${num}" style="background-color: ${obtenerColorPorValor(valorClase)}; color: black;">
                                        ${valorClase}
                                    </td>`;
                            }).join('')}
                        </tr>`;
                });
            });

            // 🔹 Agregar tabla de tiers con desplegable
            const tablaTiersHTML = `
                <details>
                    <summary><strong>Tiers</strong></summary>
                    <table class="InfoBalas">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nivel</th>
                                <th>Efectividad</th>
                                <th>Descripción</th>
                            </tr>
                        </thead>
                        <tbody id="tablaTiers"></tbody>
                    </table>
                </details>
            `;

            divContenedor.innerHTML += tablaTiersHTML;
            const tablaTiers = document.getElementById("tablaTiers");
            if (tablaTiers) {
                data.tiers.forEach(tier => {
                    tablaTiers.innerHTML += `
                        <tr>
                            <td>${tier.id}</td>
                            <td class="tier" data-tier="${tier.nivel}" style="background-color: ${obtenerColorPorNivel(tier.nivel)}; color: black;">${tier.nivel}</td>
                            <td>${tier.efectividad}</td>
                            <td>${tier.descripcion}</td>
                        </tr>`;
                });
            }
        })
        .catch(err => console.error("Error cargando los datos:", err));
});

// Función para asignar colores según el valor de clase
function obtenerColorPorValor(valor) {
    switch (parseInt(valor)) {
        case 1: return "#ff4c4c"; // Rojo claro
        case 2: return "#ff944c"; // Naranja
        case 3: return "#ffc94c"; // Amarillo
        case 4: return "#ffeb4c"; // Verde claro
        case 5: return "#aaff4c"; // Verde
        case 6: return "#2c9c2c"; // Verde Oscuro
        default: return "transparent"; // Sin color
    }
}

// Función para asignar colores según el nivel de tier
function obtenerColorPorNivel(nivel) {
    switch (nivel) {
        case 0: return "#ff4c4c"; // Rojo
        case 1: return "#ff944c"; // Naranja
        case 2: return "#ffc94c"; // Amarillo
        case 3: return "#ffeb4c"; // Amarillo Claro
        case 4: return "#aaff4c"; // Verde Claro
        case 5: return "#4cff4c"; // Verde
        case 6: return "#2c9c2c"; // Verde Oscuro
        default: return "transparent"; // Sin color
    }
}