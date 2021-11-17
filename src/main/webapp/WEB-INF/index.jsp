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
            <h2 class="display-4">Velkommen ombord</h2>

            <p class="lead velkommenP">Øens bedste cupcakes. Vælg og bestil her:</p>

            <div class="btnOptions">
                <a href="${pageContext.request.contextPath}/fc/udvalg" class="btn btn-sm btn-primary btn-lg mb-5">Se udvalg</a>
                <a href="${pageContext.request.contextPath}/fc/orderpage" class="btn btn-sm btn-primary btn-lg mb-5">Bestil cupcakes</a>
            </div>
        </div>
    </jsp:body>
</t:genericpage>