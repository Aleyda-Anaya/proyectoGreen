<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!-- bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>
        <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>
        <script src="/js/sidebars.js"></script>
        <script src="/js/carrito.js"></script>
        <link href="/css/header.css" rel="stylesheet">
        <link href="/css/sidebars.css" rel="stylesheet">
        <link rel="stylesheet" href="/css/style.css">
        <link rel="stylesheet" href="/css/carrito.css">
        <header class="flex-shrink-0 p-3" style="width: 280px;" id="SideNav">
            <a href="/"
                class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
                <svg class="bi pe-none me-2" width="30" height="24">
                    <use xlink:href="#bootstrap"></use>
                </svg>
                <span class="fs-5 fw-semibold">GreenTrend</span>
                <!-- <img class="logo" src="./img/logoIA.png" alt="logo"> -->
            </a>
            <p class="pb-2">Somos Re Moda</p>
            <ul class="list-unstyled ps-0">

                <li class="mb-1">
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
                        Mujer
                    </button>
                    <div class="collapse" id="dashboard-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="/productos/mujer"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Todos los
                                    Productos</a>
                            </li>
                            <li><a href="/productos/mujer/camisas"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Camisas</a>
                            </li>
                            <li><a href="/productos/mujer/chaquetas"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Chaquetas</a>
                            </li>
                            <li><a href="/productos/mujer/pantalones"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Pantalones</a>
                            </li>
                            <li><a href="/productos/mujer/zapatos"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Zapatos</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="mb-1">
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
                        Hombre
                    </button>
                    <div class="collapse" id="orders-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="/productos/hombre"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Todos los
                                    Productos</a>
                            </li>
                            <li><a href="/productos/hombre/camisas"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Camisas</a>
                            </li>
                            <li><a href="/productos/hombre/chaquetas"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Chaquetas</a>
                            </li>
                            <li><a href="/productos/hombre/pantalones"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Pantalones</a>
                            </li>
                            <li><a href="/productos/hombre/zapatos"
                                    class="link-body-emphasis d-inline-flex text-decoration-none rounded">Zapatos</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="border-top my-3"></li>
                <div id="NavBottom">
                    <li class="mb-1 abajo">
                        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                            data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
                            <c:if test="${empty usuarioId}">
                                Crear Cuenta
                            </c:if>
                            <c:if test="${not empty usuarioId}">
                                Bienvenido,
                                <c:out value="${usuario.nombre}" />
                            </c:if>
                        </button>
                        <div class="collapse" id="account-collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <c:if test="${empty usuarioId}">
                                    <li><a href="/login"
                                            class="link-dark d-inline-flex text-decoration-none rounded">Login</a>
                                    </li>
                                </c:if>
                                <c:if test="${not empty usuarioId}">
                                    <li><a href="/productos/tusProductos"
                                            class="link-dark d-inline-flex text-decoration-none rounded">Tus
                                            Productos</a>
                                    </li>
                                </c:if>
                                <c:if test="${empty usuarioId}">
                                    <li><a href="/registrarse"
                                            class="link-dark d-inline-flex text-decoration-none rounded">Registrarse</a>
                                    </li>
                                </c:if>
                                <c:if test="${not empty usuarioId}">
                                    <li><a href="/logout"
                                            class="link-dark d-inline-flex text-decoration-none rounded">Salir</a>
                                    </li>
                                </c:if>
                                <c:if test="${not empty usuarioId}">
                                    <li><a href="/productos/new"
                                            class="link-dark d-inline-flex text-decoration-none rounded">Nuevo
                                            Producto</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </li>
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#contact-collapse" aria-expanded="false">
                        Contacto
                    </button>
                    <div class="collapse" id="contact-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="/aboutus" class="link-dark d-inline-flex text-decoration-none rounded">Acerca
                                    de
                                    Nosotros</a>
                            </li>
                        </ul>
                    </div>
                    <li class="border-top my-3 abajo"></li>
                    <li class="mb-1 abajo">
                        © 2023 Company, Inc
                    </li>
                    <script>
                        cargarCarritoDesdeLocalStorage(); // Llama a esta función al cargar la página
                    </script>
                </div>
            </ul>
        </header>