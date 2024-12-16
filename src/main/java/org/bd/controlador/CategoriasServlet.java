package org.bd.controlador;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.bd.modelo.Producto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/categorias")
public class CategoriasServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    HashMap<String, List<Producto>> ps = Producto.GetProductosFromSession(req.getSession());
    req.getRequestDispatcher("/categorias.jsp").forward(req, resp);
  }
}
