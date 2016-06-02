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
public class PlanningDocument {
    private int id;
    private String type;
    private String name;
    private String url;
    private int year;
    private String dateuploaded;
    private Employee employee;

    public PlanningDocument(int id, String type, String name, String url, int year, String dateuploded, Employee employee) {
        this.id = id;
        this.type = type;
        this.name = name;
        this.url = url;
        this.year = year;
        this.dateuploaded = dateuploded;
        this.employee = employee;
    }

    public PlanningDocument() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getDateUploaded() {
        return dateuploaded;
    }

    public void setDateUploaded(String dateuploded) {
        this.dateuploaded = dateuploded;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
    
    
}
