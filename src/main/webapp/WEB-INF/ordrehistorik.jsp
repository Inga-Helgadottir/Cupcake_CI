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
        <%--        change to get from DB------------------------------%>
        <section class="bodyBg historyContainer d-flex flex-row">
            <div class="seeAllMyOrders">
                <h2 class="customerInfo d-flex justify-content-between mt-5">order
                    <span> 5kr</span>
                </h2>
                <p class="customerInfo d-flex justify-content-between mt-5">order
                    <span> 5kr</span>
                </p>
                <p class="customerInfo d-flex justify-content-between mt-5">order
                    <span> 5kr</span>
                </p>
                <p class="customerInfo d-flex justify-content-between mt-5">order
                    <span> 5kr</span>
                </p>
                <p class="customerInfo d-flex justify-content-between mt-5">order
                    <span> 5kr</span>
                </p>
            </div>
            <div class="orderHistoryBtnContainer">
                <a href="${pageContext.request.contextPath}/fc/profile" class="orderHistoryBtn btn btn-primary btn-lg">Tilbage til portfolie</a>
            </div>
        </section>

    </jsp:body>
</t:genericpage>