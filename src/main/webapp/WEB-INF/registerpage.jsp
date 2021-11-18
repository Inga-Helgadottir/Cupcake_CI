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
        <form name="login" action="${pageContext.request.contextPath}/fc/registercommand" method="post" class="mb-3 d-flex flex-column bodyBg">
            <div class="d-flex justify-content-start mb-4">
                <div class="input-group-prepend">
                    <lable class="loginEmail loginFormText input-group-text" for="email">Email</lable>
                </div>
                <input type="text" class="loginInput form-control" name="email" value="${param.email}" placeholder="Enter a valid email">
            </div>
            <div class="d-flex justify-content-start mb-4">
                <div class="input-group-prepend">
                    <lable class="loginFormText input-group-text" for="password1">Password</lable>
                </div>
                <input type="password" class="loginInput form-control" name="password1" value="${param.password1}" placeholder="Enter your password">
            </div>
            <div class="d-flex justify-content-start mb-4">
                <div class="input-group-prepend">
                    <lable class="loginFormText input-group-text" for="password2">Password</lable>
                </div>
                <input type="password" class="loginInput form-control" name="password2" value="${param.password2}" placeholder="Repeat the password">
            </div>
            <div class="btnOptions d-flex justify-content-start">
                <button type="submit" id="btnSignup" class="btn btn-primary btn-lg mb-5">Signup</button>
            </div>
        </form>

        <c:if test="${requestScope.error != null }">
            <p style="color:red">
                    ${requestScope.error}
            </p>
        </c:if>
    </jsp:body>
</t:genericpage>