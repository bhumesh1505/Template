/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Template;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.CallableStatement;
import java.sql.DriverManager;
import java.sql.Types;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author BHUMESH
 */
public class register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            
        try{

                Class.forName("oracle.jdbc.driver.OracleDriver");
                String URL = "jdbc:oracle:thin:@192.168.2.25:1521:orcl";
                String USER = "BCS12";
                String PASS = "BCS12";

                String contact = request.getParameter("contact");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String name = request.getParameter("name");
                String type = request.getParameter("type");

                LoginDao dao = new LoginDao();
                if(dao.check(username,password,"register",type)) // if user is not already added in database
                {
                    java.sql.Connection conn = DriverManager.getConnection(URL, USER, PASS);

                    conn.setAutoCommit(false);

                    CallableStatement cst = conn.prepareCall("{? = call insertUser(?,?,?,?,?)}");


                    cst.registerOutParameter(1, Types.VARCHAR);
                    cst.setString(2, username);
                    cst.setString(3, password);
                    cst.setString(4, contact);
                    cst.setString(5, name);
                    cst.setString(6, type);                    

                    cst.execute();

                    String result = cst.getString(1);
                    System.out.println(result);
                    conn.close();
                }
        }
        catch(Exception e)
        {
            
        }
        response.sendRedirect("userloginpage.html");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
