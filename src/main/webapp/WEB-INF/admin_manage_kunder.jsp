<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         Admin manage kunder
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>
        <%--        change to get from DB------------------------------%>
        <%--        change design after adding DB-------------------------------%>
        <section class="bodyBg d-flex flex-column justify-content-around">
            <h2 class="display-4 mb-3 orderH2">Alle kunder:</h2>
            <div class="seeAllOrders">
                <p class="customerInfo d-flex justify-content-between mt-5">Kundenavn
                    <span> måske en email</span>
                </p>
                <p class="customerInfo d-flex justify-content-between mt-5">Kundenavn
                    <span> måske en email</span>
                </p>
                <p class="customerInfo d-flex justify-content-between mt-5">Kundenavn
                    <span> måske en email</span>
                </p>
                <p class="customerInfo d-flex justify-content-between mt-5">Kundenavn
                    <span> måske en email</span>
                </p>
                <p class="customerInfo d-flex justify-content-between mt-5">Kundenavn
                    <span> måske en email</span>
                </p>
                <p class="customerInfo d-flex justify-content-between mt-5">Kundenavn
                    <span> måske en email</span>
                </p>

            </div>
            <div class="adminOrderBtns d-flex flex-row justify-content-between mt-4">
                <a class="btnProfile btnAdminOrders btn btn-danger btn-lg">Slet kunde</a>
                <a href="${pageContext.request.contextPath}/fc/admin" class="btnProfile btnAdminOrders btn btn-primary btn-lg">Tilbage til admin manager</a>
            </div>
        </section>

    </jsp:body>
</t:genericpage>