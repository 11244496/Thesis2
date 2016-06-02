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
public class Annotation {
    private int id;
    private String description;
    private String materials;
    private String schedule;
    private String upload;
    private String date;
    private String status;
    private String general;

    public String getGeneral() {
        return general;
    }

    public void setGeneral(String general) {
        this.general = general;
    }
    private Project project;

    public Annotation(int id, String description, String materials, String schedule, String upload, String date, String status, String general, Project project) {
        this.id = id;
        this.description = description;
        this.materials = materials;
        this.schedule = schedule;
        this.upload = upload;
        this.date = date;
        this.status = status;
        this.general = general;
        this.project = project;
    }


    public Annotation() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMaterials() {
        return materials;
    }

    public void setMaterials(String materials) {
        this.materials = materials;
    }

    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    public String getUpload() {
        return upload;
    }

    public void setUpload(String upload) {
        this.upload = upload;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }
    
    
}
