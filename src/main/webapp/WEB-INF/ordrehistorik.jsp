<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         Ordre historik
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>
        <%--        change to get from DB------------------------------%>
        <section class="bodyBg historyContainer d-flex flex-row">
            <div class="seeAllMyOrders">
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
                        <h2 class="customerInfo d-flex justify-content-between mt-5">order
                            <span> 5kr</span>
                        </h2>
                        <p class="customerInfo d-flex justify-content-between mt-5">order
                            <span> 5kr</span>
                        </p>
                        <p class="customerInfo d-flex justify-content-between mt-5">order
                            <span> 5kr</span>
                        </p>
                        <p class="customerInfo d-flex justify-content-between mt-5">order
                            <span> 5kr</span>
                        </p>
                        <p class="customerInfo d-flex justify-content-between mt-5">order
                            <span> 5kr</span>
                        </p><!--
                        <c:forEach var="orderItem" items="${sessionScope.orderList}">
                            <c:if test="${sessionScope.user.id == sessionScope.orderList.id}">
                                <tr>
                                    <th scope="row">
                                        ${orderItem.orderId}
                                    </th>
                                    <td>${orderItem.price}kr</td>
                                    <td>${orderItem.quantity}</td>
                                    <td>${orderItem.userEmail}</td>
                                    <td>${orderItem.topName}</td>
                                    <td>${orderItem.botName}</td>
                                </tr>
                            </c:if>
                        </c:forEach>-->
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="orderHistoryBtnContainer">
                <a href="${pageContext.request.contextPath}/fc/profile" class="orderHistoryBtn btn btn-primary btn-lg">Tilbage til portfolie</a>
            </div>
        </section>

    </jsp:body>
</t:genericpage>