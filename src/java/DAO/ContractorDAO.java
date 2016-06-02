/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.ConnectionFactory;
import Entity.Bid_Notices;
import Entity.Contractor;
import Entity.Contractor_Has_Project;
import Entity.Contractor_User;
import Entity.Eligibility_Document;
import Entity.Employee;
import Entity.InvitationToBid;
import Entity.Project;
import Entity.Request;
import Entity.Schedule;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Krist
 */
public class ContractorDAO {

    Connection connection;
    PreparedStatement statement;
    ResultSet result;
    ConnectionFactory myFactory;

    public Contractor getContractor(int id) {

        Contractor contractor = null;

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from contractor where ID = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, id);

            result = statement.executeQuery();

            while (result.next()) {

                contractor = new Contractor(result.getInt("ID"), result.getString("Name"));

            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return contractor;
    }

    public Contractor_Has_Project getContractorHasProject(Project project, Contractor contractor) {

        Contractor_Has_Project contractorProject = null;

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from contractor_has_project where Project_ID = ? AND Contractor_ID = ?";

            statement = connection.prepareStatement(query);
            statement.setString(1, project.getId());
            statement.setInt(2, contractor.getID());
            result = statement.executeQuery();

            while (result.next()) {

                contractorProject = new Contractor_Has_Project(result.getInt("ID"), project, contractor, result.getString("Status"));

            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return contractorProject;
    }

    public ArrayList<Project> getAllProjectsWithInvitation() {

        ArrayList<Project> projects = new ArrayList<Project>();
        Project project;

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from project where Status = 'Posted Invitation'";
            statement = connection.prepareStatement(query);

            result = statement.executeQuery();

            while (result.next()) {

                project = new Project();
                project.setId(result.getString("ID"));
                project.setName(result.getString("Name"));
                project.setDescription(result.getString("Description"));
                project.setType(result.getString("Type"));
                project.setStatus(result.getString("Status"));
                projects.add(project);

            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return projects;
    }

    public Project getProjectInfo(String id) {

        Project project = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from project where ID = ?";

            statement = connection.prepareStatement(query);
            statement.setString(1, id);

            result = statement.executeQuery();

            while (result.next()) {

                project = new Project();
                project.setId(result.getString("ID"));
                project.setName(result.getString("Name"));
                project.setDescription(result.getString("Description"));
                project.setType(result.getString("Type"));
                project.setStatus(result.getString("Status"));

            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return project;
    }

    public ArrayList<InvitationToBid> getInvitation(Project project) {

        ArrayList<InvitationToBid> invitation = new ArrayList<InvitationToBid>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from invitationtobid where Project_ID = ?";

            statement = connection.prepareStatement(query);
            statement.setString(1, project.getId());

            result = statement.executeQuery();

            while (result.next()) {

                InvitationToBid invite = new InvitationToBid();
                if (!result.getString("status").equalsIgnoreCase("Fail")) {
                    invite.setID(result.getInt("ID"));
                    invite.setFileName(result.getString("FileName"));
                    invite.setDateUploaded(result.getString("DateUploaded"));
                    invite.setProjectID(project);
                    invite.setFolderName(result.getString("FolderName"));

                    invitation.add(invite);
                }
            }
            connection.close();
            return invitation;

        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return invitation;

    }

    public void addContractorHasProject(Project project, Contractor contractor) {

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "insert into contractor_has_project (Project_ID,Contractor_ID,Status) values (?,?,?);";

            statement = connection.prepareStatement(query);

            statement.setString(1, project.getId());
            statement.setInt(2, contractor.getID());
            statement.setString(3, "For eligibility check");

            statement.executeUpdate();
            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateConHasProject(int id) {

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "update contractor_has_project set Status=? where id = ?";

            statement = connection.prepareStatement(query);
            statement.setString(1, "For eligibility check");
            statement.setInt(2, id);
            statement.executeUpdate();
            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Contractor_Has_Project> getRespondedProjects(Contractor contractor) {

        ArrayList<Contractor_Has_Project> respondedProjects = new ArrayList<Contractor_Has_Project>();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from contractor_has_project JOIN  project on project.ID = contractor_has_project.Project_ID where contractor_has_project.Contractor_ID = ? AND contractor_has_project.Status NOT LIKE 'Winning Bidder' ";

            statement = connection.prepareStatement(query);
            statement.setInt(1, contractor.getID());

            result = statement.executeQuery();

            while (result.next()) {

                Project project = new Project();
                project.setId(result.getString("project.ID"));
                project.setName(result.getString("Name"));
                project.setDescription(result.getString("Description"));
                project.setType(result.getString("Type"));
                project.setStatus(result.getString("Status"));
                Contractor_Has_Project conProject = new Contractor_Has_Project(result.getInt("contractor_has_project.ID"), project, contractor, result.getString("contractor_has_project.Status"));

                respondedProjects.add(conProject);
            }
            connection.close();
            return respondedProjects;

        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return respondedProjects;

    }

    public void uploadEligibilityDocuments(Eligibility_Document document) {

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "INSERT INTO eligibility_documents (FileName, FolderName, DateUploaded, Contractor_has_Project_ID, Document_Type, Status) VALUES (?, ?, now(), ?, ?, ?);";

            statement = connection.prepareStatement(query);

            statement.setString(1, document.getFileName());
            statement.setString(2, document.getFolderName());
            statement.setInt(3, document.getContractor_has_project().getID());
            statement.setString(4, document.getType());
            statement.setString(5, "Pending");

            statement.executeUpdate();
            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Contractor getContractorInfo(int id) {

        Contractor cont = null;

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from contractor where ID = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);

            result = statement.executeQuery();

            while (result.next()) {

                cont = new Contractor(result.getInt("ID"), result.getString("Name"));

            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cont;
    }
    
    public ArrayList<Bid_Notices> getBidNotices(Project p, Contractor c) {

        ArrayList<Bid_Notices> bidnotices = new ArrayList<Bid_Notices>();
        Bid_Notices bidnotice;

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from bid_notices where Project_ID = ? AND Contractor_ID = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());
            statement.setInt(2, c.getID());

            result = statement.executeQuery();

            while (result.next()) {

                bidnotice = new Bid_Notices(result.getInt("ID"), result.getString("FileName"), result.getString("DateUploaded"), p, c, result.getString("FolderName"), result.getString("Type"));
                bidnotices.add(bidnotice);

            }
            connection.close();
            return bidnotices;

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return bidnotices;
    }

    public ArrayList<Project> getImplementedProjects(Contractor_User user) {

        Project project = null;
        ArrayList<Project> projects = new ArrayList<Project>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from project where Contractor_ID = ? AND Status = 'Implementation'";

            statement = connection.prepareStatement(query);
            statement.setInt(1, user.getID());

            result = statement.executeQuery();

            while (result.next()) {

                project = new Project();
                project.setId(result.getString("ID"));
                project.setName(result.getString("Name"));
                project.setDescription(result.getString("Description"));
                project.setType(result.getString("Type"));
                project.setStatus(result.getString("Status"));

                projects.add(project);

            }
            connection.close();
            return projects;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return projects;
    }

    public ArrayList<Eligibility_Document> getSubmittedDocuments(int id) {

        ArrayList<Eligibility_Document> documents = new ArrayList<Eligibility_Document>();
        Eligibility_Document doc;
        Contractor_Has_Project contProject;
        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from eligibility_documents where Contractor_has_Project_ID = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);

            result = statement.executeQuery();

            while (result.next()) {
                contProject = new Contractor_Has_Project();
                contProject.setID(result.getInt("Contractor_has_Project_ID"));
                doc = new Eligibility_Document(result.getInt("ID"), result.getString("FileName"), result.getString("FolderName"), result.getString("DateUploaded"), contProject, result.getString("Document_Type"), result.getString("Status"), result.getString("BAC_Remarks"));
                documents.add(doc);
            }

            connection.close();

            return documents;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return documents;
    }

    public ArrayList<InvitationToBid> getNegotiatedITB(Contractor c) {
        ArrayList<InvitationToBid> pList = new ArrayList<>();
        Project p;
        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select project.id, project.Name, project.Description, invitationtobid.reason from contractor_has_project \n"
                    + "join invitationtobid on invitationtobid.project_ID = contractor_has_project.project_id\n"
                    + "join contractor on contractor_has_project.contractor_id = contractor.id\n"
                    + "join project on invitationtobid.project_id = project.id\n"
                    + "where invitationtobid.status = \"negotiated\" and contractor.id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, c.getID());

            result = statement.executeQuery();

            while (result.next()) {
                p = new Project();
                p.setId(result.getString("project.id"));
                p.setName(result.getString("project.name"));
                p.setDescription(result.getString("project.description"));
                InvitationToBid itb = new InvitationToBid();
                itb.setReason(result.getString("reason"));
                itb.setProjectID(p);
                pList.add(itb);
            }

            connection.close();

            return pList;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pList;
    }

    public String checkPage(int id, String idd) {

        int result1 = 0;
        String result2 = null;

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
//            String query = "SELECT CASE WHEN NOT EXISTS(SELECT * FROM eligibility_documents WHERE eligibility_documents.Contractor_has_Project_ID = ? AND eligibility_documents.Status = 'Approved') THEN 'Y' ELSE 'N' END AS My_Result";
            String query = "select count(*) as c from contractor_has_project where Contractor_ID = ? AND Project_ID = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.setString(2, idd);

            result = statement.executeQuery();

            while (result.next()) {
                result1 = result.getInt("c");
            }

            if (result1 <= 0) {
                result2 = "N";

            } else if (result1 > 0) {

                result2 = "Y";

            }

            statement.close();

            connection.close();
            return result2;

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result2;
    }

    public void sendRequest(Request r) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into request (schedule_id, start, end, reason, status, contractor_id, daterequested) values (?,?,?,?,?,?, now())";

            statement = connection.prepareStatement(query);
            statement.setInt(1, r.getSchedule().getId());
            statement.setString(2, r.getStart());
            statement.setString(3, r.getEnd());
            statement.setString(4, r.getReason());
            statement.setString(5, r.getStatus());
            statement.setInt(6, r.getCs().getID());
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<Project> getImplProj() {
        ArrayList<Project> plist = new ArrayList<>();
        Project p;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from project where status = ?";

            statement = connection.prepareStatement(query);
            statement.setString(1, "Implementation");
            result = statement.executeQuery();
            while (result.next()) {
                p = new Project();
                p.setId(result.getString("ID"));
                p.setName(result.getString("Name"));
                plist.add(p);
            }
            return plist;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return plist;
    }

    public ArrayList<Schedule> getTask(Project p, String stage, String status) {
        ArrayList<Schedule> sList = new ArrayList<>();
        Schedule s;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from schedule where project_id = ? and stage = ? and status = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());
            statement.setString(2, stage);
            statement.setString(3, status);
            result = statement.executeQuery();
            while (result.next()) {
                s = new Schedule();
                s.setId(result.getInt("schedule.id"));
                s.setEvent(result.getString("event"));
                sList.add(s);
            }
            return sList;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return sList;
    }

    public ArrayList<Request> getRequests(int id) {
        ArrayList<Request> requests = new ArrayList<>();
        Request tq;
        Schedule s;
        Employee e;
        Contractor_User cs;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from request join schedule on schedule.id = schedule_id where contractor_id = ? ";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            result = statement.executeQuery();
            while (result.next()) {
                tq = new Request();
                tq.setId(result.getInt("id"));
                tq.setDateRequested(result.getString("daterequested"));
                tq.setRemarks(result.getString("Remarks"));
                s = new Schedule();
                e = new Employee();
                cs = new Contractor_User();
                s.setId(result.getInt("schedule_id"));
                s.setEvent(result.getString("event"));
                s.setStartdate(result.getString("startdate"));
                s.setEnddate(result.getString("enddate"));
                tq.setSchedule(s);
                cs.setID(result.getInt("contractor_id"));
                tq.setCs(cs);
                tq.setStart(result.getString("start"));
                tq.setEnd(result.getString("end"));
                tq.setReason(result.getString("reason"));
                tq.setStatus(result.getString("status"));
                requests.add(tq);
            }
            return requests;

        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return requests;
    }

    public void updateEligibilityDocument(int id, Eligibility_Document document) {

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "UPDATE cogitov2.eligibility_documents SET FileName = ?, FolderName = ?, DateUploaded = now(), Contractor_has_Project_ID= ?, Document_Type = ?, Status= ? WHERE ID = ?";

            statement = connection.prepareStatement(query);

            statement.setString(1, document.getFileName());
            statement.setString(2, document.getFolderName());
            statement.setInt(3, document.getContractor_has_project().getID());
            statement.setString(4, document.getType());
            statement.setString(5, "Pending");
            statement.setInt(6, id);

            statement.executeUpdate();
            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Project> getCompletedProjects(Contractor_User user) {

        Project project = null;
        ArrayList<Project> projects = new ArrayList<Project>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from project where Contractor_ID = ? AND Status = 'Finished'";

            statement = connection.prepareStatement(query);
            statement.setInt(1, user.getID());

            result = statement.executeQuery();

            while (result.next()) {

                project = new Project();
                project.setId(result.getString("ID"));
                project.setName(result.getString("Name"));
                project.setDescription(result.getString("Description"));
                project.setType(result.getString("Type"));
                project.setStatus(result.getString("Status"));

                projects.add(project);

            }
            connection.close();
            return projects;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return projects;
    }
    

}
