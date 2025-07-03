/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import modelos.usuarioDAO;
import modelos.usuarios;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/usuario")
public class UsuarioController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            action = "listar";
        }

        switch (action) {
            case "listar":
                listarUsuarios(request, response);
                break;
            case "detalle":
                detalleUsuario(request, response);
                break;
            case "eliminar":
                eliminarUsuario(request, response);
                break;
                case "buscar":
    buscarUsuarios(request, response);
    break;

            default:
                response.sendRedirect("vistas/error404.jsp");
        }
    }

    // doPost será para insertar o editar
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
                insertarUsuario(request, response);
                break;
            case "editar":
                editarUsuario(request, response);
                break;
            default:
                response.sendRedirect("vistas/error404.jsp");
        }
    }
    private void buscarUsuarios(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String filtro = request.getParameter("filtro");
    usuarioDAO dao = new usuarioDAO();
    List<usuarios> listaFiltrada = dao.buscarUsuarios(filtro);
    request.setAttribute("usuarios", listaFiltrada);

    HttpSession session = request.getSession(false);
    usuarios usuario = (usuarios) session.getAttribute("usuario");

    if (usuario != null && usuario.getTipo_usu() != null) {
        String rol = usuario.getTipo_usu().toLowerCase();

        if (rol.equals("operario")) {
            request.getRequestDispatcher("vistas/operario/crudadmin.jsp").forward(request, response);
        } else if (rol.equals("administrador")) {
            request.getRequestDispatcher("vistas/admin/crudadmin.jsp").forward(request, response);
        } else {
            response.sendRedirect("vistas/error404.jsp?error=rolDesconocido");
        }
    } else {
        response.sendRedirect("vistas/error404.jsp?error=sesionNula");
    }
}

private void listarUsuarios(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    usuarioDAO dao = new usuarioDAO();
    List<usuarios> lista = dao.listarUsuarios();
    request.setAttribute("usuarios", lista);

    HttpSession session = request.getSession(false);
    usuarios usuario = (usuarios) session.getAttribute("usuario");

    if (usuario != null && usuario.getTipo_usu() != null) {
        String rol = usuario.getTipo_usu().toLowerCase();

        if (rol.equals("operario")) {
            request.getRequestDispatcher("vistas/operario/crudadmin.jsp").forward(request, response);
        } else if (rol.equals("administrador")) {
            request.getRequestDispatcher("vistas/admin/crudadmin.jsp").forward(request, response);
        } else {
            response.sendRedirect("vistas/error404.jsp?error=rolDesconocido");
        }
    } else {
        response.sendRedirect("vistas/error404.jsp?error=sesionNula");
    }
}


    private void detalleUsuario(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.setContentType("text/html;charset=UTF-8");

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.getWriter().write("<p>Error: ID de usuario no proporcionado.</p>");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            usuarioDAO dao = new usuarioDAO();
            usuarios u = dao.obtenerUsuarioPorId(id);

            if (u != null) {
                response.getWriter().write(
                    "<p><strong>Identificación:</strong> " + u.getNum_identificacion() + "</p>" +
                    "<p><strong>Tipo de Usuario:</strong> " + u.getTipo_usu() + "</p>" +
                    "<p><strong>Nombre Completo:</strong> " + u.getP_nombre() + " " + u.getS_nombre() + " " + u.getP_apellido() + " " + u.getS_apellido() + "</p>" +
                    "<p><strong>Correo:</strong> " + u.getCorreo() + "</p>" +
                    "<p><strong>Teléfono:</strong> " + u.getTelefono() + "</p>" +
                    "<p><strong>Salario:</strong> " + u.getSalario() + "</p>" +
                    "<p><strong>Fecha de Nacimiento:</strong> " + u.getFecha_nacimiento() + "</p>" +
                    "<p><strong>Dirección:</strong> " + u.getDireccion() + "</p>"
                );
            } else {
                response.getWriter().write("<p>Usuario no encontrado.</p>");
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("<p>Error: ID inválido.</p>");
        }
    }

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            long id = Long.parseLong(request.getParameter("id"));
            usuarioDAO dao = new usuarioDAO();
            dao.eliminarUsuario(id);
            response.sendRedirect("usuario?action=listar");
        } catch (Exception e) {
            System.err.println("Error al eliminar usuario: " + e.getMessage());
            response.sendRedirect("vistas/error404.jsp?error=eliminar");
        }
    }
private void insertarUsuario(HttpServletRequest request, HttpServletResponse response)
        throws IOException {
    try {
        String tipo = request.getParameter("tipo_usu");
        long numId = Long.parseLong(request.getParameter("num_identificacion"));
        String clave = request.getParameter("clave");
        String pNom = request.getParameter("p_nombre");
        String sNom = request.getParameter("s_nombre");
        String pApe = request.getParameter("p_apellido");
        String sApe = request.getParameter("s_apellido");
        String correo = request.getParameter("correo");
        long telefono = Long.parseLong(request.getParameter("telefono"));
        long salario = Long.parseLong(request.getParameter("salario"));
        String fechaNac = request.getParameter("fecha_nacimiento");
        String direccion = request.getParameter("direccion");

        usuarioDAO dao = new usuarioDAO();
        dao.insertarUsuario(numId, tipo, clave, pNom, sNom, pApe, sApe, correo, telefono, salario, fechaNac, direccion);

        response.sendRedirect("usuario?action=listar");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("vistas/error404.jsp?error=insertar");
    }
}
private void editarUsuario(HttpServletRequest request, HttpServletResponse response)
        throws IOException {
    try {
        int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
        long num_identificacion = Long.parseLong(request.getParameter("num_identificacion"));
        String tipo_usu = request.getParameter("tipo_usu");
        String clave = request.getParameter("clave");
        String p_nombre = request.getParameter("p_nombre");
        String s_nombre = request.getParameter("s_nombre");
        String p_apellido = request.getParameter("p_apellido");
        String s_apellido = request.getParameter("s_apellido");
        String correo = request.getParameter("correo");
        long telefono = Long.parseLong(request.getParameter("telefono"));
        long salario = Long.parseLong(request.getParameter("salario"));
        String fecha_nacimiento_str = request.getParameter("fecha_nacimiento");
        String direccion = request.getParameter("direccion");

        Date fecha_nacimiento = null;
        if (fecha_nacimiento_str != null && !fecha_nacimiento_str.isEmpty()) {
            fecha_nacimiento = Date.valueOf(fecha_nacimiento_str);
        }

        usuarios u = new usuarios();
        u.setId_usuario(id_usuario);
        u.setNum_identificacion(num_identificacion);
        u.setTipo_usu(tipo_usu);
        u.setClave(clave);
        u.setP_nombre(p_nombre);
        u.setS_nombre(s_nombre);
        u.setP_apellido(p_apellido);
        u.setS_apellido(s_apellido);
        u.setCorreo(correo);
        u.setTelefono(telefono);
        u.setSalario(salario);
        u.setFecha_nacimiento(fecha_nacimiento);
        u.setDireccion(direccion);

        usuarioDAO dao = new usuarioDAO();
        dao.actualizarUsuario(u);

        response.sendRedirect("usuario?action=listar");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("vistas/error404.jsp?error=editar");
    }
}
}