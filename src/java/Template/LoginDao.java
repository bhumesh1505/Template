/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Template;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author BHUMESH
 */
public class LoginDao {
    public boolean check(String uname , String upass)
    {
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String URL = "jdbc:oracle:thin:@192.168.2.25:1521:orcl";
            String USER = "BCS12";
            String PASS = "BCS12";
            
            java.sql.Connection conn = DriverManager.getConnection(URL, USER, PASS);
            conn.setAutoCommit(false);
            String query="SELECT * FROM USERS";
            PreparedStatement stmt=(PreparedStatement) conn.prepareStatement(query);
            ResultSet rs=stmt.executeQuery(query);
            if(rs.next())
            {
                return true;
            }
            rs.close();
            stmt.close();
            conn.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }
}
