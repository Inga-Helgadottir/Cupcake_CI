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


        <section class="ordersGrid row">

            <c:forEach var="cupcake" items="${sessionScope.shoppingCart}" varStatus="status">
                <div class="bodyBgOrders col-lg-7">

                    <div class="inkobskurv row">
                        <div class="col-6 col-md-auto fillAllSpace">
                            <h2 class="display-4 mb-3 orderH2">Din inkøbskurv:</h2>
                            <img class="aCupcakeImg pb-5"
                                 src="${pageContext.request.contextPath}/images/cupcake_pic.png" alt="cupcakefoto">
                        </div>
                            <%---------------here-----------------------------------------------------------------------%>

                        <div class="col-6 d-flex flex-column justify-content-around fillAllSpace">

                            <div class="cupcakeKindContainer">
                                <p class="cupcakeKind">Topping: ${cupcake.top} ${cupcake.top_price}kr</p>
                                <p class="cupcakeKind">Bottom: ${cupcake.bot} ${cupcake.bot_price}kr</p>
                            </div>

                            <div class=""><%--styling--%>
                                <label for="amount" class="">Antal:</label>
                                <input type="number" class="" id="amount" name="amount" min="0" step="1"
                                       value="${cupcake.amount}">
                            </div>

                            <a href="" class="fjernBtn btn btn-warning">Fjern</a>


                        </div>
                    </div>
                </div>
                <%---------------here-----------------------------------------------------------------------%>
            </c:forEach>
        </section>

        <div class="bodyBgOrders2 col-lg-4">
            <div class="d-flex flex-column justify-content-around">
                <h2 class="display-4 mb-3">Total</h2>
                <p class="cupcakeKind d-flex justify-content-between">Subtotal:
                    <span class="pris">${sessionScope.total}kr</span>
                </p>
                <p class="cupcakeKind d-flex justify-content-between">Levering:
                    <span class="pris">0kr</span>
                </p>
                <p class="cupcakeKind d-flex justify-content-between mt-5">I alt:
                    <span class="pris">${sessionScope.total}kr</span>
                </p>
                <a href="#" class="tjekBtn btn btn-danger">Tjek ud</a>

                <a href="#" class="fjernBtn btn btn-warning">Opdater siden</a>

            </div>
        </div>

    </jsp:body>
</t:genericpage>