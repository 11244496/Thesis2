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
public class Activity {
    private int id;
    private String activity;
    private String dateTime;
    private User user;

    public Activity() {
    }

    public Activity(int id, String activity, String dateTime) {
        this.id = id;
        this.activity = activity;
        this.dateTime = dateTime;
    }

    public Activity(int id, String activity, String dateTime, User user) {
        this.id = id;
        this.activity = activity;
        this.dateTime = dateTime;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    
}
