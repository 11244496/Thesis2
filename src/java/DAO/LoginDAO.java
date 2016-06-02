/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.ConnectionFactory;
import Entity.Address;
import Entity.Barangay;
import Entity.Citizen;
import Entity.Contractor;
import Entity.Contractor_User;
import Entity.Employee;
import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class LoginDAO {

    Connection connection;
    PreparedStatement statement;
    ResultSet result;
    ConnectionFactory myFactory;

    //LOGIN
    public boolean login(User user) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "SELECT Username, Password FROM users WHERE Username = ? AND Password = ?";
            statement = connection.prepareStatement(query);

            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());

            result = statement.executeQuery();
            boolean check = result.next();
            connection.close();

            return check;

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public String getType(String userName) {

        String type = "";
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = ("SELECT Type FROM users WHERE Username = ?");
            statement = connection.prepareStatement(query);
            statement.setString(1, userName);
            result = statement.executeQuery();

            while (result.next()) {
                type = result.getString("Type");
            }
            connection.close();

            return type;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public Citizen getCitizenInfo(String username) {
        User u = null;
        Citizen c = null;
        Address a = null;
        Barangay b = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from users join citizen on users.id = users_id join address on address_id = address.id join barangay on barangay_id = barangay.id where username=?";

            statement = connection.prepareStatement(query);
            statement.setString(1, username);
            result = statement.executeQuery();
            while (result.next()) {
                u = new User(result.getInt("users.id"), result.getString("username"), result.getString("password"), result.getString("type"));
                b = new Barangay(result.getInt("barangay.id"), result.getString("barangay"));
                a = new Address(result.getInt("address.id"), result.getString("HouseNoStreet"), result.getInt("postalcode"), b);
                c = new Citizen(result.getInt("citizen.id"), result.getString("FirstName"), result.getString("MiddleName"), result.getString("LastName"), null, u);
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public Employee getEmpInfo(String username) {
        Employee e = null;
        User u = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from users join employee on users.id = users_id where username = ?";

            statement = connection.prepareStatement(query);
            statement.setString(1, username);
            result = statement.executeQuery();
            while (result.next()) {
                u = new User(result.getInt("users_id"), result.getString("username"));
                e = new Employee(result.getInt("employee.id"), result.getString("firstname"), result.getString("middlename"),
                        result.getString("lastname"), result.getString("position"), result.getString("department"), u);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return e;
    }

    public Contractor_User getContInfo(String username) {
        Contractor_User c = null;
        User u = null;
        Contractor contractor = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from users join contractorusers on users.id = users_id join contractor on contractorusers.Company_ID = contractor.ID where username = ?";

            statement = connection.prepareStatement(query);
            statement.setString(1, username);
            result = statement.executeQuery();
            while (result.next()) {
                u = new User(result.getInt("users_id"), result.getString("username"));
                contractor = new Contractor(result.getInt("contractor.ID"), result.getString("contractor.Name"));
                c = new Contractor_User(result.getInt("contractorusers.ID"), result.getString("contractorusers.Name"), result.getString("Telephone"), result.getString("Address"), result.getString("Email"), contractor, u);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return c;
    }
    
    public User getUser(String username) {
        User u = null;
        Citizen c = null;
        Address a = null;
        Barangay b = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from users join citizen on users.id = users_id join address on address_id = address.id join barangay on barangay_id = barangay.id where username=?";

            statement = connection.prepareStatement(query);
            statement.setString(1, username);
            result = statement.executeQuery();
            while (result.next()) {
                u = new User(result.getInt("users.id"), result.getString("username"), result.getString("password"), result.getString("type"));
                b = new Barangay(result.getInt("barangay.id"), result.getString("barangay"));
                a = new Address(result.getInt("address.id"), result.getString("HouseNoStreet"), result.getInt("postalcode"), b);
                c = new Citizen(result.getInt("citizen.id"), result.getString("FirstName"), result.getString("MiddleName"), result.getString("LastName"), null, u);
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }

}
