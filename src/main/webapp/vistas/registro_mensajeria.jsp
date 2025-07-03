<%-- 
    Document   : registro_mensajeria
    Created on : 2/07/2025, 11:37:05 p. m.
    Author     : Obaho Asesores
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Mensajería</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
<div class="container mt-5">
    <h2>Registrar Mensajería</h2>

   
    <%
        String exito = request.getParameter("exito");
        String error = request.getParameter("error");
        if ("true".equals(exito)) {
    %>
        <div class="alert alert-success">✅ Mensajería registrada correctamente.</div>
    <%
        } else if ("true".equals(error)) {
    %>
        <div class="alert alert-danger">❌ Hubo un error al registrar la mensajería.</div>
    <%
        } else if ("exception".equals(error)) {
    %>
        <div class="alert alert-danger">❌ Error inesperado. Intente de nuevo.</div>
    <%
        }
    %>

    <form action="../mensajeriaController?accion=registrar" method="post">
        <input type="hidden" name="accion" value="registrar">
        <div class="mb-3">
            <label for="nombre_mensajeria" class="form-label">Nombre de la mensajería</label>
            <input type="text" class="form-control" id="nombre_mensajeria" name="nombre_mensajeria" required>
        </div>
        <div class="mb-3">
            <label for="tel_mensajeria" class="form-label">Teléfono</label>
            <input type="number" class="form-control" id="tel_mensajeria" name="tel_mensajeria" required>
        </div>
        <div class="mb-3">
            <label for="direccion_mensajeria" class="form-label">Dirección</label>
            <input type="text" class="form-control" id="direccion_mensajeria" name="direccion_mensajeria" required>
        </div>
        <div class="mb-3">
            <label for="cobertura" class="form-label">Cobertura</label>
            <input type="text" class="form-control" id="cobertura" name="cobertura" required>
        </div>
        <button type="submit" class="btn btn-primary">Registrar Mensajería</button>
    </form>
</div>
    
    <script>
    
    setTimeout(function () {
        var alerta = document.getElementById('alerta');
        if (alerta) {
            alerta.style.display = 'none';
        }
    }, 3000);
</script>
</body>
</html>