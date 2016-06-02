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
public class Location {
    
    private int id;
    private String longs;
    private String lats;
    private Project project;
    
    public Location() {
    }

    
    public Location(int id, String longs, String lats, Project project) {
        this.id = id;
        this.longs = longs;
        this.lats = lats;
        this.project = project;
        
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLongs() {
        return longs;
    }

    public void setLongs(String longs) {
        this.longs = longs;
    }

    public String getLats() {
        return lats;
    }

    public void setLats(String lats) {
        this.lats = lats;
    }


    
    
    
}
