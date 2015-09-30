<%-- 
    Document   : statusAjax
    Created on : 26 Jul, 2015, 9:32:24 PM
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
                    String data;
                    String query="SELECT Status FROM LoginMaster WHERE LoginID='"+request.getParameter("id")+"'";
                    Statement st= con.createStatement();
                    ResultSet rs= st.executeQuery(query);
                    if(rs.next())
                    {
                        data= rs.getString(1);
                        if(data.equals("Activated"))
                        {
                            data="0";
                        }    
                        else
                        {
                            data="1";
                        }
                    }
                    else
                    {
                        data="-1";
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
