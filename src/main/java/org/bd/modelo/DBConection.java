package org.bd.modelo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConection {
  Connection conn = null;

  private static DBConection s_instance;  

  private DBConection() throws SQLException, ClassNotFoundException {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(SQLConf.URL, SQLConf.USER, SQLConf.PWD);
    if(conn != null) {
      System.out.println("Login exitoso!");
    }
  }

  public static DBConection GetOrTryCreateInstance() {
    if(s_instance != null)
      return s_instance;
    
    try {
      s_instance = new DBConection();
      return s_instance;
    } catch(Exception e) {
      System.out.println(e.getMessage());
      return null;
    }
  }

  public Connection connection() {return conn;}

  public static void Dispose() {
    if(s_instance != null) {
      try {
        s_instance.conn.close();
      } catch(SQLException e) {
        System.err.println(e.getMessage());
      }
    }
  }
}