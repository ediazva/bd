const fetchClientData = async () => {
    // Esto debererÃ­a obtener datos de una base de datos, por ahora queda asÃ­
    return {
        datos: [
            {label: 'DNI', value: '01234567'},
            {label: 'Nombres', value: 'Esdras Amado'},
            {label: 'Apellidos', value: 'Diaz Vasquez'},
            {label: 'E-mail', value: 'ezdiava@unsa.edu.pe'},
        ],
        departamentos: [
            {label: '01', value: 'Ventas</td><td>203'},
            {label: '02', value: 'RR.HH. 1</td><td>500'},
            {label: '03', value: 'RR.HH. 2</td><td>473'},
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
    const departamentosBtn = document.getElementById('departamentos-btn');
    const datosSection = document.getElementById('datos-section');
    const departamentosSection = document.getElementById('departamentos-section');
    const datosTableBody = document.getElementById('datos-table-body');
    const departamentosTableBody = document.getElementById('departamentos-table-body');


    datosBtn.addEventListener('click', () => {
        datosSection.classList.remove('d-none');
        departamentosSection.classList.add('d-none');
    });

    departamentosBtn.addEventListener('click', () => {
        departamentosSection.classList.remove('d-none');
        datosSection.classList.add('d-none');
    });

    const clientData = await fetchClientData();
    populateTable(datosTableBody, clientData.datos);
    populateTable(departamentosTableBody, clientData.departamentos);
};