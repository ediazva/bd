<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Detalles del empleado</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="styles/default.css" rel="stylesheet">
  <link href="styles/font.css" rel="stylesheet">
    <script type="text/javascript" src="scripts/empleado.js"></script>
</head>

<body class="default-theme" onload="init();">
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
                <sub class="xx-small-size "><b>ESDRAS DIAZ</b></sub>
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
            <div class="d-flex flex-column row-gap-2">
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
  <div class="container-xxl my-3">

    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.html">Inicio</a></li>
        <li class="breadcrumb-item active" aria-current="page">Cuenta</li>
      </ol>
    </nav>

    <div id="main-content" class="container-fluid p-0 m-0 ">
      <div class="row m-0 p-0">
        <nav class="col-md-3 col-lg-3 d-md-block sidebar fw-bold">
          <h2 class="text-red fw-bold d-flex justify-content-center align-self-center column-gap-5">Bienvenido!</h2>
          <ul class="nav flex-column container bg-primary">
            <li class="nav-item">
              <a id="datos-btn" class="nav-link text-white" href="#"><i class="fas fa-home"></i>Datos Personales</a>
            </li>
            <li class="nav-item">
              <a id="empleado-btn" class="nav-link text-white" href="#"><i class="fas fa-box"></i>Datos de empleado</a>
            </li>
            <li class="nav-item">
              <a id="departamento-btn" class="nav-link text-white" href="#"><i class="fas fa-box"></i>Datos del departamento</a>
            </li>
          </ul>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-9 px-md-4 main-content">
          <h1 class="text-red fw-bold d-flex justify-content-center align-self-center column-gap-5">Detalles del empleado</h1>

          <div id="datos-section" class="content-section">
            <h2>Datos Personales</h2>
            <div class="table-responsive-sm">
              <table class="table">
                <tbody id="datos-table-body">
              </table>
            </div>
          </div>

          <div id="empleado-section" class="content-section d-none">
            <h2>Datos de Empleado</h2>
            <div class="table-responsive-sm">
              <table class="table">
                <tbody id="empleado-table-body">
              </table>
            </div>
          </div>

          <div id="departamento-section" class="content-section d-none">
            <h2>Departamento</h2>
            <div class="table-responsive-sm">
              <table class="table">
                <tbody id="departamento-table-body">
              </table>
            </div>
          </div>
        </main>
      </div>
    </div>
  </div>

</body>

</html>