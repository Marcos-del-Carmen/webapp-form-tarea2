<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.Map"%>
<%@ page isELIgnored="false" %>

<%
    Map<String, String> errores = (Map<String, String>)request.getAttribute("errores");
%>

<!DOCTYPE html>
    <head>
        <meta charset="UTF-8">
        <title>Regristrar producto</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <style>
            .text-danger {
                color: red;
            }
        </style>
    </head>
    <!-- CUERPO DE LA PAGINA -->
    <body>
        <div class="container d-flex justify-content-center flex-column align-items-center">
            <h1 class="text-center">Registra tu producto en nuestro sitio</h1>

            <% if(errores != null && errores.size()>0) { %>
                <div class="alert alert-danger">
                    <ul>
                        <%for(String error: errores.values()) { %>
                            <li><%=error %></li>
                        <%}%>
                    </ul>
                </div>
            <%}%>
            <div class="w-50 p-4 rounded border">
                <form action="/webapp-form-tarea2/crear" method="POST">
                  <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" class="form-control" name="nombre" id="nombre" value="${param.nombre}">
                      <%
                        if(errores !=null && errores.containsKey("nombre")) {
                           out.println("<small class='text-danger'> " + errores.get("nombre") + "</small>");
                        }
                      %>
                  </div>
                  <div class="mb-3">
                    <label for="precio" class="form-label">Precio</label>
                    <input type="number" class="form-control" name="precio" id="precio" value="${param.precio}">
                      <%
                        if(errores !=null && errores.containsKey("precio")) {
                           out.println("<small class='text-danger'> " + errores.get("precio") + "</small>");
                        }
                      %>
                  </div>
                  <div class="mb-3">
                    <label for="fabricante" class="form-label">Fabricante</label>
                    <input type="text" class="form-control" name="fabricante" id="fabricante" value="${param.fabricante}">
                      <%
                        if(errores != null && errores.containsKey("fabricante")) {
                            out.println("<small class='text-danger'> " + errores.get("fabricante") + "</small>");
                        }
                      %>
                  </div>
                  <div class="mb-3">
                      <select class="form-select" name="categoria">
                        <option selected value="nulo">-- SELECCIONA CATEGORIA --</option>
                        <option value="sd" ${param.categoria.equals("sb") ? "selected" : ""}>Salud</option>
                        <option value="bs" ${param.categoria.equals("bs") ? "selected" : ""}>Bebidas</option>
                        <option value="ms" ${param.categoria.equals("ms") ? "selected" : ""}>Muebles</option>
                        <option value="es" ${param.categoria.equals("es") ? "selected" : ""}>Electronicos</option>
                        <option value="ja" ${param.categoria.equals("ja") ? "selected" : ""}>Joyeria</option>
                        <option value="he" ${param.categoria.equals("he") ? "selected" : ""}>Higiene</option>
                      </select>
                        <%
                          if(errores != null && errores.containsKey("categoria")) {
                             out.println("<small class='text-danger'> " + errores.get("categoria") + "</small>");
                          }
                        %>
                  </div>
                  <div class="text-center">
                    <button type="submit" class="btn btn-primary">Registrar producto</button>
                  </div>
                </form>
            </div>
        </div>
    </body>
</html>