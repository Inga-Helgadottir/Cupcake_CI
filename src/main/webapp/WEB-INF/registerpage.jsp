<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Register a new user
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <form action="${pageContext.request.contextPath}/fc/RegisterCommand" method="post" class="mb-3 d-flex flex-column bodyBg">
            <div class="d-flex justify-content-start mb-4">
                <div class="input-group-prepend">
                    <span class="loginEmail loginFormText input-group-text">Email</span>
                </div>
                <input type="text" class="loginInput form-control" placeholder="Enter a valid email"><!-- aria-describedby="basic-addon1">-->
            </div>
            <div class="d-flex justify-content-start mb-4">
                <div class="input-group-prepend">
                    <span class="loginFormText input-group-text">Password</span>
                </div>
                <input type="password" class="loginInput form-control" placeholder="Enter your password"><!-- aria-describedby="basic-addon1">-->
            </div>
            <div class="d-flex justify-content-start mb-4">
                <div class="input-group-prepend">
                    <span class="loginFormText input-group-text">Password</span>
                </div>
                <input type="password" class="loginInput form-control" placeholder="Repeat the password"><!-- aria-describedby="basic-addon1">-->
            </div>
            <div class="btnOptions btnOptionsLogin d-flex justify-content-start">
                <a type="submit" class="btn btn-primary btn-lg mb-5" href="">Signup</a>
            </div>
        </form>

        <c:if test="${requestScope.error != null }">
            <p style="color:red">
                    ${requestScope.error}
            </p>
        </c:if>
    </jsp:body>
</t:genericpage>
