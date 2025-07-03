<%-- 
    Document   : crudventa
    Created on : 1/07/2025, 6:01:28?p. m.
    Author     : Obaho Asesores
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="modelos.ventaDAO"%>
<%@page import="modelos.venta"%>
<%@page import="java.util.List"%>

<%
    ventaDAO dao = new ventaDAO();
    List<venta> listaVentas = dao.listarVentas();
    request.setAttribute("ventas", listaVentas);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Ventas</title>
    <link href="${pageContext.request.contextPath}/estilos/estiloscrudadmin.css" rel="stylesheet" type="text/css"/>
<style>
.modal {
    position: fixed;
    z-index: 9999;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
    display: flex;
    align-items: center;
    justify-content: center;
}
.oculto {
    display: none !important;
}
.modal-content {
    background-color: #fff;
    padding: 25px;
    border-radius: 10px;
    max-width: 600px;
    width: 90%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    animation: fadeIn 0.3s ease;
    position: relative;
}

.close {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 24px;
    font-weight: bold;
    cursor: pointer;
    color: #333;
}

@keyframes fadeIn {
    from { opacity: 0; transform: scale(0.95); }
    to { opacity: 1; transform: scale(1); }
}
.navbar {
  display: flex;
  justify-content: center;
  gap: 15px;
  margin: 20px 0;
  flex-wrap: wrap;
}

.nav-btn {
  background-color: #66bb6a;
  color: white;
  border: none;
  border-radius: 10px;
  padding: 10px 18px;
  font-size: 15px;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.nav-btn:hover {
  background-color: #43a047;
}

</style>


</head>

<body>
<header>
    <h1 class="title">Gestión de Ventas - Tienda Naturista</h1>
<nav class="navbar">
  <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/operario/ope.jsp'">Ir a Panel</button>
  
    <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/operario/crudadmin.jsp'">Ir a Usuarios</button>
  
  <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/operario/crudproducto.jsp'">Ir a Productos</button>
  
  <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/operario/crudinventario.jsp'">Ir a Inventario</button>
</nav>
    
</header>

<div class="container">
    <div class="card">
        <div class="card-header">
            <h2>Ventas Registradas</h2>
        </div>

        <div class="card-body">
            <div class="search-container">
<button class="add-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/operario/formulario_venta.jsp'">+ Añadir Venta</button>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Fecha</th>
                        <th>Subtotal</th>
                        <th>Descuento</th>
                        <th>Abono</th>
                        <th>Total</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="venta" items="${ventas}">
                        <tr>
                            <td>${venta.idfactura}</td>
                            <td><fmt:formatDate value="${venta.fecha_factura}" pattern="yyyy-MM-dd"/></td>
                            <td>$${venta.subtotal}</td>
                            <td>$${venta.descuento}</td>
                            <td>$${venta.abono}</td>
                            <td>$${venta.valor_total}</td>
                            <td class="actions">
                                <button class="info-btn" onclick="verDetalles(${venta.idfactura})">Detalles</button>
                                <button class="edit-btn"
    onclick="abrirModalVenta(
        ${venta.idfactura},
        '${venta.fecha_factura}',
        ${venta.subtotal},
        ${venta.descuento},
        ${venta.abono},
        ${venta.valor_total},
        '${venta.observaciones}',
        ${venta.usuarios_id_usuario}
    )">Editar</button>

                                <form action="venta" method="get" style="display:inline;">
                                    <input type="hidden" name="action" value="eliminar" />
                                    <input type="hidden" name="id" value="${venta.idfactura}" />
                                    <button class="delete-btn" type="submit" onclick="return confirm('¿Eliminar esta venta?')">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<div id="modalDetalles" class="modal oculto">
    <div class="modal-content">
<span class="close" onclick="cerrarModalDetalles()">&times;</span>
        <h2>Detalles de Venta</h2>
        <div id="contenidoDetalles">Cargando...</div>
    </div>
</div>

<div id="modalEditarVenta" class="modal oculto">
    <div class="modal-content">
        <span class="close" onclick="cerrarModalVenta()">&times;</span>
        <h2>Editar Venta</h2>
        <form action="${pageContext.request.contextPath}/venta?action=editar" method="post">
            <input type="hidden" id="edit_idfactura" name="idfactura">
            <label>Fecha:</label>
            <input type="date" id="edit_fecha" name="fecha_factura" required>
            <label>Subtotal:</label>
            <input type="number" id="edit_subtotal" name="subtotal" required>
            <label>Descuento:</label>
            <input type="number" id="edit_descuento" name="descuento" required>
            <label>Abono:</label>
            <input type="number" id="edit_abono" name="abono" required>
            <label>Total:</label>
            <input type="number" id="edit_total" name="valor_total" required>
            <label>Observaciones:</label>
            <input type="text" id="edit_observaciones" name="observaciones">
            <label>ID Usuario:</label>
            <input type="number" id="edit_usuario" name="usuarios_id_usuario" required>
            <button type="submit" class="add-btn">Actualizar</button>
        </form>
    </div>
</div>

<script>
function verDetalles(id) {
    const url = `${pageContext.request.contextPath}/venta?action=detalle&id=` + id;
    fetch(url)
      .then(res => res.text())
      .then(data => {
        document.getElementById('contenidoDetalles').innerHTML = data;
        document.getElementById('modalDetalles').classList.remove('oculto');
      })
      .catch(err => {
        document.getElementById('contenidoDetalles').innerHTML = '<p>Error al cargar detalles</p>';
        document.getElementById('modalDetalles').classList.remove('oculto');
      });
}

function cerrarModalDetalles() {
    document.getElementById('modalDetalles').classList.add('oculto');
}

</script>
<script>
function abrirModalVenta(id, fecha, subtotal, descuento, abono, total, obs, idUsuario) {
    document.getElementById('edit_idfactura').value = id;
    document.getElementById('edit_fecha').value = fecha.split("T")[0];
    document.getElementById('edit_subtotal').value = subtotal;
    document.getElementById('edit_descuento').value = descuento;
    document.getElementById('edit_abono').value = abono;
    document.getElementById('edit_total').value = total;
    document.getElementById('edit_observaciones').value = obs;
    document.getElementById('edit_usuario').value = idUsuario;

    const modal = document.getElementById('modalEditarVenta');
    modal.classList.remove("oculto");
}

function cerrarModalVenta() {
    const modal = document.getElementById('modalEditarVenta');
    modal.classList.add("oculto");
}

</script>

</body>
</html>


