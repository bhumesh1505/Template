<%-- 
    Document   : welcome
    Created on : 3 Apr, 2019, 12:28:14 PM
    Author     : BHUMESH
--%>

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
            String type = (String)session.getAttribute("type");
            if(session.getAttribute("username") == null || session.getAttribute("password")==null || !type.equals("admin"))
            {
                response.sendRedirect("index.html");
            }
        %>
        <header>WELCOME <%out.println("   " + session.getAttribute("username"));%></header>
        <h1>user logged in</h1>
        <span align="right">
            <form action = "logout" method="post">                
                <button value="submit" class="logout" >LOGOUT</button>
                <button value="submit" class="logout" ><a href="update.jsp">UPDATE</a></button>
            </form>
            
        </span> 
        
    </body>
</html>
