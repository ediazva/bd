<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.bd.ProductoPathBundle"%>
<%@ page import="org.bd.modelo.Producto"%>
<%@ page import="org.bd.modelo.DBConection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

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
      </div>
    </nav>
  </header>
  <div class="container-xxl my-3">

    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">Salir</a></li>
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

        <%
          final DBConection conn = DBConection.GetOrTryCreateInstance();
          String dni = request.getParameter("dni");
          
          String telefonosSql = "CALL mostrar_telefonos(?);";
          PreparedStatement telefonosStatement = conn.connection().prepareStatement(telefonosSql);
          telefonosStatement.setString(1, dni);
          ResultSet telefonosRes = telefonosStatement.executeQuery();
          String telefonos = "";
          while (telefonosRes.next()) {
            telefonos = telefonos.concat(telefonosRes.getString("telefono")).concat(" ");
          }
         
          
          String sql1 = "CALL mostrar_no_jefe(?);";
          PreparedStatement stat1 = conn.connection().prepareStatement(sql1);
          stat1.setString(1, dni);
          ResultSet rs1 = stat1.executeQuery();
          rs1.next();
        %>
        
        <main class="col-md-9 ms-sm-auto col-lg-9 px-md-4 main-content">
          <h1 class="text-red fw-bold d-flex justify-content-center align-self-center column-gap-5">Detalles del empleado</h1>

          <div id="datos-section" class="content-section">
              <h2>Datos Personales</h2>
              <div class="table-responsive-sm">
                <table class="table">
                  <tbody id="datos-table-body">
                    <tr class="table-danger">
                      <th scope="row">DNI</th>
                      <td><%=dni%></td>
                    </tr>
                    <tr class="table-danger">
                      <th scope="row">Nombres</th>
                      <td><%=rs1.getString("primer_nombre")%></td>
                    </tr>
                    <tr class="table-danger">
                      <th scope="row">Apellidos</th>
                      <td><%=rs1.getString("primer_apellido")%>  <%=rs1.getString("segundo_apellido")%></td>
                    </tr>
                    <tr class="table-danger">
                      <th scope="row">E-mail</th>
                      <td><%=rs1.getString("email")%></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>

          <div id="empleado-section" class="content-section d-none">
            <h2>Datos de Empleado</h2>
            <div class="table-responsive-sm">
              <table class="table">
                <tbody id="empleado-table-body">
                  <tr class="table-danger">
                    <th scope="row">Teléfonos</th>
                    <td><%=telefonos%></td>
                  </tr>
                  <tr class="table-danger">
                    <th scope="row">Dirección</th>
                    <td><%=rs1.getString("direccion")%></td>
                  </tr>
                  <tr class="table-danger">
                    <th scope="row">Salario</th>
                    <td>S./<%=rs1.getString("salario")%></td>
                  </tr>
                  <tr class="table-danger">
                    <th scope="row">Inicio de contrato</th>
                    <td><%=rs1.getString("inicio_contrato")%></td>
                  </tr>
                  <tr class="table-danger">
                    <th scope="row">Fin de contrato</th>
                    <td><%=rs1.getString("fin_contrato")%></td>
                  </tr>
                  <tr class="table-danger">
                    <th scope="row">Hora de inicio</th>
                    <td><%=rs1.getString("hora_comienzo")%></td>
                  </tr>
                  <tr class="table-danger">
                    <th scope="row">Hora de salida</th>
                    <td><%=rs1.getString("hora_fin")%></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>

          <%
          String sql2 = "SELECT * FROM departamento WHERE nombre_departamento = ?";
          PreparedStatement stat2 = conn.connection().prepareStatement(sql2);
          stat2.setString(1, rs1.getString("nombre_departamento"));
          ResultSet rs2 = stat2.executeQuery();
          rs2.next();
          %>
          <div id="departamento-section" class="content-section d-none">
            <h2>Departamento</h2>
            <div class="table-responsive-sm">
              <table class="table">
                <tbody id="departamento-table-body">
                  <tr class="table-danger">
                    <th scope="row">Código de departamento</th>
                    <td><%=rs2.getString("codigo")%></td>
                  </tr>
                  <tr class="table-danger">
                    <th scope="row">Nombre de departamento</th>
                    <td><%=rs2.getString("nombre_departamento")%></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </main>
      </div>
    </div>
  </div>

</body>

</html>