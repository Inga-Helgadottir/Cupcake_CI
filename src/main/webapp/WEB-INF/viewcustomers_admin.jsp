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
        <section class="bodyBg d-flex flex-column justify-content-around">
            <h2 class="display-4 mb-3 orderH2">Alle kunder:</h2>
            <form action="${pageContext.request.contextPath}/fc/updatebalance" method="get">
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
                        <c:forEach var="item" items="${sessionScope.userList}">
                            <tr>
                                <th scope="row">
                                    <input class="checkbox" type="checkbox" name="userID" value="${item.id}"
                                           onclick="onlyOne(this)">
                                        ${item.id}
                                </th>
                                <td>${item.email}</td>
                                <td>
                                    <input type="number" value="${item.balance}" name="newBalance_${item.id}"
                                           class="balanceCheck">kr
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="adminOrderBtns d-flex flex-row justify-content-between mt-4">
                    <button type="submit" class="btnProfile btnAdminOrders btn btn-danger btn-lg">Update Balance</button>
                    <a href="${pageContext.request.contextPath}/fc/employeepage"
                       class="btnProfile btnAdminOrders btn btn-primary btn-lg">Tilbage til admin manager</a>
                </div>
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