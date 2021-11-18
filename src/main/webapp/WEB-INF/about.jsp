<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         About
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>

        <h1 class="display-4">
            <div style="text-align: center;">About us</div>
        </h1>

        <div class="bodyBgOrders col-lg-12">
            <div style="text-align: center;"><img src="${pageContext.request.contextPath}/images/cupcake_shop.jpg"></div>
            <p>About us flavortext. About us flavortext. About us flavortext. About us flavortext. About us flavortext.
                About us flavortext. About us flavortext. About us flavortext. About us flavortext. About us flavortext.
                About us flavortext. About us flavortext. About us flavortext. About us flavortext. About us flavortext.
                About us flavortext. About us flavortext. About us flavortext. About us flavortext. About us flavortext.
                About us flavortext. About us flavortext. About us flavortext. About us flavortext. About us flavortext.
                About us flavortext. About us flavortext. About us flavortext.About us flavortext.About us
                flavortext.About
                us flavortext.About us flavortext.
                About us flavortext.About us flavortext.About us flavortext.About us flavortext.About us
                flavortext.About us
                flavortext.About us flavortext.About us flavortext.About us flavortext.About us flavortext.About us
                flavortext.About us flavortext.About us flavortext.About us flavortext.About us flavortext.About us
                flavortext.About us flavortext.About us flavortext.
                About us flavortext.About us flavortext.About us flavortext.About us flavortext.About us
                flavortext.About us
                flavortext.About us flavortext.About us flavortext.About us flavortext.About us flavortext.About us
                flavortext.About us flavortext.About us flavortext.About us flavortext.About us flavortext.About us
                flavortext.About us flavortext.
                About us flavortext.About us flavortext.About us flavortext.About us flavortext.About us
                flavortext.About us
                flavortext.About us flavortext.About us flavortext.About us flavortext.
            </p>

            <div style="text-align: center;"><p></p></div>
            <div style="text-align: center;"><p>Olsker Cupcakes</p></div>
            <div style="text-align: center;"><p>Nørgaardsvej 30</p></div>
            <div style="text-align: center;"><p>2800 Kongens Lyngby</p></div>
            <div style="text-align: center;"><p>TLF: 87654321 - CVR: 12345678</p></div>
            <div style="text-align: center;"><p>Email: kontakt@olskercupcakes.dk</p></div>
        </div>


    </jsp:body>
</t:genericpage>