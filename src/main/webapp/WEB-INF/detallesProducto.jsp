<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/product.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
        <script src="/js/carrito.js"></script>
        <script src="/js/product.js"></script>
        <script>
            cargarCarritoDesdeLocalStorage(); // Llama a esta función al cargar la página
        </script>
    <title>GreenTrend</title>
</head>

<header>
    <a href="/productos"><img src="/img/home.png" height="30px" width="30px" alt="menu"></a>
</header>

<body class="contenedorPadre">
    <div id="producto" class="contenedor colum center">
        <img id="producto-imagen" src="/img/short_green.jpg" alt="product" class="sizeProducto">
        <p class="sizeProducto bloqueBlack" >Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita totam nihil accusamus blanditiis consequatur quasi accusantium inventore. Tempora, tempore officia, consequuntur quas, voluptas nulla sint veniam eum enim nobis possimus quidem esse commodi aliquid dolores. Saepe cum esse, non sapiente minus animi autem accusamus reprehenderit expedita modi. Est, modi placeat.</p>
    </div>
        
    <div id="comprar" class="contenedorPadre colum">
        <div class="contenedor space-btw">
            <p class="fs-5 fw-semibold"><c:out value = "${producto.nombre}"/></p>
            <button id="likeButton" class="heart-button center"></button>
        </div>
        <div class="contenedor">
            <p class="precio">S/ <c:out value = "${producto.precio}"/></p>
        </div>
        <p class="fs-5 fw-semibold contenedor">Color</p>
        <div id="colores" class="contenedor">
            <div class="color-option" data-color="green">
                <img class="versionProducto hover" src="/img/short_green.jpg" alt="green">
            </div>
            <div class="color-option" data-color="gray">
                <img class="versionProducto hover" src="/img/short_gray.png" alt="gray">
            </div>
            <div class="color-option" data-color="red">
                <img class="versionProducto hover" src="/img/short_red.png" alt="red">
            </div>
        </div>
        <p class="fs-5 fw-semibold contenedor">Tallas</p>
        <div id="tallas" class="contenedor space-evn size-options">
            <button class="size-button" data-size="XS"><c:out value = "${producto.talla}"/></button>
        </div>
        <div class="contenedor center">
            <button id="carrito" class="bloqueBlack" onclick="agregarAlCarrito('${producto.nombre}', '${producto.precio}', '${producto.talla}')" >Agregar al carrito</button>
        </div>        
    </div>
    <button type="button"  id="icono_carrito" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
        <img src="/img/carro.png" alt="carro">
    </button>  
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Carrito</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <%@ include file="carrito.jsp" %>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" id="boton-pagar" onclick="simularPago()">Pagar</button>
            </div>
          </div>
        </div>
      </div>
</body>
</html>