<%-- 
    Document   : cliente
    Created on : 28/06/2025, 5:42:34 p. m.
    Author     : Obaho Asesores
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Cliente - Romar natural</title>
    <link href="../estilos/estiloscliente.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <header>
        <div class="logo-container">
            <img src="logo.png" alt="Logo Tienda Naturista" class="logo">
            <h1>Panel de Cliente</h1>
        </div>
        <div class="user-info">
            <span class="operator-name">Operario María González</span>
            <button class="logout-btn" onclick="window.location.href='index.html'">Cerrar Sesión</button>
        </div>
    </header>


            <div class="dashboard-module envios">
                <div class="module-icon">🚚</div>
                <h2>Control Envíos</h2>
                <p>Rastrea los envíos de productos o el estado en el cual se encuentran</p>
                <a href="#" class="module-link">Ir a Envíos</a>
            </div>

            <div class="dashboard-module inventario">
                <div class="module-icon">📦</div>
                <h2>Consultar Productos</h2>
                <p>Visualisa las existencias de productos</p>
                <a href="#" class="module-link">Ir a Inventario</a>
            </div>
        </div>
    </main>

    <footer>
        <div class="footer-content">
            <div class="contact-info">
                <h3>Panel cliente</h3>
  </div>
            <div class="system-info">
                <p>© 2024 Tienda Naturista - Sistema Operativo</p>
            </div>
        </div>
    </footer>
</body>
</html>
