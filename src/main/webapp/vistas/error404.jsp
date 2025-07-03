<%-- 
    Document   : error404
    Created on : 28/06/2025, 5:44:05 p. m.
    Author     : Obaho Asesores
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error 404 - Página no Encontrada | Romar naturl</title>
    <link href="../estilos/estiloserror.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="error-container">
        <div class="error-content">
            <h1>404</h1>
            <h2>Página no Encontrada</h2>
            <p>Lo sentimos, la página que estás buscando parece haberse perdido en el bosque.</p>
            <div class="error-illustration">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 300">
                    <path d="M250 50 Q350 150, 250 250 Q150 150, 250 50Z" fill="#2ecc71" opacity="0.3"/>
                    <circle cx="250" cy="150" r="50" fill="#27ae60"/>
                    <text x="250" y="160" text-anchor="middle" fill="white" font-size="30">?</text>
                </svg>
            </div>
            <div class="error-actions">
                <a href="../index.jsp" class="btn-home">Volver al Inicio</a>
                <a href="/contacto" class="btn-contact">Contactar Soporte</a>
            </div>
        </div>
    </div>
</body>
</html>