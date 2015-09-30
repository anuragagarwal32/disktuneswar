
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="layout/header.html" %>
<%@include file="layout/UserLook.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="layout/custom.css" />
    </head>
    <body>
        <div class="bodyTag">
        <center>
        <h1 class="heading">DELETE YOUR ORDER HERE</h1>
        <form method="POST" action="DeleteOrder.action">
            <table>
                <tr>
                    <td class="fCol">Login ID</td>
                    <td><input type="text" name="loginID" maxlength="10"/></td>
                    <%--
                            <s:textfield name="loginID" label="Login ID" maxLength="10"/>
                    --%>
                </tr> 
            </table>
                <input class="submitButton" type="submit" value="DELETE"/>
        </form>
        </center>
        </div>
    </body>
</html>