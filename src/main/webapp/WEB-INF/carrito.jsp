<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <script src="/js/carrito.js"></script>
            <script src="/js/product.js"></script>
            <link rel="stylesheet" href="/css/style.css">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
                crossorigin="anonymous"></script>
        </head>

        <body class="contenedorPadre flex">
            <div id="carrito-contenido">
                <c:forEach items="${products}" var="producto">
                    <div id="comprar" class="contenedorPadre flex colum">
                        <div class="contenedor flex space-btw">
                            <p class="fs-5 fw-semibold">Carrito</p>
                        </div>
                        <div id="carritoMenu">
                            <div class="flex space-btw contenedorCarrito">
                                <img class="versionProducto" src="./img/1680550957-518619-bodysuit-wine.jpg" alt="">
                                <div id="caract">
                                    <div class="flex space-btw">
                                        <p class="fw-semibold">${producto.nombre}</p>
                                        <button id="eliminar" class="center"></button>
                                    </div>
                                    <p class="fw-semibold">S/ ${producto.precio}</p>
                                    <p class="precio">${producto.talla}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <p class="fw-semibold">Total</p>
            <p class="fw-semibold"> <span id="total">0</span></p>
            <div id="mensaje-pedido-exitoso" style="display: none;">
                <p>Pedido exitoso</p>
            </div>
            <script>
                cargarCarritoDesdeLocalStorage(); // Llama a esta función al cargar la página
            </script>
        </body>

        </html>