<%-- 
    Document   : index
    Created on : 28/06/2025, 5:48:13 p. m.
    Author     : Obaho Asesores
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda Naturista - Romar natural</title>
    <link href="estilos/styles.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <header>
        <div class="logo-container">
            <img src="estilos/logo.png" alt="Logo Tienda Naturista" class="logo">
        </div>
        <nav>
<div class="dropdown">
                <button class="dropbtn">Menú</button>
                <div class="dropdown-content">
                    <a href="vistas/catalogo.jsp">Catálogo</a>
                    <a href="#">Sobre Nosotros</a>
                </div>
            </div>
            <div class="auth-buttons">
<button class="login-btn" onclick="window.location.href='vistas/iniciosesion.jsp'">
  Iniciar Sesión
</button>
                
            </div>
        </nav>
    </header>

    <main class="fondo-img">
        <section class="rotating-publication">
            <div class="publication-container hero-overlay">
                <h2>¡Descubre Nuestras Ofertas Especiales!</h2>
                <p>Este mes, aprovecha nuestro pack de bienestar: té verde orgánico, suplementos de hierbas y aceites esenciales con un 25% de descuento.</p>
                <a href="#" class="btn-ver-mas">Ver Más</a>
            </div>
        </section>
    </main>

    <footer>
        <div class="footer-content">
            <div class="contact-info">
                <h3>Contacto</h3>
                <p>Teléfono: +57 3158700314 </p>
                <p>Dirección: Calle 144 #145 - 50</p>
            </div>
            <div class="social-media">
                <h3>Síguenos</h3>
                <div class="social-icons">
                    <a href="#" class="facebook">Facebook</a>
                    <a href="#" class="instagram">Instagram</a>
                    <a href="#" class="whatsapp">WhatsApp</a>
                </div>
            </div>
        </div>
    </footer>
    
</body>
</html>

