
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@include file="layout/header.html" %>
<%@include file="layout/AdminLook.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disk Tunes</title>
        <style>
            .viewAllTable{
                position: absolute;
                top: 360px;
                left: 23%;
            }
            .viewAllTable table{
                border-collapse: separate;
                border-spacing: 5px 3px;
            }
        </style>
    </head>
        <h1 class="heading">All Stock</h1>
        <div class="viewAllTable">
            <table border="1">
                <tr>
                    <th>Stock Name</th>
                    <th>Version</th>
                    <th>Casting</th>
                    <th>Director</th>
                    <th>Year</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
                <s:iterator value="userList">
             <tr>
                 <td><s:property value="StockName"/></td>
                 <td><s:property value="Version"/></td>
                 <td><s:property value="Casting"/></td>
                 <td><s:property value="Director"/></td>  
                 <td><s:property value="Year"/></td>
                 <td><s:property value="Quantity"/></td>
                 <td><s:property value="Price"/></td>
             </tr>
             </s:iterator>
            </table>
        </div>
</html>