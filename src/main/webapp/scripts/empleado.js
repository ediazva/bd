const fetchClientData = async () => {
    // Esto debererÃ­a obtener datos de una base de datos, por ahora queda asÃ­
    return {
        datos: [
            {label: 'DNI', value: '01234567'},
            {label: 'Nombres', value: 'Esdras Amado'},
            {label: 'Apellidos', value: 'Diaz Vasquez'},
            {label: 'E-mail', value: 'ezdiava@unsa.edu.pe'},
        ],
        empleado: [
            {label: 'Teléfonos', value: '123456789, 123456789'},
            {label: 'Dirección', value: 'Av. Ejemplar 123'},
            {label: 'Salario', value: 'S./ 1200'},
            {label: 'Inicio de contrato', value: '01/01/2000'},
            {label: 'Fin de contrato', value: '01/01/2030'},
            {label: 'Hora de inicio', value: '06:00'},
            {label: 'Hora de salida', value: '14:00'},
            {label: 'Tipo', value: 'Tiempo completo'}, // Medio tiempo / Tiempo completo
        ],
        departamento: [
            {label: 'Código de departamento', value: '01'},
            {label: 'Nombre de departamento', value: 'Ventas'},
        ],
    };
};

const populateTable = (tableBody, data) => {
    tableBody.innerHTML = '';
    data.forEach(row => {
        const tr = document.createElement('tr');
        tr.classList.add('table-danger');
        tr.innerHTML = `<th scope="row">${row.label}</th><td>${row.value}</td>`;
        tableBody.appendChild(tr);
    });
};

const init = async () => {
    const datosBtn = document.getElementById('datos-btn');
    const empleadoBtn = document.getElementById('empleado-btn');
    const departamentoBtn = document.getElementById('departamento-btn');

    const datosSection = document.getElementById('datos-section');
    const empleadoSection = document.getElementById('empleado-section');
    const departamentoSection = document.getElementById('departamento-section');

    const datosTableBody = document.getElementById('datos-table-body');
    const empleadoTableBody = document.getElementById('empleado-table-body');
    const departamentoTableBody = document.getElementById('departamento-table-body');


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

    const clientData = await fetchClientData();
    populateTable(datosTableBody, clientData.datos);
    populateTable(empleadoTableBody, clientData.empleado);
    populateTable(departamentoTableBody, clientData.departamento);
};