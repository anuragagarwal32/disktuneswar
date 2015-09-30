<%-- 
    Document   : cart
    Created on : 15 Aug, 2015, 2:08:24 PM
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
        <script type="text/javascript">
            function checkQuantity(quantity, id)
            {   
                xmlHttp=GetXmlHttpObject();
                if(xmlHttp==null)
                {
                    alert("Your Browser Does Not Support This Website! Kindly Update your Browser");
                    return;
                }
                
                var url="quantityAjax.jsp?id="+id;  //change here.
                xmlHttp.onreadystatechange= displayQuantity;
                xmlHttp.open("GET",url,true);
                xmlHttp.send();
            }
            
            function displayQuantity()
            {   
                document.getElementById("submit").disabled=true;
                
                if((xmlHttp.readyState==4 || xmlHttp.readyState=="complete")&& xmlHttp.status==200)
                {
                    var dataReceived=parseInt(xmlHttp.response);
                    if(dataReceived===-1)
                    {
                        alert("Invalid ID");
                        document.getElementById("submit").disabled=true;
                    }
                    else if(dataReceived < document.getElementById("Quantity").value)
                    {
                        
                        alert("Stock Less\nQuantity Left : "+dataReceived);
                        document.getElementById("submit").disabled=true;
                    }
                    else
                    {
                        document.getElementById("submit").disabled=false;
                    }
                    
                }
                
            }
            function GetXmlHttpObject()
            {   
                var xmlHttp=null;
                try
                {
                    xmlHttp=new XMLHttpRequest();
                }
                catch(e)
                {
                    try
                    {
                        xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
                        
                    }
                    catch(e)
                    {
                        xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                    }
                }
                return xmlHttp;
                
            }
        </script>
    </head>
    <body>
        <div class="cartBody"><br>
        <h1 class="headingCart">CART</h1>
        <c:if test="${requestScope['javax.servlet.forward.request_uri'] ne '/DiskTunes/cartView.action' and requestScope['javax.servlet.forward.request_uri'] ne '/DiskTunes/product/cartView.action'}">
            <c:redirect url="cartView.action" />
            
        </c:if>
        <%
                int counter=0;
        %>
        <c:set var="price" value="${0}" />
        
        <c:forEach var="list" items="${arrayList}">
            <br/>
            <%
                counter++;
            %>
            <a href="product/${list.diskID}.jsp" class="songName">${list.name}</a>
            <a href="product/${list.diskID}.jsp"><img src="product/image/${list.diskID}.jpg" class="imageSize"></a>
            <br/>
            <div class="quantity"> Quantity 
                <form action="updateCart.action" class="updateForm" id="${list.diskID}">
                        <input type="hidden" name="diskID" value="${list.diskID}" />
                        <input type="text" name="quantity" id="Quantity${list.diskID}" value="${list.quantity}" />
                <input type="submit" value="Update" />
                     </form>
            </div>
                
                <br />
                    <form action="deleteCart.action">
                        <input type="hidden" name="DiskID" value="${list.diskID}" />
                       
                        <input type="submit" value="Remove" class="deleteForm"/>
                    </form>
                        <div class="priceColor" >Price :  
                        ${list.price*list.quantity}
                        </div>  
            <c:set var="price" value="${price + list.price*list.quantity}"/>
            <br/>
            <hr>
            <br/>
        </c:forEach>
           
            <%
                if(counter==0)
                {   
            %>
                <span class="cartEmpty">Cart is Empty!</span>
            <%
                }
                else
                { 
            %>
            <div class="total">
            <br />TOTAL PRICE : ${price}
            <form action="purchaseOrder.jsp" method="POST">
                <input type="hidden" value="${price}" name="tPrice"/>
                <div style="margin-left: 220px">   <input type="submit" value="Place Order" /></div>
            </form>
            </div>
            <%
                }
            %>
        </div>
        <!-- If Balance is insufficient need to order it using divs-->
            ${requestScope.err}
    </body>
</html>