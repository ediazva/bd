<%@page pageEncoding="UTF-8" import="org.bd.modelo.Producto, org.bd.FormatFloat, org.bd.ProductoPathBundle" %>
<%
Producto producto = (Producto)session.getAttribute("producto");
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Oechsle-UNSA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="/styles/default.css" rel="stylesheet">  
    <link href="styles/font.css" rel="stylesheet">  
    <link href="styles/animation.css" rel="stylesheet">  
  </head>
  <body>
    <div class="container-fluid text-gray bg-gray">
      <ol id="breadcrumb-nav" class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item"><a href="/categorias?name=<%=producto.tipo%>"><%=producto.tipo%></a></li>
        <li class="breadcrumb-item active"><%=producto.destino%></li>
      </ol>
      
      <div class="d-flex column-gap-3">
        <div class="col-1">
          <div class="d-flex flex-column p-2 row-gap-2 border" style="max-height: 500px; overflow: auto;">
            <%
            for(String path : ProductoPathBundle.GetInstance().map.get(producto.codigo)) {
              String formatted = String.format("/images/productos/%s", path);
            %>
            <button class="thumbnail">
              <img class="img-fluid" src="<%=formatted%>">
            </button>
            <%
            }
            %>
          </div>
        </div>
        <div class="col-6 bg-white text-center">
          <img id="producto-preview" class="img-fluid border" style="max-height: 500px;" src="">
        </div>
        <div class="col">
          <div class="d-flex flex-column px-3 py-2 border bg-white rounded">
            <ol class="small-size breadcrumb" style="--bs-breadcrumb-divider: '|'">
              <li class="breadcrumb-item"><%=producto.marca%></li>
              <li class="breadcrumb-item active"><%=String.format("ID: %s", producto.codigo)%></li>
            </ol>
            <p class="fs-5 fw-bold"><%=producto.nombre%></p>
            <!-- Cliente afiliado -->
            <div class="d-flex column-gap-3 align-items-center text-light-blue">
              <p class="fs-5 fw-bold">S/ 2,799.00</p>
              <p class="px-1 badge text-bg-dark-red"><span class="icon-left-arrow"></span>-15%</p>
              <p class="fw-bold">Tarjeta Oh <img src="images/oh.png" width="30px"></p>
            </div>
            <!-- Cliente no afiliado -->
            <div class="d-flex column-gap-3 align-items-end">
              <p class="fs-5 fw-bold"><%=String.format("S/ %s", FormatFloat.format(producto.precio))%></p>
              <p class="fw-bold">Precio</p>
            </div>
            <button class="btn btn-red px-4 py-3">Agregar al carro</button>
          </div>    
        </div>
      </div>
    </div>

    <script>
      let thumbnails = Array.from(document.getElementsByClassName("thumbnail"));
       thumbnails
        .forEach(x => {
          x.addEventListener("click", (ev) => {
            thumbnails.forEach(x => x.classList.remove("thumbnail-active"));
            x.classList.add("thumbnail-active");
            document.getElementById("producto-preview").src = x.firstElementChild.src;
          })
        });
        thumbnails[0].classList.add("thumbnail-active");
        document.getElementById("producto-preview").src = thumbnails[0].firstElementChild.src;
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>