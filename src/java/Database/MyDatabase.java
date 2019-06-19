/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class MyDatabase {
    private Connection con;
    private final String className = "com.mysql.jdbc.Driver";
    private final String username = "root";
    private final String pass = "1234";
    private final String url = "jdbc:mysql://localhost:3306/cinema?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";

    public Connection getConnection(){
        try {
            Class.forName(className).newInstance();
            con = DriverManager.getConnection(url,username,pass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }

    
}
