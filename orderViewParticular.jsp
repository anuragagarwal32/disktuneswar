<%-- 
    Document   : orderViewParticular
    Created on : 16 Aug, 2015, 12:15:05 PM
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
        
        <link type="text/css" rel="stylesheet" href="layout/custom.css" />
        <style>
            .songName{
                position: relative;
                left: 520px;
                top: -10px;
                text-align: left;
                font-size: 35px;
                color: #8efd39;
                font-family: Hobo Std;
            }
        </style>
    </head>
    <body>
        <div class="cartBody"><br>
        <h1 class="headingCart">Order</h1>
        <c:if test="${requestScope['javax.servlet.forward.request_uri'] ne '/DiskTunes/orderViewParticular.action'}">
            <%
                response.sendRedirect("orderViewParticular.action?id="+Integer.parseInt(request.getParameter("id")));
            %>
        </c:if>
        
        <c:forEach var="list" items="${arrayList}">
            <br />
            <a href="product/${list.diskID}.jsp" class="songName">${list.name}</a>
            <a href="product/${list.diskID}.jsp"><img src="product/image/${list.diskID}.jpg" class="imageSize"></a>
            <br/>
            <div class="quantity">Quantity : ${list.quantity}</div><br/>
            <div class="priceColor" >Price :  
                ${list.price*list.quantity}
            </div>
            <c:set var="price" value="${price + list.price*list.quantity}" />
            <br/><br/><br/>
            <hr>
            <br/>
        </c:forEach>
            <div class="total">
                Total Price : ${price}
            </div>
        
        </div>
    </body>
</html>