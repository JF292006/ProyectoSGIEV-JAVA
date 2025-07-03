/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import modelos.usuarios;
import modelos.usuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class loginservlet extends HttpServlet {

    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String correo = request.getParameter("usuario");
    String contrasena = request.getParameter("contrasena");

    usuarioDAO dao = new usuarioDAO();
    usuarios usuario = dao.validarUsuario(correo, contrasena);

    if (usuario != null) {
        HttpSession session = request.getSession();
        session.setAttribute("usuario", usuario);

        if (usuario.getTipo_usu().equalsIgnoreCase("administrador")) {
            response.sendRedirect("vistas/admin/admin.jsp");
        } else if (usuario.getTipo_usu().equalsIgnoreCase("operario")) {
            response.sendRedirect("vistas/operario/ope.jsp");
        } else {
            response.sendRedirect("vistas/error404.jsp?error=rolDesconocido");
        }
    } else {
        response.sendRedirect("vistas/error404.jsp?error=credenciales");
    }
}


   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.html"); // o cualquier otra acción
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet que redirige según el tipo de usuario";
    }
}
