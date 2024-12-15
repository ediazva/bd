<%@page pageEncoding="UTF-8" import="java.util.HashMap, java.util.List, org.bd.modelo.Producto, org.bd.ProductoBundle" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Oechsle-UNSA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="styles/default.css" rel="stylesheet">  
    <link href="styles/font.css" rel="stylesheet">  
    <link href="styles/animation.css" rel="stylesheet">  
  </head>
  <body>
    <header>
      <nav class="navbar bg-primary">
        <div class="container column-gap-4">
          <img src="images/oe.svg">
          <form class="flex-grow-1">
            <div class="input-group">
              <input class="form-control" placeholder="¿Qué estás buscando hoy?">
              <button class="btn">
                <span class="input-group-text icon-search"></span>
              </button>
            </div>
          </form>
          <div class="d-flex column-gap-5">
            <div class="dropdown">
              <button class="btn p-0 text-white" type="button" data-bs-toggle="dropdown">
                <div class="d-flex flex-column row-gap-2">
                  <div class="d-flex column-gap-2 justify-content-center">
                    <span class="x-large-size icon-user-circle"></span>
                    <!-- Usuario ya registrado -->
                    <span class="my-auto icon-down"></span>
                  </div>
                  <sub class="xx-small-size"><b>INICIA SESIÓN</b></sub>
                </div>
              </button>
              <!-- Opciones del Usuario -->
              <ul class="dropdown-menu dropdown-menu-end">
                <li>
                <a class="dropdown-item">
                  <span class="x-large-size icon-user-circle"></span>
                  <p class="my-auto">Iniciar Sesión</p>
                </a>
              </li>
              </ul>
            </div>
            <!-- Solo para Clientes -->
            <button class="btn p-0 text-white position-relative">
              <span class="position-absolute badge translate-middle-y rounded-pill bg-white text-red">
                0
              </span>
              <div  class="d-flex flex-column row-gap-2">
                <div class="d-flex justify-content-center">
                  <span class="x-large-size icon-cart"></span>
                </div>
                <sub class="xx-small-size"><b>CARRITO</b></sub>
              </div>
            </button>
          </div>
        </div>
      </nav>
    </header>
    
    <div class="container-fluid p-0 m-0">
      <img class="img-fluid" src="images/background.jpg">
      
      <!-- Categoria -->
      <%
      HashMap<String, List<Producto>> ps = (HashMap<String, List<Producto>>)session.getAttribute("productos");
      int i = 0;
      for(HashMap.Entry<String, List<Producto>> entry : ps.entrySet()) {
        i++;
        if(i > 4) break;
      %>
      <div class="container text-center">
        <div class="d-flex py-3 justify-content-center align-items-center column-gap-2">
          <div class="fs-3 fw-bold subtle"><%=entry.getKey()%></div>
          <span class="bg-success p-1 text-white rounded-pill x-large-size icon-star"></span>
        </div>
        <div class="row gx-4">
          <%
          int j = 0;
          for(Producto p : entry.getValue()) {
            if(j++ > 3) break;
            ProductoBundle bundle = ProductoBundle.GetInstance();
            String path = String.format("/images/productos/%s", bundle.map.get(p.codigo).getFirst());
          %>
          <img class="img-fluid col-4" src="<%=path%>">
          <%
          }
          %>
        </div>
      </div>
      <%
      };
      %>
    </div>

    <footer class="bg-primary py-3 mt-3">
      <div class="container">
        <div class="text-white fw-bold d-flex justify-content-center align-self-center column-gap-5">
          <p class="my-auto">Síguenos en</p>
          <div>
            <a class="ft-link" href="#">
              <span class="text-red x-large-size icon-youtube"></span>
            </a>
            <a class="ft-link" href="#">
              <span class="text-red x-large-size icon-instagram"></span>
            </a>
            <a class="ft-link" href="#">
              <span class="text-red x-large-size icon-facebook"></span>
            </a>
          </div>
          <p class="my-auto">Medios de pago</p>
          <div class="bg-white text-center rounded-pill" style="line-height: 48px; width: 48px; height: 48px;">
            <img src="images/oh.png" width="30px">
          </div>
          <a href="#">
            <img src="images/libroReclamaciones.webp" width="100px">
          </a>
        </div>
      </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>