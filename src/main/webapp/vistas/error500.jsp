<%-- 
    Document   : error500
    Created on : 28/06/2025, 5:44:44 p. m.
    Author     : Obaho Asesores
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error 500 - Error Interno del Servidor | Tienda Naturista</title>
    
    <link href="../estilos/estiloserror.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="error-container">
        <div class="error-content">
            <h1>500</h1>
            <h2>Error Interno del Servidor</h2>
            <p>Parece que nuestro jardín de servidores ha sufrido una pequeña tormenta. Estamos trabajando para restaurarlo.</p>
            <div class="error-illustration">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 300">
                    <path d="M100 200 Q250 100, 400 200" stroke="#2ecc71" stroke-width="10" fill="none"/>
                    <circle cx="250" cy="150" r="50" fill="#e74c3c"/>
                    <text x="250" y="160" text-anchor="middle" fill="white" font-size="30">!</text>
                </svg>
            </div>
            <div class="error-actions">
                <a href="index.html" class="btn-home">Volver al Inicio</a>
                <a href="/contacto" class="btn-contact">Reportar Problema</a>
            </div>
        </div>
    </div>
</body>
</html>