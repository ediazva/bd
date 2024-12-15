package org.bd.modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class mostrar_persona {
  public int id;
  public String nombre;
  public int edad;

  public static List<mostrar_persona> GetMostrarPersonas(DBConection conn) {
    try {
      String sql = "CALL mostrar_personas();";
      PreparedStatement stat = conn.connection().prepareStatement(sql);
      ResultSet rs = stat.executeQuery();
      List<mostrar_persona> list = new LinkedList<>();
      while(rs.next()) {
        mostrar_persona mp = new mostrar_persona();
        mp.id = rs.getInt("ID");
        mp.nombre = rs.getString("Nombre");
        mp.edad = rs.getInt("Edad");
        list.add(mp);
      }

      return list;
    } catch(SQLException e) {
      System.err.println("Failed to get personas: " + e.getMessage());
      return null;
    }
  }
}
