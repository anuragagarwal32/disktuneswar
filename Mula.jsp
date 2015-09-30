
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.html" %>
<%@include file="layout/AdminLook.jsp" %>

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
                var url="statusAjax.jsp?id="+id;
                xmlHttp.onreadystatechange= displayStatus;
                xmlHttp.open("GET",url,true);
                xmlHttp.send();
                
            }
            
            function displayStatus()
            {   
                if((xmlHttp.readyState==4 || xmlHttp.readyState=="complete")&& xmlHttp.status==200)
                {
                    var dataReceived=xmlHttp.responseText;
                    dataReceived =dataReceived.split(' ').join('');
                    if(dataReceived==0)
                    {
                        document.getElementById("status").selectedIndex=1;
                        document.getElementById("submitButton").disabled=false;
                    }
                    else if(dataReceived==1)
                    {
                        document.getElementById("status").selectedIndex=2;
                        document.getElementById("submitButton").disabled=false;
                    }
                    else
                    {
                        document.getElementById("status").selectedIndex=0;
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
        <h1 class="heading">Manage User Login Account</h1>
        <div class="bodyTag">
        <center>
            <br><br><br>
        <form action="mulaAction.action" method="POST">    
            <table>
                <tr>
                    <td>
                        
                        <td class="fCol">LoginID</td> 
                        <td>
                        <input type="text" name="loginId" id="loginId" maxLength="45" onchange="getStatus(this.value);"/>
                        </td>
                        <td class="fCol">Status</td>
                        <td>
                            <select name="status" id="status">
                                <option value="-1" selected="true" disabled="true">Invalid ID</option>
                                <option value="Activated">Activated</option>
                                <option value="Deactivated">Deactivated</option>
                            </select>
                        </td>
                        
                    </td>
                </tr>
            </table>
            <input type="submit" value="Submit" id="submitButton" disabled="true"/>
        </form>
        </center>
        </div>
    </body>
</html>