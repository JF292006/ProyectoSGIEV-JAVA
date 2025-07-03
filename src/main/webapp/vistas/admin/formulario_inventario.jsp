<%-- 
    Document   : formulario_inventrario
    Created on : 2/07/2025, 5:06:13 p. m.
    Author     : Obaho Asesores
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Inventario</title>
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
    <h1>Registrar Inventario</h1>
    <form action="${pageContext.request.contextPath}/inventario?action=insertar" method="post">
        <label for="cantidad_existente">Cantidad Existente:</label>
        <input type="number" name="cantidad_existente" id="cantidad_existente" required>

        <label for="stock_max">Stock Máximo:</label>
        <input type="number" name="stock_max" id="stock_max" required>

        <label for="stock_min">Stock Mínimo:</label>
        <input type="number" name="stock_min" id="stock_min" required>

        <label for="num_lote">Número de Lote:</label>
        <input type="number" name="num_lote" id="num_lote" required>

        <label for="fecha_vencimiento">Fecha de Vencimiento:</label>
        <input type="date" name="fecha_vencimiento" id="fecha_vencimiento">

        <label for="observaciones">Observaciones:</label>
        <textarea name="observaciones" id="observaciones" rows="3"></textarea>

        <label for="fecha_entrada">Fecha de Entrada:</label>
        <input type="date" name="fecha_entrada" id="fecha_entrada">

        <label for="fecha_salida">Fecha de Salida:</label>
        <input type="date" name="fecha_salida" id="fecha_salida">

        <label for="productos_idproducto">ID del Producto Asociado:</label>
        <input type="number" name="productos_idproducto" id="productos_idproducto" required placeholder="Ej: 5">

        <div class="btn-container">
            <button type="submit" class="add-btn">Guardar</button>
            <button type="button" class="back-btn" onclick="window.location.href='${pageContext.request.contextPath}/inventario?action=listar'">Cancelar</button>
        </div>
    </form>
</div>

</body>
</html>
