document.addEventListener("DOMContentLoaded", () => {
    fetch("/TFG/PHP/balas.json.php")
        .then(response => {
            if (!response.ok) {
                throw new Error("Error en la respuesta del servidor");
            }
            return response.json();
        })
        .then(data => {
            const contenedor = document.getElementById("DivBalas");
            contenedor.innerHTML = ""; // Limpiar contenido antes de agregar las tablas

            let tablaIndex = 1;
            for (let i = 0; i < data.length; i += 10) {
                let subset = data.slice(i, i + 10); // Tomar 10 elementos
                let tablaHTML = `
                    <h2>Tabla ${tablaIndex}</h2>
                    <table class="InfoBalas">
                        <thead>
                            <tr class="cabezera">
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Daño</th>
                                <th>Distancia Máx</th>
                                <th>Distancia Efectiva</th>
                                <th>Precisión</th>
                                <th>Penetración</th>
                                <th>Retroceso</th>
                                <th>Frag. %</th>
                                <th>Tier</th>
                            </tr>
                        </thead>
                        <tbody>
                `;

                subset.forEach(bala => {
                    tablaHTML += `
                        <tr class="TierBalas${bala.tier_id}">
                            <td>${bala.id}</td>
                            <td>${bala.nombre}</td>
                            <td>${bala.daño}</td>
                            <td>${bala.distanciaMax}</td>
                            <td>${bala.distanciaEf}</td>
                            <td>${bala.precision_bala}</td>
                            <td>${bala.penetracion}</td>
                            <td>${bala.retroceso}</td>
                            <td>${bala.frag_percent}</td>
                            <td>${bala.tier_id}</td>
                        </tr>
                    `;
                });

                tablaHTML += `</tbody></table>`;
                contenedor.innerHTML += tablaHTML;
                tablaIndex++;
            }
        })
        .catch(error => console.error("Error cargando los datos:", error));
});
