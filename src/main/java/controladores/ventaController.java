/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import modelos.venta;
import modelos.ventaDAO;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/venta")
public class ventaController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) action = "listar";

        switch (action) {
            case "listar":
                listarVentas(request, response);
                break;
            case "detalle":
                detalleVenta(request, response);
                break;
            case "eliminar":
                eliminarVenta(request, response);
                break;
            default:
                response.sendRedirect("vistas/error404.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            response.sendRedirect("vistas/error404.jsp");
            return;
        }

        switch (action) {
            case "insertar":
                insertarVenta(request, response);
                break;
            case "editar":
                editarVenta(request, response);
                break;
            default:
                response.sendRedirect("vistas/error404.jsp");
        }
    }

 private void listarVentas(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession(false);

    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("vistas/error404.jsp?error=sesion");
        return;
    }

    modelos.usuarios usuario = (modelos.usuarios) session.getAttribute("usuario");
    String tipo = usuario.getTipo_usu();

    ventaDAO dao = new ventaDAO();
    List<venta> lista = dao.listarVentas();
    request.setAttribute("ventas", lista);

    if ("administrador".equalsIgnoreCase(tipo)) {
        request.getRequestDispatcher("vistas/admin/crudventa.jsp").forward(request, response);
    } else if ("operario".equalsIgnoreCase(tipo)) {
        request.getRequestDispatcher("vistas/operario/crudventa.jsp").forward(request, response);
    } else {
        response.sendRedirect("vistas/error404.jsp?error=rolDesconocido");
    }
}


    private void detalleVenta(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            response.getWriter().write("<p>Error: ID no proporcionado.</p>");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            ventaDAO dao = new ventaDAO();
            venta v = dao.obtenerVentaPorId(id);

            if (v != null) {
                response.getWriter().write(
                    "<p><strong>ID Factura:</strong> " + v.getIdfactura() + "</p>" +
                    "<p><strong>Fecha:</strong> " + v.getFecha_factura() + "</p>" +
                    "<p><strong>Subtotal:</strong> " + v.getSubtotal() + "</p>" +
                    "<p><strong>Descuento:</strong> " + v.getDescuento() + "</p>" +
                    "<p><strong>Abono:</strong> " + v.getAbono() + "</p>" +
                    "<p><strong>Total:</strong> " + v.getValor_total() + "</p>" +
                    "<p><strong>Observaciones:</strong> " + v.getObservaciones() + "</p>" +
                    "<p><strong>ID Usuario:</strong> " + v.getUsuarios_id_usuario() + "</p>");
            } else {
                response.getWriter().write("<p>Venta no encontrada.</p>");
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("<p>ID inválido.</p>");
        }
    }

    private void eliminarVenta(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            ventaDAO dao = new ventaDAO();
            dao.eliminarVenta(id);
            response.sendRedirect("venta?action=listar");
        } catch (Exception e) {
            response.sendRedirect("vistas/error404.jsp?error=eliminar");
        }
    }

    private void insertarVenta(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            Date fecha = Date.valueOf(request.getParameter("fecha_factura"));
            int subtotal = Integer.parseInt(request.getParameter("subtotal"));
            int descuento = Integer.parseInt(request.getParameter("descuento"));
            int abono = Integer.parseInt(request.getParameter("abono"));
            int total = Integer.parseInt(request.getParameter("valor_total"));
            String obs = request.getParameter("observaciones");
            int idUsuario = Integer.parseInt(request.getParameter("usuarios_id_usuario"));

            venta v = new venta();
            v.setFecha_factura(fecha);
            v.setSubtotal(subtotal);
            v.setDescuento(descuento);
            v.setAbono(abono);
            v.setValor_total(total);
            v.setObservaciones(obs);
            v.setUsuarios_id_usuario(idUsuario);

            ventaDAO dao = new ventaDAO();
            dao.insertarVenta(v);

            response.sendRedirect("venta?action=listar");
        } catch (Exception e) {
            response.sendRedirect("vistas/error404.jsp?error=insertar");
        }
    }

    private void editarVenta(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("idfactura"));
            Date fecha = Date.valueOf(request.getParameter("fecha_factura"));
            int subtotal = Integer.parseInt(request.getParameter("subtotal"));
            int descuento = Integer.parseInt(request.getParameter("descuento"));
            int abono = Integer.parseInt(request.getParameter("abono"));
            int total = Integer.parseInt(request.getParameter("valor_total"));
            String obs = request.getParameter("observaciones");
            int idUsuario = Integer.parseInt(request.getParameter("usuarios_id_usuario"));

            venta v = new venta(id, fecha, subtotal, descuento, abono, total, obs, idUsuario);

            ventaDAO dao = new ventaDAO();
            dao.actualizarVenta(v);

            response.sendRedirect("venta?action=listar");
        } catch (Exception e) {
            response.sendRedirect("vistas/error404.jsp?error=editar");
        }
    }
} 
