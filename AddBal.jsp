<%-- 
    Document   : AddBal
    Created on : 27 Aug, 2015, 9:42:29 PM
    Author     : raxor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function checkBal(bal)
            {   
                document.getElementById("submitButton").disabled=false;
                if(bal<0)
                    document.getElementById("submitButton").disabled=true;
            }
        </script>
    </head>
    <body>
        <form method="POST" action="purchase.jsp">
            <input type="number" name="tPrice" onchange="checkBal(this.value)"/>
            <input type="submit" id="submitButton" disabled="true"/>
        </form>
    </body>
</html>
