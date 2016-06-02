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
import Entity.Files;
import Entity.InvitationToBid;
import Entity.Project;
import Entity.Testimonial;
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
public class BACDAO {

    Connection connection;
    PreparedStatement statement;
    ResultSet result;
    ConnectionFactory myFactory;

    public ArrayList<Project> getProjects(String input) {
        ArrayList<Project> projects = new ArrayList<Project>();
        Project project;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from project where Status = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, input);

            result = statement.executeQuery();

            while (result.next()) {

                project = new Project();
                project.setId(result.getString("ID"));
                project.setName(result.getString("Name"));
                project.setDescription(result.getString("Description"));
                project.setType(result.getString("Type"));
                project.setStatus(result.getString("Status"));
                project.setBudget(result.getFloat("Budget"));
                projects.add(project);

            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return projects;
    }

    public ArrayList<Project> getAllProjects(String status, Contractor contractor) {
        ArrayList<Project> projects = new ArrayList<Project>();
        Project project;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from project where Status = ? AND Contractor_ID = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, status);
            statement.setInt(2, contractor.getID());

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
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return projects;
    }

    public ArrayList<Project> getAllProjectsPerContractor(Contractor contractor) {
        ArrayList<Project> projects = new ArrayList<Project>();
        Project project;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from project where Contractor_ID = ?";
            statement = connection.prepareStatement(query);

            statement.setInt(1, contractor.getID());

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
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return projects;
    }

    public ArrayList<Project> getProjectsForImplementation(String input) {
        ArrayList<Project> projects = new ArrayList<Project>();
        Project project;
        Contractor_User contractor;
        Contractor con;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from project JOIN contractorusers ON project.Contractor_ID = contractorusers.ID join contractor on company_id = contractor.id where status = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, input);

            result = statement.executeQuery();

            while (result.next()) {
                project = new Project();
                con = new Contractor();
                con.setID(result.getInt("Company_ID"));
                con.setName(result.getString("contractor.name"));
                project.setContractor(con);
                project.setId(result.getString("ID"));
                project.setName(result.getString("Name"));
                project.setDescription(result.getString("Description"));
                project.setType(result.getString("Type"));
                project.setStatus(result.getString("Status"));
                project.setBudget(result.getFloat("Budget"));
                projects.add(project);

            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return projects;
    }

    public ArrayList<Project> getProjectsWithInvitation() {

        ArrayList<Project> projects = new ArrayList<Project>();
        Project project;

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "SELECT *,\n"
                    + "(select count(*) from contractor_has_project where contractor_has_project.Project_ID = project.ID) as Submissions,\n"
                    + "(select count(*) from contractor_has_project where contractor_has_project.Project_ID = project.ID AND contractor_has_project.Status =\"Eligible to bid\") as Confirmed\n"
                    + "FROM project where project.status = \"Posted Invitation\"";
            statement = connection.prepareStatement(query);

            result = statement.executeQuery();

            while (result.next()) {

                project = new Project();
                project.setId(result.getString("ID"));
                project.setName(result.getString("Name"));
                project.setDescription(result.getString("Description"));
                project.setType(result.getString("Type"));
                project.setStatus(result.getString("Status"));
                project.setResponses(result.getInt("Submissions"));
                project.setConfirmed(result.getInt("Confirmed"));
                project.setBudget(result.getFloat("Budget"));
                projects.add(project);

            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return project;
    }

    public void changeBACStatus3(int id) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "UPDATE cogitov2.contractor_has_project SET Status = 'Winning Bidder' WHERE ID = ?";
            statement = connection.prepareStatement(query);

            statement.setInt(1, id);

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changeBACStatus2(int id) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "UPDATE cogitov2.contractor_has_project SET Status = 'Eligible to bid' WHERE ID = ?";
            statement = connection.prepareStatement(query);

            statement.setInt(1, id);

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changeBACStatus1(String id) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "UPDATE cogitov2.project SET Status = 'Posted Invitation' WHERE ID = ?";
            statement = connection.prepareStatement(query);

            statement.setString(1, id);

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changeBACStatus4(Contractor_User con, String id) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "UPDATE cogitov2.project SET Status = 'Implementation', Contractor_ID = ? WHERE ID = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, con.getID());
            statement.setString(2, id);

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Contractor_User getContUser(int id) {
        Contractor_User d = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select id from contractorusers where company_id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);

            result = statement.executeQuery();
            while (result.next()) {
                d = new Contractor_User();
                d.setID(result.getInt("id"));
            }
            statement.close();

            connection.close();
            return d;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }

    public int getContUserID(int id) {
        int d = 0;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select id from contractorusers where company_id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);

            result = statement.executeQuery();
            while (result.next()) {
                d = result.getInt("id");
            }
            statement.close();

            connection.close();
            return d;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }

    public void changeBACStatus5(int id) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "UPDATE cogitov2.contractor_has_project SET Status = 'Winning Bidder' WHERE ID = ?";
            statement = connection.prepareStatement(query);

            statement.setInt(1, id);

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void HoldContractorDocument(String remarks, int id) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "UPDATE cogitov2.eligibility_documents SET Status = 'Pending - Action needed', BAC_Remarks = ? WHERE ID = ?";
            statement = connection.prepareStatement(query);

            statement.setString(1, remarks);
            statement.setInt(2, id);

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void uploadInvitation(InvitationToBid inv) {

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "insert into invitationtobid (FileName,DateUploaded,Project_ID,FolderName,Status) values (?,now(),?,?,?);";

            statement = connection.prepareStatement(query);

            statement.setString(1, inv.getFileName());
            statement.setString(2, inv.getProjectID().getId());
            statement.setString(3, inv.getFolderName());
            statement.setString(4, "pending");

            statement.executeUpdate();
            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void uploadBidNotices(Bid_Notices notice) {

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "INSERT INTO cogitov2.bid_notices (FileName, DateUploaded, Project_ID, Contractor_ID, FolderName, Type) VALUES (?, now(), ?, ?, ?, ?);";

            statement = connection.prepareStatement(query);

            statement.setString(1, notice.getFileName());
            statement.setString(2, notice.getProject().getId());
            statement.setInt(3, notice.getContractor().getID());
            statement.setString(4, notice.getFolderName());
            statement.setString(5, notice.getType());

            statement.executeUpdate();
            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public InvitationToBid getInvitation(Project project) {

        InvitationToBid invitation = null;

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from invitationtobid where Project_ID = ?";

            statement = connection.prepareStatement(query);
            statement.setString(1, project.getId());

            result = statement.executeQuery();

            while (result.next()) {

                invitation = new InvitationToBid();
                invitation.setID(result.getInt("ID"));
                invitation.setFileName(result.getString("FileName"));
                invitation.setDateUploaded(result.getString("DateUploaded"));
                invitation.setProjectID(project);
                invitation.setFolderName(result.getString("FolderName"));

            }
            connection.close();
            return invitation;

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return invitation;

    }

    public ArrayList<Contractor_User> getAllContractors() {

        ArrayList<Contractor_User> contractors = new ArrayList<Contractor_User>();
        Contractor cont;
        Contractor_User cu = null;
        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from contractorusers join contractor on company_id = contractor.id";
            statement = connection.prepareStatement(query);

            result = statement.executeQuery();

            while (result.next()) {
                cu = new Contractor_User();
                cu.setID(result.getInt("contractorusers.id"));
                cu.setName(result.getString("contractorusers.name"));
                cu.setTelephone(result.getString("telephone"));
                cu.setAddress(result.getString("Address"));
                cu.setEmail(result.getString("Email"));
                cont = new Contractor(result.getInt("ID"), result.getString("Name"));
                cu.setContractor(cont);
                contractors.add(cu);

            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return contractors;
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

    public ArrayList<Contractor_User> getContractorUsers(Contractor contractor) {

        ArrayList<Contractor_User> contractors = new ArrayList<Contractor_User>();
        Contractor_User officer;

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from contractorusers where Company_ID = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, contractor.getID());

            result = statement.executeQuery();

            while (result.next()) {

                officer = new Contractor_User(result.getInt("ID"), result.getString("Name"), result.getString("Telephone"), result.getString("Address"), result.getString("Email"), null, null);
                contractors.add(officer);

            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return contractors;
    }

    public ArrayList<Contractor_Has_Project> getRespondentContractors() {

        ArrayList<Contractor_Has_Project> contractorList = new ArrayList<Contractor_Has_Project>();
        Contractor_Has_Project contProject;
        Project p = null;

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select project_ID, count(*) responses, count(case when contractor_has_project.status = 'Eligible to bid' THEN contractor_has_project.status END) as confirmed from contractor_has_project group by Project_ID having count(*)";
            statement = connection.prepareStatement(query);
            result = statement.executeQuery();

            while (result.next()) {

                p = new Project();
                p.setId(result.getString("project_ID"));
                p.setResponses(result.getInt("responses"));
                p.setConfirmed(result.getInt("confirmed"));

                contProject = new Contractor_Has_Project(0, p, null, null);
                contractorList.add(contProject);

            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return contractorList;
    }

    public ArrayList<Contractor_Has_Project> getViewRespondents(String id) {

        ArrayList<Contractor_Has_Project> contractorList = new ArrayList<Contractor_Has_Project>();
        Contractor_Has_Project contProject;
        Project p = null;
        Contractor c;

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from contractor_has_project \n"
                    + "JOIN contractor on contractor_has_project.Contractor_ID = contractor.ID\n"
                    + "WHERE contractor_has_project.Project_ID = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, id);
            result = statement.executeQuery();

            while (result.next()) {
                c = new Contractor();
                c.setID(result.getInt("contractor.id"));
                c.setName(result.getString("contractor.name"));
                p = new Project();
                p.setId(result.getString("project_id"));
                contProject = new Contractor_Has_Project();
                contProject.setID(result.getInt("contractor_has_project.id"));
                contProject.setStatus(result.getString("status"));
                contProject.setProject(p);
                contProject.setContractor(c);
                contractorList.add(contProject);

            }
            connection.close();
            return contractorList;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return contractorList;
    }

    public ArrayList<Eligibility_Document> getEligibilityDocuments(int id) {

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
                contProject.setID(id);

                doc = new Eligibility_Document(result.getInt("ID"), result.getString("FileName"), result.getString("FolderName"), result.getString("DateUploaded"), contProject, result.getString("Document_Type"), result.getString("Status"), result.getString("BAC_Remarks"));
                documents.add(doc);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return documents;
    }

    public Eligibility_Document getDocument(int id) {

        Eligibility_Document d = null;

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from eligibility_documents where ID = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);

            result = statement.executeQuery();

            while (result.next()) {
                d = new Eligibility_Document();
                d.setID(result.getInt("ID"));
                d.setType(result.getString("Document_Type"));
                d.setFileName(result.getString("filename"));
                d.setFolderName(result.getString("folderName"));
                d.setDateUploaded(result.getString("DateUploaded"));
                d.setBAC_Remarks(result.getString("BAC_Remarks"));

            }
            connection.close();
            return d;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return d;
    }

    public String approveDoc(int id) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "UPDATE cogitov2.eligibility_documents SET Status ='Approved' WHERE ID= ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "Approved";
    }

    public int getContractorID(int id) {

        int contractorID = 0;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select Contractor_ID from contractor_has_project WHERE ID = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);

            result = statement.executeQuery();
            while (result.next()) {

                contractorID = result.getInt("Contractor_ID");

            }

            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return contractorID;
    }

    public String checkalldocuments(int id) {

        int result1 = 0;
        String result2 = null;

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
//            String query = "SELECT CASE WHEN NOT EXISTS(SELECT * FROM eligibility_documents WHERE eligibility_documents.Contractor_has_Project_ID = ? AND eligibility_documents.Status = 'Approved') THEN 'Y' ELSE 'N' END AS My_Result";
            String query = "select count(*) from eligibility_documents where Contractor_has_Project_ID = ? and Status = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.setString(2, "Pending");

            result = statement.executeQuery();

            while (result.next()) {
                result1 = result.getInt("count(*)");
            }

            if (result1 <= 0) {
                result2 = "Y";

            } else if (result1 > 0) {

                result2 = "N";

            }

            statement.close();

            connection.close();
            return result2;

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result2;
    }

    public Eligibility_Document getDocumentStat(int id) {

        Eligibility_Document d = null;
        Contractor_Has_Project cont = null;
        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select count(case when Status = \"Approved\" THEN Status END) Approved,\n"
                    + "count(case when Status = \"Pending\" THEN Status END) Pending,\n"
                    + "count(case when Status = \"Pending - Action needed\" THEN Status END) Pending_Action_Needed   \n"
                    + "from eligibility_documents where Contractor_has_Project_ID = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);

            result = statement.executeQuery();

            while (result.next()) {
                d = new Eligibility_Document();
                d.setApproved(result.getInt("Approved"));
                d.setPending(result.getInt("Pending"));
                d.setPending_Action_Needed(result.getInt("Pending_Action_Needed"));

            }
            connection.close();
            return d;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return d;
    }

    public boolean hasITB(Project p) {
        boolean hasitb = false;
        int count = 0;
        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select count(*) as c from invitationtobid where project_id = ? and status != ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());
            statement.setString(2, "Fail");

            result = statement.executeQuery();

            while (result.next()) {
                count = result.getInt("c");
            }

            if (count > 0) {
                hasitb = true;
            }
            connection.close();
            return hasitb;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return hasitb;
    }

    public ArrayList<Project> getNegotiatedProjects() {

        ArrayList<Project> projects = new ArrayList<Project>();
        Project project;

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "SELECT *,\n"
                    + "(select count(*) from contractor_has_project where contractor_has_project.Project_ID = project.ID) as Submissions,\n"
                    + "(select count(*) from contractor_has_project where contractor_has_project.Project_ID = project.ID AND contractor_has_project.Status =\"Eligible to bid\") as Confirmed\n"
                    + "FROM project where project.status = \"For Negotiation\"";
            statement = connection.prepareStatement(query);

            result = statement.executeQuery();

            while (result.next()) {

                project = new Project();
                project.setId(result.getString("ID"));
                project.setName(result.getString("Name"));
                project.setDescription(result.getString("Description"));
                project.setType(result.getString("Type"));
                project.setStatus(result.getString("Status"));
                project.setResponses(result.getInt("Submissions"));
                project.setConfirmed(result.getInt("Confirmed"));
                project.setBudget(result.getFloat("Budget"));
                projects.add(project);

            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return projects;
    }

    public void deleteContractorProj(int id) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "delete from contractor_has_project where id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delEli(int id) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "delete from eligibility_documents where id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addReasonFail(String reason, InvitationToBid itb) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update invitationtobid set reason = ?, status = ? where id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, reason);
            statement.setString(2, itb.getStatus());
            statement.setInt(3, itb.getID());
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public boolean isFailed(Project p) {
        int count = 0;
        boolean check = false;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select count(*) as c from invitationtobid where project_id = ? and status = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());
            statement.setString(2, "Fail");
            result = statement.executeQuery();
            while (result.next()) {
                count = result.getInt("c");
            }
            if (count >= 2) {
                check = true;
            }
            connection.close();
            return check;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return check;
    }

    public void removeContractor(ArrayList<Eligibility_Document> es, Contractor_Has_Project chp) {
        PreparedStatement statement2;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String deleteE = "delete from eligibility_documents where id = ?";
            for (int x = 0; x < es.size(); x++) {
                statement = connection.prepareStatement(deleteE);
                statement.setInt(1, es.get(x).getID());
                statement.executeUpdate();
                statement.close();
            }

            String deleteC = "delete from contractor_has_project where id = ?";
            statement2 = connection.prepareStatement(deleteC);
            statement2.setInt(1, chp.getID());
            statement2.executeUpdate();
            statement2.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void addContractorHasProject(Contractor_Has_Project chp) {

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "insert into contractor_has_project (Project_ID,Contractor_ID,Status) values (?,?,?)";

            statement = connection.prepareStatement(query);

            statement.setString(1, chp.getProject().getId());
            statement.setInt(2, chp.getContractor().getID());
            statement.setString(3, chp.getStatus());

            statement.executeUpdate();
            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //END Eligibility_Document   
}
