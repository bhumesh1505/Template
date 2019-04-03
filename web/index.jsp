<%-- 
    Document   : index
    Created on : 3 Apr, 2019, 10:09:49 AM
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
        <style>
            .container {
                position: relative;
                width: 100%;
            }

            .container img {
                width: 100%;
                height: auto;
            }

            .container .btn {
                position: absolute;
                top: 12%;
                left: 85%;
                transform: translate(-50%, -50%);
                -ms-transform: translate(-50%, -50%);
                background-color: #555;
                color: white;
                font-size: 15px;
                padding: 12px 24px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                text-align: center;
            }

            .container .btn:hover {
                background-color: black;
            }
            
            body {font-family: Arial, Helvetica, sans-serif;}

            /* Full-width input fields */
            input[type=text], input[type=password] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            /* Set a style for all buttons */
            button {
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
            }

            button:hover {
                opacity: 0.8;
            }

            /* Extra styles for the cancel button */
            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                background-color: #f44336;
            }

            /* Center the image and position the close button */
            .imgcont {
                text-align: center;
                margin: 24px 0 12px 0;
                position: relative;
            }

            img.avatar {
                width: 40%;
                border-radius: 50%;
            }

            .cont {
                padding: 16px;
            }

            span.psw {
                float: right;
                padding-top: 16px;
            }

            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 25%;
                top: 0;
                width: 50%; 
                height: 60%; 
                padding-top: 20px;
            }

            /* Modal Content/Box */
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
                border: 1px solid #888;
                width: 80%; /* Could be more or less, depending on screen size */
            }

            /* The Close Button (x) */
            .close {
                position: absolute;
                right: 25px;
                top: 0;
                color: #000;
                font-size: 35px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: red;
                cursor: pointer;
            }

            /* Add Zoom Animation */
            .animate {
                -webkit-animation: animatezoom 0.6s;
                animation: animatezoom 0.6s
            }

            @-webkit-keyframes animatezoom {
                from {-webkit-transform: scale(0)} 
                to {-webkit-transform: scale(1)}
            }

            @keyframes animatezoom {
                from {transform: scale(0)} 
                to {transform: scale(1)}
            }

            /* Change styles for span and cancel button on extra small screens */
            @media screen and (max-width: 300px) {
                span.psw {
                   display: block;
                   float: none;
                }
                .cancelbtn {
                   width: 100%;
                }
            }
            
            td,th{
            font-family: helvetica;
            text-align: center;
            padding-top: 12px;
            padding-bottom: 12px;
            border: 2px solid #211f1f;
            }
            table{
             width: 85%;
             border-collapse: collapse;
            }
            th {
            background-color: #bf1711;
            color: white;
            }

            tr:nth-child(even) {background-color: #f2f2f2;}
            
            .butt {
                background-color: #555;
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
            }
            </style>
    </head>
    <body>
        <button onclick="location.href = 'userloginpage.html'" class="butt" style="width: 20%; margin-left: 40%">LOG IN TO REGISTER</button>
        
        <div class="container">

            <button class="btn" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">DELETE</button>
        </div>
        <br>
        <br>
        
        <div id="id01" class="modal">
  
         <form class="modal-content animate" action="deleteUser" method="post">
          <div class="imgcont">
            <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
<!--            <img src="avatar.jpeg" alt="Avatar" class="avatar">-->
          </div>
            
            

          <div class="cont">
            <label for="username"><b>USERNAME</b></label>
            <input type="text" placeholder="USERNAME " name="username" required>
            <button type="submit">DELETE</button>
          </div>

          <div class="cont" style="background-color:#f1f1f1">
            <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
          </div>
        </form>
      </div>
            
      <table align="center">
            <tr>
            <th>PNR</th>
            <th>SOURCE</th>
            <th>DESTINATION</th>
            <th>DATE</th>
            </tr>
            <%
            try
            {
            	Class.forName("oracle.jdbc.driver.OracleDriver");
			    String URL = "jdbc:oracle:thin:@192.168.2.25:1521:orcl";
			    String USER = "BCS97";
			    String PASS = "BCS97";
			    java.sql.Connection conn = DriverManager.getConnection(URL, USER, PASS);
			    System.out.println("-----------------------------------------CONNECTED TO JDBC--------------------------------------------");
			    conn.setAutoCommit(false);
            String query="SELECT * FROM AVAILABLE_TICKETS";
                PreparedStatement stmt=(PreparedStatement) conn.prepareStatement(query);
                ResultSet rs=stmt.executeQuery(query);
            while(rs.next())
            {

            %>
                <tr>
                    <td><%= rs.getInt("PNR") %></td>
                    <td><%= rs.getString("SOURCE") %></td>
                    <td><%= rs.getString("DEST") %></td>
                    <td><%= rs.getString("A_DATE") %></td>
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

        <div class="container">

            <button class="btn" onclick="document.getElementById('id02').style.display='block'" style="width:auto;">DELETE</button>
        </div>
        <br>
        <br>
        
        <div id="id02" class="modal">
  
         <form class="modal-content animate" action="searchUser.jsp" method="post">
          <div class="imgcont">
            <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
<!--            <img src="avatar.jpeg" alt="Avatar" class="avatar">-->
          </div>
            
            

          <div class="cont">
            <label for="uname"><b>User ID</b></label>
            <input type="text" placeholder="Enter userid" name="uid" required>

            <button type="submit">SEARCH</button>
          </div>

          <div class="cont" style="background-color:#f1f1f1">
            <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancel</button>
          </div>
        </form>
      </div>

      <script>
      // Get the modal
      var modal = document.getElementById('id01');

      // When the user clicks anywhere outside of the modal, close it
      window.onclick = function(event) {
          if (event.target == modal) {
              modal.style.display = "none";
          }
      }

      var modal2 = document.getElementById('id02');

      // When the user clicks anywhere outside of the modal, close it
      window.onclick = function(event) {
          if (event.target == modal2) {
              modal2.style.display = "none";
          }
      }
      </script>
    </body>
</html>
