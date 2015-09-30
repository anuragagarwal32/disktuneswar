<%-- 
    Document   : UserLook
    Created on : 16 Aug, 2015, 12:09:22 PM
    Author     : twinklesharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="layout/custom.css" />
        <style type="text/css">
            a{color: white}
        </style>
    </head>
    <body>
        <form action="signOut.action" class="signOutButton">
            <input type="submit" value="Sign Out"/>
        </form>
        <div class="welcome">   Welcome, ${Name} </div>
        <ul class="userList">
            <li><a href="../dashboard.jsp" >Dashboard</a></li>
            <li><a href="../productView.action" >View all Products</a></li>
            <li><a href="../cart.jsp" >Cart</a></li>
            <li><a href="../orders.jsp" >Orders</a></li>
            <li><a href="../contact.jsp" >Contact Us</a></li>
            <li><a href="../about.jsp" >About Us</a></li>
        </ul>
    </body>
</html>
