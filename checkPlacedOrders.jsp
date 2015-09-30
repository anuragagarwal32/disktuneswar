

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="layout/header.html" %>
<%@include file="layout/AdminLook.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="layout/custom.css" />
        <script>
            function changeStatus(status, id)
            {
                xmlHttp= GetXmlHttpObject();
                if(xmlHttp==null)
                {
                    Alert("Browser Not Supported!");
                    return;
                }
                var url="changeStatus.jsp?id="+id+"&status="+status;
                xmlHttp.onreadystatechange=receiveStatus;
                xmlHttp.open("GET",url,true);
                xmlHttp.send();
            }
            function receiveStatus()
            {
                document.getElementById("innerHtmlCode").innerHTML="";
                if((xmlHttp.readyState==4 || xmlHttp.readyState=="complete")&& xmlHttp.status==200)
                {
                    var dataReceived=xmlHttp.responseText;
                    if(dataReceived==0)
                    {
                        document.getElementById("innerHtmlCode").innerHTML="ERROR";
                    }
                    else
                    {
                        document.getElementById("innerHtmlCode").innerHTML="Updated Successfully";
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
        <c:if test="${requestScope['javax.servlet.forward.request_uri'] ne '/DiskTunes/checkPlacedorders.action'}">
            <c:redirect url="checkPlacedorders.action"/>
        </c:if>
        <h1 class="heading">All Placed Orders</h1>
        <div class="bodyTag">
        <center>
        <br><br><br>
        <table border="1">
                <tr>
                    <th class="fCol">OrderID</th>
                    
                    <th class="fCol">OrderDate</th>
                    
                    <th class="fCol">Current Status</th>
                    <th class="fCol">Change Status</th>
                </tr>
                <s:iterator value="userList">
             <tr>
                 <td><a href="orderViewParticular.action?id=<s:property value='OrderID'/>"><s:property value="OrderID"/></a></td>
                 
                 <td><s:property value="OrderDate"/></td>
                 
                 <td><s:property value="Status"/></td>
                 <td>
                     <select name="Status" onchange="changeStatus(this.value, <s:property value="OrderID"/>);">   
                        <option value="-1" selected="true" disabled="true">Select</option>
                        <option value="Pending">Pending</option>
                        <option value="Delivered">Delivered</option>
                        <option value="Cancel">Cancel</option>
                        
                     </select>
                 </td>
                <p id="innerHtmlCode"></p>
             </tr>
             
             </s:iterator>
            
            </table>
            <br><a href="checkPlacedorders.action" class="fCol">Refresh Page</a>
        </center>
        </div>
    </body>
</html>