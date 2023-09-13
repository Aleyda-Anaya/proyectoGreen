<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/css/crear.css">
</head>
<body class="flex center">
    <div id="contenedorPadre">
        <div class="flex space-btw">
            <p>
                Nuevo Producto
            </p>
            <button id="cerrar"></button>
        </div>
        <div id="login-form" class="form-container">
            <form:form action="/productos/new" method="post" modelAttribute="producto" class="flex column">
                <form:label path="nombre">Nombre</form:label>
                <form:input type="text" path="nombre" id="nombre" name="nombre" />
                <form:label path="descripcion">Descripcion</form:label>
                <form:input type="text" path="descripcion" id="descripcion" name="descripcion" />
                <form:label path="precio">Precio</form:label>
                <form:input type="number" path="precio" id="precio" name="precio" min="0.01" step="0.01" required="required" />
                <form:label path="talla">Talla</form:label>
                <form:select path="talla">
                    <form:option value="xs">XS</form:option>
                    <form:option value="S">S</form:option>
                    <form:option value="M">M</form:option>
                    <form:option value="L">L</form:option>
                    <form:option value="XL">XL</form:option>
                </form:select>
                <form:label path="genero">Género</form:label>
                <form:select path="genero">
                    <form:option value="M">Masculino</form:option>
                    <form:option value="F">Femenino</form:option>
                </form:select>
                <input class="boton" type="submit" value="Crear Producto">
            </form:form>
        </div>
    </div>
</body>

</html>