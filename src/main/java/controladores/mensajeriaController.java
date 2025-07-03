/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import modelos.mensajeria;
import modelos.mensajeriaDAO;

/**
 *
 * @author User
 */

public class mensajeriaController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet mensajeriaController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet mensajeriaController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
       
        if ("listar".equalsIgnoreCase(accion)) {
        listarMensajeria(request, response);
    }
        else if ("eliminar".equalsIgnoreCase(accion)) {
        eliminarMensajeria(request, response);
        }
        else if ("editar".equalsIgnoreCase(accion)) {
            String idStr = request.getParameter("id");

            if (idStr != null && !idStr.isEmpty()) {
                try {
                    int id = Integer.parseInt(idStr);
                    mensajeriaDAO dao = new mensajeriaDAO();
                    mensajeria m = dao.obtenerMensajeriaPorId(id);

                    if (m != null) {
                        request.setAttribute("mensajeria", m);
                        request.getRequestDispatcher("vistas/editar_mensajerias.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("mensajeriaController?accion=listar&error=no_existe");
                    }
                } catch (NumberFormatException e) {
                    response.sendRedirect("mensajeriaController?accion=listar&error=id_invalido");
                }
            } else {
        response.sendRedirect("mensajeriaController?accion=listar&error=id_vacio");
    }
}

        else {
        processRequest(request, response);
    }
       
       
}
    private void listarMensajeria(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    mensajeriaDAO dao = new mensajeriaDAO();
    List<mensajeria> lista = dao.listarMensajeria();
    request.setAttribute("mensajerias", lista);
    request.getRequestDispatcher("vistas/lista_mensajeria.jsp").forward(request, response);
}
   
    private void eliminarMensajeria(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    try {
        int id = Integer.parseInt(request.getParameter("id"));
        mensajeriaDAO dao = new mensajeriaDAO();
        boolean exito = dao.eliminarMensajeria(id);

        if (exito) {
            response.sendRedirect("mensajeriaController?accion=listar");
        } else {
            response.sendRedirect("mensajeriaController?accion=listar&error=delete");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("mensajeriaController?accion=listar&error=exception");
    }
}

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String accion = request.getParameter("accion");
       
        if ("registrar".equalsIgnoreCase(accion)) {
            registrarMensajeria(request, response);
        }
        else if ("actualizar".equalsIgnoreCase(accion)) {
        actualizarMensajeria(request, response);
    }
       
       
       
    }
   
    private void registrarMensajeria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
           
            String nombre = request.getParameter("nombre_mensajeria");
            long tel = Long.parseLong(request.getParameter("tel_mensajeria"));
            String direccion = request.getParameter("direccion_mensajeria");
            String cobertura = request.getParameter("cobertura");

           
            mensajeria m = new mensajeria();
            m.setNombre_mensajeria(nombre);
            m.setTel_mensajeria(tel);
            m.setDireccion_mensajeria(direccion);
            m.setCobertura(cobertura);

           
            mensajeriaDAO dao = new mensajeriaDAO();
            boolean exito = dao.agregarMensajeria(m);

            if (exito) {
                response.sendRedirect("vistas/registro_mensajeria.jsp?exito=true");
            } else {
                response.sendRedirect("vistas/registro_mensajeria.jsp?error=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("vistas/registro_mensajeria.jsp?error=exception");
        }
    }
    private void actualizarMensajeria(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        int id = Integer.parseInt(request.getParameter("idmensajeria"));
        String nombre = request.getParameter("nombre_mensajeria");
        long tel = Long.parseLong(request.getParameter("tel_mensajeria"));
        String direccion = request.getParameter("direccion_mensajeria");
        String cobertura = request.getParameter("cobertura");

        mensajeria m = new mensajeria();
        m.setIdmensajeria(id);
        m.setNombre_mensajeria(nombre);
        m.setTel_mensajeria(tel);
        m.setDireccion_mensajeria(direccion);
        m.setCobertura(cobertura);

        mensajeriaDAO dao = new mensajeriaDAO();
        boolean exito = dao.actualizarMensajeria(m);

        if (exito) {
            response.sendRedirect("mensajeriaController?accion=listar");
        } else {
            response.sendRedirect("vistas/editar_mensajeria.jsp?error=true");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("vistas/editar_mensajeria.jsp?error=exception");
    }
}
 

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
