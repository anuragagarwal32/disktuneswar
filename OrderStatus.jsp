
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../layout/header.html" %>
<%@include file="../layout/AdminLook.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="layout/custom.css" />
      
        <script type="text/javascript">
            function getStatus(id)
            {   
                xmlHttp=GetXmlHttpObject();
                if(xmlHttp==null)
                {
                    alert("Your Browser Does Not Support This Website! Kindly Update your Browser");
                    return;
                }
                var url="orderstatusAjax.jsp?id="+id;
                xmlHttp.onreadystatechange= displayStatus;
                xmlHttp.open("GET",url,true);
                xmlHttp.send();
                
            }
            
            function displayStatus()
            {   
                document.getElementById("cstatus").value="";
                
                if((xmlHttp.readyState==4 || xmlHttp.readyState=="complete")&& xmlHttp.status==200)
                {
                    var dataReceived=xmlHttp.responseText;
                    if(dataReceived==-1)
                    {
                        document.getElementById("cstatus").value="Invalid Id";
                    }
                    else if(dataReceived==0)
                    {
                        document.getElementById("cstatus").value="Pending";
                        //For extra spaces removal
                    }
                    else if(dataReceived==1)
                    {
                        document.getElementById("cstatus").value="Delivered";
                        //For extra spaces removal
                    }
                    else
                    {
                        document.getElementById("cstatus").value="Cancel";
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
        <h1 class="heading">Order Status</h1>
        <div class="bodyTag">
        <center>
            <br><br><br>
        <form >    
            <table>
            <tr>
                <td class="fCol"> OrderID </td>
                <td><input type="text" name="orderId" id="orderId" onkeyup="getStatus(this.value);"/></td>
            </tr>
            <tr>
                <td class="fCol">Current Status</td> 
                <td><input type="text" name="cstatus" id="cstatus" readonly="true"/></td>
            </tr>
            </table>
        </form>
        </center>
        </div>    
    </body>
</html>
