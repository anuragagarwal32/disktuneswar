<%-- 
    Document   : product
    Created on : 11 Aug, 2015, 8:09:07 PM
    Author     : ubuntu
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="layout/custom.css" />
    </head>
    <body>
        <c:if test="${sessionScope.LoginID ne null}">
            <%@include file="layout/UserLook.jsp" %>
        </c:if>
        <h1 class="headingCart">Search Results</h1>
        <div class="productTable">
        <table>
            <c:set var="counter" value="${0}"/>
            
            <c:forEach var="list" items="${arrayList}">
                <c:if test="${counter eq 3}">
                    <tr>
                </c:if>
                    
                    <td>
                        <c:set var="counter" value="${counter=counter+1}"/>
                        <a href="product/${list.id}.jsp"><img src="product/image/${list.image}.jpg" width="200" height="200"  /></a>
                        
                        <br />
                        <a href="product/${list.id}.jsp" class="productListName">${list.name}</a>
                    </td>
                <c:if test="${counter eq 3}">
                    <c:set var="counter" value="${counter=0}"/>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
        </div>
        <br /><br /><br />
        
        
        <table class="pageNumberTable">
            <tr>
                <td>
                    <c:if test="${currentPage !=1}" >
                        <a href="search.action?page=${currentPage -1}">Previous</a>
                    </c:if>
                </td>
                <c:forEach begin="1" end="${noOfPages}" var="i" >
                    <c:choose>
                        <c:when test="${currentPage eq i}">
                            <td>${i}</td>
                        </c:when>
                        <c:otherwise>
                            <td><a href="search.action?page=${i}">${i}</a></td>
                        </c:otherwise>
                    </c:choose> 
                </c:forEach>
                <td>
                    <c:if test="${currentPage != noOfPages}" >
                        <a href="search.action?page=${currentPage +1}">Next</a>
                    </c:if>
                </td>
            </tr>
        </table>
    </body>
</html>
