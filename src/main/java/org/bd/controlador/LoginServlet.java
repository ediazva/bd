package org.bd.controlador;

import java.io.IOException;

import org.bd.modelo.obtener_tipo_usuario;
import org.bd.modelo.obtener_tipo_usuario.TipoUsuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String email = req.getParameter("email");
    String pwd = req.getParameter("pwd");

    TipoUsuario user = obtener_tipo_usuario.obtenerTipoUsuario(pwd, email);
    switch(user) {
      case CLIENTE:
        req.getRequestDispatcher("/mostrarDatosCliente.jsp").forward(req, resp);
        break;
      case DESCONOCIDO:
        resp.sendRedirect("/");
        break;

    }
  }
}
