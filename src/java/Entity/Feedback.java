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
public class Feedback {
    
    private int id;
    private int quality;
    private int promptness;
    private int convenience;
    private int safety;
    private int details;
    private int details2;
    private int satisfaction;
    private double qualityave;
    private double promptnessave;
    private double convenienceave;
    private double safetyave;
    private double detailsave;
    private double satisfactionave;
    private String comments;
    private Project project;
    private Citizen citizen;
    private String dateSubmitted;

    public Feedback() {
    }

    public Feedback(double qualityave, double promptnessave, double convenienceave, double safetyave, double detailsave, double satisfactionave, Project project) {
        this.qualityave = qualityave;
        this.promptnessave = promptnessave;
        this.convenienceave = convenienceave;
        this.safetyave = safetyave;
        this.detailsave = detailsave;
        this.satisfactionave = satisfactionave;
        this.project = project;
    }

    
    public Feedback(int quality, int promptness, int convenience, int safety, int details, int details2, int satisfaction, String comments, Project project, Citizen citizen, String dateSubmitted) {
        this.quality = quality;
        this.promptness = promptness;
        this.convenience = convenience;
        this.safety = safety;
        this.details = details;
        this.details2 = details2;
        this.satisfaction = satisfaction;
        this.comments = comments;
        this.project = project;
        this.citizen = citizen;
        this.dateSubmitted = dateSubmitted;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuality() {
        return quality;
    }

    public void setQuality(int quality) {
        this.quality = quality;
    }

    public int getPromptness() {
        return promptness;
    }

    public void setPromptness(int promptness) {
        this.promptness = promptness;
    }

    public int getConvenience() {
        return convenience;
    }

    public void setConvenience(int convenience) {
        this.convenience = convenience;
    }

    public int getSafety() {
        return safety;
    }

    public void setSafety(int safety) {
        this.safety = safety;
    }

    public int getDetails() {
        return details;
    }

    public void setDetails(int details) {
        this.details = details;
    }

    public int getDetails2() {
        return details2;
    }

    public void setDetails2(int details2) {
        this.details2 = details2;
    }

    public int getSatisfaction() {
        return satisfaction;
    }

    public void setSatisfaction(int satisfaction) {
        this.satisfaction = satisfaction;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public Citizen getCitizen() {
        return citizen;
    }

    public void setCitizen(Citizen citizen) {
        this.citizen = citizen;
    }

    public String getDateSubmitted() {
        return dateSubmitted;
    }

    public void setDateSubmitted(String dateSubmitted) {
        this.dateSubmitted = dateSubmitted;
    }

    public double getQualityave() {
        return qualityave;
    }

    public void setQualityave(double qualityave) {
        this.qualityave = qualityave;
    }

    public double getPromptnessave() {
        return promptnessave;
    }

    public void setPromptnessave(double promptnessave) {
        this.promptnessave = promptnessave;
    }

    public double getConvenienceave() {
        return convenienceave;
    }

    public void setConvenienceave(double convenienceave) {
        this.convenienceave = convenienceave;
    }

    public double getSafetyave() {
        return safetyave;
    }

    public void setSafetyave(double safetyave) {
        this.safetyave = safetyave;
    }

    public double getDetailsave() {
        return detailsave;
    }

    public void setDetailsave(double detailsave) {
        this.detailsave = detailsave;
    }

    public double getSatisfactionave() {
        return satisfactionave;
    }

    public void setSatisfactionave(double satisfactionave) {
        this.satisfactionave = satisfactionave;
    }
    
}
