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
public class Bid_Notices {
    
    private int ID;
    private String FileName;
    private String DateUploaded;
    private Project Project;
    private Contractor Contractor;
    private String FolderName;
    private String Type;

    private Bid_Notices(){
        
        
        
        
    }

    public Bid_Notices(int ID, String FileName, String DateUploaded, Project Project, Contractor Contractor, String FolderName, String Type) {
        this.ID = ID;
        this.FileName = FileName;
        this.DateUploaded = DateUploaded;
        this.Project = Project;
        this.Contractor = Contractor;
        this.FolderName = FolderName;
        this.Type = Type;
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
     * @return the Project
     */
    public Project getProject() {
        return Project;
    }

    /**
     * @param Project the Project to set
     */
    public void setProject(Project Project) {
        this.Project = Project;
    }

    /**
     * @return the Contractor
     */
    public Contractor getContractor() {
        return Contractor;
    }

    /**
     * @param Contractor the Contractor to set
     */
    public void setContractor(Contractor Contractor) {
        this.Contractor = Contractor;
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
     * @return the Type
     */
    public String getType() {
        return Type;
    }

    /**
     * @param Type the Type to set
     */
    public void setType(String Type) {
        this.Type = Type;
    }
    
    
}
