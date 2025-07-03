/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import modelos.proveedor;
import modelos.proveedorDAO;

@WebServlet("/proveedor")
public class proveedorController extends HttpServlet {

    proveedorDAO dao = new proveedorDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "listar";

        switch (action) {
            case "listar":
                List<proveedor> lista = dao.listarProveedores();
                request.setAttribute("proveedores", lista);
                request.getRequestDispatcher("/vistas/admin/crudproveedor.jsp").forward(request, response);
                break;

            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminarProveedor(idEliminar);
                response.sendRedirect("proveedor?action=listar");
                break;

            case "detalle":
                int idDetalle = Integer.parseInt(request.getParameter("id"));
                proveedor p = dao.obtenerProveedorPorId(idDetalle);

                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<p><strong>Nombre:</strong> " + p.getNombre_proveedor() + "</p>");
                out.println("<p><strong>Correo:</strong> " + p.getCorreo_proveedor() + "</p>");
                out.println("<p><strong>Teléfono:</strong> " + p.getTelefono() + "</p>");
                out.println("<p><strong>Dirección:</strong> " + p.getDireccion() + "</p>");
                break;

            default:
                response.sendRedirect("proveedor?action=listar");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("insertar".equals(action)) {
    proveedor p = new proveedor();
    p.setNombre_proveedor(request.getParameter("nombre_proveedor"));
    p.setCorreo_proveedor(request.getParameter("correo_proveedor"));
    p.setTelefono(Long.parseLong(request.getParameter("telefono"))); // ← CORREGIDO
    p.setDireccion(request.getParameter("direccion"));

    dao.insertarProveedor(p);
    response.sendRedirect("proveedor?action=listar");
}

if ("editar".equals(action)) {
    proveedor p = new proveedor();
    p.setIdproveedor(Integer.parseInt(request.getParameter("idproveedor")));
    p.setNombre_proveedor(request.getParameter("nombre_proveedor"));
    p.setCorreo_proveedor(request.getParameter("correo_proveedor"));
    p.setTelefono(Long.parseLong(request.getParameter("telefono"))); // ← CORREGIDO
    p.setDireccion(request.getParameter("direccion"));

    dao.editarProveedor(p);
    response.sendRedirect("proveedor?action=listar");
}

    }
}
