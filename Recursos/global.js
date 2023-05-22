'use strict';
// Funciones globales que serán accedidas desde C#.
window.MostrarMensaje = (mensaje) => {
    const toastLiveExample = document.getElementById('liveToast');
    document.querySelector(".toast-body").innerText = mensaje;
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample);
    toastBootstrap.show();
};