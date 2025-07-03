<%-- 
    Document   : crudventa
    Created on : 1/07/2025, 6:01:28?p. m.
    Author     : Obaho Asesores
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="modelos.inventarioDAO"%>
<%@page import="modelos.inventario"%>
<%@page import="java.util.List"%>

<%
    inventarioDAO dao = new inventarioDAO();
    List<inventario> listaInventario = dao.listarInventario();
    request.setAttribute("inventarios", listaInventario);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Inventario</title>
    <link href="${pageContext.request.contextPath}/estilos/estiloscrudadmin.css" rel="stylesheet" type="text/css"/>
    <style>
        .modal { position: fixed; z-index: 9999; left: 0; top: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.5); display: none; align-items: center; justify-content: center; }
        .modal-content { background-color: #fff; padding: 25px; border-radius: 10px; max-width: 600px; width: 90%; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); animation: fadeIn 0.3s ease; position: relative; }
        .close { position: absolute; top: 10px; right: 15px; font-size: 24px; font-weight: bold; cursor: pointer; color: #333; }
        @keyframes fadeIn { from { opacity: 0; transform: scale(0.95); } to { opacity: 1; transform: scale(1); } }
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
    <h1 class="title">Gestión de Inventario - Tienda Naturista</h1>
<nav class="navbar">
  <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/admin.jsp'">Ir a Panel</button>
  
    <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/crudventa.jsp'">Ir a Ventas</button>
  <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/crudproducto.jsp'">Ir a Productos</button>
    <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/crudproveedor.jsp'">Ir a Proveedores</button>
  <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/crudadmin.jsp'">Ir a Usuarios</button>
</nav>
</header>
    

<div class="container">
    <div class="card">
        <div class="card-header">
            <h2>Lista de Inventario</h2>
        </div>

        <div class="card-body">
            <div class="search-container">
                <button class="add-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/formulario_inventario.jsp'">+ Añadir Inventario</button>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Stock Min</th>
                        <th>Stock Max</th>
                        <th>Lote</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="inv" items="${inventarios}">
                        <tr>
                            <td>${inv.idinventario}</td>
                            <td>${inv.nombreProducto}</td>
                            <td>${inv.cantidad_existente}</td>
                            <td>${inv.stock_min}</td>
                            <td>${inv.stock_max}</td>
                            <td>${inv.num_lote}</td>
                            <td>
                                <button class="info-btn" onclick="verDetalles(${inv.idinventario})">Detalles</button>
                                <button class="edit-btn"
                                    onclick="abrirModalEdicionInventario(
                                        ${inv.idinventario},
                                        ${inv.cantidad_existente},
                                        ${inv.stock_max},
                                        ${inv.stock_min},
                                        ${inv.num_lote},
                                        '${inv.fecha_vencimiento}',
                                        '${inv.observaciones}',
                                        '${inv.fecha_entrada}',
                                        '${inv.fecha_salida}',
                                        ${inv.productos_idproducto}
                                    )">Editar</button>
                                <form action="inventario" method="get" style="display:inline;">
                                    <input type="hidden" name="action" value="eliminar"/>
                                    <input type="hidden" name="id" value="${inv.idinventario}"/>
                                    <button class="delete-btn" type="submit" onclick="return confirm('¿Eliminar inventario?')">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal Detalles -->
<div id="modalDetallesInventario" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarDetallesInventario()">&times;</span>
        <h2>Detalles del Inventario</h2>
        <div id="contenidoDetallesInventario">Cargando...</div>
    </div>
</div>

<!-- Modal Editar -->
<div id="modalEditarInventario" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarModalInventario()">&times;</span>
        <h2>Editar Inventario</h2>
        <form action="${pageContext.request.contextPath}/inventario?action=editar" method="post">
            <input type="hidden" id="edit_idinventario" name="idinventario">
            <label>Cantidad Existente:</label>
            <input type="number" id="edit_cantidad" name="cantidad_existente" required>
            <label>Stock Máximo:</label>
            <input type="number" id="edit_stock_max" name="stock_max" required>
            <label>Stock Mínimo:</label>
            <input type="number" id="edit_stock_min" name="stock_min" required>
            <label>Número de Lote:</label>
            <input type="number" id="edit_num_lote" name="num_lote" required>
            <label>Fecha Vencimiento:</label>
            <input type="date" id="edit_fecha_vencimiento" name="fecha_vencimiento">
            <label>Observaciones:</label>
            <textarea id="edit_observaciones" name="observaciones"></textarea>
            <label>Fecha Entrada:</label>
            <input type="date" id="edit_fecha_entrada" name="fecha_entrada">
            <label>Fecha Salida:</label>
            <input type="date" id="edit_fecha_salida" name="fecha_salida">
            <label>ID Producto:</label>
            <input type="number" id="edit_producto" name="productos_idproducto" required>
            <button type="submit" class="add-btn">Actualizar</button>
        </form>
    </div>
</div>

<script>
function verDetalles(id) {
    const url = `${pageContext.request.contextPath}/inventario?action=detalle&id=` + id;
    fetch(url)
        .then(res => res.text())
        .then(data => {
            document.getElementById("contenidoDetallesInventario").innerHTML = data;
            document.getElementById("modalDetallesInventario").style.display = "flex";
        });
}

function cerrarDetallesInventario() {
    document.getElementById("modalDetallesInventario").style.display = "none";
}

function abrirModalEdicionInventario(id, cantidad, stockMax, stockMin, lote, venc, obs, entrada, salida, idprod) {
    document.getElementById("edit_idinventario").value = id;
    document.getElementById("edit_cantidad").value = cantidad;
    document.getElementById("edit_stock_max").value = stockMax;
    document.getElementById("edit_stock_min").value = stockMin;
    document.getElementById("edit_num_lote").value = lote;
    document.getElementById("edit_fecha_vencimiento").value = venc;
    document.getElementById("edit_observaciones").value = obs;
    document.getElementById("edit_fecha_entrada").value = entrada;
    document.getElementById("edit_fecha_salida").value = salida;
    document.getElementById("edit_producto").value = idprod;
    document.getElementById("modalEditarInventario").style.display = "flex";
}

function cerrarModalInventario() {
    document.getElementById("modalEditarInventario").style.display = "none";
}
</script>

</body>
</html>
