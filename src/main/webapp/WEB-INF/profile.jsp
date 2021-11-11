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
            <div class="btnOptions d-flex justify-content-around flex-column mt-4">
                <a href="${pageContext.request.contextPath}/fc/ordrehistorik" class="btnProfile btn btn-sm btn-primary btn-lg mb-5">Orderhistorik</a>
                <a href="${pageContext.request.contextPath}/fc/indbetal" class="btnProfile btn btn-sm btn-primary btn-lg mb-5">Indbetal penge</a>
            </div>
        </div>

    </jsp:body>
</t:genericpage>