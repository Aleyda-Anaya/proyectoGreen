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
    <link href="/css/sidebars.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <header>
        <%@ include file="header.jsp" %>
    </header>
    <div class="container">
        <div class="border-black border-opacity-10">
            <c:forEach items="${usuarioProductos}" var="producto">
                <p class="list-unstyled"><a href="/productos/${producto.id}"><img class= "hover" src="/img/dsadasfafa.jpeg" height="500px" width="500px" alt="placeholder"></a></p>
            </c:forEach>
        </div>
    </div>
</body>
</html>