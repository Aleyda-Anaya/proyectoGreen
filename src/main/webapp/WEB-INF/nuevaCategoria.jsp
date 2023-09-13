<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CRUD Producto</title>
</head>
<body>
  <h2>Nuevo categoria</h2>

  <!-- crear categorias -->
  <form action="/categorias/new" method="post">
    <label>Nombre: <input type="text" name="nombreCategoria" /></label><br/>
    <button type="submit">Crear</button>
  </form>
</body>
</html>