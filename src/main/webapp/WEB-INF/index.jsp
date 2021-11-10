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
        <div class="bodyBgOrders">
            <h2 class="display-4">Din inkøbskurv:</h2>

<%--            here--------------------------------------------%>
            <p>Topping: Rasberry (5 kr.)</p>
            <p>Bottom: Chocolate (5 kr.)</p>
            <select class="andtal">
                <option selected>Antal:</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>
            <a class="fjernBtn btn btn-warning">Fjern</a>
        </div>
        <div class="bodyBgOrders">
            <h2 class="display-4">Total</h2>
            <p>Subtotal:<span class="pris">20kr</span></p>
            <p>Levering:<span class="pris">0kr</span></p>
            <p>I alt:<span class="pris">20kr</span></p>
            <a class="tjekBtn btn btn-warning">Tjek ud</a>
        </div>
        <!--
        <div class="bodyBg">
            <h2 class="display-4">Velkommen ombord</h2>

            <p class="lead velkommenP">
                Øens bedste cupcakes. Vælg og bestil her:
            </p>

            <div class="btnOptions">
                <a class="btn btn-sm btn-primary btn-lg mb-5">Se udvalg</a>
                <a class="btn btn-sm btn-primary btn-lg mb-5">Bestil cupcakes</a>
            </div>

            <c:if test="${sessionScope.role == 'employee' }">
                <p style="font-size: larger">This is what you can do,
                    since your are logged in as an employee</p>
                 <p><a href="fc/employeepage">Employee Page</a>
             </c:if>

             <c:if test="${sessionScope.role == 'customer' }">
                <p style="font-size: larger">This is what you can do, since your
                    are logged in as a customer</p>
                <p><a href="fc/customerpage">Customer Page</a>
            </c:if>
        </div>-->

    </jsp:body>
</t:genericpage>