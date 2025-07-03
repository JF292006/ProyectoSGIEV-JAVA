<%-- 
    Document   : crudventa
    Created on : 1/07/2025, 6:01:28?p. m.
    Author     : Obaho Asesores
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="modelos.productoDAO" %>
<%@page import="modelos.producto" %>
<%@page import="java.util.List" %>

<%
    productoDAO dao = new productoDAO();
    List<producto> listaProductos = dao.listarProductos();
    request.setAttribute("productos", listaProductos);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Productos</title>
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
    <h1 class="title">Gestión de Productos - Tienda Naturista</h1>
    <nav class="navbar">
  <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/admin.jsp'">Ir a Panel</button>
  
    <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/crudventa.jsp'">Ir a Ventas</button>
  <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/crudinventario.jsp'">Ir a Inventario</button>
    <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/crudproveedor.jsp'">Ir a Proveedores</button>
  <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/crudadmin.jsp'">Ir a Usuarios</button>
</nav>
</header>

<div class="container">
    <div class="card">
        <div class="card-header">
            <h2>Productos Registrados</h2>
        </div>

        <div class="card-body">
            <div class="search-container">
                <button class="add-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/formulario_producto.jsp'">+ Añadir Producto</button>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Tipo</th>
                        <th>Registro Sanitario</th>
                        <th>Proveedor</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="producto" items="${productos}">
                        <tr>
                            <td>${producto.idproducto}</td>
                            <td>${producto.nombre_producto}</td>
                            <td>$${producto.precio_producto}</td>
                            <td>${producto.nombre_tipo}</td>
                            <td>${producto.registrosanitario}</td>
                            <td>${producto.proveedor_idproveedor}</td>
                            <td class="actions">
                                <button class="info-btn" onclick="verDetallesProducto(${producto.idproducto})">Detalles</button>
                                <button class="edit-btn"
                                    onclick="abrirModalProducto(
                                        ${producto.idproducto},
                                        '${producto.nombre_producto}',
                                        ${producto.precio_producto},
                                        '${producto.descripcion_producto}',
                                        '${producto.nombre_tipo}',
                                        '${producto.registrosanitario}',
                                        ${producto.proveedor_idproveedor}
                                    )">Editar</button>

                                <form action="producto" method="get" style="display:inline;">
                                    <input type="hidden" name="action" value="eliminar" />
                                    <input type="hidden" name="id" value="${producto.idproducto}" />
                                    <button class="delete-btn" type="submit" onclick="return confirm('¿Eliminar este producto?')">Eliminar</button>
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
<div id="modalDetallesProducto" class="modal oculto">
    <div class="modal-content">
        <span class="close" onclick="cerrarModalDetallesProducto()">&times;</span>
        <h2>Detalles del Producto</h2>
        <div id="contenidoDetallesProducto">Cargando...</div>
    </div>
</div>

<!-- Modal Editar -->
<div id="modalEditarProducto" class="modal oculto">
    <div class="modal-content">
        <span class="close" onclick="cerrarModalProducto()">&times;</span>
        <h2>Editar Producto</h2>
        <form action="${pageContext.request.contextPath}/producto?action=editar" method="post">
            <input type="hidden" id="edit_idproducto" name="idproducto">
            <label>Nombre:</label>
            <input type="text" id="edit_nombre" name="nombre_producto" required>
            <label>Precio:</label>
            <input type="number" id="edit_precio" name="precio_producto" required>
            <label>Descripción:</label>
            <input type="text" id="edit_descripcion" name="descripcion_producto">
            <label>Tipo:</label>
            <input type="text" id="edit_tipo" name="nombre_tipo" required>
            <label>Registro Sanitario:</label>
            <input type="text" id="edit_registro" name="registrosanitario" required>
            <label>ID Proveedor:</label>
            <input type="number" id="edit_proveedor" name="proveedor_idproveedor" required>
            <button type="submit" class="add-btn">Actualizar</button>
        </form>
    </div>
</div>

<script>
function verDetallesProducto(id) {
    fetch('${pageContext.request.contextPath}/producto?action=detalle&id=' + id)
        .then(res => res.text())
        .then(data => {
            document.getElementById('contenidoDetallesProducto').innerHTML = data;
            document.getElementById('modalDetallesProducto').classList.remove("oculto");
        })
        .catch(err => {
            document.getElementById('contenidoDetallesProducto').innerHTML = "<p>Error al cargar detalles</p>";
            document.getElementById('modalDetallesProducto').classList.remove("oculto");
        });
}

function cerrarModalDetallesProducto() {
    document.getElementById('modalDetallesProducto').classList.add("oculto");
}

function abrirModalProducto(id, nombre, precio, descripcion, tipo, registro, proveedorId) {
    document.getElementById('edit_idproducto').value = id;
    document.getElementById('edit_nombre').value = nombre;
    document.getElementById('edit_precio').value = precio;
    document.getElementById('edit_descripcion').value = descripcion;
    document.getElementById('edit_tipo').value = tipo;
    document.getElementById('edit_registro').value = registro;
    document.getElementById('edit_proveedor').value = proveedorId;
    document.getElementById('modalEditarProducto').classList.remove("oculto");
}

function cerrarModalProducto() {
    document.getElementById('modalEditarProducto').classList.add("oculto");
}
</script>

</body>
</html>
