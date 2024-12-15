package org.bd.listener;

import org.bd.modelo.DBConection;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class DBListener implements ServletContextListener {
  @Override
  public void contextDestroyed(ServletContextEvent sce) {
    DBConection.Dispose();
  }
}
