
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="../layout/header.html" %>
<%@include file="../layout/AdminLook.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="layout/custom.css" />
        <script type="text/javascript">
            function getId(id)
            {   
                xmlHttp=GetXmlHttpObject();
                if(xmlHttp==null)
                {
                    alert("Your Browser Does Not Support This Website! Kindly Update your Browser");
                    return;
                }
                var url="deleteStockAjax.jsp?id="+id;
                xmlHttp.onreadystatechange= displayId;
                xmlHttp.open("GET",url,true);
                xmlHttp.send();
                
            }
            
            function displayId()
            {   
                if((xmlHttp.readyState==4 || xmlHttp.readyState=="complete")&& xmlHttp.status==200)
                {
                    var dataReceived=xmlHttp.responseText;
                    dataReceived =dataReceived.split(' ').join('');
                    if(dataReceived==-1)
                    {
                        document.getElementById("submitButton").disabled=true;
                    }
                    else
                    {                       
                        document.getElementById("submitButton").disabled=false;
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
        <h1 class="heading">Delete Stock</h1>
        <div class="bodyTag">
        <center>
            <br><br><br>
        <form action="deleteStock.action" method="POST">
            <table>
               <tr>
                    <td class="fCol">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Stock ID</td>
                    <td><input type="text" name="stockId" onchange="getId(this.value);"></td>
                </tr>
            </table>
            <input type="submit" id="submitButton" name="submitButton" value="Delete Stock" disabled="true"/>
        </form>
        </center>
        </div>
            ${requestScope.msg}
            ${requestScope.err}
    </body>
</html>