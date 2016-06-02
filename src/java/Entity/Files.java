/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author Lenovo
 */
public class Files {
    
    private int id;
    private String fileName;
    private String dateUploaded;
    private String type;
    private Testimonial testimonial;
    private String status;
    private String uploader;
    private Project project;

    public Files() {
    }
    
    public Files(int id, String fileName, String dateUploaded, String type, Testimonial testimonial, String status, String uploader) {
        this.id = id;
        this.fileName = fileName;
        this.dateUploaded = dateUploaded;
        this.type = type;
        this.testimonial = testimonial;
        this.status = status;
        this.uploader = uploader;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getDateUploaded() {
        return dateUploaded;
    }

    public void setDateUploaded(String dateUploaded) {
        this.dateUploaded = dateUploaded;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Testimonial getTestimonial_ID() {
        return testimonial;
    }

    public void setTestimonial_ID(Testimonial testimonial) {
        this.testimonial = testimonial;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Testimonial getTestimonial() {
        return testimonial;
    }

    public void setTestimonial(Testimonial testimonial) {
        this.testimonial = testimonial;
    }

    public String getUploader() {
        return uploader;
    }

    public void setUploader(String uploader) {
        this.uploader = uploader;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }
    
    
    
}
