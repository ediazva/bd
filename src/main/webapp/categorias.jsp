<%@page pageEncoding="UTF-8" import="java.util.HashMap, java.util.List, org.bd.modelo.Producto, org.bd.ProductoPathBundle, java.util.stream.Collectors, java.util.function.Function, java.util.Collections, org.bd.security.Security"%>
<%
HashMap<String, List<Producto>> ps = (HashMap<String, List<Producto>>)session.getAttribute("productos");
String NAME = request.getParameter("name");
String MARCA = request.getParameter("marca");
String PRICE = request.getParameter("price");
String SORT = request.getParameter("sort");
HashMap<String, Function<Float, Boolean>> foos = new HashMap<>();
foos.put("0", x -> x > 100f);
foos.put("1", x -> x >= 100f && x <= 500f);
foos.put("2", x -> x > 500f && x <= 1000f);
foos.put("3", x -> x > 1000f);
List<Producto> filtered_products =
    ps.get(NAME)
        .stream()
        .filter(p -> MARCA == null || p.marca.equals(MARCA))
        .filter(p -> foos.getOrDefault(PRICE, x -> true).apply(p.precio))
        .collect(Collectors.toList());
if ("asc".equals(SORT)) {
    Collections.sort(filtered_products, (p1, p2) -> Double.compare(p1.precio, p2.precio)); // Orden ascendente
} else if ("desc".equals(SORT)) {
    Collections.sort(filtered_products, (p1, p2) -> Double.compare(p2.precio, p1.precio)); // Orden descendente
}

%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo de Juguetería</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="styles/default.css" rel="stylesheet">  
    <link href="styles/font.css" rel="stylesheet">  
</head>
<body>
    <jsp:include page="header.jsp"/>

    <div class="container-fluid">
        <!-- Contenedor principal -->
        <div class="row mt-4">
            <!-- Sidebar de filtros -->
            <div class="col-md-2">
                <div class="p-3 rounded-3 shadow-sm bg-white">
                    <h4 class="fw-bold mb-3"><%=NAME%></h4>
                    <div class="accordion" id="filtros">
                        <!-- Categorías -->
                        <div class="accordion-item border-0 mb-2">
                            <h2 class="accordion-header" id="headingCategorias">
                                <button class="accordion-button custom-accordion-btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCategorias">
                                    <span class="fw-bold">Categorías</span>
                                </button>
                            </h2>
                            <div id="collapseCategorias" class="accordion-collapse collapse show">
                                <div class="accordion-body">
                                    <ul class="list-unstyled mb-0">
                                        <%
                                        for(HashMap.Entry<String, List<Producto>> entry : ps.entrySet()) {
                                            String name = entry.getKey();
                                            String effect = "";
                                            if(name.equals(NAME))
                                                effect = "fw-bold";
                                        %>
                                        <li><a href="/categorias?name=<%=entry.getKey()%>" class="text-decoration-none text-muted <%=effect%>"><%=entry.getKey()%></a></li>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- Marca -->
                        <div class="accordion-item border-0 mb-2">
                            <h2 class="accordion-header" id="headingMarca">
                                <button class="accordion-button custom-accordion-btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseMarca">
                                    <span class="fw-bold">Marca</span>
                                </button>
                            </h2>
                            <div id="collapseMarca" class="accordion-collapse collapse show">
                                <div class="accordion-body">
                                    <ul class="list-unstyled mb-0">
                                        <%
                                        for(String marca : 
                                            ps.get(NAME)
                                                .stream()
                                                .map(p -> p.marca)
                                                .distinct()
                                                .collect(Collectors.toList())) {
                                            String effect = "";
                                            if(marca.equals(MARCA)) effect = "fw-bold";
                                        %>
                                        <li><a href="/categorias?name=<%=NAME%>&marca=<%=marca%>" class="text-decoration-none text-muted <%=effect%>"><%=marca%></a></li>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- Precio -->
                        <div class="accordion-item border-0">
                            <h2 class="accordion-header" id="headingPrecio">
                                <button class="accordion-button custom-accordion-btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePrecio">
                                    <span class="fw-bold">Precio</span>
                                </button>
                            </h2>
                            <div id="collapsePrecio" class="accordion-collapse collapse show">
                                <div class="accordion-body">
                                    <ul class="list-unstyled mb-0">
                                        <%
                                        String url = "/categorias?name=" + NAME;
                                        if(MARCA != null)
                                            url += "&marca=" + MARCA;
                                        if(SORT != null)
                                            url += "&sort=" + SORT;
                                        %>
                                        <li><a id="price-0" href="<%=url%>&price=0" class="text-decoration-none text-muted">Menos de S/ 100</a></li>
                                        <li><a id="price-1" href="<%=url%>&price=1" class="text-decoration-none text-muted">S/ 100 - S/ 500</a></li>
                                        <li><a id="price-2" href="<%=url%>&price=2" class="text-decoration-none text-muted">S/ 500 - S/ 1,000</a></li>
                                        <li><a id="price-3" href="<%=url%>&price=3" class="text-decoration-none text-muted">Más de S/ 1,000</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Contenedor de productos -->
            <div class="col-md-10">
                <!-- Título y selector -->
                <div class="p-3 rounded-3 shadow-sm bg-white mb-3 d-flex justify-content-between align-items-center">
                    <span class="fs-5"> <strong class="text-primary"><%=filtered_products.size()%></strong> productos</span>
                    <div class="d-flex align-items-center">
                        <span class="me-2 text-muted">Ordenar por:</span>
                        <select id="sort" onchange="changeSort()" class="form-select form-select-sm w-auto">
                            <option value="">Seleccionar</option>
                            <option value="asc">Precio ascendente</option>
                            <option value="desc">Precio descendente</option>
                        </select>
                    </div>
                </div>

                <!-- Tarjetas de productos -->
                <div class="row">
                    <!-- Producto 1 -->
                     <%
                        for(Producto p : filtered_products) {
                     %>
                    <div class="col-md-4 mb-4">
                        <a class="card shadow-sm" href="/producto?codigo=<%=p.codigo%>&tipo=<%=p.tipo%>">
                            <img src="/images/productos/<%=ProductoPathBundle.GetInstance().map.get(p.codigo).getFirst()%>" class="object-fit-contain card-img-top" width="300" height="200">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div class="text-muted small mb-1"><%=p.marca%></div>
                                    <div class="text-muted small mb-1">ID: <%=p.codigo%></div>
                                </div>
                                <h5 class="card-title"><%=p.nombre%></h5>
                                <p class="text-muted small"><%=p.destino%></p>
                                <p class="text-decoration-line-through text-muted small">Antes: S/ 449.90</p>
                                <h6 class="text-danger d-inline">S/ 314.93</h6>
                                <span class="badge bg-danger">-30%</span>
                            </div>
                        </a>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </div>

    <script>
        <%
        if(PRICE != null) {
        %>
        document.getElementById("price-<%=PRICE%>").classList.add("fw-bold");
        <%}%>

        <%
        if(SORT != null) {
            int id = "desc".equals(SORT) ? 2 : 1;
        %>
        document.getElementById("sort").selectedIndex = <%=id%>;
        <%}%>

        function changeSort() {
            const sortValue = document.getElementById("sort").value; // Obtener el valor seleccionado
            if (sortValue) {
                // Si se selecciona un valor (no vacío), redirigir a la nueva URL con el parámetro de consulta
                <%
                String url2 = "?name=" + NAME;
                if(MARCA != null)
                    url2 += "&marca=" + MARCA;
                %>
            
                window.location.search = "<%=url2%>" + "&sort=" + sortValue;
            } else {
                // Si "Seleccionar" es la opción seleccionada, no añadir ningún parámetro
                window.location.search = '';
            }
        }
    </script>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
