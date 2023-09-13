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
</head>
<body>
    <main class="text-center">
        <h1 class="text-center text-black bg-primary pb-2">Registrarse</h1>
        <div class="container mt-3">
            <div class="row justify-content-center">
                <div class="col-md-6 p-2">
                    <form:form action="/registrarse" method="post" modelAttribute="usuario">
                        <div class="form-group p-2">
                            <form:label path="nombre">Nombre</form:label>
                            <form:input path="nombre" class="form-control" />
                            <form:errors path="nombre" class="text-danger" />
                        </div>
                        <div class="form-group p-2">
                            <form:label path="apellido">Apellido</form:label>
                            <form:input path="apellido" class="form-control" />
                            <form:errors path="apellido" class="text-danger" />
                        </div>
                        <div class="form-group p-2">
                            <form:label path="email">Email</form:label>
                            <form:input type="email" path="email" class="form-control" />
                            <form:errors path="email" class="text-danger" />
                        </div>
                        <div class="form-group p-2">
                            <form:label path="password">Contraseña</form:label>
                            <form:input type="password" path="password" class="form-control" />
                            <form:errors path="password" class="text-danger" />
                        </div>
                        <div class="form-group p-2">
                            <form:label path="confirmPassword">Confirmar Contraseña</form:label>
                            <form:input type="password" path="confirmPassword" class="form-control" />
                            <form:errors path="confirmPassword" class="text-danger" />
                        </div>
                        <div class="form-group p-2">
                            <form:label path="dni">Documento de identidad</form:label>
                            <form:input path="dni" class="form-control" />
                            <form:errors path="dni" class="text-danger" />
                        </div>
                        <div class="form-group p-2">
                            <form:label path="telefono">Teléfono</form:label>
                            <form:input path="telefono" class="form-control" />
                            <form:errors path="telefono" class="text-danger" />
                        </div>
                        <button type="submit" class="btn btn-primary mt-2">Submit</button>
                    </form:form>
                </div>
            </div>
        </div>
    </main>
</body>
</html>