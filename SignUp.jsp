
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="layout/header.html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="layout/custom.css" />
        <script type="text/javascript">
            function checkUserName(id)
            {   
                xmlHttp=GetXmlHttpObject();
                if(xmlHttp==null)
                {
                    alert("Your Browser Does Not Support This Website! Kindly Update your Browser");
                    return;
                }
                var url="checkUserNameAjax.jsp?id="+id;
                xmlHttp.onreadystatechange= function()
                {
                    if((xmlHttp.readyState==4 || xmlHttp.readyState=="complete")&& xmlHttp.status==200)
                    {
                        var dataReceived=xmlHttp.responseText;
                        if(dataReceived==-1)
                        {
                            document.getElementById("loginIDinnerHTML").innerHTML= "Username Already Exists! Choose Another";
                            document.getElementById("submitButton").disabled=true;
                        }
                        else
                        {
                            document.getElementById("loginIDinnerHTML").innerHTML= "Username Available";
                            document.getElementById("submitButton").disabled=false;
                        }

                    }
                }
                xmlHttp.open("GET",url,true);
                xmlHttp.send();
                
            }
            
            function checkPasswordLength(password)
            {   
                if(password.length<8)
                {
                    document.getElementById("passwordinnerHTML").innerHTML= "Password must be atleast 8 characters long";
                    document.getElementById("submitButton").disabled=true;
                }
                else
                {
                    document.getElementById("passwordinnerHTML").innerHTML= "";
                    document.getElementById("submitButton").disabled=false;
                }
            }
            
            
            function checkPasswordMatch()
            {
               if(document.getElementById("password").value === document.getElementById("cpassword").value)
               {
                   document.getElementById("cpasswordinnerHTML").innerHTML="Password Match";
                   document.getElementById("submitButton").disabled=false;
               }
               else
               {
                   document.getElementById("cpasswordinnerHTML").innerHTML="Password does not Match";
                   document.getElementById("submitButton").disabled=true;
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
        <div class="bodyTag">
        <center>
        <h1 class="headingCart">SIGN UP</h1>
        <form action="signUpAction.action" method="POST">
            <table>
                <tr>
                    <td class="fCol">Username</td>
                    <td><input type="text" name="loginID" id="loginID" onchange="checkUserName(this.value);"/></td>
                    <%--
                    <s:textfield name="loginID" id="loginID" label="Username" onchange="checkUserName(this.value);"/>
                    --%>
                </tr>
                <div id="loginIDinnerHTML"></div><br />
                <tr>
                    <td class="fCol">Password</td>
                    <td><input type="password" name="password" id="password" onkeyup="checkPasswordLength(this.value);"></td>
                </tr>
                <div id="passwordinnerHTML"></div><br />
                <tr>
                    <td class="fCol">Confirm Password</td>
                    <td><input type="password" name="cpassword" id="cpassword" onkeyup="checkPasswordMatch();"></td>
                </tr>
                <div id="cpasswordinnerHTML"></div><br />
                <tr>
                    <td class="fCol">First Name</td>
                    <td><input type="text" name="firstname" id="firstname"></td>
                </tr>
                <tr>
                    <td class="fCol">Last Name</td>
                    <td><input type="text" name="lastname" id="lastname"></td>
                </tr>
                <tr>
                    <td class="fCol">Mobile</td>
                    <td><input type="text" name="mobile" id="mobile"></td>
                </tr>
                <tr>
                    <td class="fCol">Email ID</td>
                    <td><input type="text" name="email" id="email"></td>
                </tr>
                <tr>
                    <td class="fCol">Street</td>
                    <td><input type="text" name="street" id="street"></td>
                </tr>
                <tr>
                    <td class="fCol">City</td>
                    <td><input type="text" name="city" id="city"></td>
                </tr>
                <tr>
                    <td class="fCol">State</td>
                    <td><input type="text" name="state" id="state"></td>
                </tr>
                <tr>
                    <td class="fCol">Country</td>
                    <td><input type="text" name="country" id="country"></td>
                </tr>
                <tr>
                    <td class="fCol">Occupation</td>
                    <td><input type="text" name="occupation" id="occupation"></td>
                </tr>                
            </table>
            
          <%--  <s:password name="password" id="password" label="Password" onkeyup="checkPasswordLength(this.value);"/><div id="passwordinnerHTML"></div><br />
            <s:password name="cpassword" id="cpassword" label="Confirm Password" onkeyup="checkPasswordMatch();"/><div id="cpasswordinnerHTML"></div><br />
            <s:textfield name="firstname" id="firstname" label="Firstname" /><br />
            <s:textfield name="lastname" id="lastname" label="Lastname" /><br />
            <s:textfield name="mobile" id="mobile" label="Mobile" /><br />  
            <s:textfield name="email" id="email" label="Email" /><br />
            <s:textfield name="street" id="street" label="Street" /><br />
            <s:textfield name="city" id="city" label="City" /><br />
            <s:textfield name="state" id="state" label="State" /><br />
            <s:textfield name="country" id="country" label="Country" /><br />
            <s:textfield name="occupation" id="occupation" label="Occupation" /><br /> 
          --%>
            <input type="submit" value="SignUp" name="SignUP" id="submitButton" disabled="true"/>
        </form>
        </center>
        </div>
            
        ${requestScope.err}
        ${requestScope.msg}
    </body>
</html>
