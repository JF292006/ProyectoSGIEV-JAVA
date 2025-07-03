<%-- 
    Document   : ope
    Created on : 28/06/2025, 5:45:41 p. m.
    Author     : Obaho Asesores
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración - Tienda Naturista</title>
    <link href="../../estilos/estilosadmin.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <header>
        <div class="logo-container">
            <img src="../../estilos/logo.png" alt="Logo Tienda Naturista" class="logo">
            <h1>Panel de Operario</h1>
        </div>
        <div class="user-info">
            <span class="admin-name">Operario activo</span>
            <button class="logout-btn" onclick="window.location.href='../iniciosesion.jsp'">Cerrar Sesión</button>
        </div>
    </header>

    <main class="admin-dashboard">
        <div class="dashboard-grid">
            <div class="dashboard-module ventas">
                <div class="module-icon">📊</div>
                <h2>Gestionar Ventas</h2>
                <p>Administra y visualiza tus ventas diarias, semanales y mensuales</p>
                <a href="${pageContext.request.contextPath}/venta?action=listar" class="module-link">Ir a Ventas</a>

            </div>

            <div class="dashboard-module usuarios">
                <div class="module-icon">👥</div>
                <h2>Gestionar Usuarios</h2>
                <p>Administra perfiles de usuarios, roles y permisos</p>
                <a href="${pageContext.request.contextPath}/usuario?action=listar" class="module-link">Ir a Usuarios</a>
            </div>
          

            <div class="dashboard-module envios">
                <div class="module-icon">📝</div>
                <h2>Gestionar Productos</h2>
                <p>Controla y gestiona tus productos</p>
                <a href="${pageContext.request.contextPath}/producto?action=listar" class="module-link">Ir a Productos</a>
            </div>

            <div class="dashboard-module inventario">
                <div class="module-icon">📦</div>
                <h2>Gestionar Inventario</h2>
                <p>Mantén un control preciso de tus productos y existencias</p>
                <a href="${pageContext.request.contextPath}/inventario?action=listar" class="module-link">Ir a Inventario</a>
            </div>
        </div>
    </main>

    <footer>
        <div class="footer-content">
            <div class="contact-info">
                <h3>Panel Operario</h3>
                <p></p>
            </div>
            <div class="system-info">
                <p>© 2024 Tienda Naturista - Sistema de Administración</p>
            </div>
        </div>
    </footer>
</body>
</html>
