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
public class Eligibility_Document {
    
    private int ID;
    private String FileName;
    private String FolderName;
    private String DateUploaded;
    private Contractor_Has_Project contractor_has_project;
    private String type;
    private String Status;
    private String BAC_Remarks;
    
    private int Approved;
    private int Pending;
    private int Pending_Action_Needed;
    
    public Eligibility_Document(){
        
        
        
    }

    public Eligibility_Document(int ID, String FileName, String FolderName, String DateUploaded, Contractor_Has_Project contractor_has_project, String type, String Status, String BAC_Remarks) {
        this.ID = ID;
        this.FileName = FileName;
        this.FolderName = FolderName;
        this.DateUploaded = DateUploaded;
        this.contractor_has_project = contractor_has_project;
        this.type = type;
        this.Status = Status;
        this.BAC_Remarks = BAC_Remarks;
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
     * @return the FileName
     */
    public String getFileName() {
        return FileName;
    }

    /**
     * @param FileName the FileName to set
     */
    public void setFileName(String FileName) {
        this.FileName = FileName;
    }

    /**
     * @return the FolderName
     */
    public String getFolderName() {
        return FolderName;
    }

    /**
     * @param FolderName the FolderName to set
     */
    public void setFolderName(String FolderName) {
        this.FolderName = FolderName;
    }

    /**
     * @return the DateUploaded
     */
    public String getDateUploaded() {
        return DateUploaded;
    }

    /**
     * @param DateUploaded the DateUploaded to set
     */
    public void setDateUploaded(String DateUploaded) {
        this.DateUploaded = DateUploaded;
    }

    /**
     * @return the contractor_has_project
     */
    public Contractor_Has_Project getContractor_has_project() {
        return contractor_has_project;
    }

    /**
     * @param contractor_has_project the contractor_has_project to set
     */
    public void setContractor_has_project(Contractor_Has_Project contractor_has_project) {
        this.contractor_has_project = contractor_has_project;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
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

    /**
     * @return the BAC_Remarks
     */
    public String getBAC_Remarks() {
        return BAC_Remarks;
    }

    /**
     * @param BAC_Remarks the BAC_Remarks to set
     */
    public void setBAC_Remarks(String BAC_Remarks) {
        this.BAC_Remarks = BAC_Remarks;
    }

    /**
     * @return the Approved
     */
    public int getApproved() {
        return Approved;
    }

    /**
     * @param Approved the Approved to set
     */
    public void setApproved(int Approved) {
        this.Approved = Approved;
    }

    /**
     * @return the Pending
     */
    public int getPending() {
        return Pending;
    }

    /**
     * @param Pending the Pending to set
     */
    public void setPending(int Pending) {
        this.Pending = Pending;
    }

    /**
     * @return the Pending_Action_Needed
     */
    public int getPending_Action_Needed() {
        return Pending_Action_Needed;
    }

    /**
     * @param Pending_Action_Needed the Pending_Action_Needed to set
     */
    public void setPending_Action_Needed(int Pending_Action_Needed) {
        this.Pending_Action_Needed = Pending_Action_Needed;
    }
    
    
    
    
    
    
    
}
