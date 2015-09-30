<%-- 
    Document   : orders
    Created on : 16 Aug, 2015, 11:04:00 AM
    Author     : ubuntu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="layout/header.html" %>
<%@include file="layout/UserLook.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <div class="orderStyle">
            <h1 class="orderHeading">ORDERS</h1>
            <div class="orderDetails">
        <c:if test="${requestScope['javax.servlet.forward.request_uri'] ne '/DiskTunes/orderView.action'}">
            <c:redirect url="orderView.action" />
            <%
                //response.sendRedirect("orderView.action");  
            %>
        </c:if>
        <c:forEach var="list" items="${arrayList}">
            Order ID : <a href="orderViewParticular.jsp?id=${list.orderID}">${list.orderID}</a>
            <br/>
            ${list.orderDate}<br/>
            ${list.price}<br/>
            <div class="status">  ${list.status}</div>
            <hr class="hrColor">
        </c:forEach>
            
            </div>
        </div>
    </body>
</html>
