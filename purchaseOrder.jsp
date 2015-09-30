<%-- 
    Document   : purchaseOrder
    Created on : 27 Aug, 2015, 11:27:44 PM
    Author     : raxor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.html" %>
<%@include file="layout/UserLook.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function changeState()
            {
                document.getElementById("submitButton").disabled=false;
            }
        </script>
        <style>
            .methods{
                position:absolute;
                padding:5px;
                left:30%;
                top:280px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="methods"><br>
        <h1 class="headingCart">Payment</h1>
        <form method="POST" action="placeOrder.action">
            <input type="radio" name="pMethod" value="credit" onclick="changeState()"/>Credit Card<br><br>
            <input type="radio" name="pMethod" value="debit" onclick="changeState()"/>Debit Card<br><br>
            <input type="radio" name="pMethod" value="cod" onclick="changeState()"/>Cash On Delivery<br><br>
            <input type="radio" name="pMethod" value="bal" onclick="changeState()"/>Balance
            <input type="hidden" name="tPrice" value="<%=Integer.parseInt(request.getParameter("tPrice"))%>" />
            <input type="submit" id="submitButton" disabled="true" value="Place Order" />
        </form>
        </div>
    </body>
</html>
