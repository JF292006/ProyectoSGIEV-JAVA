<%-- 
    Document   : crudventa
    Created on : 1/07/2025, 6:01:28?p. m.
    Author     : Obaho Asesores
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="modelos.proveedorDAO"%>
<%@page import="modelos.proveedor"%>
<%@page import="java.util.List"%>

<%
    proveedorDAO dao = new proveedorDAO();
    List<proveedor> listaProveedores = dao.listarProveedores();
    request.setAttribute("proveedores", listaProveedores);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Proveedores</title>
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
            display: none;
            align-items: center;
            justify-content: center;
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
    <h1 class="title">Gestión de Proveedores - Tienda Naturista</h1>
 <nav class="navbar">
  <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/admin.jsp'">Ir a Panel</button>
  
    <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/crudventa.jsp'">Ir a Ventas</button>
  <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/crudinventario.jsp'">Ir a Inventario</button>
    <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/crudproducto.jsp'">Ir a Productos</button>
  <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/crudadmin.jsp'">Ir a Usuarios</button>
</nav>
</header>

<div class="container">
    <div class="card">
        <div class="card-header">
            <h2>Lista de Proveedores</h2>
        </div>

        <div class="card-body">
            <div class="search-container">
                <button class="add-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/admin/formulario_proveedor.jsp'">+ Añadir Proveedor</button>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="prov" items="${proveedores}">
                        <tr>
                            <td>${prov.idproveedor}</td>
                            <td>${prov.nombre_proveedor}</td>
                            <td>${prov.correo_proveedor}</td>
                            <td>${prov.telefono}</td>
                            <td>${prov.direccion}</td>
                            <td>
                                <button class="info-btn" onclick="verDetalles(${prov.idproveedor})">Detalles</button>
                                <button class="edit-btn"
                                    onclick="abrirModalEdicionProveedor(
                                        ${prov.idproveedor},
                                        '${prov.nombre_proveedor}',
                                        '${prov.correo_proveedor}',
                                        ${prov.telefono},
                                        '${prov.direccion}'
                                    )">Editar</button>
                                <form action="proveedor" method="get" style="display:inline;">
                                    <input type="hidden" name="action" value="eliminar"/>
                                    <input type="hidden" name="id" value="${prov.idproveedor}"/>
                                    <button class="delete-btn" type="submit" onclick="return confirm('¿Eliminar proveedor?')">Eliminar</button>
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
<div id="modalDetallesProveedor" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarDetallesProveedor()">&times;</span>
        <h2>Detalles del Proveedor</h2>
        <div id="contenidoDetallesProveedor">Cargando...</div>
    </div>
</div>

<!-- Modal Editar -->
<div id="modalEditarProveedor" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarModalProveedor()">&times;</span>
        <h2>Editar Proveedor</h2>
        <form action="${pageContext.request.contextPath}/proveedor?action=editar" method="post">
            <input type="hidden" id="edit_idproveedor" name="idproveedor">
            <label>Nombre:</label>
            <input type="text" id="edit_nombre" name="nombre_proveedor" required>
            <label>Correo:</label>
            <input type="email" id="edit_correo" name="correo_proveedor">
            <label>Teléfono:</label>
            <input type="number" id="edit_telefono" name="telefono" required>
            <label>Dirección:</label>
            <input type="text" id="edit_direccion" name="direccion" required>
            <button type="submit" class="add-btn">Actualizar</button>
        </form>
    </div>
</div>

<!-- Scripts -->
<script>
function verDetalles(id) {
    const url = `${pageContext.request.contextPath}/proveedor?action=detalle&id=` + id;
    fetch(url)
        .then(res => res.text())
        .then(data => {
            document.getElementById("contenidoDetallesProveedor").innerHTML = data;
            document.getElementById("modalDetallesProveedor").style.display = "flex";
        })
        .catch(err => {
            document.getElementById("contenidoDetallesProveedor").innerHTML = "<p>Error al cargar detalles</p>";
            document.getElementById("modalDetallesProveedor").style.display = "flex";
        });
}

function cerrarDetallesProveedor() {
    document.getElementById("modalDetallesProveedor").style.display = "none";
}

function abrirModalEdicionProveedor(id, nombre, correo, telefono, direccion) {
    document.getElementById("edit_idproveedor").value = id;
    document.getElementById("edit_nombre").value = nombre;
    document.getElementById("edit_correo").value = correo;
    document.getElementById("edit_telefono").value = telefono;
    document.getElementById("edit_direccion").value = direccion;
    document.getElementById("modalEditarProveedor").style.display = "flex";
}

function cerrarModalProveedor() {
    document.getElementById("modalEditarProveedor").style.display = "none";
}
</script>

</body>
</html>

