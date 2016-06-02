/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.ConnectionFactory;
import Entity.Activity;
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
public class ActivityDAO {

    Connection connection;
    PreparedStatement statement;
    ResultSet result;
    ConnectionFactory myFactory;

    public void addActivity(Activity a) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into activity (activity, datetime, users_id) values (?, now(), ?);";

            statement = connection.prepareStatement(query);
            statement.setString(1, a.getActivity());
            statement.setInt(2, a.getUser().getId());
            statement.executeUpdate();
            statement.close();

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Activity> getAllActivity(String type) {
        ArrayList<Activity> actList = new ArrayList<>();
        Activity a;
        User u;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from activity join users on activity.users_id = users.id where type=?";
            statement = connection.prepareStatement(query);
            statement.setString(1, type);
            result = statement.executeQuery();

            while (result.next()) {
                u = new User();
                u.setId(result.getInt("Users_id"));
                u.setUsername(result.getString("username"));
                a = new Activity(result.getInt("id"), result.getString("Activity"), result.getString("DateTime"), u);
                actList.add(a);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return actList;
    }

    public ArrayList<Activity> getActsPerUser(int id) {
        ArrayList<Activity> actList = new ArrayList<>();
        Activity a;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from activity where users_id = ?;";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            result = statement.executeQuery();

            while (result.next()) {
                a = new Activity(result.getInt("id"), result.getString("activity"), result.getString("datetime"));
                actList.add(a);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return actList;

    }

}
