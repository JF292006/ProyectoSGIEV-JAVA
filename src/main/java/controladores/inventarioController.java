/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import modelos.inventario;
import modelos.inventarioDAO;
import modelos.producto;
import modelos.productoDAO;

@WebServlet("/inventario")
public class inventarioController extends HttpServlet {

    inventarioDAO dao = new inventarioDAO();
    productoDAO productoDao = new productoDAO();

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

List<inventario> inventarios = dao.listarInventario();
List<producto> productos = productoDao.listarProductos();
request.setAttribute("inventarios", inventarios);
request.setAttribute("productos", productos);

if ("administrador".equalsIgnoreCase(tipo)) {
    request.getRequestDispatcher("vistas/admin/crudinventario.jsp").forward(request, response);
} else if ("operario".equalsIgnoreCase(tipo)) {
    request.getRequestDispatcher("vistas/operario/crudinventario.jsp").forward(request, response);
} else {
    response.sendRedirect("vistas/error404.jsp?error=rolDesconocido");
}

                break;

            case "eliminar":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    dao.eliminarInventario(id);
                } catch (Exception e) {
                    System.out.println("Error al eliminar inventario: " + e.getMessage());
                }
                response.sendRedirect("inventario?action=listar");
                break;

            case "detalle":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    inventario i = dao.obtenerInventarioPorId(id);

                    StringBuilder html = new StringBuilder();
                    html.append("<p><strong>ID:</strong> ").append(i.getIdinventario()).append("</p>");
                    html.append("<p><strong>Cantidad Existente:</strong> ").append(i.getCantidad_existente()).append("</p>");
                    html.append("<p><strong>Stock Máximo:</strong> ").append(i.getStock_max()).append("</p>");
                    html.append("<p><strong>Stock Mínimo:</strong> ").append(i.getStock_min()).append("</p>");
                    html.append("<p><strong>Lote:</strong> ").append(i.getNum_lote()).append("</p>");
                    html.append("<p><strong>Fecha Vencimiento:</strong> ").append(i.getFecha_vencimiento()).append("</p>");
                    html.append("<p><strong>Observaciones:</strong> ").append(i.getObservaciones()).append("</p>");
                    html.append("<p><strong>Fecha Entrada:</strong> ").append(i.getFecha_entrada()).append("</p>");
                    html.append("<p><strong>Fecha Salida:</strong> ").append(i.getFecha_salida()).append("</p>");
                    html.append("<p><strong>ID Producto:</strong> ").append(i.getProductos_idproducto()).append("</p>");

                    response.setContentType("text/html;charset=UTF-8");
                    response.getWriter().write(html.toString());
                } catch (Exception e) {
                    response.getWriter().write("<p>Error al obtener detalles del inventario.</p>");
                }
                break;

            default:
                response.sendRedirect("inventario?action=listar");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");

        switch (action != null ? action : "") {
            case "insertar":
    try {
        inventario inv = new inventario();

        inv.setCantidad_existente(Integer.parseInt(request.getParameter("cantidad_existente")));
        inv.setStock_max(Integer.parseInt(request.getParameter("stock_max")));
        inv.setStock_min(Integer.parseInt(request.getParameter("stock_min")));
        inv.setNum_lote(Integer.parseInt(request.getParameter("num_lote")));
        inv.setObservaciones(request.getParameter("observaciones"));
        inv.setProductos_idproducto(Integer.parseInt(request.getParameter("productos_idproducto")));

        // Captura fechas opcionales
        String fechaVenc = request.getParameter("fecha_vencimiento");
        String fechaEntrada = request.getParameter("fecha_entrada");
        String fechaSalida = request.getParameter("fecha_salida");

        if (fechaVenc != null && !fechaVenc.isEmpty()) {
            inv.setFecha_vencimiento(Date.valueOf(fechaVenc));
        }
        if (fechaEntrada != null && !fechaEntrada.isEmpty()) {
            inv.setFecha_entrada(Date.valueOf(fechaEntrada));
        }
        if (fechaSalida != null && !fechaSalida.isEmpty()) {
            inv.setFecha_salida(Date.valueOf(fechaSalida));
        }

        dao.insertarInventario(inv);
    } catch (Exception e) {
        System.out.println("Error al insertar inventario: " + e.getMessage());
    }

    response.sendRedirect("inventario?action=listar");
    break;


            case "editar":
                try {
                    inventario i = new inventario();
                    i.setIdinventario(Integer.parseInt(request.getParameter("idinventario")));
                    i.setCantidad_existente(Integer.parseInt(request.getParameter("cantidad_existente")));
                    i.setStock_max(Integer.parseInt(request.getParameter("stock_max")));
                    i.setStock_min(Integer.parseInt(request.getParameter("stock_min")));
                    i.setNum_lote(Integer.parseInt(request.getParameter("num_lote")));
                    i.setFecha_vencimiento(sdf.parse(request.getParameter("fecha_vencimiento")));
                    i.setObservaciones(request.getParameter("observaciones"));
                    i.setFecha_entrada(sdf.parse(request.getParameter("fecha_entrada")));
                    i.setFecha_salida(sdf.parse(request.getParameter("fecha_salida")));
                    i.setProductos_idproducto(Integer.parseInt(request.getParameter("productos_idproducto")));

                    dao.editarInventario(i);
                } catch (Exception e) {
                    System.out.println("Error al editar inventario: " + e.getMessage());
                }
                response.sendRedirect("inventario?action=listar");
                break;

            default:
                response.sendRedirect("inventario?action=listar");
                break;
        }
        
    }
    
}
