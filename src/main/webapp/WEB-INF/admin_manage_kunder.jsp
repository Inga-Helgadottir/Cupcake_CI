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
                <table class="table mt-5 myTable">
                    <thead>
                    <tr>
                        <th scope="col">User id</th>
                        <th scope="col">Email</th>
                        <th scope="col">Balance</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="kundeItem" items="${applicationScope.kundeList}">
                        <tr>
                            <th scope="row">
                                <input class="checkbox" type="checkbox" name="orderCheck" value="${kundeItem.id}" onclick="onlyOne(this)">
                                ${kundeItem.id}
                            </th>
                            <td>${kundeItem.email}</td>
                            <td>
                                <input type="text" value="${kundeItem.balance}" class="balanceCheck">kr
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
            <div class="adminOrderBtns d-flex flex-row justify-content-between mt-4">
                <a class="btnProfile btnAdminOrders btn btn-danger btn-lg">Slet kunde</a>
                <a href="${pageContext.request.contextPath}/fc/admin" class="btnProfile btnAdminOrders btn btn-primary btn-lg">Tilbage til admin manager</a>
            </div>
        </section>
        <script>
            function onlyOne(checkbox) {
                //selects all the checkboxes
                let checkboxes = document.getElementsByName("orderCheck");
                //loops through them
                checkboxes.forEach((item) => {
                    //if this box is checked it unchecks all the others
                    if (item !== checkbox) item.checked = false;
                })
            }
        </script>

    </jsp:body>
</t:genericpage>