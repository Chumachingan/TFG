document.addEventListener("DOMContentLoaded", () => {
    fetch("../PHP/balas.json.php")
        .then(res => res.json())
        .then(balas => {
            const divContenedor = document.getElementById("DivBalas");

            if (!divContenedor) {
                console.error("No se encontró el contenedor de tablas.");
                return;
            }

            divContenedor.innerHTML = ""; // Limpiar contenido anterior

            Object.keys(balas).forEach(tipo => {
                const tablaHTML = `
                    <h2>${tipo}</h2>
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
                                <th>Tier</th>
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
                `;

                divContenedor.innerHTML += tablaHTML;

                const tbody = document.getElementById(`tabla-${tipo.replace(/\s/g, '')}`);
                Object.values(balas[tipo]).forEach(bala => {
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
                            <td class="TierBalas${bala.tier}">${bala.tier}</td>
                            ${[1, 2, 3, 4, 5, 6].map(num => `
                                <td class="clase-${bala.clases["Clase" + num] || 0}">
                                    ${bala.clases["Clase" + num] ?? '-'}
                                </td>
                            `).join('')}
                        </tr>`;
                });
            });
        })
        .catch(err => console.error("Error cargando los datos:", err));
});
