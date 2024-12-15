package org.bd;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletContext;

public class ProductoBundle {
  public final Map<Integer, List<String>> map;
  private static ProductoBundle s_instance;

  private ProductoBundle(Map<Integer, List<String>> map) {
    this.map = map;
  }

  public static void MakeInstance(ServletContext ctx) {
    if(s_instance != null) return;
    
    HashMap<Integer, List<String>> map = new HashMap<Integer, List<String>>();
    ctx.getResourcePaths("/images/productos").forEach(x -> {
      String filename = x.substring(x.lastIndexOf('/')+1);
      int id = Integer.parseInt(filename.substring(0, filename.indexOf('_')));
      map.computeIfAbsent(id, k -> new LinkedList<>()).add(filename);
    });
    s_instance = new ProductoBundle(map);
  }

  public static ProductoBundle GetInstance() {
    assert(s_instance != null);

    return s_instance;
  }
}
