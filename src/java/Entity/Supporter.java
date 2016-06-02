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
public class Supporter {
    
    private int id;
    private Testimonial testimonial;
    private Citizen citizen;

    public Supporter(int id, Testimonial testimonial, Citizen citizen) {
        this.id = id;
        this.testimonial = testimonial;
        this.citizen = citizen;
    }

    public Supporter(int id, Citizen citizen) {
        this.id = id;
        this.citizen = citizen;
    }

    public Supporter() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Testimonial getTestimonial() {
        return testimonial;
    }

    public void setTestimonial(Testimonial testimonial) {
        this.testimonial = testimonial;
    }

    public Citizen getCitizen() {
        return citizen;
    }

    public void setCitizen(Citizen citizen) {
        this.citizen = citizen;
    }
    
    
    
}
