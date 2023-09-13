<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
    <link href="/css/sidebars.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
    <title>GreenTrend</title>
</head>
<body>
    <header>
        <%@ include file="header.jsp" %>
    </header>
    <div id="Galeria">
        <c:forEach items="${products}" var="producto" varStatus="loop">
            <div class="producto">
                <a href="/productos/${producto.id}"><img class="hover" src="/img/dsadasfafa.jpeg" alt="logo"></a>
                <p class="fs-5 fw-semibold">${producto.nombre}</p>
                <p class="text-danger">S/ ${producto.precio}</p>
            </div>
            <c:if test="${loop.index % 2 == 1}">
                <div style="clear: both;"></div>
            </c:if>
        </c:forEach>
    </div>
    <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
    <script src="/js/sidebar.js"></script>
</body>
</html>
