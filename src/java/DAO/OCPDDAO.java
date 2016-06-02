/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.ConnectionFactory;
import Entity.Activity;
import Entity.Annotation;
import Entity.Citizen;
import Entity.Component;
import Entity.Employee;
import Entity.Files;
import Entity.Location;
import Entity.Material;
import Entity.PlanningDocument;
import Entity.Project;
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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author RoAnn
 */
public class OCPDDAO {

    Connection connection;
    PreparedStatement statement;
    ResultSet result;
    ConnectionFactory myFactory;

    public void uploadDocument(PlanningDocument pd) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into planningdocument (type, name, url, year, dateuploaded, employee_id) values (?,?,?,YEAR(now()),now(),?);";
            statement = connection.prepareStatement(query);
            statement.setString(1, pd.getType());
            statement.setString(2, pd.getName());
            statement.setString(3, pd.getUrl());
            statement.setInt(4, pd.getEmployee().getId());

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.OCPDDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    public ArrayList<Project> getProjects() {
        ArrayList<Project> pList = new ArrayList<>();
        Project p = null;
        Employee e = null;
        User u = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = ("SELECT project.id, name, budget, description, project.type, status, datesubmitted, username FROM cogitov2.project join employee on employee.id = employee_id join users on users.id = users_id");
            statement = connection.prepareStatement(query);
            result = statement.executeQuery();
            while (result.next()) {
                p = new Project();
                e = new Employee();
                u = new User();
                u.setUsername(result.getString("username"));
                e.setUser(u);
                p.setId(result.getString("id"));
                p.setName(result.getString("name"));
                p.setDescription(result.getString("description"));
                p.setType(result.getString("project.type"));
                p.setDatesubmitted(result.getString("datesubmitted"));
                p.setStatus(result.getString("status"));
                p.setEmployee(e);
                p.setBudget(result.getFloat("budget"));
                pList.add(p);
            }
            connection.close();

            return pList;

        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pList;
    }

    public Project getProjectDetails(String id) {
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

            String detailsQuery = ("select name,foldername, budget, description, project.type, status, datesubmitted, employee.id, username, subcategory from project \n"
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
                p.setFoldername(result.getString("FolderName"));
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

            String scheduleQuery = ("SELECT * FROM schedule where project_id = ? order by startdate asc");
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
                sc.setActualenddate(result.getString("actualenddate"));
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
                if (result.getString("Testimonial_ID") != null) {
                    t = new Testimonial();
                    t.setId(result.getInt("Testimonial_ID"));
                    f.setTestimonial(t);
                } else if (result.getString("Testimonial_ID") == null) {
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

    public float getCost(Project p) {
        float cost = 0;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String getID = "select sum(project_has_material.quantity*material.unitprice) as cost from project_has_material join material on materialid = material.id where projectid = ?";
            statement = connection.prepareStatement(getID);
            statement.setString(1, p.getId());
            result = statement.executeQuery();
            while (result.next()) {
                cost = result.getFloat("cost");
            }

            statement.close();
            connection.close();
            return cost;
        } catch (SQLException ex) {
            Logger.getLogger(OCPDDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cost;
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
                t = new Testimonial(id, result.getString("testimonial.title"), result.getString("testimonial.dateuploaded"), result.getString("testimonial.message"), result.getString("testimonial.foldername"), result.getString("testimonial.location"), result.getString("testimonial.locationdetails"), result.getString("testimonial.category"), null, result.getString("testimonial.Status"), c);

            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return t;
    }

    public void setMeeting(Schedule s, Project p) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into schedule (event, startdate, enddate, status, project_id, stage, time, department) values (?,?,?,?,?,?,?,?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, s.getEvent());
            statement.setString(2, s.getStartdate());
            statement.setString(3, s.getEnddate());
            statement.setString(4, s.getStatus());
            statement.setString(5, p.getId());
            statement.setString(6, s.getStage());
            statement.setString(7, s.getTime());
            statement.setString(8, s.getDept());
            statement.executeUpdate();
            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(OCPDDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getMeetingID(Project p) {
        int x = 0;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select max(schedule.id) as id from schedule\n"
                    + "join project on project_id = project.ID\n"
                    + "where event = ? and schedule.Status = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, "Meeting with OCPD");
            statement.setString(2, "Unconfirmed");
            result = statement.executeQuery();
            while (result.next()) {
                x = result.getInt("id");
            }
            connection.close();
            return x;
        } catch (SQLException ex) {
            Logger.getLogger(OCPDDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
    }

    public void addTask(Task t, int id) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into task (taskno, name, description, startdate, enddate, personincharge, schedule_id) values (?,?,?,?,?,?,?)";
            statement = connection.prepareStatement(query);
            statement.setInt(1, t.getTaskNo());
            statement.setString(2, t.getName());
            statement.setString(3, t.getDescription());
            statement.setString(4, t.getStartDate());
            statement.setString(5, t.getEndDate());
            statement.setString(6, t.getPersonInCharge());
            statement.setInt(7, id);
            statement.executeUpdate();
            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(OCPDDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addTask(Task t, String status, int id) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into task (taskno, name, description, startdate, enddate, personincharge, schedule_id,status) values (?,?,?,?,?,?,?,?)";
            statement = connection.prepareStatement(query);
            statement.setInt(1, t.getTaskNo());
            statement.setString(2, t.getName());
            statement.setString(3, t.getDescription());
            statement.setString(4, t.getStartDate());
            statement.setString(5, t.getEndDate());
            statement.setString(6, t.getPersonInCharge());
            statement.setInt(7, id);
            statement.setString(8, status);
            statement.executeUpdate();
            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(OCPDDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void sendAnnotations(Annotation a, Project p) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into annotations (description, materials, schedule, upload, date, status, project_id, general) values (?,?,?,?,now(),?,?,?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, a.getDescription());
            statement.setString(2, a.getMaterials());
            statement.setString(3, a.getSchedule());
            statement.setString(4, a.getUpload());
            statement.setString(5, a.getStatus());
            statement.setString(6, p.getId());
            statement.setString(7, a.getGeneral());
            statement.executeUpdate();
            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(OCPDDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changeProjStatus(String s, Project p) {
        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "UPDATE project SET Status = ? WHERE ID = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, s);
            statement.setString(2, p.getId());
            statement.executeUpdate();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(OCPDDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void setBudget(Project p, float budget) {
        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "UPDATE project SET budget = ? WHERE ID = ?";
            statement = connection.prepareStatement(query);
            statement.setFloat(1, budget);
            statement.setString(2, p.getId());
            statement.executeUpdate();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(OCPDDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public Annotation getAnnotation(Project p, String status) {
        Annotation a = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from annotations where project_id = ? and status = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());
            statement.setString(2, "Pending");
            result = statement.executeQuery();
            while (result.next()) {
                a = new Annotation(result.getInt("ID"), result.getString("Description"), result.getString("Materials"),
                        result.getString("Schedule"), result.getString("Upload"), result.getString("Date"), status, result.getString("general"), p);
            }
            connection.close();
            return a;
        } catch (SQLException ex) {
            Logger.getLogger(OCPDDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public Schedule getMeeting(Project p, String status) {
        Schedule s = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from schedule where event = ? and project_id = ? and status = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, "Meeting with OCPD");
            statement.setString(2, p.getId());
            statement.setString(3, status);
            result = statement.executeQuery();
            while (result.next()) {
                s = new Schedule(result.getInt("ID"), result.getString("Event"), result.getString("StartDate"),
                        result.getString("Enddate"), status, result.getString("Department"), result.getString("Stage"));
                s.setTime(result.getString("Time"));
            }
            connection.close();
            return s;
        } catch (SQLException ex) {
            Logger.getLogger(OCPDDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public Schedule getMeeting(Project p) {
        Schedule s = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from schedule where event = ? and project_id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, "Meeting with OCPD");
            statement.setString(2, p.getId());
            result = statement.executeQuery();
            while (result.next()) {
                s = new Schedule(result.getInt("ID"), result.getString("Event"), result.getString("StartDate"),
                        result.getString("Enddate"), result.getString("Status"), result.getString("Department"), result.getString("Stage"));
                s.setTime(result.getString("Time"));
            }
            connection.close();
            return s;
        } catch (SQLException ex) {
            Logger.getLogger(OCPDDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public ArrayList<Task> getAgenda(Schedule s) {
        ArrayList<Task> tList = new ArrayList<>();
        Task t;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select Description from task where schedule_id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, s.getId());
            result = statement.executeQuery();
            while (result.next()) {
                t = new Task();
                t.setDescription(result.getString("Description"));
                tList.add(t);
            }
            connection.close();
            return tList;
        } catch (SQLException ex) {
            Logger.getLogger(OCPDDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tList;
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

    public void updateSchedule(Schedule s, String stat) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update schedule set status = ?, enddate = ? where id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, stat);
            statement.setString(1, s.getEnddate());
            statement.setInt(3, s.getId());
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
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

}
