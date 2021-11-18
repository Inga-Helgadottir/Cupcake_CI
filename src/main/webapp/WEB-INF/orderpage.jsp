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

        <section class="bodyBg">
            <h2 class="bestilH2 mb-4">Bestil her:</h2>
            <p class="bestilP mb-5">Vælg din bund, topping og mængde her:</p>


            <form method="post" class="mb-3 d-flex flex-lg-row flex-sm-column justify-content-between"
                  action="${pageContext.request.contextPath}/fc/addtocart">
                <select class="bestilSelect valgBund" name="bot">
                    <option selected>Vælg bund</option>
                    <c:forEach var="botItem" items="${applicationScope.botList}">
                        <option value="${botItem.bot_id}">${botItem.name}: ${botItem.price}kr</option>
                    </c:forEach>
                </select>

                <select class="bestilSelect valgTopping" name="top">
                    <option selected>Vælg topping</option>
                    <c:forEach var="topItem" items="${applicationScope.topList}">
                        <option value="${topItem.top_id}">${topItem.name}: ${topItem.price}kr</option>
                    </c:forEach>
                </select>

                <select class="bestilSelect valgAntal" id="antal" name="amount">
                    <option selected>Vælg antal</option>
                    <c:forEach var="var" begin="1" end="10" step="1">
                        <option value="${var}">${var}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="kurvBtn btn btn-primary btn-lg mb-5">Læg i kurv</button>
            </form>
        </section>

        <c:if test="${requestScope.error != null }">
            <p style="color:red">
                    ${requestScope.error}
            </p>
        </c:if>

        <c:if test="${not empty param.msg}">
            <p style="font-size: large">${param.msg}</p>
        </c:if>


        </div>

    </jsp:body>
</t:genericpage>