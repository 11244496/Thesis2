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
public class Contractor_Has_Project {
    
    private int ID;
    private Project project;
    private Contractor contractor;
    private String Status;
    
    
    public Contractor_Has_Project(){
        
        
        
    }
    public Contractor_Has_Project(int ID, Project project, Contractor contractor, String Status) {
        this.ID = ID;
        this.project = project;
        this.contractor = contractor;
        this.Status = Status;
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
     * @return the contractor
     */
    public Contractor getContractor() {
        return contractor;
    }

    /**
     * @param contractor the contractor to set
     */
    public void setContractor(Contractor contractor) {
        this.contractor = contractor;
    }

    /**
     * @return the Status
     */
    public String getStatus() {
        return Status;
    }

    /**
     * @param Status the Status to set
     */
    public void setStatus(String Status) {
        this.Status = Status;
    }
    
    
}
