/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.ConnectionFactory;
import Entity.Annotation;
import Entity.Category;
import Entity.Citizen;
import Entity.Component;
import Entity.Contractor;
import Entity.Contractor_User;
import Entity.Employee;
import Entity.Files;
import Entity.Location;
import Entity.Material;
import Entity.PlanningDocument;
import Entity.Project;
import Entity.Project_Inspection;
import Entity.Project_Progress;
import Entity.Reply;
import Entity.Request;
import Entity.Resources;
import Entity.Schedule;
import Entity.SubCategory;
import Entity.Task;
import Entity.Testimonial;
import Entity.Unit;
import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author RoAnn
 */
public class GSDAO {

    Connection connection;
    PreparedStatement statement;
    ResultSet result;
    ConnectionFactory myFactory;

    public Employee getInfo(int id) {
        Employee e = null;
        User u = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from employee join users on users.id = users_id where id = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            result = statement.executeQuery();
            while (result.next()) {
                u = new User(result.getInt("users.id"), result.getString("username"));
                e = new Employee(result.getInt("employee.id"), result.getString("firstname"), result.getString("middlename"),
                        result.getString("lastname"), result.getString("position"), result.getString("department"), u);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return e;
    }

    public ArrayList<Testimonial> getTestimonials() {
        ArrayList<Testimonial> tList = new ArrayList<>();
        Testimonial t = null;
        Citizen c = null;
        User u = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "SELECT * FROM testimonial join citizen on citizen_id = citizen.id join users on users.id =users_id";

            statement = connection.prepareStatement(query);
            result = statement.executeQuery();
            while (result.next()) {
                u = new User(result.getInt("users.id"), result.getString("username"));
                c = new Citizen();
                c.setId(result.getInt("citizen.id"));
                c.setUser(u);
                t = new Testimonial(result.getInt("testimonial.id"), result.getString("title"), result.getString("dateuploaded"),
                        result.getString("message"), result.getString("foldername"), result.getString("location"),
                        result.getString("locationdetails"), result.getString("category"), result.getString("concern"), result.getString("testimonial.status"), c);
                Project p = new Project();
                p.setId(result.getString("testimonial.Project_ID"));
                t.setProject(p);
                tList.add(t);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return tList;
    }

    public ArrayList<Files> getFiles(Testimonial t, String status) {
        ArrayList<Files> fList = new ArrayList<>();
        Files f = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from files where testimonial_id = ? and status = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, t.getId());
            statement.setString(2, status);
            result = statement.executeQuery();
            while (result.next()) {
                f = new Files(result.getInt("id"), result.getString("filename"), result.getString("dateuploaded"),
                        result.getString("type"), t, status, null);
                fList.add(f);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fList;
    }

    public ArrayList<Files> getFiles(int id, Testimonial t, String type) {

        ArrayList<Files> fl = new ArrayList<Files>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from files where Testimonial_ID = ? and type = ? and status = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.setString(2, type);
            statement.setString(3, "Approved");
            result = statement.executeQuery();

            while (result.next()) {

                Files file = new Files();
                file.setId(result.getInt("ID"));
                file.setFileName(result.getString("FileName"));
                file.setDateUploaded(result.getString("DateUploaded"));
                file.setType(result.getString("Type"));
                file.setStatus(result.getString("Status"));
                file.setTestimonial_ID(t);

                fl.add(file);
            }
            connection.close();
            return fl;

        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return fl;

    }

    public Testimonial getTestimonial(int id) {
        Testimonial t = null;
        Citizen c = null;
        User u = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from testimonial join citizen on citizen.id = citizen_id join users on users.id = users_id where testimonial.ID = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            result = statement.executeQuery();
            while (result.next()) {
                u = new User(result.getInt("users.id"), result.getString("username"));
                c = new Citizen(result.getInt("citizen.id"), result.getString("FirstName"), result.getString("middlename"), u);
                t = new Testimonial(id, result.getString("testimonial.title"), result.getString("testimonial.dateuploaded"), result.getString("testimonial.message"), result.getString("testimonial.foldername"), result.getString("testimonial.location"), result.getString("testimonial.locationdetails"), result.getString("testimonial.category"), null, result.getString("testimonial.status"), c);
                Project p = new Project();
                p.setId(result.getString("testimonial.Project_ID"));
                t.setProject(p);

            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return t;
    }

    public void sendReply(Testimonial t, Reply r) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into reply (message, sender, testimonial_id, datesent) values(?,?,?,now());";
            statement = connection.prepareStatement(query);
            statement.setString(1, r.getMessage());
            statement.setString(2, r.getSender());
            statement.setInt(3, t.getId());
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<Reply> getReplies(Testimonial t) {
        ArrayList<Reply> rList = new ArrayList<>();
        Reply r = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from reply where testimonial_id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, t.getId());
            result = statement.executeQuery();
            while (result.next()) {
                r = new Reply(result.getInt("ID"), result.getString("message"),
                        result.getString("Sender"), t, result.getString("datesent"));
                rList.add(r);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rList;
    }

    public void uploadPDocs(PlanningDocument pd) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "";
            statement = connection.prepareStatement(query);
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<PlanningDocument> getPDocs() {
        ArrayList<PlanningDocument> pdList = new ArrayList<>();
        PlanningDocument pd = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "";
            statement = connection.prepareStatement(query);
            result = statement.executeQuery();
            while (result.next()) {
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pdList;
    }

    public void createProposal(Project p) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "";
            statement = connection.prepareStatement(query);
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public Project getProjectInfo(int id) {
        Project p = new Project();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "";
            statement = connection.prepareStatement(query);
            result = statement.executeQuery();
            while (result.next()) {
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return p;
    }

    public ArrayList<Project> getProjects(String status) {
        ArrayList<Project> pList = new ArrayList<>();
        Project p;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "";
            statement = connection.prepareStatement(query);
            result = statement.executeQuery();
            while (result.next()) {
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pList;
    }

    public ArrayList<Files> getProjectFiles() {
        ArrayList<Files> fList = new ArrayList<>();
        Files f = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "";
            statement = connection.prepareStatement(query);
            result = statement.executeQuery();
            while (result.next()) {
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return fList;
    }

    public void editProposal(Project p) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "";
            statement = connection.prepareStatement(query);
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<PlanningDocument> getDocuments() {
        ArrayList<PlanningDocument> documents = new ArrayList<>();
        PlanningDocument d;
        Employee e;

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = ("select * from planningdocument");

            statement = connection.prepareStatement(query);
            result = statement.executeQuery();

            while (result.next()) {
                d = new PlanningDocument();
                e = new Employee();
                e.setId(result.getInt("Employee_ID"));
                d.setId(result.getInt("ID"));
                d.setType(result.getString("Type"));
                d.setDateUploaded(result.getString("DateUploaded"));
                d.setUrl(result.getString("URL"));
                d.setYear(result.getInt("Year"));
                d.setName(result.getString("Name"));
                d.setEmployee(e);
                documents.add(d);
            }
            connection.close();

            return documents;

        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    //====================================CODE FOR SUBMIT PORJECT PROPOSAL===============================================
    public SubCategory getSubCategory(String subcategory) {
        SubCategory sc = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "SELECT * FROM subcategory where subcategory = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, subcategory);
            result = statement.executeQuery();

            while (result.next()) {
                sc = new SubCategory();
                sc.setId(result.getInt("ID"));
                sc.setSubCategory(result.getString("SubCategory"));
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sc;
    }

    public void insertLocation(Location l, int id) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "Insert into location (Longitude, Latitude, Project_ID) values (?,?,?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, l.getLongs());
            statement.setString(2, l.getLats());
            statement.setInt(3, id);
            statement.executeUpdate();
            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getLastIDTags() {
        int id = 0;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getID = "select max(id) from tags";
            statement = connection.prepareStatement(getID);
            result = statement.executeQuery();
            while (result.next()) {
                id = result.getInt("max(id)");
            }

            statement.close();
            connection.close();
            return id;
        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public Resources getRes(String name) {
        Resources r = new Resources();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getID = "SELECT * from resources where type = ?";
            statement = connection.prepareStatement(getID);
            statement.setString(1, name);
            result = statement.executeQuery();
            while (result.next()) {
                r.setId(result.getInt("ID"));
                r.setType(result.getString("Type"));
            }
            statement.close();
            connection.close();
            return r;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }

    public Unit getUnit(String unit) {
        Unit u = new Unit();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "Select * from unit where unit = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, unit);
            result = statement.executeQuery();
            while (result.next()) {
                u.setId(result.getInt("ID"));
                u.setUnit(result.getString("Unit"));
            }
            statement.close();
            connection.close();
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }

    public void setProjFilesNull(Files f) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "UPDATE files SET project_ID = null WHERE id=?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, f.getId());
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Files setcitizenfiles(int filesid, Project p) {
        Files f = new Files();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "SELECT * FROM files where id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, filesid);
            result = statement.executeQuery();
            while (result.next()) {
                f.setId(result.getInt("ID"));
                f.setFileName(result.getString("FileName"));
                f.setDateUploaded(result.getString("DateUploaded"));
                f.setType(result.getString("Type"));
                f.setStatus(result.getString("Status"));
                f.setUploader(result.getString("Uploader"));
                Testimonial t = new Testimonial();
                t.setId(result.getInt("Testimonial_ID"));
                f.setTestimonial(t);
                f.setProject(p);
            }
            statement.close();
            connection.close();
            return f;
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }

    //Submit basic info for the project
    public void submitproject(Project p) {

        PreparedStatement locationstatement;
        PreparedStatement schedulestatement;
        PreparedStatement componentstatement;
        PreparedStatement taskstatement;

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            //Add Basic Info
            String basicinfo = "insert into project (ID,Name,Description,Type,Employee_ID,Status,DateSubmitted, budget) values (?,?,?,?,?,?,now(),?)";
            statement = connection.prepareStatement(basicinfo);
            statement.setString(1, p.getId());
            statement.setString(2, p.getName());
            statement.setString(3, p.getDescription());
            statement.setString(4, p.getType());
            statement.setInt(5, p.getEmployee().getId());
            statement.setString(6, p.getStatus());
            statement.setFloat(7, 0);
            statement.executeUpdate();
            statement.close();

            //Add Location
            String location = "insert into location (Longitude,Latitude,Project_ID) values (?,?,?)";

            for (int x = 0; x < p.getLocation().size(); x++) {
                locationstatement = connection.prepareStatement(location);
                locationstatement.setString(1, p.getLocation().get(x).getLongs());
                locationstatement.setString(2, p.getLocation().get(x).getLats());
                locationstatement.setString(3, p.getId());
                locationstatement.executeUpdate();
                locationstatement.close();
            }

            //Add Components
            String component = "insert into components (Component,Duration,Type,Project_ID) values (?,?,?,?)";

            for (int x = 0; x < p.getComponents().size(); x++) {
                componentstatement = connection.prepareStatement(component);
                componentstatement.setString(1, p.getComponents().get(x).getComponent());
                componentstatement.setString(2, p.getComponents().get(x).getDuration());
                componentstatement.setString(3, p.getComponents().get(x).getType());
                componentstatement.setString(4, p.getId());
                componentstatement.executeUpdate();
                componentstatement.close();
            }

            //Add Schedule
            String schedule = "insert into schedule (Event,StartDate,EndDate,Status,Project_ID,Stage,Department) values (?,?,?,?,?,?,?)";

            for (int x = 0; x < p.getSchedule().size(); x++) {
                schedulestatement = connection.prepareStatement(schedule);
                schedulestatement.setString(1, p.getSchedule().get(x).getEvent());
                schedulestatement.setString(2, p.getSchedule().get(x).getStartdate());
                schedulestatement.setString(3, p.getSchedule().get(x).getEnddate());
                schedulestatement.setString(4, p.getSchedule().get(x).getStatus());
                schedulestatement.setString(5, p.getId());
                schedulestatement.setString(6, p.getSchedule().get(x).getStage());
                schedulestatement.setString(7, p.getSchedule().get(x).getDept());

                schedulestatement.executeUpdate();
                schedulestatement.close();
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void setSubCategory(Project p, SubCategory sc) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into project_has_category (projectID,categoryID) values (?,?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());
            statement.setInt(2, sc.getId());
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Schedule> getprojectSchedule(Project p) {
        ArrayList<Schedule> schedulelist = new ArrayList<Schedule>();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = ("select * from schedule where Project_ID = ?");
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());
            result = statement.executeQuery();
            while (result.next()) {
                Schedule sc = new Schedule(result.getInt("ID"),
                        result.getString("Event"),
                        result.getString("StartDate"),
                        result.getString("EndDate"),
                        result.getString("Status"),
                        result.getString("Department"),
                        result.getString("Stage"));
                schedulelist.add(sc);
            }
            connection.close();

            return schedulelist;

        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return schedulelist;

    }

    public void setScheduleTask(Task t, Schedule s) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into task (TaskNo,Name,Description,StartDate,EndDate,PersonInCharge,Schedule_ID,Status) values (?,?,?,?,?,?,?,?)";
            statement = connection.prepareStatement(query);
            statement.setInt(1, t.getTaskNo());
            statement.setString(2, t.getName());
            statement.setString(3, t.getDescription());
            statement.setString(4, t.getStartDate());
            statement.setString(5, t.getEndDate());
            statement.setString(6, t.getPersonInCharge());
            statement.setInt(7, s.getId());
            statement.setString(8, "Pending");
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCTFiles(Files f, Project p) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "UPDATE files SET project_ID = ? WHERE id=?";
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());
            statement.setInt(2, f.getId());
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Material CompareMaterials(Material m, Project p) {
        Material material = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "SELECT * FROM material where name = ? and Unit_ID = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, m.getName());
            statement.setInt(2, m.getUnit().getId());
            result = statement.executeQuery();
            while (result.next()) {
                material = new Material();
                material.setId(result.getInt("ID"));
                material.setName(result.getString("Name"));
                material.setQuantity(result.getInt("Quantity"));
                material.setUnitprice(result.getFloat("UnitPrice"));
                material.setProject(p);
                Unit u = new Unit();
                u.setId(result.getInt("Unit_ID"));
                material.setUnit(u);
                material.setType(result.getString("Type"));
                SubCategory sc = new SubCategory();
                sc.setId(result.getInt("subcategory_ID"));
                material.setSubcategory(sc);
            }
            statement.close();
            connection.close();
            return material;
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return material;
    }

    public void setProjectMaterials(Material m, Project p, int quantity, float percentage) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into project_has_material (projectID,materialID,Quantity,Percentage) values (?,?,?,?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());
            statement.setInt(2, m.getId());
            statement.setInt(3, quantity);
            statement.setFloat(4, percentage);
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addnewmaterial(Material m, Project p) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into material (Name,UnitPrice,Unit_ID,Type,subcategory_ID,Quantity) values (?,?,?,?,?,?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, m.getName());
            statement.setFloat(2, m.getUnitprice());
            statement.setInt(3, m.getUnit().getId());
            statement.setString(4, "Special");
            statement.setInt(5, p.getCategory().getId());
            statement.setInt(6, m.getQuantity());
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getLastMaterialID() {
        int id = 0;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getID = "select max(id) from material";
            statement = connection.prepareStatement(getID);
            result = statement.executeQuery();
            while (result.next()) {
                id = result.getInt("max(id)");
            }

            statement.close();
            connection.close();
            return id;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public Material getMaterialbyid(int materialID, Project p) {
        Material material = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "SELECT * FROM material where ID = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, materialID);
            result = statement.executeQuery();
            while (result.next()) {
                material = new Material();
                material.setId(result.getInt("ID"));
                material.setName(result.getString("Name"));
                material.setQuantity(result.getInt("Quantity"));
                material.setUnitprice(result.getFloat("UnitPrice"));
                material.setProject(p);
                Unit u = new Unit();
                u.setId(result.getInt("Unit_ID"));
                material.setUnit(u);
                material.setType(result.getString("Type"));
                SubCategory sc = new SubCategory();
                sc.setId(result.getInt("subcategory_ID"));
                material.setSubcategory(sc);
            }
            statement.close();
            connection.close();
            return material;
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return material;
    }

    public void changeTestiStatus(Testimonial t) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update testimonial set status = ? where id = ?;";
            statement = connection.prepareStatement(query);
            statement.setString(1, t.getStatus());
            statement.setInt(2, t.getId());
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void setTestimonialProject(Project p, int testID) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update testimonial set Project_ID = ? where id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());
            statement.setInt(2, testID);
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<Task> getTasks(Project p) {
        ArrayList<Task> tList = new ArrayList<>();
        Task t;
        Schedule s;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getID = "select * from task join schedule on schedule_id = schedule.id where project_id = ?";
            statement = connection.prepareStatement(getID);
            statement.setString(1, p.getId());
            result = statement.executeQuery();
            while (result.next()) {
                t = new Task();
                s = new Schedule();
                t.setId(result.getInt("task.ID"));
                t.setName(result.getString("task.name"));
                t.setDescription(result.getString("Description"));
                t.setStartDate(result.getString("StartDate"));
                t.setEndDate(result.getString("EndDate"));
                t.setPersonInCharge(result.getString("PersonInCharge"));
                s.setId(result.getInt("schedule.id"));
                s.setEvent(result.getString("Event"));
                t.setSchedule2(s);
                t.setStatus(result.getString("schedule.status"));
                tList.add(t);
            }

            statement.close();
            connection.close();
            return tList;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tList;
    }

    public void editProjectDetails(Project p) {

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String project = "update project set name = ?, description = ?, status = ?, datesubmitted = now() where id = ?";
            statement = connection.prepareStatement(project);
            statement.setString(1, p.getName());
            statement.setString(2, p.getDescription());
            statement.setString(3, p.getStatus());
            statement.setString(4, p.getId());
            statement.executeUpdate();
            statement.close();

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void editLocation(String action, Location l, Project p) {

        PreparedStatement locationstatement;

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String location;
            if (action.equalsIgnoreCase("add")) {
                location = "insert into location (Longitude,Latitude,Project_ID) values (?,?,?)";
                locationstatement = connection.prepareStatement(location);
                locationstatement.setString(1, l.getLongs());
                locationstatement.setString(2, l.getLats());
                locationstatement.setString(3, p.getId());
                locationstatement.executeUpdate();
                locationstatement.close();

            } else if (action.equalsIgnoreCase("delete")) {
                location = "delete from location where id = ?";
                locationstatement = connection.prepareStatement(location);
                locationstatement.setInt(1, l.getId());
                locationstatement.executeUpdate();
                locationstatement.close();
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void editComponents(String action, Component c, Project p) {

        PreparedStatement componentstatement;

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String components;

            if (action.equalsIgnoreCase("add")) {
                components = "insert into components (Component,Duration,Type,Project_ID) values (?,?,?,?)";
                componentstatement = connection.prepareStatement(components);
                componentstatement.setString(1, c.getComponent());
                componentstatement.setString(2, c.getDuration());
                componentstatement.setString(3, c.getType());
                componentstatement.setString(4, p.getId());
                componentstatement.executeUpdate();
                componentstatement.close();

            } else if (action.equalsIgnoreCase("delete")) {

                components = "delete from components where id = ?";
                componentstatement = connection.prepareStatement(components);
                componentstatement.setInt(1, c.getId());
                componentstatement.executeUpdate();
                componentstatement.close();
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void editSchedule(String action, Schedule s, Project p) {

        PreparedStatement schedulestatement;

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String schedule;

            if (action.equalsIgnoreCase("add")) {
                schedule = "insert into schedule (Event,StartDate,EndDate,Status,Project_ID,Stage,Department) values (?,?,?,?,?,?,?)";
                schedulestatement = connection.prepareStatement(schedule);
                schedulestatement.setString(1, s.getEvent());
                schedulestatement.setString(2, s.getStartdate());
                schedulestatement.setString(3, s.getEnddate());
                schedulestatement.setString(4, s.getStatus());
                schedulestatement.setString(5, p.getId());
                schedulestatement.setString(6, s.getStage());
                schedulestatement.setString(7, s.getDept());

                schedulestatement.executeUpdate();
                schedulestatement.close();

            } else if (action.equalsIgnoreCase("delete")) {
                schedule = "delete from schedule where id = ?";
                schedulestatement = connection.prepareStatement(schedule);
                schedulestatement.setInt(1, s.getId());

                schedulestatement.executeUpdate();
                schedulestatement.close();
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void editCategory(SubCategory sc, Project p) {

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "update project_has_category set categoryID = ? where projectid = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, sc.getId());
            statement.setString(2, p.getId());
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editAnnotationStat(Annotation a, String stat) {

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "update annotations set status= ? where id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, stat);
            statement.setInt(2, a.getId());
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editTask(String action, Task t, Schedule s) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query;

            if (action.equalsIgnoreCase("add")) {
                query = "insert into task (TaskNo,Name,Description,StartDate,EndDate,PersonInCharge,Schedule_ID) values (?,?,?,?,?,?,?)";
                statement = connection.prepareStatement(query);
                statement.setInt(1, t.getTaskNo());
                statement.setString(2, t.getName());
                statement.setString(3, t.getDescription());
                statement.setString(4, t.getStartDate());
                statement.setString(5, t.getEndDate());
                statement.setString(6, t.getPersonInCharge());
                statement.setInt(7, s.getId());
                statement.executeUpdate();
                statement.close();

            } else if (action.equalsIgnoreCase("delete")) {
                query = "delete from task where id = ?";
                statement = connection.prepareStatement(query);
                statement.setInt(1, t.getId());
                statement.executeUpdate();
                statement.close();
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void editMaterials(String action, Material m, Project p) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query;
            if (action.equalsIgnoreCase("add")) {
                query = "insert into material (Name,UnitPrice,Unit_ID,Type,subcategory_ID,Quantity) values (?,?,?,?,?,?)";
                statement = connection.prepareStatement(query);
                statement.setString(1, m.getName());
                statement.setFloat(2, m.getUnitprice());
                statement.setInt(3, m.getUnit().getId());
                statement.setString(4, "Special");
                statement.setInt(5, p.getCategory().getId());
                statement.setInt(6, m.getQuantity());
                statement.executeUpdate();
                statement.close();
            } else if (action.equalsIgnoreCase("delete")) {
                query = "delete from project_has_material where projectid = ? and quantity = ? and materialid = ?";
                statement = connection.prepareStatement(query);
                statement.setString(1, p.getId());
                statement.setInt(2, m.getQuantity());
                statement.setInt(3, m.getId());
                statement.executeUpdate();
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void updateSchedule(Schedule s, String stat) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update schedule set status = ?, ActualEndDate = now() where id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, stat);
            statement.setInt(2, s.getId());
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //FOR GS HOME
    public ArrayList<Schedule> getAllMeetings() {
        ArrayList<Schedule> meetingList = new ArrayList<Schedule>();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getID = "select * from schedule where Event = ? and Status = ?";
            statement = connection.prepareStatement(getID);
            statement.setString(1, "Meeting with OCPD");
            statement.setString(2, "Pending");
            result = statement.executeQuery();
            while (result.next()) {
                Schedule s = new Schedule();
                s.setId(result.getInt("ID"));
                s.setEvent(result.getString("Event"));
                s.setStartdate(result.getString("StartDate"));
                s.setEnddate(result.getString("EndDate"));
                s.setStatus(result.getString("Status"));
                s.setStage(result.getString("Stage"));
                s.setDept(result.getString("Department"));
                s.setTime(result.getString("Time"));
                s.setProjectID(result.getString("Project_ID"));
                meetingList.add(s);
            }

            statement.close();
            connection.close();
            return meetingList;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return meetingList;
    }

    public ArrayList<Schedule> getAllMeetings(String status) {
        ArrayList<Schedule> meetingList = new ArrayList<Schedule>();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getID = "select * from schedule where Event = ? and Status = ?";
            statement = connection.prepareStatement(getID);
            statement.setString(1, "Meeting with OCPD");
            statement.setString(2, status);
            result = statement.executeQuery();
            while (result.next()) {
                Schedule s = new Schedule();
                s.setId(result.getInt("ID"));
                s.setEvent(result.getString("Event"));
                s.setStartdate(result.getString("StartDate"));
                s.setEnddate(result.getString("EndDate"));
                s.setStatus(result.getString("Status"));
                s.setStage(result.getString("Stage"));
                s.setDept(result.getString("Department"));
                s.setTime(result.getString("Time"));
                s.setProjectID(result.getString("Project_ID"));
                s.setRemarks(result.getString("Remarks"));
                meetingList.add(s);
            }

            statement.close();
            connection.close();
            return meetingList;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return meetingList;
    }

    public ArrayList<Testimonial> getTestimonialsNR() {
        ArrayList<Testimonial> NRtesti = new ArrayList<Testimonial>();
        Citizen c = null;
        User u = null;
        Testimonial t = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getID = "select * from testimonial join citizen on citizen_id = citizen.id join users on users.id = users_id where testimonial.id not in (select testimonial_id from reply)";
            statement = connection.prepareStatement(getID);
            result = statement.executeQuery();
            while (result.next()) {
                u = new User(result.getInt("users.id"), result.getString("username"));
                c = new Citizen();
                c.setId(result.getInt("citizen.id"));
                c.setFirstName(result.getString("FirstName"));
                c.setUser(u);
                t = new Testimonial(result.getInt("testimonial.id"), result.getString("title"), result.getString("dateuploaded"),
                        result.getString("message"), result.getString("foldername"), result.getString("location"),
                        result.getString("locationdetails"), result.getString("category"), result.getString("concern"), result.getString("testimonial.status"), c);
                Project p = new Project();
                p.setId(result.getString("testimonial.Project_ID"));
                t.setProject(p);

                NRtesti.add(t);
            }

            statement.close();
            connection.close();
            return NRtesti;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return NRtesti;
    }

    public int getPPCount() {
        int PPCount = 0;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getcount = "Select Count(*) as count from project where Status = ?";
            statement = connection.prepareStatement(getcount);
            statement.setString(1, "Pending");
            result = statement.executeQuery();
            while (result.next()) {
                PPCount = result.getInt("count");
            }

            statement.close();
            connection.close();
            return PPCount;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return PPCount;
    }

    public int getOPCount() {
        int PPCount = 0;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getcount = "Select Count(*) as count from project where Status = ?";
            statement = connection.prepareStatement(getcount);
            statement.setString(1, "On-Going");
            result = statement.executeQuery();
            while (result.next()) {
                PPCount = result.getInt("count");
            }

            statement.close();
            connection.close();
            return PPCount;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return PPCount;
    }

    public int getFPCount() {
        int PPCount = 0;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getcount = "Select Count(*) as count from project where Status = ?";
            statement = connection.prepareStatement(getcount);
            statement.setString(1, "Finished");
            result = statement.executeQuery();
            while (result.next()) {
                PPCount = result.getInt("count");
            }

            statement.close();
            connection.close();
            return PPCount;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return PPCount;
    }

    public int getOHCount() {
        int PPCount = 0;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getcount = "Select Count(*) as count from project where Status = ?";
            statement = connection.prepareStatement(getcount);
            statement.setString(1, "On-Hold");
            result = statement.executeQuery();
            while (result.next()) {
                PPCount = result.getInt("count");
            }

            statement.close();
            connection.close();
            return PPCount;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return PPCount;
    }

    public ArrayList<Project> getImplementedProjects() {
        ArrayList<Project> plist = new ArrayList<Project>();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getID = "select * from project where status = ?";
            statement = connection.prepareStatement(getID);
            statement.setString(1, "Implementation");
            result = statement.executeQuery();
            while (result.next()) {

                Project p = new Project();

                p.setId(result.getString("ID"));
                p.setName(result.getString("Name"));
                p.setDescription(result.getString("Description"));
                p.setType(result.getString("Type"));

                plist.add(p);
            }

            statement.close();
            connection.close();
            return plist;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return plist;
    }

    public ArrayList<Project> getFinishedProjects() {
        ArrayList<Project> plist = new ArrayList<Project>();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getID = "select * from project where status = ?";
            statement = connection.prepareStatement(getID);
            statement.setString(1, "Finished");
            result = statement.executeQuery();
            while (result.next()) {

                Project p = new Project();

                p.setId(result.getString("ID"));
                p.setName(result.getString("Name"));
                p.setDescription(result.getString("Description"));
                p.setType(result.getString("Type"));

                plist.add(p);
            }

            statement.close();
            connection.close();
            return plist;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return plist;
    }

    public ArrayList<Schedule> getScheduleImplementation(String start, Project p) {
        ArrayList<Schedule> schedule = new ArrayList<Schedule>();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getID = "select * from schedule where Stage = ? and Project_ID = ?";
            statement = connection.prepareStatement(getID);
            statement.setString(1, "Implementation");
            statement.setString(2, p.getId());

            result = statement.executeQuery();
            while (result.next()) {

                Schedule sc = new Schedule(result.getInt("ID"),
                        result.getString("Event"),
                        result.getString("StartDate"),
                        result.getString("EndDate"),
                        result.getString("Status"),
                        result.getString("Department"),
                        result.getString("Stage"));
                sc.setProjectID(result.getString("Project_ID"));

                schedule.add(sc);
            }

            statement.close();
            connection.close();
            return schedule;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return schedule;
    }

    public ArrayList<Task> getscheduleTask(int id) {
        ArrayList<Task> finaltask = new ArrayList<Task>();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getID = "select * from task where Schedule_ID = ?";
            statement = connection.prepareStatement(getID);
            statement.setInt(1, id);

            result = statement.executeQuery();
            while (result.next()) {

                Task t = new Task();
                t.setId(result.getInt("ID"));
                t.setName(result.getString("name"));
                t.setDescription(result.getString("Description"));
                t.setStartDate(result.getString("StartDate"));
                t.setEndDate(result.getString("EndDate"));
                t.setPersonInCharge(result.getString("PersonInCharge"));
                Schedule s = new Schedule();
                s.setId(result.getInt("Schedule_ID"));
                t.setSchedule2(s);
                t.setStatus(result.getString("Status"));
                finaltask.add(t);
            }

            statement.close();
            connection.close();
            return finaltask;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return finaltask;
    }

    public void setTaskStatus(int id, String status) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "UPDATE task SET Status = ? WHERE id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, status);
            statement.setInt(2, id);
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addInspection(int TaskID, String remarks, int UserID) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into project_inspection (DateOfInspection, Task_ID, Remark, Status,Users_ID) values(now(),?,?,?,?);";
            statement = connection.prepareStatement(query);
            statement.setInt(1, TaskID);
            statement.setString(2, remarks);
            statement.setString(3, "Done");
            statement.setInt(4, UserID);
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<Project_Inspection> getProjectInspections(Project p) {
        ArrayList<Project_Inspection> projectInspections = new ArrayList<Project_Inspection>();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getID = "SELECT * FROM project_inspection join task on Task_ID = task.ID join schedule on Schedule_ID = schedule.ID where Project_ID = ?";
            statement = connection.prepareStatement(getID);
            statement.setString(1, p.getId());

            result = statement.executeQuery();
            while (result.next()) {
                Project_Inspection pi = new Project_Inspection();
                pi.setID(result.getInt("Project_Inspection.ID"));
                pi.setDateOfInspection(result.getString("Project_Inspection.DateOfInspection"));
                Task t = new Task();
                t.setId(result.getInt("task.id"));
                t.setName(result.getString("task.Name"));
                pi.setTask(t);
                pi.setRemark(result.getString("Project_Inspection.Remark"));
                pi.setStatus(result.getString("Project_Inspection.Status"));

                projectInspections.add(pi);
            }

            statement.close();
            connection.close();
            return projectInspections;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return projectInspections;
    }

    public void submitProgressEntry(Project_Progress pp) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "INSERT INTO cogitov2.project_progress (Material, Quantity, Percentage, Value_of_Work, Date, Project_ID) VALUES (?, ?, ?, ?, now(), ?);";
            statement = connection.prepareStatement(query);
            statement.setString(1, pp.getMaterial());
            statement.setInt(2, pp.getQuantity());
            statement.setFloat(3, pp.getProject_percentage());
            statement.setFloat(4, pp.getValue_of_work());
            statement.setString(5, pp.getProject().getId());

            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<Project_Progress> getProject_Progress(Project p) {
        ArrayList<Project_Progress> progress_project = new ArrayList<Project_Progress>();
        Project_Progress pp;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = ("SELECT * FROM project_progress where Project_ID = ?");
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());

            result = statement.executeQuery();
            while (result.next()) {

                pp = new Project_Progress(result.getInt("ID"), result.getString("Material"), result.getInt("Quantity"), result.getFloat("Percentage"), result.getFloat("Value_of_Work"), result.getString("Date"), p);
                progress_project.add(pp);
            }
            connection.close();

            return progress_project;

        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return progress_project;

    }

    public ArrayList<Material> getAllMaterials(Project p) {
        ArrayList<Material> allMaterials = new ArrayList<Material>();
        Material material = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from material join project_has_material on materialid = material.id where projectid = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());
            result = statement.executeQuery();
            while (result.next()) {
                material = new Material();
                material.setId(result.getInt("ID"));
                material.setName(result.getString("Name"));
                material.setQuantity(result.getInt("Quantity"));
                material.setUnitprice(result.getFloat("UnitPrice"));
                material.setPercentage(result.getFloat("project_has_material.percentage"));

                Unit u = new Unit();
                u.setId(result.getInt("Unit_ID"));
                material.setUnit(u);
                material.setType(result.getString("Type"));
                SubCategory sc = new SubCategory();
                sc.setId(result.getInt("subcategory_ID"));
                material.setSubcategory(sc);
                allMaterials.add(material);

            }
            statement.close();
            connection.close();
            return allMaterials;
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return allMaterials;
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

    public Project GenerateAccReportPDetails(String id) {
        Project p = new Project();
        Employee e;
        User u;
        SubCategory sub;
        ArrayList<Location> lList = new ArrayList<>();
        Location loc;
        ArrayList<Material> mList = new ArrayList<>();
        Material mat;
        Unit un;
        ArrayList<Schedule> sList = new ArrayList<>();
        Schedule sc;
        ArrayList<Component> cList = new ArrayList<>();
        Component c;
        ArrayList<Files> fList = new ArrayList<>();
        Files f;
        Testimonial t;
        PreparedStatement statement2, statement3, statement4, statement5, statement6;

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String detailsQuery = ("select name, budget, description, project.type, status, datesubmitted, employee.id, username, subcategory from project \n"
                    + "join employee on employee.id = employee_id \n"
                    + "join users on users.id = users_id\n"
                    + "join project_has_category on projectid = project.id\n"
                    + "join subcategory on subcategory.id = categoryid where project.id = ?");
            statement = connection.prepareStatement(detailsQuery);
            statement.setString(1, id);
            result = statement.executeQuery();
            while (result.next()) {
                u = new User();
                e = new Employee();
                sub = new SubCategory();
                p.setId(id);
                p.setName(result.getString("name"));
                p.setDescription(result.getString("description"));
                p.setType(result.getString("project.type"));
                p.setStatus(result.getString("status"));
                p.setDatesubmitted(result.getString("datesubmitted"));
                e.setId(result.getInt("employee.id"));
                u.setUsername(result.getString("username"));
                sub.setSubCategory(result.getString("subcategory"));
                p.setCategory(sub);
                p.setBudget(result.getFloat("budget"));
            }

            String locationQuery = ("select * from location where project_id = ?");
            statement2 = connection.prepareStatement(locationQuery);
            statement2.setString(1, id);
            result = statement2.executeQuery();
            while (result.next()) {
                loc = new Location();
                loc.setId(result.getInt("ID"));
                loc.setLongs(result.getString("latitude"));
                loc.setLats(result.getString("longitude"));
                lList.add(loc);
            }

            String materialQuery = ("select material.id, name, project_has_material.quantity,project_has_material.percentage, unitprice, unit from project_has_material \n"
                    + "join material on materialID = material.id\n"
                    + "join unit on unit_id = unit.id where projectID = ?");
            statement3 = connection.prepareStatement(materialQuery);
            statement3.setString(1, id);
            result = statement3.executeQuery();
            while (result.next()) {
                mat = new Material();
                un = new Unit();
                mat.setId(result.getInt("material.id"));
                mat.setName(result.getString("name"));
                mat.setQuantity(result.getInt("project_has_material.quantity"));
                mat.setUnitprice(result.getFloat("material.unitprice"));
                mat.setPercentage(result.getFloat("project_has_material.percentage"));
                un.setUnit(result.getString("unit"));
                mat.setUnit(un);
                mList.add(mat);
            }

            String componentsQuery = ("select * from components where project_id = ?");
            statement6 = connection.prepareStatement(componentsQuery);
            statement6.setString(1, id);
            result = statement6.executeQuery();
            while (result.next()) {
                c = new Component();
                c.setId(result.getInt("id"));
                c.setComponent(result.getString("component"));
                c.setDuration(result.getString("duration"));
                c.setType(result.getString("type"));
                cList.add(c);
            }

            String scheduleQuery = ("select id, event, startdate, enddate, actualenddate, status, department, stage from schedule where project_id = ?");
            statement4 = connection.prepareStatement(scheduleQuery);
            statement4.setString(1, id);
            result = statement4.executeQuery();
            while (result.next()) {
                sc = new Schedule();
                sc.setId(result.getInt("id"));
                sc.setEvent(result.getString("event"));
                sc.setStartdate(result.getString("startdate"));
                sc.setEnddate(result.getString("enddate"));
                sc.setStatus(result.getString("status"));
                sc.setStage(result.getString("stage"));
                sc.setDept(result.getString("department"));
                sList.add(sc);
            }

            String filesQuery = ("select * from files where project_id = ?");
            statement5 = connection.prepareStatement(filesQuery);
            statement5.setString(1, id);
            result = statement5.executeQuery();
            while (result.next()) {
                f = new Files();
                f.setId(result.getInt("id"));
                f.setFileName(result.getString("FileName"));
                f.setDateUploaded(result.getString("DateUploaded"));
                f.setType(result.getString("type"));
                Project p2 = new Project();
                p2.setId(result.getString("project_id"));
                f.setProject(p2);
                f.setStatus(result.getString("status"));
                f.setUploader(result.getString("uploader"));
                if (!result.getString("Testimonial_ID").equalsIgnoreCase("") || result.getString("Testimonial_ID") != null) {
                    t = new Testimonial();
                    t.setId(result.getInt("Testimonial_ID"));
                    f.setTestimonial(t);
                } else if (result.getString("Testimonial_ID").equalsIgnoreCase("") || result.getString("Testimonial_ID") == null) {
                    t = new Testimonial();
                    t.setId(0);
                    f.setTestimonial(t);
                }
                fList.add(f);
            }

            p.setLocation(lList);
            p.setComponents(cList);
            p.setMaterials(mList);
            p.setSchedule(sList);
            p.setFiles(fList);
            connection.close();
            return p;

        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public ArrayList<Project_Progress> GenerateAccReportPP(Project p) {
        ArrayList<Project_Progress> pp = new ArrayList<Project_Progress>();
        Project_Progress prop = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "SELECT * FROM project_progress where Project_ID = ?";
            statement = connection.prepareStatement(query);
            result = statement.executeQuery();
            while (result.next()) {
                prop = new Project_Progress();
                prop.setID(result.getInt("ID"));
                prop.setMaterial(result.getString("Material"));
                prop.setQuantity(result.getInt("Quantity"));
                prop.setProject_percentage(result.getFloat("Percentage"));
                prop.setValue_of_work(result.getFloat("Value_of_Work"));
                prop.setDate(result.getString("Date"));
                prop.setProject(p);

                pp.add(prop);

            }
            statement.close();
            connection.close();
            return pp;
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pp;
    }

    public ArrayList<Project_Inspection> GenerateAccReportPI(Project p) {
        ArrayList<Project_Inspection> projectInspections = new ArrayList<Project_Inspection>();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getID = "SELECT * FROM project_inspection join task on Task_ID = task.ID join schedule on Schedule_ID = schedule.ID where Project_ID = ?";
            statement = connection.prepareStatement(getID);
            statement.setString(1, p.getId());

            result = statement.executeQuery();
            while (result.next()) {
                Project_Inspection pi = new Project_Inspection();
                pi.setID(result.getInt("Project_Inspection.ID"));
                pi.setDateOfInspection(result.getString("Project_Inspection.DateOfInspection"));
                Task t = new Task();
                t.setId(result.getInt("task.id"));
                t.setName(result.getString("task.Name"));
                pi.setTask(t);
                pi.setRemark(result.getString("Project_Inspection.Remark"));
                pi.setStatus(result.getString("Project_Inspection.Status"));

                projectInspections.add(pi);
            }

            statement.close();
            connection.close();
            return projectInspections;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return projectInspections;
    }

    //Inserting new Subcategory
    public Category getCategory(String category) {

        Category c = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "SELECT * FROM category where Category = ?";

            statement = connection.prepareStatement(query);
            statement.setString(1, category);

            result = statement.executeQuery();

            while (result.next()) {

                c = new Category();
                c.setId(result.getInt("ID"));
                c.setCategory(result.getString("Category"));
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return c;
    }

    public void addnewSubCategory(SubCategory sc) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "INSERT INTO subcategory (SubCategory,category_ID) VALUES (?, ?);";
            statement = connection.prepareStatement(query);
            statement.setString(1, sc.getSubCategory());
            statement.setInt(2, sc.getCategory().getId());
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<Integer> getTestimonialsWR() {

        ArrayList<Integer> test = new ArrayList<Integer>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select distinct(testimonial.id) from testimonial join reply on testimonial_id = testimonial.id";

            statement = connection.prepareStatement(query);
            result = statement.executeQuery();

            while (result.next()) {
                int id = result.getInt("testimonial.id");
                test.add(id);
            }
            connection.close();
            return test;

        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return test;
    }

    public ArrayList<Integer> getLinkedTestimonials() {

        ArrayList<Integer> test = new ArrayList<Integer>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select distinct(testimonial.id) from testimonial join files on testimonial_id = testimonial.id\n"
                    + "join project on project.id = files.project_id";

            statement = connection.prepareStatement(query);
            result = statement.executeQuery();

            while (result.next()) {
                int id = result.getInt("testimonial.id");
                test.add(id);
            }
            connection.close();
            return test;

        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return test;
    }

    public ArrayList<Request> getRequests() {
        ArrayList<Request> rList = new ArrayList<>();
        Request r = null;
        Contractor_User cs = null;
        Contractor c = null;
        Schedule s = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select request.id, start, end, reason, request.status, daterequested, contractorusers.name, \n"
                    + "event, schedule.id, startdate, enddate,contractor.name from request \n"
                    + "join contractorusers on contractor_id = contractorusers.id \n"
                    + "join contractor on company_id = contractor.id\n"
                    + "join schedule on schedule_id = schedule.id";
            statement = connection.prepareStatement(query);
            result = statement.executeQuery();
            while (result.next()) {
                r = new Request();
                r.setId(result.getInt("id"));
                r.setStart(result.getString("start"));
                r.setEnd(result.getString("end"));
                r.setReason(result.getString("reason"));
                r.setStatus(result.getString("status"));
                r.setDateRequested(result.getString("daterequested"));

                cs = new Contractor_User();
                cs.setName(result.getString("contractorusers.name"));

                c = new Contractor();
                c.setName(result.getString("contractor.name"));

                s = new Schedule();
                s.setId(result.getInt("schedule.id"));
                s.setEvent(result.getString("event"));
                s.setStartdate(result.getString("startdate"));
                s.setEnddate(result.getString("enddate"));

                cs.setContractor(c);
                r.setCs(cs);
                r.setSchedule(s);

                rList.add(r);
            }
            connection.close();
            return rList;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ContractorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rList;
    }

    public void changeScheduleRequest(int id, String status, String remark) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update request set status = ?, remarks = ? where id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, status);
            statement.setString(2, remark);
            statement.setInt(3, id);
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public double getPercentage(Project p) {

        PreparedStatement statement2;
        double Percentage = 0;
        try {
            double AllSchedule = 0;
            double DoneSchedule = 0;

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getpending = "Select Count(*) as count from schedule where Project_ID = ? and Status = ? and Event != ?";
            statement = connection.prepareStatement(getpending);
            statement.setString(1, p.getId());
            statement.setString(2, "Pending");
            statement.setString(3, "Meeting with OCPD");

            result = statement.executeQuery();
            while (result.next()) {
                AllSchedule = result.getInt("count");
            }
            statement.close();

            String getdone = "Select Count(*) as countdone from schedule where Project_ID = ? and Status = ? and Event != ?";
            statement2 = connection.prepareStatement(getdone);
            statement2.setString(1, p.getId());
            statement2.setString(2, "Done");
            statement2.setString(3, "Meeting with OCPD");
            result = statement2.executeQuery();
            while (result.next()) {
                DoneSchedule = result.getInt("countdone");
            }
            statement2.close();

            connection.close();

            Percentage = (DoneSchedule / AllSchedule) * 100;

            return Percentage;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Percentage;
    }

    public void addProjectFiles(Files f) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into files (FileName, DateUploaded, Type, Status, Uploader,project_ID) values "
                    + "(?, curdate(),?,?,?,?);";
            statement = connection.prepareStatement(query);
            statement.setString(1, f.getFileName());
            statement.setString(2, f.getType());
            statement.setString(3, f.getStatus());
            statement.setString(4, f.getUploader());
            statement.setString(5, f.getProject().getId());
            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void updateProjectFolderName(Project p, String foldername) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "UPDATE project SET FolderName = ? WHERE id=?";
            statement = connection.prepareStatement(query);
            statement.setString(1, foldername);
            statement.setString(2, p.getId());
            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Files> getprojectfiles(Project p) {

        ArrayList<Files> files = new ArrayList<Files>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from files where testimonial_id is null and project_ID = ?";

            statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());
            result = statement.executeQuery();

            while (result.next()) {
                Files f = new Files();
                f.setId(result.getInt("ID"));
                f.setFileName(result.getString("FileName"));
                f.setDateUploaded(result.getString("DateUploaded"));
                f.setType(result.getString("type"));
                f.setStatus(result.getString("status"));
                f.setUploader(result.getString("uploader"));
                files.add(f);
            }
            connection.close();
            return files;

        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return files;
    }

    public ArrayList<Project_Inspection> getInspection(Project p) {
        ArrayList<Project_Inspection> projectinspection = new ArrayList<Project_Inspection>();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String getID = "SELECT * FROM project_inspection join task on Task_ID = task.id join schedule on Schedule_ID = schedule.id where schedule.Project_ID = ?;";
            statement = connection.prepareStatement(getID);
            statement.setString(1, p.getId());
            result = statement.executeQuery();
            while (result.next()) {
                Schedule s = new Schedule();
                s.setId(result.getInt("schedule.ID"));
                s.setEvent(result.getString("schedule.Event"));
                s.setStartdate(result.getString("schedule.StartDate"));
                s.setEnddate(result.getString("schedule.EndDate"));
                s.setStatus(result.getString("schedule.Status"));
                s.setStage(result.getString("schedule.Stage"));
                s.setDept(result.getString("schedule.Department"));
                s.setTime(result.getString("schedule.Time"));
                s.setProjectID(result.getString("schedule.Project_ID"));
                s.setActualenddate(result.getString("schedule.ActualEndDate"));

                Task t = new Task();
                t.setId(result.getInt("task.ID"));
                t.setName(result.getString("task.Name"));
                t.setDescription(result.getString("task.description"));
                t.setStartDate(result.getString("task.StartDate"));
                t.setEndDate(result.getString("task.EndDate"));
                t.setPersonInCharge(result.getString("task.PersonInCharge"));
                t.setSchedule2(s);

                Project_Inspection pi = new Project_Inspection();
                pi.setID(result.getInt("project_inspection.ID"));
                pi.setDateOfInspection(result.getString("project_inspection.DateOfInspection"));
                pi.setTask(t);
                pi.setRemark(result.getString("project_inspection.Remark"));
                pi.setStatus(result.getString("project_inspection.Status"));

                projectinspection.add(pi);
            }

            statement.close();
            connection.close();
            return projectinspection;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return projectinspection;
    }

}
