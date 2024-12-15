package org.bd.controlador;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.bd.modelo.Producto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/producto")
public class ProductoServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    HttpSession s = req.getSession();
    HashMap<String, List<Producto>> ps = (HashMap<String, List<Producto>>)s.getAttribute("productos");
    if(ps == null) {
      resp.sendRedirect("/");
      return;
    }

    int codigo = Integer.parseInt(req.getParameter("codigo"));
    Producto p = ps.getOrDefault(req.getParameter("tipo"), new LinkedList<Producto>())
      .stream()
      .filter(x -> x.codigo == codigo)
      .findFirst().orElse(null);
    if(p == null) {
      resp.sendRedirect("/");
      return;
    }
    
    s.setAttribute("producto", p);
    req.getRequestDispatcher("producto.jsp").forward(req, resp);
  }
}
