const init = async () => {
    const datosBtn = document.getElementById('datos-btn');
    const afiliacionBtn = document.getElementById('afiliacion-btn');
    const datosSection = document.getElementById('datos-section');
    const afiliacionSection = document.getElementById('afiliacion-section');

    datosBtn.addEventListener('click', () => {
        datosSection.classList.remove('d-none');
        afiliacionSection.classList.add('d-none');
    });

    afiliacionBtn.addEventListener('click', () => {
        afiliacionSection.classList.remove('d-none');
        datosSection.classList.add('d-none');
    });


    const clientData = await fetchClientData();
};