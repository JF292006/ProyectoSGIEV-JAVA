/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import modelos.producto;
import modelos.productoDAO;

@WebServlet("/producto")
public class productoController extends HttpServlet {

    productoDAO dao = new productoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "listar";

        switch (action) {
            case "listar":
               HttpSession session = request.getSession(false);

if (session == null || session.getAttribute("usuario") == null) {
    response.sendRedirect("vistas/error404.jsp?error=sesion");
    return;
}

modelos.usuarios usuario = (modelos.usuarios) session.getAttribute("usuario");
String tipo = usuario.getTipo_usu();

List<producto> productos = dao.listarProductos();
request.setAttribute("productos", productos);

if ("administrador".equalsIgnoreCase(tipo)) {
    request.getRequestDispatcher("vistas/admin/crudproducto.jsp").forward(request, response);
} else if ("operario".equalsIgnoreCase(tipo)) {
    request.getRequestDispatcher("vistas/operario/crudproducto.jsp").forward(request, response);
} else {
    response.sendRedirect("vistas/error404.jsp?error=rolDesconocido");
}

                break;

            case "eliminar":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    dao.eliminarProducto(id);
                } catch (Exception e) {
                    System.out.println("Error al eliminar: " + e.getMessage());
                }
                response.sendRedirect("producto?action=listar");
                break;

            case "detalle":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    producto p = dao.obtenerProductoPorId(id);

                    StringBuilder html = new StringBuilder();
                    html.append("<p><strong>ID Producto:</strong> ").append(p.getIdproducto()).append("</p>");
                    html.append("<p><strong>Nombre:</strong> ").append(p.getNombre_producto()).append("</p>");
                    html.append("<p><strong>Precio:</strong> $").append(p.getPrecio_producto()).append("</p>");
                    html.append("<p><strong>Descripción:</strong> ").append(p.getDescripcion_producto()).append("</p>");
                    html.append("<p><strong>Tipo:</strong> ").append(p.getNombre_tipo()).append("</p>");
                    html.append("<p><strong>Registro Sanitario:</strong> ").append(p.getRegistrosanitario()).append("</p>");
                    html.append("<p><strong>ID Proveedor:</strong> ").append(p.getProveedor_idproveedor()).append("</p>");

                    response.setContentType("text/html;charset=UTF-8");
                    response.getWriter().write(html.toString());
                } catch (Exception e) {
                    response.getWriter().write("<p>Error al cargar detalles.</p>");
                }
                break;

            default:
                response.sendRedirect("producto?action=listar");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (action != null ? action : "") {
            case "insertar":
                try {
                    producto p = new producto();
                    p.setNombre_producto(request.getParameter("nombre_producto"));
                    p.setPrecio_producto(Integer.parseInt(request.getParameter("precio_producto")));
                    p.setDescripcion_producto(request.getParameter("descripcion_producto"));
                    p.setNombre_tipo(request.getParameter("nombre_tipo"));
                    p.setRegistrosanitario(request.getParameter("registrosanitario"));
                    p.setProveedor_idproveedor(Integer.parseInt(request.getParameter("proveedor_idproveedor")));

                    dao.insertarProducto(p);
                } catch (Exception e) {
                    System.out.println("Error al insertar producto: " + e.getMessage());
                }
                response.sendRedirect("producto?action=listar");
                break;

            case "editar":
                try {
                    producto p = new producto();
                    p.setIdproducto(Integer.parseInt(request.getParameter("idproducto")));
                    p.setNombre_producto(request.getParameter("nombre_producto"));
                    p.setPrecio_producto(Integer.parseInt(request.getParameter("precio_producto")));
                    p.setDescripcion_producto(request.getParameter("descripcion_producto"));
                    p.setNombre_tipo(request.getParameter("nombre_tipo"));
                    p.setRegistrosanitario(request.getParameter("registrosanitario"));
                    p.setProveedor_idproveedor(Integer.parseInt(request.getParameter("proveedor_idproveedor")));

                    dao.editarProducto(p);
                } catch (Exception e) {
                    System.out.println("Error al editar producto: " + e.getMessage());
                }
                response.sendRedirect("producto?action=listar");
                break;

            default:
                response.sendRedirect("producto?action=listar");
                break;
        }
    }
}
