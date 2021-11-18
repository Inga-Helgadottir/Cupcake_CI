<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Indbetal penge
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <%--        add action here----------------------------------------------------------%>
        <form action="" method="post" class="mb-3 bodyBg indbetalForm">
            <h2 class="display-4 mb-2">Indbetal penge</h2>
            <div class="indbetalPengeContainer d-flex flex-row justify-content-between">
                <div class="indbetalInputs d-flex flex-column col-lg-6 mr-4">
                    <div class="d-flex justify-content-start mt-4">
                        <div class="input-group-prepend">
                            <span class="loginEmail indbetalFormText input-group-text">Kort nr:</span>
                        </div>
                        <input type="text" class="inputIndbetal form-control" placeholder="Indtast dit kortnummer"><!-- aria-describedby="basic-addon1">-->
                    </div>
                    <div class="d-flex justify-content-start mt-4">
                        <div class="input-group-prepend">
                            <span class="indbetalFormText input-group-text">Sikkerheds kode:</span>
                        </div>
                        <input type="text" class="inputIndbetal form-control" placeholder="Indtast din sikkerhedskode"><!-- aria-describedby="basic-addon1">-->
                    </div>
                    <div class="d-flex justify-content-start mt-4">
                        <div class="input-group-prepend">
                            <span class="indbetalFormText input-group-text">Udløbsdato:</span>
                        </div>
                        <input type="text" class="inputIndbetal form-control" placeholder="Indtast måned"><!-- aria-describedby="basic-addon1">-->
                        <input type="text" class="inputIndbetal form-control" placeholder="Indtast år"><!-- aria-describedby="basic-addon1">-->
                    </div>
                </div>
                <div class="indbetalInputs d-flex flex-column col-lg-4 justify-content-end">
                    <div class="d-flex justify-content-start addMarginIndbetal">
                        <div class="input-group-prepend">
                            <span class="indbetalFormText input-group-text">Beløb:</span>
                        </div>
                        <input type="text" class="inputIndbetal indtastBelobInput form-control" placeholder="Indtast beløb">
                    </div>
                    <div class="d-flex justify-content-end">
                        <button type="submit" class="indbetalBtn btn btn-primary btn-lg">Indbetal beløb</button>
                    </div>
                </div>
            </div>
        </form>
    </jsp:body>
</t:genericpage>