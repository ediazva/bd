package org.bd.modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.bd.ProductoPathBundle;

import jakarta.servlet.http.HttpSession;

public class add_carrito {
  public enum TipoUsuario {
    GERENTE,
    EMPLEADO,
    CLIENTE,
    JEFE,
    DESCONOCIDO
  }

  public static TipoUsuario obtenerTipoUsuario(String dni, String email) {
    final DBConection conn = DBConection.GetOrTryCreateInstance();
    String sql = "CALL add_product(?, ?)";
    try {
      PreparedStatement stmt = conn.connection().prepareStatement(sql);

      // Establece los parámetros para la función
      stmt.setString(1, dni);
      stmt.setString(2, email);

      // Ejecuta la consulta
      ResultSet rs = stmt.executeQuery();

      if (rs.next()) {
          String resultado = rs.getString(1); // Obtiene el valor retornado por la función
          return TipoUsuario.valueOf(resultado.toUpperCase()); // Convierte a enum
      }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return TipoUsuario.DESCONOCIDO; // Valor por defecto si ocurre algún error
  }
}
