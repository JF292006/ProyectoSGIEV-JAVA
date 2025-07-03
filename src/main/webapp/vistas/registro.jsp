<%-- 
    Document   : registro
    Created on : 28/06/2025, 5:47:02 p. m.
    Author     : Obaho Asesores
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Operario - Romar natural</title>
    <link href="../estilos/estilosregistro.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="register-container">
        <div class="register-form">
            <div class="logo-container">
                <img src="logo.png" alt="Logo Tienda Naturista" class="logo">
                <h1>Registro de Usuario</h1>
            </div>

            <form action="#" method="POST">
                <div class="form-row">
                    <div class="form-group">
                        <label for="p_nombre">Primer Nombre *</label>
                        <input type="text" id="p_nombre" name="p_nombre" required maxlength="15">
                    </div>
                    <div class="form-group">
                        <label for="seg_nombre">Segundo Nombre</label>
                        <input type="text" id="seg_nombre" name="seg_nombre" maxlength="15">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="p_apellido">Primer Apellido *</label>
                        <input type="text" id="p_apellido" name="p_apellido" required maxlength="15">
                    </div>
                    <div class="form-group">
                        <label for="seg_apellido">Segundo Apellido</label>
                        <input type="text" id="seg_apellido" name="seg_apellido" maxlength="15">
                    </div>
                </div>

                <div class="form-group">
                    <label for="correo">Correo Electrónico *</label>
                    <input type="email" id="correo" name="correo" required maxlength="70">
                </div>

                <div class="form-group">
                    <label for="telefono">Teléfono *</label>
                    <input type="tel" id="telefono" name="telefono" required pattern="[0-9]{10}">
                </div>

                <div class="form-group">
                    <label for="contrasena">Contraseña *</label>
                    <input type="password" id="contrasena" name="contrasena" required>
                </div>

                <div class="form-group">
                    <label for="confirmar_contrasena">Confirmar Contraseña *</label>
                    <input type="password" id="confirmar_contrasena" name="confirmar_contrasena" required>
                </div>

                <div class="form-policies">
                    <input type="checkbox" id="terminos" name="terminos" required>
                    <label for="terminos">Acepto los términos y condiciones</label>
                </div>

                <button type="submit" class="btn-register">Registrarse</button>

                <div class="login-link">
                    <p>¿Ya tienes una cuenta? <a href="iniciosesion.html">Inicia sesión</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>