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
public class Project_Progress {
   
    private int ID;
    private String material;
    private int quantity;
    private float project_percentage;
    private float value_of_work;
    private String Date;
    private Project project;
    
    public Project_Progress(){
        
        
        
    }
    
    
    public Project_Progress(int ID, String material,int quantity, float project_percentage, float value_of_work, String Date, Project project) {
        this.ID = ID;
        this.material = material;
        this.quantity = quantity;
        this.project_percentage = project_percentage;
        this.value_of_work = value_of_work;
        this.Date = Date;
        this.project = project;
    }
    
    
    
    /**
     * @return the ID
     */
    public int getID() {
        return ID;
    }

    /**
     * @param ID the ID to set
     */
    public void setID(int ID) {
        this.ID = ID;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the project_percentage
     */
    public float getProject_percentage() {
        return project_percentage;
    }

    /**
     * @param project_percentage the project_percentage to set
     */
    public void setProject_percentage(float project_percentage) {
        this.project_percentage = project_percentage;
    }

    /**
     * @return the value_of_work
     */
    public float getValue_of_work() {
        return value_of_work;
    }

    /**
     * @param value_of_work the value_of_work to set
     */
    public void setValue_of_work(float value_of_work) {
        this.value_of_work = value_of_work;
    }

    /**
     * @return the Date
     */
    public String getDate() {
        return Date;
    }

    /**
     * @param Date the Date to set
     */
    public void setDate(String Date) {
        this.Date = Date;
    }

    /**
     * @return the project
     */
    public Project getProject() {
        return project;
    }

    /**
     * @param project the project to set
     */
    public void setProject(Project project) {
        this.project = project;
    }

    /**
     * @return the material
     */
    public String getMaterial() {
        return material;
    }

    /**
     * @param material the material to set
     */
    public void setMaterial(String material) {
        this.material = material;
    }
    
    
}
