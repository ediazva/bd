package org.bd;//package org.especiales.launch;

import java.io.File;

import javax.management.RuntimeErrorException;

import org.apache.catalina.WebResourceRoot;
import org.apache.catalina.core.StandardContext;
import org.apache.catalina.startup.Tomcat;
import org.apache.catalina.webresources.DirResourceSet;
import org.apache.catalina.webresources.StandardRoot;
import org.bd.modelo.DBConection;

public class Main {
  public static void main(String[] args) throws Exception {
    Tomcat tomcat = new Tomcat();
    tomcat.setPort(8080);
    tomcat.getConnector();

    String webappDirLocation = "src/main/webapp/";

    StandardContext ctx = (StandardContext) tomcat.addWebapp("/", new File(webappDirLocation).getAbsolutePath());

    File additionWebInfClasses = new File("target/classes");
    WebResourceRoot resources = new StandardRoot(ctx);
    resources.addPreResources(new DirResourceSet(resources, "/WEB-INF/classes",
            additionWebInfClasses.getAbsolutePath(), "/"));
    ctx.setResources(resources);

    if(DBConection.GetOrTryCreateInstance() == null)
      throw new Exception("Failed to connect database");

    tomcat.start();
    tomcat.getServer().await();
  }
}