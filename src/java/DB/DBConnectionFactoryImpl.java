/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DBConnectionFactoryImpl extends ConnectionFactory {

    @Override
    public Connection getConnection() {
        try {
            Class.forName(getDriverName());
            Connection conn = DriverManager.getConnection(getUrl(),getUsername(),getPassword() );
            return conn;
        } catch (SQLException ex) {
            Logger.getLogger(DBConnectionFactoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnectionFactoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
