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
public class Meeting {
    private int id;
    private String agenda;
    private Task task;

    public Meeting(int id, String agenda, Task task) {
        this.id = id;
        this.agenda = agenda;
        this.task = task;
    }

    public Meeting() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAgenda() {
        return agenda;
    }

    public void setAgenda(String agenda) {
        this.agenda = agenda;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }
    
    
}
