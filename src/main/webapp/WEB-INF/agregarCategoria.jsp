<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <!-- agregar categoria a productos  -->
    <td>
        <form action="/productos/${producto.id}/add" method="post">
            <select name="categoriaId">
                <c:forEach var="categoria" items="${categorias}">
                    <option value="${categoria.id}">${categoria.nombreCategoria}</option>
                </c:forEach>
            </select>
            <input type="submit" value="Añadir Categoria">
        </form>
    </td>
</body>
</html>