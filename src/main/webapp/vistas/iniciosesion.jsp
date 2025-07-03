<%-- 
    Document   : iniciosecion
    Created on : 28/06/2025, 5:40:22 p. m.
    Author     : Obaho Asesores
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de Sesión - Tienda Naturista</title>
    <link href="../estilos/estilosinicios.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="login-container">
        <div class="login-form">
            <div class="logo-container">
                <img src="../estilos/logo.png" alt="Logo Tienda Naturista" class="logo">
                <h1>Iniciar Sesión</h1>
            </div>

            <form action="${pageContext.request.contextPath}/login" method="POST">

                <div class="form-group">
                   <label for="usuario">Correo</label>
                   <input type="email" id="usuario" name="usuario" placeholder="Ingresa tu correo" required>
                </div>

                <div class="form-group password-container">
                    <label for="contrasena">Contraseña</label>
                    <div class="password-input">
                        <input type="password" id="contrasena" name="contrasena" placeholder="Ej. 1234567890" required>
                        <button type="button" class="toggle-password">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>

                <button type="submit" class="btn-login">Iniciar Sesión</button>

                <div class="login-options">
                    <a href="#" class="forgot-password">¿Olvidaste tu contraseña?</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        document.querySelector('.toggle-password').addEventListener('click', function () {
            const passwordInput = document.getElementById('contrasena');
            const icon = this.querySelector('i');

            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        });
    </script>
</body>
</html>
