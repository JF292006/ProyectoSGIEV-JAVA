<%-- 
    Document   : crudadmin
    Created on : 28/06/2025, 5:43:11 p. m.
    Author     : Obaho Asesores
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="modelos.usuarioDAO"%>
<%@page import="modelos.usuarios"%>
<%@page import="java.util.List"%>

<%
    if (request.getAttribute("usuarios") == null) {
        modelos.usuarioDAO dao = new modelos.usuarioDAO();
        List<modelos.usuarios> listaUsuarios = dao.listarUsuarios();
        request.setAttribute("usuarios", listaUsuarios);
    }
%>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema CRUD - Tienda Naturista</title>
    <link href="${pageContext.request.contextPath}/estilos/estiloscrudadmin.css" rel="stylesheet" type="text/css"/>
    <style>
        .modal {
            position: fixed;
            z-index: 9999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.5);
        }
        .modal-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 20px;
            border-radius: 8px;
            width: 500px;
        }
        .close {
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
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
    <h1 class="title">Sistema de Gestión - Tienda Naturista</h1>
<nav class="navbar">
  <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/operario/ope.jsp'">Ir a Panel</button>
  
    <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/operario/crudventa.jsp'">Ir a Ventas</button>
  
  <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/operario/crudproducto.jsp'">Ir a Productos</button>
  
  <button class="nav-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/operario/crudinventario.jsp'">Ir a Inventario</button>
</nav>

</header>



<div class="container">
    <div class="card">
        <div class="card-header">
            <h2>Usuarios registrados</h2>
            
        </div>

        <div class="card-body">
           <div class="search-container">
  <form action="${pageContext.request.contextPath}/usuario" method="get" style="display: flex; gap: 10px;">
    <input type="hidden" name="action" value="buscar" />
    <input type="text" name="filtro" class="search-input" placeholder="Buscar por nombre, apellido o rol..." required>
    <button type="submit" class="add-btn">Buscar</button>
</form>

</div>

            <div class="search-container">
                <button class="add-btn" onclick="window.location.href='${pageContext.request.contextPath}/vistas/operario/formulario_usuario.jsp'">+ Añadir Usuario</button>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Año de Nacimiento</th>
                        <th>Rol</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="usuario" items="${usuarios}">
                        <tr>
                            <td>${usuario.id_usuario}</td>
                            <td>${usuario.p_nombre}</td>
                            <td>${usuario.p_apellido}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty usuario.fecha_nacimiento}">
                                        <fmt:formatDate value="${usuario.fecha_nacimiento}" pattern="yyyy"/>
                                    </c:when>
                                    <c:otherwise>-</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${usuario.tipo_usu}</td>
                            <td class="actions">
                                <button class="edit-btn" onclick='abrirModal(
                                    "${usuario.id_usuario}",
                                    "${usuario.num_identificacion}",
                                    "${usuario.tipo_usu}",
                                    "${usuario.clave}",
                                    "${usuario.p_nombre}",
                                    "${usuario.s_nombre}",
                                    "${usuario.p_apellido}",
                                    "${usuario.s_apellido}",
                                    "${usuario.correo}",
                                    "${usuario.telefono}",
                                    "${usuario.salario}",
                                    "${usuario.fecha_nacimiento}",
                                    "${usuario.direccion}"
                                )'>Editar</button>
<button class="info-btn" onclick="verDetalles(${usuario.id_usuario})">Detalles</button>

                                <form action="${pageContext.request.contextPath}/usuario?action=eliminar" method="get" style="display:inline;" onsubmit="return confirm('¿Estás seguro que deseas eliminar este usuario?');">
                                    <input type="hidden" name="id" value="${usuario.id_usuario}" />
                                    <button type="submit" class="delete-btn">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
function abrirModal(id, numId, tipo, clave, pnom, snom, papell, sapell, correo, tel, salario, fecha, direccion) {
  document.getElementById('id_usuario').value = id;
  document.getElementById('num_identificacion').value = numId;
  document.getElementById('tipo_usu').value = tipo;
  document.getElementById('clave').value = clave;
  document.getElementById('p_nombre').value = pnom;
  document.getElementById('s_nombre').value = snom;
  document.getElementById('p_apellido').value = papell;
  document.getElementById('s_apellido').value = sapell;
  document.getElementById('correo').value = correo;
  document.getElementById('telefono').value = tel;
  document.getElementById('salario').value = salario;
  document.getElementById('fecha_nacimiento').value = fecha;
  document.getElementById('direccion').value = direccion;
  document.getElementById('modalEditar').style.display = 'block';
}
function cerrarModal() {
  document.getElementById('modalEditar').style.display = 'none';
}
</script>
<script>
  const contextPath = '<%= request.getContextPath() %>';
</script>
<script>
function verDetalles(id) {
  if (!id) {
    alert("ID inválido.");
    return;
  }


  var contextPath = "<%= request.getContextPath() %>";
var url = contextPath + "/usuario?action=detalle&id=" + id;

  fetch(url)
    .then(response => {
      if (!response.ok) {
        throw new Error("No se pudo cargar el recurso.");
      }
      return response.text();
    })
    .then(data => {
      document.getElementById("contenidoDetalles").innerHTML = data;
      document.getElementById("modalDetalles").style.display = "block";
    })
    .catch(error => {
      console.error("Error al obtener los detalles:", error);
      document.getElementById("contenidoDetalles").innerHTML = "<p>Error al cargar detalles.</p>";
      document.getElementById("modalDetalles").style.display = "block";
    });
}

function cerrarDetalles() {
  document.getElementById("modalDetalles").style.display = "none";
}
</script>



<!-- Modal de Detalles -->
<div id="modalDetalles" class="modal" style="display: none;">
  <div class="modal-content">
    <span class="close" onclick="cerrarDetalles()">&times;</span>
    <h2>Detalles del Usuario</h2>
    <div id="contenidoDetalles">Cargando...</div>
  </div>
</div>

<!-- Modal Edicion -->
<div id="modalEditar" class="modal" style="display: none;">
  <div class="modal-content">
    <span class="close" onclick="cerrarModal()">&times;</span>
    <h2>Editar Usuario</h2>
<form action="${pageContext.request.contextPath}/usuario?action=editar" method="post">
      <input type="hidden" name="id_usuario" id="id_usuario" />
      <label>Identificación:</label>
      <input type="text" name="num_identificacion" id="num_identificacion" required />
      <label>Tipo de Usuario:</label>
      <input type="text" name="tipo_usu" id="tipo_usu" required />
      <label>Contraseña:</label>
      <input type="password" name="clave" id="clave" required />
      <label>Primer Nombre:</label>
      <input type="text" name="p_nombre" id="p_nombre" required />
      <label>Segundo Nombre:</label>
      <input type="text" name="s_nombre" id="s_nombre" />
      <label>Primer Apellido:</label>
      <input type="text" name="p_apellido" id="p_apellido" required />
      <label>Segundo Apellido:</label>
      <input type="text" name="s_apellido" id="s_apellido" />
      <label>Correo:</label>
      <input type="email" name="correo" id="correo" required />
      <label>Teléfono:</label>
      <input type="text" name="telefono" id="telefono" />
      <label>Salario:</label>
      <input type="text" name="salario" id="salario" />
      <label>Fecha de Nacimiento:</label>
      <input type="date" name="fecha_nacimiento" id="fecha_nacimiento" />
      <label>Dirección:</label>
      <input type="text" name="direccion" id="direccion" />
      <button type="submit" class="add-btn">Actualizar</button>
    </form>
  </div>
</div>
</body>
</html>
