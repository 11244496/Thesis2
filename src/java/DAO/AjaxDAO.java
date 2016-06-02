/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.ConnectionFactory;
import Entity.Category;
import Entity.Citizen;
import Entity.Contractor;
import Entity.Files;
import Entity.Material;
import Entity.Project;
import Entity.Request;
import Entity.Resources;
import Entity.Schedule;
import Entity.ScheduleCalendar;
import Entity.SubCategory;
import Entity.Testimonial;
import Entity.Unit;
import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class AjaxDAO {

    Connection connection;
    PreparedStatement statement;
    ResultSet result;
    ConnectionFactory myFactory;

    //============================================AJAX CALLS===========================================================
    public ArrayList<SubCategory> getSubCategory(Category c) {

        ArrayList<SubCategory> subcategory = new ArrayList<SubCategory>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "SELECT * FROM cogitov2.subcategory where category_ID = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, c.getId());

            result = statement.executeQuery();

            while (result.next()) {

                SubCategory subc = new SubCategory();
                subc.setId(result.getInt("subcategory.id"));
                subc.setSubCategory(result.getString("subcategory.SubCategory"));

                subcategory.add(subc);
            }
            connection.close();
            return subcategory;

        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return subcategory;

    }

    public Category getCategory(String categoryname) {
        Category c = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "SELECT * FROM cogitov2.category where Category = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, categoryname);
            result = statement.executeQuery();
            while (result.next()) {
                c = new Category(result.getInt("ID"), result.getString("Category"));
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public SubCategory getSubCategory(String subcategoryname, Category c) {
        SubCategory sc = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "SELECT * FROM cogitov2.subcategory where SubCategory = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, subcategoryname);
            result = statement.executeQuery();
            while (result.next()) {
                sc = new SubCategory(result.getInt("ID"), result.getString("SubCategory"), c);
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sc;
    }

    public ArrayList<Material> getGeneralMaterials(SubCategory sc) {

        ArrayList<Material> generalmaterials = new ArrayList<Material>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "SELECT material.ID, material.name, material.unitprice, material.quantity, unit.unit FROM cogitov2.material join unit on Unit_ID = unit.id  where subcategory_ID = ? and material.type = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, sc.getId());
            statement.setString(2, "General");
            result = statement.executeQuery();

            while (result.next()) {

                Material m = new Material(result.getInt("material.ID"), result.getString("material.Name"), result.getInt("material.Quantity"), result.getFloat("material.UnitPrice"), null, new Unit(0, result.getString("unit.unit")), sc, null, 0);

                generalmaterials.add(m);

            }
            connection.close();
            return generalmaterials;

        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return generalmaterials;

    }

    public ArrayList<Testimonial> getTestimonialSearch(String Keyword) {

        ArrayList<Testimonial> testimonials = new ArrayList<Testimonial>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "SELECT * FROM cogitov2.testimonial where title like ? or location like ? or locationdetails like ? or message like ?";

            statement = connection.prepareStatement(query);
            statement.setString(1, "%" + Keyword + "%");
            statement.setString(2, "%" + Keyword + "%");
            statement.setString(3, "%" + Keyword + "%");
            statement.setString(4, "%" + Keyword + "%");

            result = statement.executeQuery();

            while (result.next()) {

                Testimonial t = new Testimonial(result.getInt("ID"), result.getString("Title"), result.getString("DateUploaded"), result.getString("Message"), result.getString("FolderName"), result.getString("Location"), result.getString("LocationDetails"), result.getString("Category"), null, result.getString("Status"), null);

                testimonials.add(t);

            }
            connection.close();
            return testimonials;

        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return testimonials;

    }

    public ArrayList<Files> getTestimonialFiles(int testimonialID) {

        ArrayList<Files> files = new ArrayList<Files>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "SELECT * FROM cogitov2.files where Testimonial_ID = ? and Status = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, testimonialID);
            statement.setString(2, "Approved");

            result = statement.executeQuery();

            while (result.next()) {

                Files f = new Files(result.getInt("ID"), result.getString("FileName"), result.getString("DateUploaded"), result.getString("Type"), null, result.getString("Status"), result.getString("Uploader"));
                files.add(f);

            }
            connection.close();
            return files;

        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return files;

    }

    public ArrayList<ArrayList<Schedule>> getSchedule() throws ParseException {
        ArrayList<ArrayList<Schedule>> list = new ArrayList<>();
        ScheduleCalendar sc = new ScheduleCalendar();
        sc.createPlanningSched();
        sc.createBiddingSched();
        list.add(sc.getPlanning());
        list.add(sc.getBidding());
        return list;
    }

    public ArrayList<ArrayList<Schedule>> getSchedulePW(String date, String json) throws ParseException {

        ArrayList<ArrayList<Schedule>> list = new ArrayList<>();
        ScheduleCalendar sc = new ScheduleCalendar();

        sc.createPlanningSched();
        sc.createBiddingSched();
        sc.createImplementationSched(date, json);

        list.add(sc.getPlanning());
        list.add(sc.getBidding());
        list.add(sc.getImplementation());
        return list;
    }

    public String createID(String Maincategory) {
        Random r = new Random();
        int num = r.nextInt(8999);
        ArrayList<String> ids = new ArrayList<>();
        String finalid = null;
        String category = null;

        Date d = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(d);
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);

        String finalyear = Integer.toString(year).substring(2, 4);
        String finalmonth;
        String finaldate;

        if (month < 10) {
            finalmonth = "0" + Integer.toString(month + 1);
        } else {
            finalmonth = Integer.toString(month + 1);
        }

        finaldate = finalmonth + finalyear;

        if (Maincategory.equalsIgnoreCase("Vertical")) {
            category = "VE";
        } else if (Maincategory.equalsIgnoreCase("Horizontal")) {
            category = "HO";
        } else if (Maincategory.equalsIgnoreCase("Maintenance")) {
            category = "MA";
        }

        finalid = category + finaldate + (num + 1000);

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select id from project";
            statement = connection.prepareStatement(query);
            result = statement.executeQuery();
            while (result.next()) {
                ids.add(result.getString("id"));
            }
            statement.close();
            connection.close();

            while (ids.contains(finalid)) {
                num = r.nextInt(8999);
                finalid = category + finaldate + (num + 1000);
            }

            return finalid;

        } catch (SQLException ex) {
            Logger.getLogger(OCPDDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return finalid;

    }

    public ArrayList<Schedule> getScheduleDB(String id) {
        ArrayList<Schedule> list = new ArrayList<>();
        Schedule sc;

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "SELECT * FROM schedule where project_id = ?";

            statement = connection.prepareStatement(query);
            statement.setString(1, id);
            result = statement.executeQuery();
            while (result.next()) {
                sc = new Schedule();
                sc.setId(result.getInt("id"));
                sc.setEvent(result.getString("event"));
                sc.setStartdate(result.getString("startdate"));
                sc.setEnddate(result.getString("enddate"));
                sc.setStatus(result.getString("status"));
                sc.setStage(result.getString("stage"));
                sc.setDept(result.getString("department"));
                list.add(sc);
            }
            connection.close();
            return list;

        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;

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

    public Files getFile(int id) {
        Files f = null;
        Testimonial t;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String filesQuery = ("select * from files where id = ?");
            statement = connection.prepareStatement(filesQuery);
            statement.setInt(1, id);
            result = statement.executeQuery();
            while (result.next()) {
                f = new Files();
                f.setId(id);
                f.setFileName(result.getString("FileName"));
                f.setDateUploaded(result.getString("DateUploaded"));
                f.setType(result.getString("type"));
                f.setStatus(result.getString("status"));
                f.setUploader(result.getString("uploader"));
                t = new Testimonial();
                t.setId(result.getInt("Testimonial_ID"));
                f.setTestimonial(t);
            }
            connection.close();
            return f;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;

    }

    public Files getProjectFile(int id) {
        Files f = null;
        Testimonial t;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String filesQuery = ("select * from files where id = ?");
            statement = connection.prepareStatement(filesQuery);
            statement.setInt(1, id);
            result = statement.executeQuery();
            while (result.next()) {
                f = new Files();
                f.setId(id);
                f.setFileName(result.getString("FileName"));
                f.setDateUploaded(result.getString("DateUploaded"));
                f.setType(result.getString("type"));
                f.setStatus(result.getString("status"));
                f.setUploader(result.getString("uploader"));
            }
            connection.close();
            return f;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;

    }

    public void setMeetingDone(int id, String status) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update schedule set status = ?, actualenddate=now() where id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, status);
            statement.setInt(2, id);

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void setScheduleDone(int id, String status) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update schedule set status = ? where id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, status);
            statement.setInt(2, id);

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateMeetingDone(String date, String end, int id, String department, String time, String remark) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update schedule set StartDate = ?, EndDate = ?, Status = ?, Department = ?, Time = ?, Remarks = ? where id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, date);
            statement.setString(2, end);
            statement.setString(3, "Unconfirmed");
            statement.setString(4, department);
            statement.setString(5, time);
            statement.setString(6, remark);
            statement.setInt(7, id);

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Contractor> getIdle() {
        ArrayList<Contractor> cList = new ArrayList<>();
        Contractor c;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from contractor";
            statement = connection.prepareStatement(query);
            result = statement.executeQuery();
            while (result.next()) {
                c = new Contractor();
                c.setID(result.getInt("contractor.id"));
                c.setName(result.getString("contractor.name"));
                cList.add(c);
            }
            connection.close();
            return cList;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cList;

    }

    public String[] getSchedDates(int id) {
        String[] dates = new String[2];
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select startdate, enddate from schedule where id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            result = statement.executeQuery();
            while (result.next()) {
                dates[0] = result.getString("startdate");
                dates[1] = result.getString("enddate");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.AjaxDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dates;
    }

    public Request getSchedDetails(int id) {
        Request r = null;
        Schedule s = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select event, start, end, reason, remarks, startdate, enddate\n"
                    + " from request  join schedule on schedule_id = schedule.id where request.id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            result = statement.executeQuery();
            while (result.next()) {
                r = new Request();
                r.setStart(result.getString("start"));
                r.setEnd(result.getString("end"));
                r.setReason(result.getString("reason"));
                if (result.getString("remarks") == null || result.getString("remarks").equalsIgnoreCase("")) {
                    r.setRemarks("");
                } else {
                    r.setRemarks(result.getString("remarks"));
                }

                s = new Schedule();
                s.setEvent(result.getString("event"));
                s.setStartdate(result.getString("startdate"));
                s.setEnddate(result.getString("enddate"));
                r.setSchedule(s);
            }
            connection.close();
            return r;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.AjaxDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }

    public Schedule getSchedule(int id) {
        Schedule s = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from schedule where id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            result = statement.executeQuery();
            while (result.next()) {
                s = new Schedule();
                s.setId(result.getInt("id"));
                s.setEvent(result.getString("event"));
                s.setStartdate(result.getString("startdate"));
                s.setEnddate(result.getString("enddate"));
                s.setProjectID(result.getString("project_id"));
            }
            connection.close();
            return s;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.AjaxDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public void changeDept(Schedule s, String department) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update schedule set department = ? where id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, department);
            statement.setInt(2, s.getId());
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.AjaxDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
