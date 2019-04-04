/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Template;

import java.sql.CallableStatement;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;

/**
 *
 * @author BHUMESH
 */
public class LoginDao {
    
    public boolean check(String uname , String upass , String type,String user_type )
    {
        int result =0;
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String URL = "jdbc:oracle:thin:@192.168.2.25:1521:orcl";
            String USER = "BCS12";
            String PASS = "BCS12";
            
            java.sql.Connection conn = DriverManager.getConnection(URL, USER, PASS);
            conn.setAutoCommit(false);
            CallableStatement cst = conn.prepareCall("{? = call validateUsers(?,?,?)}");
	    
	    cst.registerOutParameter(1, Types.INTEGER);
	    cst.setString(2, uname);
	    cst.setString(3,upass);
            cst.setString(4,user_type);
            
                cst.execute();

                 result = Integer.parseInt(cst.getString(1));



                 conn.close();

                 
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
         if(type.equals("login"))
         {
            if(result == 0) 
            {
                return false;
            }
            else // user should be existed in database to login
            {
                return true;
            }
         }
         else   // type is "register"
         {
            if(result == 0) // already user is not added  
            {
                return true;
            }
            else 
            {
                return false;
            } 
         }
    }
}
