document.addEventListener("DOMContentLoaded", () => {
    fetch("../PHP/balas.json.php")
        .then(res => res.json())
        .then(balas => {
            const tabla = document.getElementById("tablaBalas");
            tabla.innerHTML = "";

            balas.forEach(bala => {
                tabla.innerHTML += `
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
                    <td>${bala.tier_nivel}</td>
                    <td class="clase-${bala.clases.Clase1}">${bala.clases.Clase1 ?? '-'}</td>
                    <td class="clase-${bala.clases.Clase2}">${bala.clases.Clase2 || '-'}</td>
                    <td class="clase-${bala.clases.Clase3}">${bala.clases.Clase3 || '-'}</td>
                    <td class="clase-${bala.clases.Clase4}">${bala.clases.Clase4 || '-'}</td>
                    <td class="clase-${bala.clases.Clase4}">${bala.clases.Clase4 || '-'}</td>
                    <td class="clase-${bala.clases.Clase5}">${bala.clases.Clase5 || '-'}</td>
                </tr>`;
            });
        })
        .catch(err => console.log("Error:", err));
});
