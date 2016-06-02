/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.ConnectionFactory;
import Entity.Activity;
import Entity.Notification;
import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class NotificationDAO {

    Connection connection;
    PreparedStatement statement;
    ResultSet result;
    ConnectionFactory myFactory;

    public void addNotification(Notification n) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into notification (notification, datetime, users_id) values (?, now(), ?);";

            statement = connection.prepareStatement(query);
            statement.setString(1, n.getNotification());
            statement.setInt(2, n.getUsers_ID().getId());
            statement.executeUpdate();
            statement.close();

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Notification> getAllNotification() {
        ArrayList<Notification> notifList = new ArrayList<Notification>();
        Notification n;
        User u;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from notification;";
            statement = connection.prepareStatement(query);
            result = statement.executeQuery();

            while (result.next()) {
                u = new User();
                u.setId(result.getInt("Users_id"));
                n = new Notification(result.getInt("id"), result.getString("Notification"), result.getString("DateTime"), u);
                notifList.add(n);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return notifList;

    }

    public ArrayList<Notification> getNotifPerUser(int id) {
        ArrayList<Notification> notifList = new ArrayList<Notification>();
        Notification n;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from notification where users_id = ?;";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            result = statement.executeQuery();

            while (result.next()) {
                n = new Notification(result.getInt("id"), result.getString("notification"), result.getString("datetime"));
                notifList.add(n);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return notifList;

    }

    public ArrayList<User> getEmployeePerDept(String type) {
        ArrayList<User> uList = new ArrayList<>();
        User u;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select users.id from users join employee on users_ID = users.id where type=?";
            statement = connection.prepareStatement(query);
            statement.setString(1, type);
            result = statement.executeQuery();

            while (result.next()) {
                u = new User();
                u.setId(result.getInt("id"));
                uList.add(u);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return uList;

    }

}
