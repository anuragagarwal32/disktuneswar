<%-- 
    Document   : login
    Created on : 15 Aug, 2015, 8:52:05 AM
    Author     : ubuntu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="layout/login.css" />
    </head>
    <body>
        
        <form action="loginAction.action" method="POST" class="loginForm">
            <div class="innerLogin">
                Username <input type="text" name="username" id="username" />
            </div><br />
            <div class="innerLogin"> 
                Password <input type="password" name="password" id="password" />
            </div><br />
            <div class="innerLogin"> <input type="submit" value="Login" name="login"/></div>
            <font color="red">${requestScope.err}</font>
        </form>
    </body>
</html>
