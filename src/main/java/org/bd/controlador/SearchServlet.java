package org.bd.controlador;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.bd.modelo.Producto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String name = req.getParameter("name");
    if(name == null) {
      resp.sendRedirect("/categorias?name=Accesorio");
      return;
    }

    HashMap<String, List<Producto>> ps = Producto.GetProductosFromSession(req.getSession());
    Optional<Producto> res = 
      ps
        .values()
        .stream()
        .flatMap(List::stream)
        .filter(p -> p.nombre.toLowerCase().contains(name.toLowerCase()))
        .findFirst();
    
    resp.sendRedirect("/categorias?name=" + (res.isEmpty() ? "Accesorio" : res.get().tipo));
  }
}
