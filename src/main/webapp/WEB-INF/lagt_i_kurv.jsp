<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         Home
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>

        <div class="bodyBg">
            <h2 class="display-4 kurvH2">Bestilling lagt i kurv</h2>

            <div class="btnOptions">
                <a href="${pageContext.request.contextPath}/fc/bestil" class="btnKurv btn btn-sm btn-primary btn-lg mb-5">Shop videre</a>
                <a href="${pageContext.request.contextPath}/fc/orders" class="btnKurv btn btn-sm btn-primary btn-lg mb-5">Se order</a>
            </div>
        </div>

    </jsp:body>
</t:genericpage>