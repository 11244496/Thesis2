/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.ConnectionFactory;
import Entity.Activity;
import Entity.Address;
import Entity.Barangay;
import Entity.Category;
import Entity.Citizen;
import Entity.Contractor;
import Entity.Feedback;
import Entity.Files;
import Entity.Notification;
import Entity.Project;
import Entity.Reply;
import Entity.SubCategory;
import Entity.Supporter;
import Entity.Testimonial;
import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author RoAnn
 */
public class CitizenDAO {

    Connection connection;
    PreparedStatement statement;
    ResultSet result;
    ConnectionFactory myFactory;

    public void registerCitizen(String Username, String Password, String FirstName, String MiddleName, String LastName, Address address, Barangay barangay, String type) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            PreparedStatement statement2;
            PreparedStatement statement3;
            PreparedStatement statement4;
            String query = "insert into users (username, password, type) values (?, ?, ?)";
            String query2 = "insert into citizen (firstname, middlename, lastname, users_id) values (?, ?, ?, (select last_insert_id()))";
            String query3 = "insert into address (housenostreet, postalcode, barangay_id)values (?,?,(select id from barangay where barangay = ?))";
            String query4 = "update citizen set address_id = (select max(address.id) from address) where users_id = (select id from users where username = ?)";

            statement = connection.prepareStatement(query);
            statement.setString(1, Username);
            statement.setString(2, Password);
            statement.setString(3, type);
            statement.executeUpdate();
            statement.close();

            statement2 = connection.prepareStatement(query2);
            statement2.setString(1, FirstName);
            statement2.setString(2, MiddleName);
            statement2.setString(3, LastName);
            statement2.executeUpdate();
            statement2.close();

            statement3 = connection.prepareStatement(query3);
            statement3.setString(1, address.getHouseNoStreet());
            statement3.setInt(2, address.getPostalCode());
            statement3.setString(3, barangay.getBarangay());
            statement3.executeUpdate();
            statement3.close();

            statement4 = connection.prepareStatement(query4);
            statement4.setString(1, Username);
            statement4.executeUpdate();
            statement4.close();

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getUser(Citizen c) {
        User u = null;

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from users where users.ID = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, c.getUser().getId());
            result = statement.executeQuery();
            while (result.next()) {
                u = new User(result.getInt("users.id"), result.getString("username"), result.getString("password"), result.getString("type"));

            }

            connection.close();
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }

    public User getInfo(int id) {
        User u = null;
        Citizen c = null;
        Address a = null;
        Barangay b = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from users join citizen on users.id = users_id join address on address_id = address.id join barangay on barangay_id = barangay.id";

            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            result = statement.executeQuery();
            while (result.next()) {
                u = new User(result.getInt("users.id"), result.getString("username"), result.getString("password"), result.getString("type"));
                b = new Barangay(result.getInt("barangay.id"), result.getString("barangay"));
                a = new Address(result.getInt("address.id"), result.getString("HouseNoStreet"), result.getInt("postalcode"), b);
                c = new Citizen(result.getInt("citizen.id"), result.getString("FirstName"), result.getString("MiddleName"), result.getString("LastName"), null, u);
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }

    //==================================TESTIMONIAL METHODS===============================================
    public void uploadTestimonial(Testimonial t) {

        try {

            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "insert into testimonial (title, dateUploaded, message, citizen_id, location, foldername,category,locationdetails, status) \n"
                    + "values (?,now(),?,(Select citizen.id from citizen join users on users_id = users.id where username = ?),?,?,?,?,?);";

            statement = connection.prepareStatement(query);
            statement.setString(1, t.getTitle());
            statement.setString(2, t.getMessage());
            statement.setString(3, t.getCitizen().getUser().getUsername());
            statement.setString(4, t.getLocation());
            statement.setString(5, t.getFolderName());
            statement.setString(6, t.getCategory());
            statement.setString(7, t.getLocationdetails());
            statement.setString(8, t.getStatus());

            statement.executeUpdate();
            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Files
    public void uploadFiles(Files f, String username) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into files (FileName, DateUploaded, Type, Status, testimonial_id, uploader) values "
                    + "(?, curdate(),?,?,(select testimonial.ID from testimonial join "
                    + "citizen on citizen_id = citizen.id join users on Users_ID = users.ID where username = ? "
                    + "and dateuploaded = (select max(dateuploaded) from testimonial)),?);";
            statement = connection.prepareStatement(query);
            statement.setString(1, f.getFileName());
            statement.setString(2, f.getType());
            statement.setString(3, f.getStatus());
            statement.setString(4, f.getTestimonial_ID().getCitizen().getUser().getUsername());
            statement.setString(5, username);

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void sendLetter(Testimonial r) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into testimonial (title, dateuploaded, category, message, citizen_id, concern, status, Location, LocationDetails) values (?, now(), ?, ?, ?,?,?,?,?);";
            statement = connection.prepareStatement(query);
            statement.setString(1, r.getTitle());
            statement.setString(2, r.getCategory());
            statement.setString(3, r.getMessage());
            statement.setInt(4, r.getCitizen().getId());
            statement.setString(5, r.getConcern());
            statement.setString(6, r.getStatus());
            statement.setString(7, r.getLocation());
            statement.setString(8, r.getLocationdetails());

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void followTestimonial(Supporter s) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into supporters (testimonial_id, citizen_id) values (?, ?);";
            statement = connection.prepareStatement(query);
            statement.setInt(1, s.getTestimonial().getId());
            statement.setInt(2, s.getCitizen().getId());

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void unfollowTestimonial(Supporter s) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "DELETE FROM supporters WHERE Citizen_ID = ? and Testimonial_ID = ?;";
            statement = connection.prepareStatement(query);
            statement.setInt(1, s.getCitizen().getId());
            statement.setInt(2, s.getTestimonial().getId());

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Supporter> getSupporterList(Testimonial r) {
        ArrayList<Supporter> sList = new ArrayList<>();
        Supporter s;
        Citizen c;
        User u;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select supporters.id as suppId, users.id as userId, citizen_id, firstname, lastname, username from supporters \n"
                    + "join citizen on citizen.id = supporters.citizen_id\n"
                    + "join users on users.id = users_id\n"
                    + "where Testimonial_ID = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, r.getId());
            result = statement.executeQuery();
            while (result.next()) {
                u = new User(result.getInt("userId"), result.getString("username"));
                c = new Citizen(result.getInt("citizen_id"), result.getString("firstname"), result.getString("lastname"), u);
                s = new Supporter(result.getInt("suppId"), c);
                sList.add(s);
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sList;
    }

    //================= GET MULTIMEDIA BASED ON STATUS: FOR APPROVAL: STATUS = PENDING ==================//
    //================= GET MULTIMEDIA BASED ON STATUS: FOR VIEW: STATUS = APPROVED ==================//
    public ArrayList<Files> getFiles(Testimonial r, String status) {
        ArrayList<Files> fList = new ArrayList<>();
        Files f;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select Files.ID, FileName, Files.dateuploaded, files.type, uploader from files  \n"
                    + "join testimonial on testimonial_id = testimonial.id \n"
                    + "where foldername = ? and Files.status = ? and testimonial_id = ?";

            statement = connection.prepareStatement(query);
            statement.setString(1, r.getFolderName());
            statement.setString(2, status);
            statement.setInt(3, r.getId());
            result = statement.executeQuery();
            while (result.next()) {
                f = new Files(result.getInt("id"), result.getString("FileName"), result.getString("DateUploaded"), result.getString("type"), r, status, result.getString("uploader"));
                fList.add(f);
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fList;
    }

    public void changeMMStatus(String status, int id) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update files set status = ? where id = ?";
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

    public void disapproveAdded(int id) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "delete from files where id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);

            statement.executeUpdate();
            statement.close();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Files getFile(int id) {
        Files f = new Files();
        Testimonial t = new Testimonial();
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "SELECT * from files where id=?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            result = statement.executeQuery();

            while (result.next()) {
                t.setId(result.getInt("testimonial_id"));
                f.setId(result.getInt("ID"));
                f.setFileName(result.getString("FileName"));
                f.setDateUploaded(result.getString("DateUploaded"));
                f.setTestimonial_ID(t);
                f.setType(result.getString("Type"));
                f.setStatus(result.getString("Status"));
                f.setUploader(result.getString("Uploader"));
            }
            connection.close();
            return f;

        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }

    public ArrayList<Testimonial> getTestimonials() {
        Testimonial t = null;
        Citizen c = null;
        User u = null;
        ArrayList<Testimonial> test = new ArrayList<Testimonial>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from testimonial join citizen on citizen.id = citizen_id join users on users.id = users_id";

            statement = connection.prepareStatement(query);

            result = statement.executeQuery();

            while (result.next()) {
                u = new User(result.getInt("users.id"), result.getString("username"));
                c = new Citizen(result.getInt("citizen.id"), result.getString("FirstName"), result.getString("middlename"), u);
                t = new Testimonial(result.getInt("testimonial.id"), result.getString("testimonial.title"), result.getString("testimonial.dateuploaded"), result.getString("testimonial.message"), result.getString("testimonial.foldername"), result.getString("testimonial.location"), result.getString("testimonial.locationdetails"), result.getString("testimonial.category"), null, result.getString("testimonial.status"), c);
                Project p = new Project();
                p.setId(result.getString("testimonial.Project_ID"));
                t.setProject(p);
                test.add(t);
            }
            connection.close();
            return test;

        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return test;

    }

    public ArrayList<Testimonial> getTestimonial(Citizen c) {
        Testimonial t = null;
        User u = null;
        Citizen ci = null;
        ArrayList<Testimonial> test = new ArrayList<Testimonial>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from testimonial join citizen on citizen.id = citizen_id join users on users.id = users_id where username = ?";

            statement = connection.prepareStatement(query);
            statement.setString(1, c.getUser().getUsername());

            result = statement.executeQuery();

            while (result.next()) {
                u = new User(result.getInt("users.id"), result.getString("username"));
                ci = new Citizen(result.getInt("citizen.id"), result.getString("FirstName"), result.getString("middlename"), u);
                t = new Testimonial(result.getInt("testimonial.id"), result.getString("testimonial.title"), result.getString("testimonial.dateuploaded"), result.getString("testimonial.message"), result.getString("testimonial.foldername"), result.getString("testimonial.location"), result.getString("testimonial.locationdetails"), result.getString("testimonial.category"), null, result.getString("testimonial.status"), c);
                Project p = new Project();
                p.setId(result.getString("testimonial.Project_ID"));
                t.setProject(p);
                test.add(t);
            }
            connection.close();
            return test;

        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return test;

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
                t = new Testimonial(result.getInt("testimonial.id"), result.getString("testimonial.title"), result.getString("testimonial.dateuploaded"), result.getString("testimonial.message"), result.getString("testimonial.foldername"), result.getString("testimonial.location"), result.getString("testimonial.locationdetails"), result.getString("testimonial.category"), result.getString("testimonial.concern"), result.getString("testimonial.status"), c);
                Project p = new Project();
                p.setId(result.getString("testimonial.Project_ID"));
                t.setProject(p);
            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return t;
    }

    //INSERT GET TOP 10 TESTIMONIALS HERE
    //INSERT SUBSCRIBED TESTIMONIALS HERE
    public ArrayList<Integer> getSubscribedTestimonials(int citizenid) {

        ArrayList<Integer> test = new ArrayList<Integer>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select testimonial_ID from supporters where citizen_id = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, citizenid);
            result = statement.executeQuery();

            while (result.next()) {
                int id = result.getInt("testimonial_ID");
                test.add(id);
            }
            connection.close();
            return test;

        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return test;
    }

    public boolean isSubscribed(Testimonial t, Citizen c) {
        int count = 0;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select count(*) as c from supporters where testimonial_ID = ? and citizen_ID = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, t.getId());
            statement.setInt(2, c.getId());
            result = statement.executeQuery();
            while (result.next()) {
                count = result.getInt("c");
            }
            connection.close();

            if (count > 0) {
                return true;
            }

            return false;

        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //SELECT ALL IMAGE BASED ON ID
    public Files openImage(int id) {
        Files f = null;
        Testimonial test = new Testimonial();
        test.setId(id);

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from files where Testimonial_ID = ? and Type = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.setString(2, "Image");

            result = statement.executeQuery();
            while (result.next()) {

                f = new Files(result.getInt("files.ID"), result.getString("files.filename"), result.getString("files.dateuploaded"), result.getString("files.type"), test, result.getString("files.Status"), null);

            }

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.ActivityDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
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
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return fl;

    }

    public ArrayList<Activity> getActivity(User u) {

        ArrayList<Activity> activities = new ArrayList<Activity>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from activity where users_id = ? Order by DateTime DESC";

            statement = connection.prepareStatement(query);
            statement.setInt(1, u.getId());

            result = statement.executeQuery();

            while (result.next()) {
                Activity activity = new Activity();
                activity.setId(result.getInt("activity.id"));
                activity.setActivity(result.getString("activity.activity"));
                activity.setDateTime(result.getString("activity.datetime"));
                activity.setUser(u);
                activities.add(activity);
            }
            connection.close();
            return activities;

        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return activities;

    }

    public ArrayList<Notification> getNotification(User u) {

        ArrayList<Notification> notification = new ArrayList<Notification>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "select * from notification where users_id = ? Order by DateTime DESC";

            statement = connection.prepareStatement(query);
            statement.setInt(1, u.getId());

            result = statement.executeQuery();

            while (result.next()) {
                Notification n = new Notification();
                n.setId(result.getInt("notification.id"));
                n.setNotification(result.getString("Notification"));
                n.setDateTime(result.getString("notification.datetime"));
                n.setUsers_ID(u);

                notification.add(n);
            }
            connection.close();
            return notification;

        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return notification;

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

    //CITIZEN HOME METHODS
    public ArrayList<Integer> gettoptestimonialID() {

        ArrayList<Integer> toptestiID = new ArrayList<Integer>();

        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();

            String query = "SELECT Testimonial_ID, COUNT(*)\n"
                    + "FROM supporters\n"
                    + "Group By Testimonial_ID\n"
                    + "Order By COUNT(*) DESC\n"
                    + "LIMIT 10";

            statement = connection.prepareStatement(query);
            result = statement.executeQuery();

            while (result.next()) {

                int ID = result.getInt("Testimonial_ID");

                toptestiID.add(ID);
            }
            connection.close();
            return toptestiID;

        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return toptestiID;

    }

    public int gettestimonialcount(Citizen c) {
        int test = 0;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "SELECT COUNT(*) as c FROM testimonial where Citizen_ID = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, c.getId());
            result = statement.executeQuery();
            while (result.next()) {
                test = result.getInt("c");
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return test;
    }

    public int getunlikedtestimonial(Citizen c) {
        int unlinkedtesti = 0;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "SELECT COUNT(*) as c FROM testimonial where Citizen_ID = ? AND Project_ID = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, c.getId());
            statement.setInt(2, 0);
            result = statement.executeQuery();
            while (result.next()) {
                unlinkedtesti = result.getInt("c");
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return unlinkedtesti;
    }

    public int getnumberofsubscribers(Testimonial t) {
        int subscribers = 0;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select count(*) as c from supporters where testimonial_ID = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, t.getId());
            result = statement.executeQuery();
            while (result.next()) {
                subscribers = result.getInt("c");
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return subscribers;
    }

    public void followProject(Project p, Citizen c) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into projectsupporter (citizen_id, project_id) values (?, ?)";
            statement = connection.prepareStatement(query);
            statement.setInt(1, c.getId());
            statement.setString(2, p.getId());
            statement.executeUpdate();
            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void unfollowProject(Project p, Citizen c) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "DELETE FROM projectsupporter WHERE citizen_id = ? and project_id = ?;";
            statement = connection.prepareStatement(query);
            statement.setInt(1, c.getId());
            statement.setString(2, p.getId());
            statement.executeUpdate();
            statement.close();
            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(DAO.CitizenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    public ArrayList<Project> getProjectsForImplementation(String input) {
        ArrayList<Project> projects = new ArrayList<Project>();
        Project project;
        Contractor contractor;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select * from project JOIN contractor ON project.Contractor_ID = contractor.ID where status = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, input);

            result = statement.executeQuery();

            while (result.next()) {
                contractor = new Contractor(result.getInt("contractor.ID"), result.getString("contractor.Name"));
                project = new Project();
                project.setId(result.getString("ID"));
                project.setName(result.getString("Name"));
                project.setDescription(result.getString("Description"));
                project.setType(result.getString("Type"));
                project.setStatus(result.getString("Status"));
                project.setContractor(contractor);

                projects.add(project);

            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return projects;
    }

    public int hasFeedback(Citizen c, Project p) {
        int count = 0;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select count(*) as c from feedback join citizen on citizen_id = citizen.id where project_id = ? and citizen.id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());
            statement.setInt(2, c.getId());

            result = statement.executeQuery();

            while (result.next()) {
                count = result.getInt("c");
            }
            connection.close();
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public void sendFeedback(Feedback f) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "insert into feedback (quality, promptness, convenience, safety, details, "
                    + "details2, satisfaction, comments, project_id, citizen_id, datesubmitted) "
                    + "values (?,?,?,?,?,?,?,?,?,?,now())";
            statement = connection.prepareStatement(query);
            statement.setInt(1, f.getQuality());
            statement.setInt(2, f.getPromptness());
            statement.setInt(3, f.getConvenience());
            statement.setInt(4, f.getSafety());
            statement.setInt(5, f.getDetails());
            statement.setInt(6, f.getDetails2());
            statement.setInt(7, f.getSatisfaction());
            statement.setString(8, f.getComments());
            statement.setString(9, f.getProject().getId());
            statement.setInt(10, f.getCitizen().getId());

            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Feedback getAverage(Project p) {
        Feedback f = null;
        DecimalFormat df = new DecimalFormat("#,###.00");
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "select project_id, avg(quality) as quality,  avg(promptness) as promptness, avg(convenience) as convenience, avg(safety) as safety,\n"
                    + "avg(details) as details, avg(details2) as details2, avg(satisfaction) as satisfaction from feedback where project_id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getId());
            result = statement.executeQuery();
            while (result.next()) {
                f = new Feedback();
                f.setQualityave(result.getDouble("quality"));
                f.setPromptnessave(result.getDouble("promptness"));
                f.setConvenienceave(result.getDouble("convenience"));
                f.setSafetyave(result.getDouble("safety"));
                f.setDetailsave((result.getDouble("details") + result.getDouble("details2")) / 2);
                f.setSatisfactionave(result.getDouble("satisfaction"));
            }

            connection.close();
            return f;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.BACDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }

}
