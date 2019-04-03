<%-- 
    Document   : update
    Created on : 3 Apr, 2019, 10:18:36 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update</title>
    </head>
    <body>
        <form class="w3-container" action="update" method="post">
                <div class="w3-section">
                    <label><b>NAME </b></label>
                    <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Name" name="name" required>    
                    
                    <label><b>Contact Number</b></label>
                    <input class="w3-input w3-border w3-margin-bottom" type="number" placeholder="Enter Contact Number" name="contact" required>
      
                    <label><b>Username</b></label>
                    <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Username" name="username" required>
                    
                    <label><b>Password</b></label>
                    <input class="w3-input w3-border" type="password" placeholder="Enter Password" name="password" required>
                    
                    <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">REGISTER</button>
                </div>
            </form>

    </body>
</html>
