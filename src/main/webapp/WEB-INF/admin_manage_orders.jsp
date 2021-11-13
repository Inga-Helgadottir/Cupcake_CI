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

        <section class="bodyBg d-flex flex-column justify-content-around">
            <h2 class="display-4 mb-3 orderH2">Alle ordre:</h2>
            <div class="seeAllOrders">
                <table class="table mt-5 myTable">
                    <thead>
                    <tr>
                        <th scope="col">Order id</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">User</th>
                        <th scope="col">Top</th>
                        <th scope="col">Bottom</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="orderItem" items="${applicationScope.orderList}">
                        <tr>
                            <th scope="row">
                                    <%--for at kunne slette den senere------------------------------------------------------%>
                                <input class="checkbox" type="checkbox" name="orderCheck" value="${orderItem.orderId}" onclick="onlyOne(this)">
                                    ${orderItem.orderId}
                            </th>
                            <td>${orderItem.price}kr</td>
                            <td>${orderItem.quantity}</td>
                            <td>${orderItem.userEmail}</td>
                            <td>${orderItem.topName}</td>
                            <td>${orderItem.botName}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="adminOrderBtns d-flex flex-row justify-content-between mt-4">
                <a href="${pageContext.request.contextPath}/fc/adminDeleteOrders" class="btnProfile btnAdminOrders btn btn-danger btn-lg">Slet ordre</a>
                <a href="${pageContext.request.contextPath}/fc/admin" class="btnProfile btnAdminOrders btn btn-primary btn-lg">Tilbage til admin manager</a>
            </div>
        </section>
        <script>
            function onlyOne(checkbox) {
                let checkboxes = document.getElementsByName("orderCheck");
                checkboxes.forEach((item) => {
                    if (item !== checkbox) item.checked = false
                })
                let checkedCookie = document.querySelector(".checkbox:checked").value;
                document.cookie = "checkedbox=" + checkedCookie;
            }
        </script>

    </jsp:body>
</t:genericpage>