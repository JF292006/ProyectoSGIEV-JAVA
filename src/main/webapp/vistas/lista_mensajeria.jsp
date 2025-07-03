<%-- 
    Document   : lista_mensajeria
    Created on : 2/07/2025, 11:36:19 p. m.
    Author     : Obaho Asesores
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="modelos.mensajeria" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Mensajerías</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Listado de Mensajerías</h2>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Teléfono</th>
                <th>Dirección</th>
                <th>Cobertura</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<mensajeria> mensajerias = (List<mensajeria>) request.getAttribute("mensajerias");
            if (mensajerias != null && !mensajerias.isEmpty()) {
                for (mensajeria m : mensajerias) {
        %>
        <tr>
            <td><%= m.getIdmensajeria() %></td>
            <td><%= m.getNombre_mensajeria() %></td>
            <td><%= m.getTel_mensajeria() %></td>
            <td><%= m.getDireccion_mensajeria() %></td>
            <td><%= m.getCobertura() %></td>
            <td>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        &#8942;
                    </button>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="mensajeriaController?accion=editar&id=<%= m.getIdmensajeria() %>" class="dropdown-item">Editar</a>
                        </li>
                        <li>
                            <a href="mensajeriaController?accion=eliminar&id=<%= m.getIdmensajeria() %>" class="dropdown-item" onclick="return confirm('¿Estás seguro de eliminar esta mensajería?');">Eliminar</a>
                        </li>
                    </ul>
                </div>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6" class="text-center">No hay registros disponibles.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/vistas/registro_mensajeria.jsp" target="_blank" class="btn btn-primary">Registrar nueva mensajería</a>
</div>
</body>
</html>