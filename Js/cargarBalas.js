document.addEventListener("DOMContentLoaded", () => {
    fetch("../PHP/balas.json.php")
        .then(response => response.json())
        .then(data => {
            const tabla = document.getElementById("tablaBalas");
            tabla.innerHTML = "";

            if (!Array.isArray(data) || data.length === 0) {
                tabla.innerHTML = "<tr><td colspan='10'>No hay datos disponibles</td></tr>";
                return;
            }

            data.forEach(bala => {
                let fila = document.createElement("tr");

                fila.innerHTML = `
                    <td>${bala.id}</td>
                    <td>${bala.nombre}</td>
                    <td>${bala.daño}</td>
                    <td>${bala.penetracion}</td>
                    <td>${bala.frag_percent}%</td>
                    <td>${bala.retroceso}</td>
                    <td>${bala.precision_bala}</td>
                    <td>${bala.distanciaEf}</td>
                    <td>${bala.distanciaMax}</td>
                    <td>${bala.velocidad} m/s</td>
                    <td>${bala.tier.nivel} - ${bala.tier.efectividad}</td>
                    <td>${bala.clases.Clase1}</td>
                    <td>${bala.clases.Clase2}</td>
                    <td>${bala.clases.Clase3}</td>
                    <td>${bala.clases.Clase4}</td>
                    <td>${bala.clases.Clase5}</td>
                    <td>${bala.clases.Clase6}</td>
                `;

                tabla.appendChild(fila);
            });
        })
        .catch(error => console.error("Error cargando los datos:", error));
});
