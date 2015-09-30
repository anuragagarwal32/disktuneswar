

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="layout/header.html" %>
<%@include file="layout/AdminLook.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="layout/custom.css" />
        <script>
            function getId(id)
            {   
                xmlHttp=GetXmlHttpObject();
                if(xmlHttp==null)
                {
                    alert("Your Browser Does Not Support This Website! Kindly Update your Browser");
                    return;
                }
                var url="stockIdAjax.jsp?id="+id;
                xmlHttp.onreadystatechange= displayId;
                xmlHttp.open("GET",url,true);
                xmlHttp.send();
                
            }
            
            function displayId()
            {   
                if((xmlHttp.readyState==4 || xmlHttp.readyState=="complete")&& xmlHttp.status==200)
                {
                    var dataReceived=xmlHttp.responseText;
                    if(dataReceived==-1)
                    {
                        document.getElementById("submitButton").disabled=false;
                    }
                    else
                    {
                        document.getElementById("submitButton").disabled=true;
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
        <h1 class="heading">ADD STOCK</h1>
        <div class="bodyTag">
        <center>
            <br><br><br>
        <s:form method="POST" action="addStock.action" enctype="multipart/form-data">
            <table>
                <tr>
                    <td class="fCol">Stock ID</td>
                    <td><input type="text" name="id" maxLength="10" onchange="getId(this.value);"/></td>
                </tr>
                <tr>
                    <td class="fCol">Stock Name</td>
                    <td><input type="text" name="name" maxLength="45"/></td>
                </tr>
                <tr>
                    <td class="fCol">Version</td>
                    <td><input type="text" name="version" maxLength="45"/></td>
                </tr>
                <tr>
                    <td class="fCol">Casting</td>
                    <td><input type="text" name="casting" maxLength="45"/></td>
                </tr>
                <tr>
                    <td class="fCol">Director</td>
                    <td><input type="text" name="director" maxLength="45"/></td>
                </tr>
                <tr>
                    <td class="fCol">Year</td>
                    <td><input type="text" name="year" maxLength="4"/></td>
                </tr>
                <tr>
                    <td class="fCol">Quantity</td>
                    <td><input type="text" name="quantity" maxLength="5"/></td>
                </tr>
                <tr>
                    <td class="fCol">Price</td>
                    <td><input type="text" name="price" maxLength="5"/></td>
                </tr>
                <tr>
                    <td class="fCol">Description</td>
                    <td><input type="text" name="desc" maxLength="45" /></td>
                </tr>
                <tr>
                    <td class="fCol">Image</td>
                    <td><s:file name="image"/></td>
                </tr>
                
                
            </table>
            <input type="submit" id="submitButton" name="submitButton" class="submitButton" value="Add Stock" disabled="true"/>
       
        </s:form>
        </center>
        </div>
    </body>
</html>
