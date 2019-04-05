<%-- 
    Document   : student
    Created on : 5 Apr, 2019, 2:17:01 PM
    Author     : BHUMESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student</title>
    </head>
    <body>

        <h1>Login for student</h1>
        <form action="loginStudent">
            <br>
            <input type="text" name="id" placeholder="ID">
            <br>
            <input type="password" name="password" placeholder="password">
            <br>
            <button type="submit">LOGIN</button>
        </form>

        <br>
        <br>
        <hr>

        <h1>Registration of student</h1>
        <form action="studentRegistration">
            <input type="text" name="id" placeholder="id">
            <br>
            <input type="password" name="password" placeholder="password">
            <br>
            <input type="text" name="name" placeholder="name">
            <br>
            <input type="number" name="mobile" placeholder="mobile">
            <br>
            <input type="text" name="department" placeholder="department">
            <br>
            <input type="email" name="email" placeholder="email">
            <br>
            <button type="submit">Register</button>    
        </form>

    </body>
</html>
