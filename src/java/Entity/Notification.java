/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author RoAnn
 */
public class Notification {
 
    private int id;
    private String notification;
    private String dateTime;
    private User users_ID;

    public Notification(int id, String notification, String dateTime, User users_ID) {
        this.id = id;
        this.notification = notification;
        this.dateTime = dateTime;
        this.users_ID = users_ID;
    }

    public Notification() {
    }

    public Notification (int id, String notification, String dateTime) {
        this.id = id;
        this.notification = notification;
        this.dateTime = dateTime;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNotification() {
        return notification;
    }

    public void setNotification(String notification) {
        this.notification = notification;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public User getUsers_ID() {
        return users_ID;
    }

    public void setUsers_ID(User users_ID) {
        this.users_ID = users_ID;
    }
    
    
    
}
