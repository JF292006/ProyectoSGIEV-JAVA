<%-- 
    Document   : catalogo
    Created on : 2/07/2025, 11:01:14 p. m.
    Author     : Obaho Asesores
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Catálogo</title>
  <link href="../estilos/estiloscatalogo.css" rel="stylesheet" type="text/css"/>
</head>
<body>
  <div class="contenedor">
    
    <header>
      <div class="encabezado">
        <div class="textos-header">
          <h1>Catálogo Romar Natural</h1>
          <p>Productos 100% naturales para tu bienestar</p>
        </div>
        <img src="../estilos/logo.png" alt="Logo Tienda Naturista" class="logo-derecha" />
      </div>
      <div class="dropdown">
                <button class="dropbtn">Menú</button>
                <div class="dropdown-content">
                    <a href="../index.jsp">Página principal</a>
                    <a href="#">Sobre Nosotros</a>
                </div>
            </div>
    </header>

    <main class="main">
      <div class="catalogo">
        <div class="producto">
          <img src="../estilos/producto1.png" alt="Producto 1">
          <h2>Jugo Detox</h2>
          <p>Mezcla natural de frutas y vegetales que limpian tu organismo.</p>
          <span class="precio">$18.000</span>
        </div>

        <div class="producto">
          <img src="../estilos/producto2.png" alt="Producto 2">
          <h2>Té Digestivo</h2>
          <p>Infusión de hierbas para mejorar tu digestión naturalmente.</p>
          <span class="precio">$12.000</span>
        </div>

        <div class="producto">
          <img src="../estilos/producto3.png" alt="Producto 3">
          <h2>Multivitamínico Natural</h2>
          <p>Suplemento completo a base de extractos vegetales.</p>
          <span class="precio">$25.000</span>
        </div>

        <div class="producto">
          <img src="../estilos/producto4.png" alt="producto 4"/>
          <h2>Shampoo de Romero</h2>
          <p>Fortalece tu cabello con extracto 100% natural de romero.</p>
          <span class="precio">$22.000</span>
        </div>

        <div class="producto">
          <img src="../estilos/producto5.png" alt="Producto 5">
          <h2>Miel Orgánica</h2>
          <p>Miel pura sin aditivos, ideal para endulzar de forma saludable.</p>
          <span class="precio">$15.000</span>
        </div>

        <div class="producto">
          <img src="../estilos/producto6.png" alt="Producto 6">
          <h2>Crema de Caléndula</h2>
          <p>Alivia irritaciones y nutre la piel con caléndula natural.</p>
          <span class="precio">$19.000</span>
        </div>
      </div>
    </main>

    <footer>
      <p>&copy; 2025 Romar Natural</p>
    </footer>
  </div>
</body>
</html>
