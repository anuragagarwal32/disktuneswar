<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="layout/custom.css" />
        <style type="text/css">
            a{color: white}
        </style>
    </head>
    <body>
        <form action="signOut.action" class="signOutButton">
            <input type="submit" value="Sign Out"/>
        </form>
        <div class="welcome">Welcome, ${Name}</div>
        <ul class="userList">
            <li><a href="showMula.action" >Manage User Login Account</a></li>
            <li><a href="showcheckPlacedOrders.action">Check Placed Order</a></li>   
            <li><a href="showOrderStatus.action">Check Order Status</a></li>
            <li>Manage Stock</li>
            <li>    
                <ol>
                    <li><a href="showAddStock.action">1. Add CD/DVD to Stock</a></li>
                    <li><a href="showDeleteStock.action">2. Remove CD/DVD to Stock</a></li>
                    <li><a href="ViewAllStock.action">3. View All Stock</a></li>
                </ol>
            </li>
        </ul>
    </body>
</html>
