'use strict';
import Header from './header.js';
// Información del Trabajo Práctico Actual. Modificable
const TP_DATA = {
    title: "Trabajo Práctico N.º 7",
    group: "Grupo N.º 5", // Si es resolución individual cambiar por "Resolución de X"
    links: [
        ["Seleccionar Sucursales", "/SeleccionarSucursales.aspx"],
        ["Listado de Sucursales", "/ListadoSucursales.aspx"]
    ],
    otherLinks: [
        ["Repositorio", "https://github.com/maximocanedo/PROGIII-TP7"],
        ["Foro", "https://frgp.cvg.utn.edu.ar/mod/forum/view.php?id=255241"]
    ]
};
// Configuramos el Header:
(() => {
    const header = new Header(TP_DATA);
    header.putOnPage();
})();