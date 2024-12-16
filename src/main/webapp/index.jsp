<%@page pageEncoding="UTF-8" import="java.util.HashMap, java.util.List, org.bd.modelo.Producto, org.bd.ProductoPathBundle" %>
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
      <style>
        .modal-header {
          border-bottom: none;
        }
        .modal-footer {
          border-top: none;
        }
        .btn-ingresar {
          background-color: red;
          color: white;
          border: none;
        }
        .btn-ingresar:hover {
          background-color: darkred;
        }
        .btn-google, .btn-facebook {
          width: 100%;
          margin-bottom: 10px;
        }
        .custom-modal {
          max-width: 400px;
        }
        .btn-registrarse {
          border: 1px solid red;
          color: red;
        }
        .btn-registrarse:hover {
          background-color: red;
          color: white;
        }
      </style>
      <nav class="navbar bg-primary">
        <div class="container column-gap-4">
          <img src="images/oe.svg">
          <form class="flex-grow-1" method="get" action="/search">
            <div class="input-group">
              <input name="name" class="form-control" placeholder="¿Qué estás buscando hoy?" required>
              <button type="submit" class="btn">
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
                <a href="#" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#loginModal">
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

      <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog custom-modal">
          <div class="modal-content">
            <div class="modal-header text-center">
              <h5 class="modal-title w-100" id="loginModalLabel">Iniciar sesión</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form method="post" action="/login">
                <div class="mb-3">
                  <input type="email" name="email" class="form-control" placeholder="Correo" required>
                </div>
                <div class="mb-3">
                  <input type="password" name="pwd" class="form-control" placeholder="Contraseña" required>
                </div>
                <div class="d-grid">
                  <button type="submit" class="btn btn-ingresar">Ingresar</button>
                </div>
              </form>
            </div>
            <div class="modal-footer justify-content-center">
              <p>¿No tienes una cuenta? <a href="#" data-bs-toggle="modal" data-bs-target="#registerModal" class="text-danger">Regístrate</a></p>
            </div>
          </div>
        </div>
      </div>
      
      <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
        <div class="modal-dialog custom-modal">
          <div class="modal-content">
            <div class="modal-header text-center">
              <h5 class="modal-title w-100" id="registerModalLabel">Registrarse</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form>
                <div class="mb-3">
                  <input type="text" class="form-control" placeholder="DNI" required>
                </div>
                <div class="mb-3">
                  <input type="text" class="form-control" placeholder="Primer Nombre" required>
                </div>
                <div class="mb-3">
                  <input type="text" class="form-control" placeholder="Primer Apellido" required>
                </div>
                <div class="mb-3">
                  <input type="text" class="form-control" placeholder="Segundo Apellido" required>
                </div>
                <div class="mb-3">
                  <input type="email" class="form-control" placeholder="Correo Electrónico" required>
                </div>
                <div class="d-grid">
                  <button type="submit" class="btn btn-ingresar">Registrarse</button>
                </div>
              </form>
            </div>
            <div class="modal-footer justify-content-center">
              <p>¿Ya tienes una cuenta? <a href="#" data-bs-toggle="modal" data-bs-target="#loginModal" class="text-danger">Inicia sesión</a></p>
            </div>
          </div>
        </div>
      </div>
    </header>
    
    <div class="container-fluid p-0 m-0">
      <a href="/categorias?name=Accesorio">
        <img class="img-fluid" src="images/background.jpg">
      </a>
      
      <!-- Categoria -->
      <%
      HashMap<String, List<Producto>> ps = (HashMap<String, List<Producto>>)session.getAttribute("productos");
      int i = 0;
      for(HashMap.Entry<String, List<Producto>> entry : ps.entrySet()) {
        if(i++ > 4) break;
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
            if(j++ > 2) break;
            ProductoPathBundle bundle = ProductoPathBundle.GetInstance();
            String path = String.format("/images/productos/%s", bundle.map.get(p.codigo).getFirst());
          %>
          <a class="col-4" href="/producto?tipo=<%=p.tipo%>&codigo=<%=p.codigo%>">
            <img class="img-fluid" src="<%=path%>">
          </a>
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