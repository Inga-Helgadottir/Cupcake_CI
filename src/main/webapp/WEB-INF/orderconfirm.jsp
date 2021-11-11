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
            <h2 class="display-4 kurvH2">Tak for din bestilling</h2>

            <div class="btnOptions">
                <a href="${pageContext.request.contextPath}/fc/orderpage" type="button"
                   class="btn btn-sm btn-primary btn-lg mb-5">Gå til forsiden</a>
            </div>


            <div class=""> <%--styling --%>
                <h4>
                    Her kan du se noget information om din netop afsluttede ordre:
                </h4>

                <p>Ordre nummer: </p> ${sessionScope}
                <p>Tracking: </p> ${sessionScope}
                <p>Leverings tid: </p> ${sessionScope}
                <p>Thank U Text</p>
            </div>

        </div>

    </jsp:body>
</t:genericpage>