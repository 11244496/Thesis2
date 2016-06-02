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
public class Comment {
    
    private int id;
    private String comment;
    private String sender;
    private String dateSent;
    private Testimonial testimonial;
    private User user;

    public Comment() {
    }

    public Comment(int id, String comment, String sender, String dateSent, Testimonial testimonial, User user) {
        this.id = id;
        this.comment = comment;
        this.sender = sender;
        this.dateSent = dateSent;
        this.testimonial = testimonial;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getDateSent() {
        return dateSent;
    }

    public void setDateSent(String dateSent) {
        this.dateSent = dateSent;
    }

    public Testimonial getTestimonial() {
        return testimonial;
    }

    public void setTestimonial(Testimonial testimonial) {
        this.testimonial = testimonial;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    
}
