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
public class InvitationToBid {

    
    
    private int ID;
    private String FileName;
    private String DateUploaded;
    private Project projectID;
    private String FolderName;
    private String reason;
    private String status;
    
    public InvitationToBid(){
        
    }
    
    public InvitationToBid(int ID, String FileName, String DateUploaded, Project projectID, String FolderName) {
        this.ID = ID;
        this.FileName = FileName;
        this.DateUploaded = DateUploaded;
        this.projectID = projectID;
        this.FolderName = FolderName;
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
     * @return the projectID
     */
    public Project getProjectID() {
        return projectID;
    }

    /**
     * @param projectID the projectID to set
     */
    public void setProjectID(Project projectID) {
        this.projectID = projectID;
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

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
}
