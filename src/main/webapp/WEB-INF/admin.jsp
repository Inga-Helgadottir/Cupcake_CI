<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         Admin
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>
        <div class="bodyBg d-flex justify-content-around flex-column">
            <h2 class="display-4 mb-3 orderH2">Admin page:</h2>
            <div class="btnOptions d-flex justify-content-around flex-column mt-4">
                <a href="${pageContext.request.contextPath}/fc/adminOrders" class="btnProfile btn btn-primary btn-lg mb-5">Se alle ordre</a>
                <a href="${pageContext.request.contextPath}/fc/adminKunder" class="btnProfile btn btn-primary btn-lg mb-5">Se alle kunder</a>
            </div>
        </div>

    </jsp:body>
</t:genericpage>