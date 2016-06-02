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
public class Reply {
    
    private int id;
    private String message;
    private String sender;
    private String dateSent;
    
    private Testimonial testimonial_ID;

    public Reply() {
    }

    public Reply(int id, String message, String sender, Testimonial testimonial_ID, String dateSent) {
        this.id = id;
        this.message = message;
        this.sender = sender;
        this.testimonial_ID = testimonial_ID;
        this.dateSent = dateSent;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public Testimonial getTestimonial_ID() {
        return testimonial_ID;
    }

    public void setTestimonial_ID(Testimonial testimonial_ID) {
        this.testimonial_ID = testimonial_ID;
    }

    public String getDateSent() {
        return dateSent;
    }

    public void setDateSent(String dateSent) {
        this.dateSent = dateSent;
    }

    
    
    
}
