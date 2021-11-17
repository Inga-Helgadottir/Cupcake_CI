<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         Udvalg
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>

            <h1 class="display-4">
                <div style="text-align: center;">Vores udvalg:</div>
            </h1>
            <div class="row">
            <div class="bodyBgOrders col">

                <h2 class="display-3">Bottoms:</h2>


                <img class="aCupcakeImg"
                     src="${pageContext.request.contextPath}/images/cupcake_bottoms/chocolate_cupcake_bottom.jpg" width="500" height="600">
                <p>Bottom: Chocolate (5 kr.)</p>

                <img class="aCupcakeImg"
                     src="${pageContext.request.contextPath}/images/cupcake_bottoms/almond_cupcake_bottom.jpg"width="500" height="600">
                <p>Bottom: Almond (7 kr.)</p>

                <img class="aCupcakeImg"
                     src="${pageContext.request.contextPath}/images/cupcake_bottoms/nutmeg_cupcake_bottom.png"width="500" height="600">
                <p>Bottom: Nutmeg (5 kr.)</p>

                <img class="aCupcakeImg"
                     src="${pageContext.request.contextPath}/images/cupcake_bottoms/pistacio_cupcake_bottom.jpg"width="500" height="600">
                <p>Bottom: Pistacio (6 kr.)</p>

                <img class="aCupcakeImg"
                     src="${pageContext.request.contextPath}/images/cupcake_bottoms/vanilla_cupcake_bottom.jpg"width="500" height="600">
                <p>Bottom: Vanilla (5 kr.)</p>


            </div>

            <div class="bodyBgOrders col">

                    <h2 class="display-3 mb-3">Toppings:</h2>

                    <img class="aCupcakeImg"
                         src="${pageContext.request.contextPath}/images/cupcake_toppings/cupcake_blueberry_topping.jpg"width="500" height="600">
                    <p>Bottom: Blueberry (5 kr.)</p>

                    <img class="aCupcakeImg"
                         src="${pageContext.request.contextPath}/images/cupcake_toppings/cupcake_bluecheese_topping.jpg"width="500" height="600">
                    <p>Bottom: Blue cheese (9 kr.)</p>

                    <img class="aCupcakeImg"
                         src="${pageContext.request.contextPath}/images/cupcake_toppings/cupcake_chocolate_topping.jpg"width="500" height="600">
                    <p>Bottom: Chocolate (5 kr.)</p>

                    <img class="aCupcakeImg"
                         src="${pageContext.request.contextPath}/images/cupcake_toppings/cupcake_crispy_topping.jpg"width="500" height="600">
                    <p>Bottom: Crispy (6 kr.)</p>

                    <img class="aCupcakeImg"
                         src="${pageContext.request.contextPath}/images/cupcake_toppings/cupcake_lemon_topping.jpg"width="500" height="600">
                    <p>Bottom: Lemon (8 kr.)</p>

                    <img class="aCupcakeImg"
                         src="${pageContext.request.contextPath}/images/cupcake_toppings/cupcake_orange_topping.jpg"width="500" height="600">
                    <p>Bottom: Orange (8 kr.)</p>

                    <img class="aCupcakeImg"
                         src="${pageContext.request.contextPath}/images/cupcake_toppings/cupcake_rasberry_topping.jpg"width="500" height="600">
                    <p>Bottom: Rasberry (5 kr.)</p>

                    <img class="aCupcakeImg"
                         src="${pageContext.request.contextPath}/images/cupcake_toppings/cupcake_rumraisin_topping.jpg"width="500" height="600">
                    <p>Bottom: Rum/Raisin (7 kr.)</p>

                    <img class="aCupcakeImg"
                         src="${pageContext.request.contextPath}/images/cupcake_toppings/cupcake_strawberry_topping.jpg"width="500" height="600">
                    <p>Bottom: Strawberry (6 kr.)</p>
                </div>
            </div>


    </jsp:body>
</t:genericpage>