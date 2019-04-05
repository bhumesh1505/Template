<%-- 
    Document   : admin
    Created on : 5 Apr, 2019, 3:24:10 PM
    Author     : BHUMESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin</title>
    </head>
    <body>

        <h1>Login for admin</h1>
        <form action="loginAdmin">
            <br>
            <input type="text" name="id" placeholder="ID">
            <br>
            <input type="password" name="password" placeholder="password">
            <br>
            <button type="submit">LOGIN</button>
        </form>

         <form class="w3-container" action="userLogin" method="post">
                <div class="w3-section">
                    <label><b>Username</b></label>
                    <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Username" name="username" required>
                    <label><b>Password</b></label>
                    <input class="w3-input w3-border" type="password" placeholder="Enter Password" name="password" required>
                    
                    <label><b>User type</b></label>
                    <select name="type"> 
                        <option value="user" >user</option>
                        <option value="admin" >admin</option>                        
                    </select>
                    
                    <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">LOGIN</button>
                    
                </div>
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
