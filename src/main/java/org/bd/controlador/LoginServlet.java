package org.bd.controlador;

import java.io.IOException;

import org.bd.modelo.obtener_tipo_usuario;
import org.bd.modelo.obtener_tipo_usuario.TipoUsuario;
import org.bd.security.Security;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String email = req.getParameter("email");
    String pwd = req.getParameter("pwd");

    if(Security.getCookieUsuario(req) != null) {
      req.getRequestDispatcher("mostrarDatosCliente.jsp").forward(req, resp);
      return;
    }

    TipoUsuario user = obtener_tipo_usuario.obtenerTipoUsuario(pwd, email);
    switch(user) {
      case CLIENTE:
        Cookie loginCookie = new Cookie("usuario", pwd);
        loginCookie.setMaxAge(60);
        resp.addCookie(loginCookie);

        req.getRequestDispatcher("mostrarDatosCliente.jsp").forward(req, resp);
        break;
      case EMPLEADO:
        req.getRequestDispatcher("mostrarDatosEmpleado.jsp").forward(req, resp);
        break;
      case GERENTE:
        req.getRequestDispatcher("mostrarDatoGerente.jsp").forward(req, resp);
        break;  
      case JEFE:
        req.getRequestDispatcher("mostrarDatoJefe.jsp").forward(req, resp);
        break;
      case DESCONOCIDO:
        resp.sendRedirect("/");
        break;

    }
  }
}
