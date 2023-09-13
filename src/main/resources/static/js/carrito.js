// Define una variable para almacenar el carrito
var carrito = {};

function cargarCarritoDesdeLocalStorage() {
    var carritoGuardado = localStorage.getItem('cart');
    if (carritoGuardado) {
        carrito = JSON.parse(carritoGuardado);
        // Actualiza la vista del carrito al cargar la página
        actualizarCarrito();
    }
}

function agregarAlCarrito(nombre, precio, talla) {
    // Crea una clave única para cada producto basada en su nombre y talla
    var claveProducto = nombre + '-' + talla;

    // Verifica si el producto ya está en el carrito
    if (carrito[claveProducto]) {
        // Si el producto ya está en el carrito, incrementa su cantidad
        carrito[claveProducto].cantidad++;
    } else {
        // Si el producto no existe en el carrito, créalo
        var producto = {
            nombre: nombre,
            precio: precio,
            talla: talla,
            cantidad: 1
        };

        carrito[claveProducto] = producto;
    }

    // Actualiza el localStorage
    localStorage.setItem('cart', JSON.stringify(carrito));

    // Actualiza la vista del carrito
    actualizarCarrito();
}

function actualizarCarrito() {
    var carritoContenido = document.getElementById("carrito-contenido");
    var totalElement = document.getElementById("total");

    // Reinicia el contenido del carrito
    carritoContenido.innerHTML = "";

    // Inicializa el total como un número
    var total = 0;

    // Recorre los productos en el carrito y muestra cada uno
    for (var claveProducto in carrito) {
        var producto = carrito[claveProducto];

        // Parsea el precio como número
        var precio = parseFloat(producto.precio);

        // Verifica si el precio es un número válido
        if (!isNaN(precio)) {
            // Crea un elemento para mostrar el producto en el carrito
            var productoElement = document.createElement("div");
            productoElement.innerHTML = `${producto.nombre} - Talla ${producto.talla} - Cantidad: 
            <button class="boton-aumentar" onclick="aumentarCantidad('${producto.nombre}', '${producto.talla}')">+</button>
            <span id="cantidad-${producto.nombre}-${producto.talla}">${producto.cantidad}</span>
            <button class="boton-disminuir" onclick="disminuirCantidad('${producto.nombre}', '${producto.talla}')">-</button>
            - S/ ${precio}`;
            
            // Agrega el elemento al carrito
            carritoContenido.appendChild(productoElement);

            // Actualiza la cantidad para este producto
            var cantidadElement = document.getElementById(`cantidad-${producto.nombre}-${producto.talla}`);
            if (cantidadElement) {
                cantidadElement.textContent = producto.cantidad;
            }


            // Suma el precio al total multiplicado por la cantidad
            total += precio * producto.cantidad;
        }
    }

    // Actualiza el total en la vista
    totalElement.textContent = total.toFixed(2); // Ajusta el total a dos decimales
}

function aumentarCantidad(nombre, talla) {
    var claveProducto = nombre + '-' + talla;

    if (carrito[claveProducto]) {
        carrito[claveProducto].cantidad++;
    }

    // Actualiza el localStorage
    localStorage.setItem('cart', JSON.stringify(carrito));

    // Actualiza la vista del carrito
    actualizarCarrito();
}

function disminuirCantidad(nombre, talla) {
    var claveProducto = nombre + '-' + talla;

    if (carrito[claveProducto] && carrito[claveProducto].cantidad > 1) {
        carrito[claveProducto].cantidad--;
    } else if (carrito[claveProducto] && carrito[claveProducto].cantidad === 1) {
        // Si la cantidad llega a 1 y se disminuye más, elimina el producto del carrito
        delete carrito[claveProducto];
    }

    // Actualiza el localStorage
    localStorage.setItem('cart', JSON.stringify(carrito));

    // Actualiza la vista del carrito
    actualizarCarrito();
}

function setCookie(name, value) {
    document.cookie = name + "=" + value + "; path=/";
}

// Función para obtener el valor de una cookie
function getCookie(name) {
    var cookieName = name + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var cookieArray = decodedCookie.split(';');
    for (var i = 0; i < cookieArray.length; i++) {
        var cookie = cookieArray[i];
        while (cookie.charAt(0) == ' ') {
            cookie = cookie.substring(1);
        }
        if (cookie.indexOf(cookieName) == 0) {
            return cookie.substring(cookieName.length, cookie.length);
        }
    }
    return null;
}

function simularPago() {
    // Lógica para simular el pago (puedes agregar lógica adicional aquí si es necesario)

    // Muestra una alerta con el mensaje de pedido exitoso
    alert("Pedido exitoso");

    // Vacía el carrito
    carrito = [];
    localStorage.removeItem('cart'); // Elimina el carrito del almacenamiento local

    // Actualiza la vista del carrito (carrito vacío)
    actualizarCarrito();

    // Redirige a la dirección web después de un retraso de 3 segundos
    setTimeout(function () {
        window.location.href = "http://localhost:8080/productos";
    }, 1000); // Cambia 3000 a la cantidad de milisegundos que deseas esperar antes de la redirección
}
cargarCarritoDesdeLocalStorage();