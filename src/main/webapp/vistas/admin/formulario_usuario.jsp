<%-- 
    Document   : formulario_usuario
    Created on : 30/06/2025, 2:15:18 p. m.
    Author     : Obaho Asesores
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registrar Usuario</title>
    <link href="../../estilos/estiloscrudadmin.css" rel="stylesheet" type="text/css"/>
     <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <style>
    * {
      box-sizing: border-box;
      font-family: 'Inter', sans-serif;
      margin: 0;
      padding: 0;
    }

    body {
      background: linear-gradient(to right, #e8f5e9, #f1f8e9);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }

    .form-container {
      background-color: #ffffff;
      padding: 40px;
      border-radius: 16px;
      box-shadow: 0 10px 30px rgba(0, 100, 0, 0.1);
      max-width: 600px;
      width: 100%;
      border: 1px solid #c8e6c9;
    }

    h1 {
      text-align: center;
      margin-bottom: 30px;
      font-size: 26px;
      color: #2e7d32;
    }

    label {
      display: block;
      margin-bottom: 6px;
      margin-top: 18px;
      font-weight: 600;
      color: #33691e;
    }

    input,
    textarea {
      width: 100%;
      padding: 10px 12px;
      border: 1px solid #a5d6a7;
      border-radius: 10px;
      font-size: 16px;
      transition: border-color 0.3s;
      background-color: #f9fff9;
    }

    textarea {
      resize: vertical;
      min-height: 80px;
    }

    input:focus,
    textarea:focus {
      outline: none;
      border-color: #66bb6a;
      box-shadow: 0 0 5px rgba(102, 187, 106, 0.3);
    }

    .btn-container {
      margin-top: 30px;
      display: flex;
      justify-content: space-between;
    }

    .add-btn,
    .back-btn {
      flex: 1;
      padding: 12px 0;
      font-size: 16px;
      border: none;
      border-radius: 10px;
      cursor: pointer;
      font-weight: 600;
      transition: background-color 0.3s ease;
      margin: 0 8px;
    }

    .add-btn {
      background-color: #66bb6a;
      color: white;
    }

    .add-btn:hover {
      background-color: #43a047;
    }

    .back-btn {
      background-color: #a5d6a7;
      color: #2e7d32;
      text-align: center;
    }

    .back-btn:hover {
      background-color: #81c784;
    }

    @media (max-width: 600px) {
      .btn-container {
        flex-direction: column;
      }

      .add-btn,
      .back-btn {
        margin: 8px 0;
      }
    }
  </style>
</head>
<body>
    <body>
    <div class="form-container">
        <h1>Registrar Nuevo Usuario</h1>
        <form action="${pageContext.request.contextPath}/usuario?action=insertar" method="post">
        <label>Tipo de Usuario:</label>
        <select name="tipo_usu" required>
            <option value="operario">Operario</option>
            <option value="cliente">Cliente</option>
            <option value="Administrador">Administrador</option>
        </select><br><br>

        <label>Número de Identificación:</label>
        <input type="number" name="num_identificacion" required><br><br>

        <label>Clave:</label>
        <input type="password" name="clave" required><br><br>

        <label>Primer Nombre:</label>
        <input type="text" name="p_nombre" required><br><br>

        <label>Segundo Nombre:</label>
        <input type="text" name="s_nombre"><br><br>

        <label>Primer Apellido:</label>
        <input type="text" name="p_apellido" required><br><br>

        <label>Segundo Apellido:</label>
        <input type="text" name="s_apellido"><br><br>

        <label>Correo:</label>
        <input type="email" name="correo" required><br><br>

        <label>Teléfono:</label>
        <input type="number" name="telefono"><br><br>

        <label>Salario:</label>
        <input type="number" name="salario"><br><br>

        <label>Fecha de Nacimiento:</label>
        <input type="date" name="fecha_nacimiento"><br><br>

        <label>Dirección:</label>
        <input type="text" name="direccion"><br><br>

        <div class="btn-container">
    <button type="submit" class="add-btn">Registrar Usuario</button>
    <a href="${pageContext.request.contextPath}/usuario?action=listar" class="back-btn">Volver</a>
</div>

    </form>
    </div>
    </body>

</html>
