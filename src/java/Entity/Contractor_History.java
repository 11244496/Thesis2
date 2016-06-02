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
public class Contractor_History {
    
    
    private int ID;
    private Project project;
    private Contractor contractor;
    private String remarks;
    
    public Contractor_History(){
        
        
        
    }

    public Contractor_History(int ID, Project project, Contractor contractor, String remarks) {
        this.ID = ID;
        this.project = project;
        this.contractor = contractor;
        this.remarks = remarks;
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
     * @return the remarks
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * @param remarks the remarks to set
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    
    
    
    
}
