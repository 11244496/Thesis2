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
public class Task {

    private int id;
    private int taskNo;
    private String name;
    private String description;
    private String startDate;
    private String endDate;
    private String personInCharge;
    private String schedule;
    private Schedule schedule2;
    private String status;
    
    public Task() {
    }

    public Task(int id, int taskNo, String name, String description, String startDate, String endDate, String personInCharge, String schedule) {
        this.id = id;
        this.taskNo = taskNo;
        this.name = name;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.personInCharge = personInCharge;
        this.schedule = schedule;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTaskNo() {
        return taskNo;
    }

    public void setTaskNo(int taskNo) {
        this.taskNo = taskNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getPersonInCharge() {
        return personInCharge;
    }

    public void setPersonInCharge(String personInCharge) {
        this.personInCharge = personInCharge;
    }

    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    public Schedule getSchedule2() {
        return schedule2;
    }

    public void setSchedule2(Schedule schedule2) {
        this.schedule2 = schedule2;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    

}
