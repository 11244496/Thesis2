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
public class Contractor_Profile {
    
    private int ID;
    private String FileName;
    private String DateUploaded;
    private String FolderName;
    private Contractor contractor;
    
    public Contractor_Profile(){
        
        
        
    }
    public Contractor_Profile(int ID, String FileName, String DateUploaded, String FolderName, Contractor contractor) {
        this.ID = ID;
        this.FileName = FileName;
        this.DateUploaded = DateUploaded;
        this.FolderName = FolderName;
        this.contractor = contractor;
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
    
    
    
}
