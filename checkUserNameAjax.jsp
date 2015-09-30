<%-- 
    Document   : checkUserNameAjax
    Created on : 6 Aug, 2015, 11:03:36 PM
    Author     : ubuntu
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
            String query="SELECT LoginID FROM LoginMaster WHERE LoginID='"+request.getParameter("id")+"'";
            Statement st= con.createStatement();
            System.out.println(query);
            ResultSet rs= st.executeQuery(query);
            if(rs.next())
            {
                data=-1; 
            }
            else
            {
                data=1;
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
