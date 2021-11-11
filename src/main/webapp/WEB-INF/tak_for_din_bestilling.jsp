<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         Tak for din bestilling
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>

        <div class="bodyBgTak d-flex flex-column justify-content-around">
            <h2 class="display-4 takH2 d-flex justify-content-center">Tak for din bestilling!</h2>

            <div class="btnOptions d-flex justify-content-center">
                <a href="${pageContext.request.contextPath}/fc/index" id="btnTak" class="btn btn-sm btn-primary btn-lg mb-5">Tilbage til forsiden</a>
            </div>
        </div>

    </jsp:body>
</t:genericpage>