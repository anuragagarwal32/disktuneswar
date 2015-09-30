<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="../layout/header.html" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="../layout/custom.css" />
        <link type="text/css" rel="stylesheet" href="../layout/product.css" />
        <style>
            .songNameFinal{
                position: relative;
                top: -10px;
                font-size: 35px;
                color: #8efd39;
                font-family: Hobo Std;
            }
        </style>
        <script type="text/javascript">
            function checkQuantity(quantity)
            {   
                xmlHttp=GetXmlHttpObject();
                
                if(xmlHttp==null)
                {
                    alert("Your Browser Does Not Support This Website! Kindly Update your Browser");
                    return;
                }
                
                var url="quantityAjax.jsp?id="+3;
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
        </script>    </head>
    <body>
   <c:if test="${sessionScope.LoginID ne null}">
            <%@include file="layout/UserLook.jsp" %>
        </c:if>
        <c:if test="${sessionScope.LoginID eq null}">
            <form class="logInButton" action="../login.jsp">
                <input type="submit" value="LOG IN"/>
            </form>
            <form class="signUpButton" action="../SignUp.jsp">
                <input type="submit" value="SIGN UP"/>
            </form>
        </c:if>        <div class="product">    
            <div class="songNameFinal"><h1>Patiyala Peg</h1></div><br><br><br><br>
                <img src="image/3.jpg" class="productImage"/><br/>
                <table>
                    <tr>
                        <td class="fCol">Version</td>
                        <td>Punjabi</td>
                    </tr>
                    <tr>
                        <td class="fCol">Casting</td>
                        <td>Diljit Dosanjh, Diljot</td>
                    </tr>
                    <tr>
                        <td class="fCol">Director</td>
                        <td>Virsa Arts</td>
                    </tr>
                    <tr>
                        <td class="fCol">Year</td>
                        <td>2014</td>
                    </tr>
                    <tr>
                        <td class="fCol">Description</td>
                        <td>Party song</td>
                    </tr>

                </table>
                    <br /><br />
                <div class="price"> Rs. 50 </div>    
 <c:if test="${sessionScope.LoginID ne null}">
                    <center>
                    <form action="addToCart.action" method="POST" class="buyNow"><br/>
                    <input type="hidden" name="DiskID" value="3"/> 
                    <input type="text" name="Quantity" size="5" placeholder="Quantity"/><br/>
                    <input type="submit" value="Add To Cart"/><br/>
                    </form>
                </center>
                </c:if>        </div>
    </body>
</html>