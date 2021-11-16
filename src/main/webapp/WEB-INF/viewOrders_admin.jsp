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
                <form action="${pageContext.request.contextPath}/fc/deleteorder_admin" method="get"
                      name="deleteform" id="deleteform">
                    <table class="table mt-5 myTable">
                        <thead>
                        <tr>
                            <th scope="col">Order id</th>
                            <th scope="col">Price</th>
                            <th scope="col">User</th>
                            <th scope="col">Date</th>
                            <th scope="col">Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="order" items="${sessionScope.orderList}">
                            <tr>
                                <th scope="row">
                                    <input class="checkbox" type="checkbox" name="orderCheck" value="${order.order_id}"
                                           onclick="onlyOne(this)">
                                        ${order.order_id}
                                    <input hidden="hidden" name="" value=""/>
                                    <input hidden="hidden" name="" value=""/>
                                    <input hidden="hidden" name="" value=""/>
                                </th>
                                <td>${order.price}kr</td>
                                <td>${sessionScope.user.email}</td>
                                <td>${order.ts}</td>
                                <td>${order.status}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="adminOrderBtns d-flex flex-row justify-content-between mt-4">
                        <button type="submit" name="delete"
                                class="btnProfile btnAdminOrders btn btn-primary btn-lg">Slet ordre
                        </button>
                        <a href="${pageContext.request.contextPath}/fc/employeepage"
                           class="btnProfile btnAdminOrders btn btn-primary btn-lg">Tilbage til admin manager</a>
                    </div>
                </form>
            </div>
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
            //<input class="checkbox" type="checkbox" name="orderCheck" value="${order.order_id}" onclick="onlyOne(this)">
            function onlyOne(checkbox) {
                //selects all the checkboxes
                let checkboxes = document.getElementsByName("orderCheck");
                //loops through them
                checkboxes.forEach((item) => {
                    //if this box is checked it unchecks all the others
                    if (item !== checkbox) item.checked = false;
                })
                //gets the checkbox value, witch is the orderId
                let checkedCookie = document.querySelector(".checkbox:checked").value;
                // saves the value of the checkbox in a cookie
                document.cookie = "checkedbox=" + checkedCookie;
            }
        </script>

    </jsp:body>
</t:genericpage>