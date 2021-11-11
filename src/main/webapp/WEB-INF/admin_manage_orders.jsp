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
        <section class="bodyBg d-flex flex-column justify-content-around">
            <h2 class="display-4 mb-3 orderH2">Alle ordre:</h2>
            <div class="seeAllOrders">
                <h2 class="customerInfo d-flex justify-content-between mt-5">//her vises alle ordre
                    <span> 5kr</span>
                </h2>
                <p class="customerInfo d-flex justify-content-between mt-5">jeg behøver at ændre det her
                    <span> 5kr</span>
                </p>
                <p class="customerInfo d-flex justify-content-between mt-5">fordi jeg er ikke sikker hvordan det her skal se ud da man henter fra databasen
                    <span> 5kr</span>
                </p>
                <p class="customerInfo d-flex justify-content-between mt-5">men jeg mangler meget indhold for at kigge på design på siden
                    <span> 5kr</span>
                </p>
                <p class="customerInfo d-flex justify-content-between mt-5">remember to fix adminOrders.css (padding on seeAllOrders)
                    <span> 5kr</span>
                </p>
            </div>
            <div class="adminOrderBtns d-flex flex-row justify-content-between mt-4">
                <a class="btnProfile btnAdminOrders btn btn-danger btn-lg">Slet ordre</a>
                <a href="${pageContext.request.contextPath}/fc/admin" class="btnProfile btnAdminOrders btn btn-primary btn-lg">Tilbage til admin manager</a>
            </div>
        </section>

    </jsp:body>
</t:genericpage>