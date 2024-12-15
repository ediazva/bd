const fetchClientData = async () => {
    // Esto deberería obtener datos de una base de datos, por ahora queda así
    return {
        datos: [
            {label: 'DNI', value: '01234567'},
            {label: 'Nombres', value: 'Esdras Amado'},
            {label: 'Apellidos', value: 'Diaz Vasquez'},
            {label: 'E-mail', value: 'ezdiava@unsa.edu.pe'}
        ],
        jefe: [
            {label: 'Teléfonos', value: '123456789, 123456789'},
            {label: 'Dirección', value: 'Av. Ejemplar 123'},
            {label: 'Salario', value: 'S./ 1200'},
            {label: 'Inicio de contrato', value: '01/01/2000'},
            {label: 'Fin de contrato', value: '01/01/2030'},
            {label: 'Hora de inicio', value: '06:00'},
            {label: 'Hora de salida', value: '14:00'},
            {label: 'Tipo', value: 'Jefe'} // Jefe
        ],
        departamento: [
            {label: '01', value: 'Ventas</td><td>203'},
            {label: '02', value: 'RR.HH. 1</td><td>500'},
            {label: '03', value: 'RR.HH. 2</td><td>478'}
        ],
        libros: [
            {
                id: 'libro1',
                name: 'Libro 1',
                reclamaciones: [
                    {fecha: '2024-01-01', mensaje: 'Reclamo sobre producto A'},
                    {fecha: '2024-01-02', mensaje: 'Reclamo sobre servicio B'}
                ]
            },
            {
                id: 'libro2',
                name: 'Libro 2',
                reclamaciones: [
                    {fecha: '2024-02-01', mensaje: 'Reclamo sobre producto X'},
                    {fecha: '2024-02-02', mensaje: 'Reclamo sobre servicio Y'}
                ]
            }
        ]
    };
};

const populateTable = (tableBody, data) => {
    tableBody.innerHTML = '';
    data.forEach(row => {
        const tr = document.createElement('tr');
        tr.innerHTML = `<th>${row.fecha || row.label}</th><td>${row.mensaje || row.value}</td>`;
        tableBody.appendChild(tr);
    });
};

const populateDropdown = (dropdown, data) => {
    dropdown.innerHTML = '';
    data.forEach(item => {
        const option = document.createElement('option');
        option.value = item.id;
        option.textContent = item.name;
        dropdown.appendChild(option);
    });
};

const init = async () => {
    const datosBtn = document.getElementById('datos-btn');
    const jefeBtn = document.getElementById('jefe-btn');
    const departamentoBtn = document.getElementById('departamento-btn');

    const datosSection = document.getElementById('datos-section');
    const jefeSection = document.getElementById('jefe-section');
    const departamentoSection = document.getElementById('departamento-section');

    const datosTableBody = document.getElementById('datos-table-body');
    const jefeTableBody = document.getElementById('jefe-table-body');
    const departamentoTableBody = document.getElementById('departamento-table-body');

    const libroBtn = document.getElementById('libro-btn');
    const libroSection = document.getElementById('libro-section');
    const libroSelect = document.getElementById('libro-select');
    const libroTableBody = document.getElementById('libro-table-body');


    datosBtn.addEventListener('click', () => {
        datosSection.classList.remove('d-none');
        departamentoSection.classList.add('d-none');
        libroSection.classList.add('d-none');
        jefeSection.classList.add('d-none');
    });

    jefeBtn.addEventListener('click', () => {
        jefeSection.classList.remove('d-none');
        departamentoSection.classList.add('d-none');
        libroSection.classList.add('d-none');
        datosSection.classList.add('d-none');
    });

    departamentoBtn.addEventListener('click', () => {
        departamentoSection.classList.remove('d-none');
        jefeSection.classList.add('d-none');
        libroSection.classList.add('d-none');
        datosSection.classList.add('d-none');
    });

    libroBtn.addEventListener('click', () => {
        libroSection.classList.remove('d-none');
        datosSection.classList.add('d-none');
        jefeSection.classList.add('d-none');
        departamentoSection.classList.add('d-none');
    });

    const clientData = await fetchClientData();
    populateTable(datosTableBody, clientData.datos);
    populateTable(jefeTableBody, clientData.jefe);
    populateTable(departamentoTableBody, clientData.departamento);
    populateDropdown(libroSelect, clientData.libros);

    const selectedLibro = clientData.libros.find(libro => libro.id === libroSelect.value);
    populateTable(libroTableBody, selectedLibro.reclamaciones);

    libroSelect.addEventListener('change', () => {
        const selectedLibro = clientData.libros.find(libro => libro.id === libroSelect.value);
        populateTable(libroTableBody, selectedLibro.reclamaciones);
    });
};

