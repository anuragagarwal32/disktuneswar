<%-- 
    Document   : purchase
    Created on : 27 Aug, 2015, 10:19:14 PM
    Author     : raxor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body>
        <form method="POST" action="addBal.action">
            <input type="radio" name="pMethod" value="credit" onclick="changeState()"/>Credit Card
            <input type="radio" name="pMethod" value="debit" onclick="changeState()"/>Debit Card
            <input type="hidden" name="amount" value="<%=Integer.parseInt(request.getParameter("tPrice"))%>" />
            <input type="submit" id="submitButton" disabled="true" value="Buy Now"/>
        </form>    
    </body>
</html>
