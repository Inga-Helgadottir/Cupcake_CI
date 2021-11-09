<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Login page
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <form action="${pageContext.request.contextPath}/fc/logincommand" method="post" class="mb-3 d-flex flex-column bodyBg">
            <div class="d-flex justify-content-start mb-4">
                <div class="input-group-prepend">
                    <span class="loginEmail loginFormText input-group-text">Email:</span>
                </div>
                <input type="text" class="loginInput form-control" placeholder="fake@email.com">
            </div>
            <div class="d-flex justify-content-start mb-4">
                <div class="input-group-prepend">
                    <span class="loginFormText input-group-text">Password:</span>
                </div>
                <input type="password" class="loginInput form-control" placeholder="**********">
            </div>
            <div class="btnOptions btnOptionsLogin d-flex justify-content-start">
                <a type="submit" class="btn btn-sm btn-primary btn-lg mb-5">Login</a>
                <a type="submit" class="btn btn-sm btn-primary btn-lg mb-5">Login som admin</a>
            </div>
        </form>

        <c:if test="${requestScope.error != null }">
            <p style="color:red">
                    ${requestScope.error}
            </p>
        </c:if>

        <c:if test="${not empty param.msg}">
            <p style="font-size: large">${param.msg}</p>
        </c:if>
    </jsp:body>
</t:genericpage>
