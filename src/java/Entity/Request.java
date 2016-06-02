/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author Krist
 */
public class Request {
    private int id;
    private Schedule schedule;
    private String start;
    private String end;
    private String reason;
    private String status;
    private String remarks;
    private String dateRequested;
    private Contractor_User cs;
    private Employee employee;

    public Request() {
    }

    public Request(int id, Schedule schedule, String start, String end, String reason, String status, Contractor_User cs, Employee employee) {
        this.id = id;
        this.schedule = schedule;
        this.start = start;
        this.end = end;
        this.reason = reason;
        this.status = status;
        this.cs = cs;
        this.employee = employee;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Contractor_User getCs() {
        return cs;
    }

    public void setCs(Contractor_User cs) {
        this.cs = cs;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public String getDateRequested() {
        return dateRequested;
    }

    public void setDateRequested(String dateRequested) {
        this.dateRequested = dateRequested;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    
    
}
