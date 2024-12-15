const fetchClientData = async () => {
    // Esto deberería obtener datos de una base de datos, por ahora queda así
    return {
        datos: [
            {label: 'DNI', value: '01234567'},
            {label: 'Nombres', value: 'Esdras Amado'},
            {label: 'Apellidos', value: 'Diaz Vasquez'},
            {label: 'E-mail', value: 'ezdiava@unsa.edu.pe'}
        ],
        afiliacion: [
            {label: 'Número de tarjeta OH', value: '01234567'},
            {label: 'Nombre del titular', value: 'Esdras Amado Diaz Vasquez'},
            {label: 'Fecha de vencimiento', value: '6/9/69420'},
            {label: 'Tipo', value: 'Ilimitada'}
        ]
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
    const afiliacionBtn = document.getElementById('afiliacion-btn');
    const datosSection = document.getElementById('datos-section');
    const afiliacionSection = document.getElementById('afiliacion-section');
    const datosTableBody = document.getElementById('datos-table-body');
    const afiliacionTableBody = document.getElementById('afiliacion-table-body');

    datosBtn.addEventListener('click', () => {
        datosSection.classList.remove('d-none');
        afiliacionSection.classList.add('d-none');
    });

    afiliacionBtn.addEventListener('click', () => {
        afiliacionSection.classList.remove('d-none');
        datosSection.classList.add('d-none');
    });


    const clientData = await fetchClientData();
    populateTable(datosTableBody, clientData.datos);
    populateTable(afiliacionTableBody, clientData.afiliacion);
};