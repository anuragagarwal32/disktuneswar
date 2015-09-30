<%-- 
    Document   : index
    Created on : 26 Jul, 2015, 5:00:11 PM
    Author     : ubuntu
--%>

<!-- LOGIN PAGE-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="layout/header.html" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <c:if test="${sessionScope.LoginID eq null}">
            <form class="logInButton" action="login.jsp">
                <input type="submit" value="LOG IN"/>
            </form>
            <form class="signUpButton" action="SignUp.jsp">
                <input type="submit" value="SIGN UP"/>
            </form>
        </c:if>
        
        <c:if test="${requestScope['javax.servlet.forward.request_uri'] ne '/DiskTunes/productView.action'}">
            <c:redirect url="productView.action"/>
        </c:if>
            <br />
        ${requestScope.msg}
        <div class="productTable">
        <table>
            <c:set var="counter" value="${0}"/>
            
            <c:forEach var="list" items="${arrayList}">
                <c:if test="${counter eq 3}">
                    <tr>
                </c:if>
                    <td>
                        <c:set var="counter" value="${counter=counter+1}"/>
                        <a href="product/${list.id}.jsp"><img src="product/image/${list.image}.jpg" width="200" height="200" /></a>
                        
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
                        <a href="productView.action?page=${currentPage -1}">Previous</a>
                    </c:if>
                </td>
                <c:forEach begin="1" end="${noOfPages}" var="i" >
                    <c:choose>
                        <c:when test="${currentPage eq i}">
                            <td>${i}</td>
                        </c:when>
                        <c:otherwise>
                            <td><a href="productView.action?page=${i}">${i}</a></td>
                        </c:otherwise>
                    </c:choose> 
                </c:forEach>
                <td>
                    <c:if test="${currentPage != noOfPages}" >
                        <a href="productView.action?page=${currentPage +1}">Next</a>
                    </c:if>
                </td>
            </tr>
            
        </table>
        
    </body>
</html>
