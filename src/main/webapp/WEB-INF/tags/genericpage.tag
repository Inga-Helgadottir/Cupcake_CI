<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><jsp:invoke fragment="header"/></title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bestil.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/kurv.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/tak.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/profile.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/orders.css">
    <meta name="theme-color" content="#7952b3">
</head>
<body>
<!--
    This header is inspired by this bootstrap
    example: https://getbootstrap.com/docs/5.0/examples/pricing/
-->
<header>
    <section class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 bg-white headerSection">
        <div class="h5 my-0 me-md-auto fw-normal">
            <p class="currentPage">
                <jsp:invoke fragment="header"/>
            </p>
        </div>
        <nav class="my-2 my-md-0 me-md-3">
            <a class="p-2 text-dark text-decoration-none saldo">Saldo: ----</a>
            <c:if test="${addHomeLink == null }">
                <a class="p-2 text-dark text-decoration-none" href="<%=request.getContextPath()%>">Home</a>
            </c:if>

            <a class="p-2 text-dark text-decoration-none" href="${pageContext.request.contextPath}/fc/cartpage">Orders</a>
            <a class="p-2 text-dark text-decoration-none" href="${pageContext.request.contextPath}/fc/profilepage">Profile</a>
            <a class="p-2 text-dark text-decoration-none" href="${pageContext.request.contextPath}/fc/aboutpage">About</a>
        </nav>
        <div class="btns">

            <c:if test="${sessionScope.user != null }">
                ${sessionScope.user.email}
            </c:if>

            <c:set var="thisPage" value="${pageContext.request.servletPath}"/>
            <c:set var="isNotLoginPage" value="${!fn:endsWith(thisPage,'loginpage.jsp')}"/>
            <c:set var="isNotRegisterPage" value="${!fn:endsWith(thisPage,'registerpage.jsp')}"/>

            <c:if test="${isNotLoginPage && isNotRegisterPage}">
            <c:if test="${sessionScope.user != null }">
                <a type="button" class="btn btn-sm  btn-outline-secondary"
                   href="${pageContext.request.contextPath}/fc/logoutcommand">Logout</a>
            </c:if>
            <c:if test="${sessionScope.user == null }">
                <a type="button" class="btn btn-sm btn-primary"
                   href="${pageContext.request.contextPath}/fc/loginpage">Login</a>
                <a type="button" class="btn btn-sm btn-primary"
                   href="${pageContext.request.contextPath}/fc/registerpage">Sign up</a>
            </c:if>
        </div>
        </c:if>
    </section>
    <img src="${pageContext.request.contextPath}/images/olskercupcakes.png" alt="Olsker cupcakes mums filbaba logo" class="headerImg mb-3">
</header>

<div id="body">
    <jsp:doBody/>
</div>


</body>
</html>
<!-- Bootsrtap, things i will most likely use

<div class="input-group mb-3"> == select
<div class="input-group-prepend">
<label class="input-group-text" for="inputGroupSelect01">Options</label>
</div>
<select class="custom-select" id="inputGroupSelect01">
<option selected>Choose...</option>
<option value="1">One</option>
<option value="2">Two</option>
<option value="3">Three</option>
</select>
</div>

-->