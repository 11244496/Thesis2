/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.ArrayList;

/**
 *
 * @author Krist
 */
public class Project_Inspection {
    
    private int ID;
    private String DateOfInspection;
    private Task task;
    private String Remark;
    private String Status;
    private User user;

    public Project_Inspection(){
        
        
        
    }
    public Project_Inspection(int ID, String DateOfInspection, Task task, String Remark, String Status, User user) {
        this.ID = ID;
        this.DateOfInspection = DateOfInspection;
        this.task = task;
        this.Remark = Remark;
        this.Status = Status;
        this.user = user;
    }

    
    /**
     * @return the ID
     */
    public int getID() {
        return ID;
    }

    /**
     * @param ID the ID to set
     */
    public void setID(int ID) {
        this.ID = ID;
    }

    /**
     * @return the DateOfInspection
     */
    public String getDateOfInspection() {
        return DateOfInspection;
    }

    /**
     * @param DateOfInspection the DateOfInspection to set
     */
    public void setDateOfInspection(String DateOfInspection) {
        this.DateOfInspection = DateOfInspection;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    

    /**
     * @return the Remark
     */
    public String getRemark() {
        return Remark;
    }

    /**
     * @param Remark the Remark to set
     */
    public void setRemark(String Remark) {
        this.Remark = Remark;
    }

    /**
     * @return the Status
     */
    public String getStatus() {
        return Status;
    }

    /**
     * @param Status the Status to set
     */
    public void setStatus(String Status) {
        this.Status = Status;
    }

    /**
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }
            
    
}
