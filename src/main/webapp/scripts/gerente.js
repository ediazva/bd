const init = async () => {
    const datosBtn = document.getElementById('datos-btn');
    const departamentosBtn = document.getElementById('departamentos-btn');
    const datosSection = document.getElementById('datos-section');
    const departamentosSection = document.getElementById('departamentos-section');

    datosBtn.addEventListener('click', () => {
        datosSection.classList.remove('d-none');
        departamentosSection.classList.add('d-none');
    });

    departamentosBtn.addEventListener('click', () => {
        departamentosSection.classList.remove('d-none');
        datosSection.classList.add('d-none');
    });
};