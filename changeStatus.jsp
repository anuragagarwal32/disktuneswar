<%-- 
    Document   : changeStatus
    Created on : 4 Aug, 2015, 9:55:52 PM
    Author     : ubuntu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.project.DatabaseClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try
    {
        DatabaseClass dbObj=new DatabaseClass();
        Connection con=dbObj.getConnection();
        if(con!=null)
        {
            int data;
            System.out.println(request.getParameter("id"));
            System.out.println(request.getParameter("status"));
            String query="UPDATE OrderMaster SET Status='"+request.getParameter("status")+"' WHERE OrderID='"+request.getParameter("id")+"'";
            Statement st= con.createStatement();
            System.out.println(query);
            int status= st.executeUpdate(query);
            if(status>0)
            {
                data= 1; 
            }
            else
            {
                data=0;
            }
            out.print(data);
        }
        else
        {
            System.out.println("Cannot Establish Connection to Database");
        }
    }
    catch(Exception e)
    {
        System.out.println("Exception : "+e);
    }
%>
