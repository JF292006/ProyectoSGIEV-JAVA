<%-- 
    Document   : editar_mensajerias
    Created on : 2/07/2025, 11:37:55 p. m.
    Author     : Obaho Asesores
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelos.mensajeria" %>
<%
    mensajeria m = (mensajeria) request.getAttribute("mensajeria");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Mensajería</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Editar Mensajería</h2>
    <form action="${pageContext.request.contextPath}/mensajeriaController?accion=actualizar" method="post">
        <input type="hidden" name="accion" value="editar">
        <input type="hidden" name="idmensajeria" value="<%= m.getIdmensajeria() %>">

        <div class="mb-3">
            <label for="nombre_mensajeria" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="nombre_mensajeria" name="nombre_mensajeria" value="<%= m.getNombre_mensajeria() %>" required>
        </div>
        <div class="mb-3">
            <label for="tel_mensajeria" class="form-label">Teléfono</label>
            <input type="number" class="form-control" id="tel_mensajeria" name="tel_mensajeria" value="<%= m.getTel_mensajeria() %>" required>
        </div>
        <div class="mb-3">
            <label for="direccion_mensajeria" class="form-label">Dirección</label>
            <input type="text" class="form-control" id="direccion_mensajeria" name="direccion_mensajeria" value="<%= m.getDireccion_mensajeria() %>" required>
        </div>
        <div class="mb-3">
            <label for="cobertura" class="form-label">Cobertura</label>
            <input type="text" class="form-control" id="cobertura" name="cobertura" value="<%= m.getCobertura() %>" required>
        </div>

        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
        <a href="lista_mensajeria.jsp" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
</body>
</html>