<%@page pageEncoding="UTF-8" import="java.util.HashMap, java.util.List, org.bd.modelo.Producto, org.bd.ProductoPathBundle, org.bd.security.Security" %>
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
    <jsp:include page="header.jsp"/>
    
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