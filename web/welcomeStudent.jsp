<%-- 
    Document   : welcomeStudent
    Created on : 5 Apr, 2019, 2:46:11 PM
    Author     : BHUMESH
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        <%
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
            response.setHeader("Pragma","no-cache");
            response.setHeader("Expires","0");
            if(session.getAttribute("id") == null || session.getAttribute("password")==null)
            {
                response.sendRedirect("index.html");
            }
        %>
        <h1>welcome student</h1>
        
        <BR>
        <form action = "logout" method="post">                
            <button value="submit" class="logout" >LOGOUT</button>
        </form>

        <BR>
        <HR>
        <h1>VIEW ALL AVAILABLE BOOKS</h1>
        <br>
        
          <table align="center" border="1px solid black" cellspacing="20">
            <tr>
            <th>BOOK_ID</th>
            <th>TITLE</th>
            <th>AUTHOR</th>
            <th>QUANTITY</th>
            <th>RENT_PER_DAY</th>
            </tr>
            <%
            try
            {
            	Class.forName("oracle.jdbc.driver.OracleDriver");
                String URL = "jdbc:oracle:thin:@192.168.2.25:1521:orcl";
                String USER = "BCS12";
                String PASS = "BCS12";
                java.sql.Connection conn = DriverManager.getConnection(URL, USER, PASS);
                conn.setAutoCommit(false);
                
                String query="SELECT * FROM BOOK_ADMIN";
                PreparedStatement stmt=(PreparedStatement) conn.prepareStatement(query);
                ResultSet rs=stmt.executeQuery(query);
                
                while(rs.next())
                {

                %>
                    <tr>
                        <td><%= rs.getString("BOOK_ID") %></td>
                        <td><%= rs.getString("TITLE") %></td>
                        <td><%= rs.getString("AUTHOR") %></td>
                        <td><%= rs.getString("QUANTITY") %></td>
                        <td><%= rs.getString("RENT_PER_DAY") %></td>
                    </tr>
                <%

                }
                %>
        </table>

        <%
        rs.close();
        stmt.close();
        conn.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        %>
        <br>
        <br>
        
    </body>
</html>
