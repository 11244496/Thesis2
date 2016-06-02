/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.ArrayList;

/**
 *
 * @author RoAnn
 */
public class Project {

    private String id;
    private String name;
    private String description;
    private String type;
    private String status;
    private String foldername;
    private Employee employee;
    private String datesubmitted;
    private float budget;
    private Annotation annotations;

    private ArrayList<Location> location;
    private ArrayList<Material> materials;
    private ArrayList<Schedule> schedule;
    private ArrayList<Files> files;
    private ArrayList<Component> components;

    private SubCategory category;

    //BAC PART
    private int responses = 0;
    private int confirmed = 0;
    private Contractor contractor;
    private Contractor_User contractorUser;

    private ArrayList<Project_Inspection> inspection;
    
//    public Project(int id, String name, String description, String type, String status, Employee employee, Project project, Contractor contractor) {
//        this.id = id;
//        this.name = name;
//        this.description = description;
//        this.type = type;
//        this.status = status;
//        this.employee = employee;
//        this.project = project;
//        this.contractor = contractor;
//    }

    
    public Project() {
    }

    public Project(String id, String name, String description, String type, String status, Employee employee, ArrayList<Location> location, ArrayList<Material> materials, ArrayList<Schedule> schedule, ArrayList<Files> files) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.type = type;
        this.status = status;
        this.employee = employee;
        this.location = location;
        this.materials = materials;
        this.schedule = schedule;
        this.files = files;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public ArrayList<Location> getLocation() {
        return location;
    }

    public void setLocation(ArrayList<Location> location) {
        this.location = location;
    }

    public ArrayList<Material> getMaterials() {
        return materials;
    }

    public void setMaterials(ArrayList<Material> materials) {
        this.materials = materials;
    }

    public ArrayList<Schedule> getSchedule() {
        return schedule;
    }

    public void setSchedule(ArrayList<Schedule> schedule) {
        this.schedule = schedule;
    }

    public ArrayList<Files> getFiles() {
        return files;
    }

    public void setFiles(ArrayList<Files> files) {
        this.files = files;
    }

    public SubCategory getCategory() {
        return category;
    }

    public void setCategory(SubCategory category) {
        this.category = category;
    }

    public String getDatesubmitted() {
        return datesubmitted;
    }

    public void setDatesubmitted(String datesubmitted) {
        this.datesubmitted = datesubmitted;
    }

    public ArrayList<Component> getComponents() {
        return components;
    }

    public void setComponents(ArrayList<Component> components) {
        this.components = components;
    }

    public float getBudget() {
        return budget;
    }

    public void setBudget(float budget) {
        this.budget = budget;
    }

    public Annotation getAnnotations() {
        return annotations;
    }

    public void setAnnotations(Annotation annotations) {
        this.annotations = annotations;
    }

    public int getResponses() {
        return responses;
    }

    public void setResponses(int responses) {
        this.responses = responses;
    }

    public int getConfirmed() {
        return confirmed;
    }

    public void setConfirmed(int confirmed) {
        this.confirmed = confirmed;
    }

    public Contractor getContractor() {
        return contractor;
    }

    public void setContractor(Contractor contractor) {
        this.contractor = contractor;
    }

    public Contractor_User getContractorUser() {
        return contractorUser;
    }

    public void setContractorUser(Contractor_User contractorUser) {
        this.contractorUser = contractorUser;
    }

    public String getFoldername() {
        return foldername;
    }

    public void setFoldername(String foldername) {
        this.foldername = foldername;
    }

    public ArrayList<Project_Inspection> getInspection() {
        return inspection;
    }

    public void setInspection(ArrayList<Project_Inspection> inspection) {
        this.inspection = inspection;
    }
    
    

}
