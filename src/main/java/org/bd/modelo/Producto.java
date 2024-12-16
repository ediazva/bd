package org.bd.modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.bd.ProductoPathBundle;

import jakarta.servlet.http.HttpSession;

public class Producto {
  public final int codigo;
  public final String nombre;
  public final float precio;
  public final String destino;
  public final String marca;
  public final String tipo;

  private Producto(
      int codigo,
      String nombre,
      float precio,
      String destino,
      String marca,
      String tipo) {
    this.codigo = codigo;
    this.nombre = nombre;
    this.precio = precio;
    this.destino = destino;
    this.marca = marca;
    this.tipo = tipo;
  }

  public static HashMap<String, List<Producto>> GetProductosFromSession(HttpSession s) {
    if(s.getAttribute("productos") == null) {
      ProductoPathBundle.MakeInstance(s.getServletContext());
      s.setAttribute("productos", Producto.MakeProductos(null));
    }

    return (HashMap<String, List<Producto>>)s.getAttribute("productos");
  } 

  public static HashMap<String, List<Producto>> MakeProductos(String codigoOrNull) {
    final DBConection conn = DBConection.GetOrTryCreateInstance();
    try {
        String sql = "CALL mostrar_producto(?);";
        PreparedStatement stat = conn.connection().prepareStatement(sql);
        stat.setString(1, codigoOrNull);
        ResultSet rs = stat.executeQuery();

        HashMap<String, List<Producto>> map = new HashMap<>();
        while(rs.next()) {
          Producto p = new Producto(
            rs.getInt("codigo"),
            rs.getString("nombre"),
            rs.getFloat("precio"),
            rs.getString("destino"),
            rs.getString("marca"),
            rs.getString("tipo")
          );
          
          List<Producto> list = map.computeIfAbsent(p.tipo, x -> new LinkedList<>());
          list.add(p);
        }

        return map;
      } catch(SQLException e) {
        System.err.println("Failed to get personas: " + e.getMessage());
        return null;
      } 
  }
}
