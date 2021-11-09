<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Login page
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
<%--        <form action="${pageContext.request.contextPath}/fc/logincommand" method="post" class="mb-3 d-flex flex-column bodyBg">--%>
<%--    change to get from DB -------------------------------------------------------------------------------------------------------%>
        <section class="bodyBg">
            <h2 class="bestilH2 mb-4">Bestil her:</h2>
            <p class="bestilP mb-5">Vælg din bund, topping og mængde her:</p>

            <!-- add action here--------------------------------------------------------------------------------->
            <form method="post" class="mb-3 d-flex flex-lg-row flex-sm-column justify-content-between">
                <select class="bestilSelect valgBund" id="bund">
                    <option selected>Vælg bund</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>

                <select class="bestilSelect valgTopping" id="topping">
                    <option selected>Vælg topping</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>

                <select class="bestilSelect valgAntal" id="antal">
                    <option selected>Vælg antal</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
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
    </jsp:body>
</t:genericpage>
