package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/crear")
public class RegistroProductoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/form.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombre = req.getParameter("nombre");
        String precioStr = req.getParameter("precio");
        String fabricate = req.getParameter("fabricante");
        String categoria = req.getParameter("categoria");

        Map<String, String> errores = new HashMap<String, String>();

        if (nombre == null || nombre.isEmpty()) {
            errores.put("nombre", "El nombre es requerido.");
        }

        if (precioStr == null || precioStr.isEmpty()) {
            errores.put("precio", "El precio es requerido");
        } else {
            try {
                double precio = Double.parseDouble(precioStr);
                if (precio <= 0) {
                    errores.put("precio", "El precio debe ser mayor a 0");
                }
            } catch (NumberFormatException e) {
                errores.put("precio", "El precio debe ser un número válido");
            }
        }

        if(fabricate == null || fabricate.isEmpty()) {
            errores.put("fabricante","El fabricante es requerido");
        } else if (fabricate.length() < 4 || fabricate.length() > 10) {
            errores.put("fabricante", "El nombre del fabricante deve ser mayor de 4 cáracteres y menor a 10.");
        }

        if (categoria ==null || categoria.isEmpty() || categoria.contains("nulo")) {
            errores.put("categoria", "La categoria es requerida.");
        }

        resp.setContentType("text/html;charset=UTF-8");
        if(errores.isEmpty()) {
            try(PrintWriter out = resp.getWriter()) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<meta charset=\"UTF-8\">");
                out.println("<title>Producto registrado</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Producto registrado con éxito!</h1>");
                out.println("<p>Datos del producto</p>");
                out.println("<ul>");
                out.println("<li>"+nombre+"</li>");
                out.println("<li>"+precioStr+"</li>");
                out.println("<li>"+fabricate+"</li>");
                out.println("<li>"+categoria+"</li>");
                out.println("</ul>");
                out.println("</body>");
                out.println("</html>");
            }
        } else {
            req.setAttribute("errores", errores);
            getServletContext().getRequestDispatcher("/form.jsp").forward(req, resp);

        }

    }
}
