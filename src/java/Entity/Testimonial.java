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
public class Testimonial {
    
    private int id;
    private String title;
    private String dateUploaded;
    private String message;
    private String folderName;
    private String location;
    private String locationdetails;
    private String category;
    private String concern;
    private String status;
    private Citizen citizen;
    private Project project;
    private ArrayList<Reply> replies;
    private ArrayList<Files> files;

    public Testimonial(int id, String title, String dateUploaded, String message, String folderName, String location, String locationdetails, String category, String concern, String status, Citizen citizen) {
        this.id = id;
        this.title = title;
        this.dateUploaded = dateUploaded;
        this.message = message;
        this.folderName = folderName;
        this.location = location;
        this.locationdetails = locationdetails;
        this.category = category;
        this.concern = concern;
        this.citizen = citizen;
        this.status = status;
    }

    public Testimonial() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDateUploaded() {
        return dateUploaded;
    }

    public void setDateUploaded(String dateUploaded) {
        this.dateUploaded = dateUploaded;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getFolderName() {
        return folderName;
    }

    public void setFolderName(String folderName) {
        this.folderName = folderName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLocationdetails() {
        return locationdetails;
    }

    public void setLocationdetails(String locationdetails) {
        this.locationdetails = locationdetails;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getConcern() {
        return concern;
    }

    public void setConcern(String concern) {
        this.concern = concern;
    }

    public Citizen getCitizen() {
        return citizen;
    }

    public void setCitizen(Citizen citizen) {
        this.citizen = citizen;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project projectId) {
        this.project = projectId;
    }

    public ArrayList<Reply> getReplies() {
        return replies;
    }

    public void setReplies(ArrayList<Reply> replies) {
        this.replies = replies;
    }

    public ArrayList<Files> getFiles() {
        return files;
    }

    public void setFiles(ArrayList<Files> files) {
        this.files = files;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
