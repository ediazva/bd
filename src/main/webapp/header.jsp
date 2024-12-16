<%@page pageEncoding="UTF-8" import="java.util.HashMap, java.util.List, org.bd.modelo.Producto, org.bd.ProductoPathBundle, org.bd.security.Security" %>
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
              <%
              if(Security.getCookieUsuario(request) != null) {
              %>
              <sub class="xx-small-size"><b>JOSE ALONSO</b></sub>
              <%
              } else {
              %>
              <sub class="xx-small-size"><b>INICIA SESIÓN</b></sub>
              <%
              }
              %>
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
        <%
        if(Security.getCookieUsuario(request) != null) {
        %>
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
        <%
        }
        %>
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
              <input type="password" name="dni" class="form-control" placeholder="Contraseña" required>
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