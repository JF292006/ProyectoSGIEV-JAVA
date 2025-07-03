<%-- 
    Document   : formulario_venta
    Created on : 1/07/2025, 10:32:24 p. m.
    Author     : Obaho Asesores
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Registrar Venta</title>
  <link href="${pageContext.request.contextPath}/estilos/estiloscrudadmin.css" rel="stylesheet" type="text/css"/>
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
  <div class="form-container">
    <h1>Registrar Nueva Venta</h1>
    <form action="${pageContext.request.contextPath}/venta?action=insertar" method="post">
      <label>Fecha de Factura:</label>
      <input type="date" name="fecha_factura" required />

      <label>Subtotal:</label>
      <input type="number" name="subtotal" required />

      <label>Descuento:</label>
      <input type="number" name="descuento" value="0" required />

      <label>Abono:</label>
      <input type="number" name="abono" value="0" required />

      <label>Valor Total:</label>
      <input type="number" name="valor_total" required />

      <label>Observaciones:</label>
      <textarea name="observaciones"></textarea>

      <label>ID Usuario Responsable:</label>
      <input type="number" name="usuarios_id_usuario" required />

      <div class="btn-container">
        <button type="submit" class="add-btn">Registrar Venta</button>
        <button type="button" class="back-btn" onclick="window.location.href='crudventa.jsp'">Cancelar</button>
      </div>
    </form>
  </div>
</body>
</html>
