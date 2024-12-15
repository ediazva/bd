package org.bd.controlador;

import java.io.IOException;

import org.bd.ProductoPathBundle;
import org.bd.modelo.Producto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("")
public class HomeServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    HttpSession s = req.getSession();
    if(s.getAttribute("productos") == null) {
      ProductoPathBundle.MakeInstance(req.getServletContext());
      s.setAttribute("productos", Producto.GetProductos(null));
    }

    req.getRequestDispatcher("/index.jsp").forward(req, resp);
  }
}
