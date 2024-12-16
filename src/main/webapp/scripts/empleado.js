const init = async () => {
    const datosBtn = document.getElementById('datos-btn');
    const empleadoBtn = document.getElementById('empleado-btn');
    const departamentoBtn = document.getElementById('departamento-btn');

    const datosSection = document.getElementById('datos-section');
    const empleadoSection = document.getElementById('empleado-section');
    const departamentoSection = document.getElementById('departamento-section');
    
    datosBtn.addEventListener('click', () => {
        datosSection.classList.remove('d-none');
        departamentoSection.classList.add('d-none');
        empleadoSection.classList.add('d-none');
    });

    empleadoBtn.addEventListener('click', () => {
        empleadoSection.classList.remove('d-none');
        departamentoSection.classList.add('d-none');
        datosSection.classList.add('d-none');
    });

    departamentoBtn.addEventListener('click', () => {
        departamentoSection.classList.remove('d-none');
        empleadoSection.classList.add('d-none');
        datosSection.classList.add('d-none');
    });

};