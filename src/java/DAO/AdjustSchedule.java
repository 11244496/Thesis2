/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DB.ConnectionFactory;
import Entity.Project;
import Entity.Schedule;
import Entity.ScheduleCalendar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Calendar;

/**
 *
 * @author RoAnn
 */
public class AdjustSchedule {

    Connection connection;
    PreparedStatement statement;
    ResultSet result;
    ConnectionFactory myFactory;
    ArrayList<Schedule> dbList;
    Calendar c = Calendar.getInstance();
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    public Schedule updateSchedule(Schedule CurrentSchedule) throws ParseException {
        Calendar c = Calendar.getInstance();
        Date d = new Date();
        c.setTime(d);

        CurrentSchedule.setActualenddate(df.format(c.getTime()));

        Date start = df.parse(CurrentSchedule.getStartdate());
        Date end = df.parse(CurrentSchedule.getEnddate());
        int length = daysBetween(start, end);
        if (start.after(df.parse(CurrentSchedule.getActualenddate()))) {
            start = new Date();
            c.setTime(start);
            if (length < 0) {
                length = length * -1;
            }
            c.add(Calendar.DATE, length);
            end = c.getTime();
            CurrentSchedule.setStartdate(df.format(start));
            CurrentSchedule.setEnddate(df.format(end));
            updateScheduleStart(CurrentSchedule);
        }
        updateScheduleStatus(CurrentSchedule, "Done");
        return CurrentSchedule;
    }

   public void reschedITB(ArrayList<Schedule> pSched, String start) throws ParseException {

        ArrayList<Schedule> bidding = new ArrayList<>();
        for (Schedule s : pSched) {
            if (s.getStage().equalsIgnoreCase("Bidding")) {
                bidding.add(s);
            }
        }

        ArrayList<Schedule> newBidding = new ArrayList<>();
        c.setTime(df.parse(start));
        Schedule s = null;
        int length = 0;
        for (int x = 1; x < bidding.size();) {
            s = bidding.get(x);

            if (s.getEvent().equalsIgnoreCase("Post Invitation to Bid")) {
                s.setStartdate(start);
                s.setEnddate(start);
                changeStatus(s, "Pending");

            } else {
                length = daysBetween(df.parse(s.getStartdate()), df.parse(s.getEnddate()));
                c.add(Calendar.DATE, 1);
                s.setStartdate(df.format(c.getTime()));
                if (length == 0) {
                    s.setEnddate(df.format(c.getTime()));
                } else {
                    if (length < 0) {
                        length = length * -1;
                    }
                    c.add(Calendar.DATE, length);
                    s.setEnddate(df.format(c.getTime()));

                }
            }

            updateScheduleDate(s);
        }

    }

    public void adjust(Schedule s, ArrayList<Schedule> sList) throws ParseException {
        ArrayList<Schedule> newSched = new ArrayList<>();
        int index = 0;
        for (int x = 0; x < sList.size(); x++) {
            if (sList.get(x).getStatus().equalsIgnoreCase("Done") && sList.get(x).getEvent().equalsIgnoreCase(s.getEvent()) && sList.get(x).getId() == s.getId()) {
                index = x;
                x = sList.size();
            }
        }

        Schedule s2 = null;
        c.setTime(df.parse(s.getActualenddate()));

        int length = 0;
        for (int x = index + 1; x < sList.size();) {
            //as long as event is not meeting with ocpd or implementation event
            if (sList.get(x).getStage().equalsIgnoreCase("Implementation") || sList.get(x).getStage().equalsIgnoreCase("Bidding")) {
                x++;
            } else {
                if (sList.get(x).getEvent().equalsIgnoreCase("Meeting with OCPD")) {
                    x++;
                } else {

                    s2 = new Schedule();
                    s2 = sList.get(x);
                    length = daysBetween(df.parse(sList.get(x).getStartdate()), df.parse(sList.get(x).getEnddate()));
                    c.add(Calendar.DATE, 1);
                    s2.setStartdate(df.format(c.getTime()));

                    if (length == 0) {
                        s2.setEnddate(df.format(c.getTime()));
                    } else {
                        c.add(Calendar.DATE, length);
                        s2.setEnddate(df.format(c.getTime()));
                    }
                    newSched.add(s2);
                    x++;
                }
            }
        }

        for (Schedule sc : newSched) {
            updateScheduleDate(sc);
        }

    }

    public void adjustImplementation(ArrayList<Schedule> sList) throws ParseException {
        ArrayList<Schedule> newSched = new ArrayList<>();
        int index = 0;
        for (int x = 0; x < sList.size(); x++) {
            if (sList.get(x).getStage().equalsIgnoreCase("Implementation")) {
                if (sList.get(x).getStatus().equalsIgnoreCase("Pending")) {
                    index = x - 1;
                    x = sList.size();
                } else {
                    index = x;
                }
            }
        }

        if (index + 1 != sList.size()) {

            ArrayList<Schedule> implsched = new ArrayList<Schedule>();
            for (int x = index + 1; x < sList.size(); x++) {
                implsched.add(sList.get(x));
            }

            Schedule s2 = null;

            if (sList.get(index).getActualenddate() == null) {
                c.setTime(df.parse(sList.get(index).getEnddate()));
            } else {
                c.setTime(df.parse(sList.get(index).getActualenddate()));
            }

            int length = 0;
            for (int x = 0; x < implsched.size(); x++) {
                s2 = new Schedule();
                s2 = implsched.get(x);
                c.add(Calendar.DATE, 1);
                s2.setStartdate(df.format(c.getTime()));

                length = daysBetween(df.parse(implsched.get(x).getStartdate()), df.parse(implsched.get(x).getEnddate()));

                if (length == 0) {
                    s2.setEnddate(df.format(c.getTime()));
                } else {
                    c.add(Calendar.DATE, length);
                    s2.setEnddate(df.format(c.getTime()));
                }
                newSched.add(s2);

            }

            for (Schedule sc : newSched) {
                updateScheduleDate(sc);
            }
        }

    }

    public void adjustForEdit(ArrayList<Schedule> sList) throws ParseException {
        ArrayList<Schedule> newSched = new ArrayList<>();
        int index = 0;
        for (int x = 0; x < sList.size(); x++) {
            if (sList.get(x).getEvent().equalsIgnoreCase("Review Proposal") && sList.get(x).getStatus().equalsIgnoreCase("Pending")) {
                index = x;
                x = sList.size();
            }
        }
        if (sList.get(index).getActualenddate() == null) {
            c.setTime(df.parse(sList.get(index).getEnddate()));
        }
        String start = "";
        Schedule v = new Schedule();
        for (int x = 0; x < sList.size(); x++) {
            if (sList.get(x).getEvent().equalsIgnoreCase("Edit Proposal") && sList.get(x).getStatus().equalsIgnoreCase("Pending")) {
                v.setId(sList.get(x).getId());
                v.setStartdate(sList.get(x).getStartdate());
                x = sList.size();
            }
        }
        for (int x = 0; x < sList.size(); x++) {
            if (sList.get(x).getEvent().equalsIgnoreCase("Approve Proposal") && sList.get(x).getStatus().equalsIgnoreCase("Pending")) {
                index = x;
                x = sList.size();
            }
        }

        Schedule s2 = null;

        int length = 0;
        for (int x = index; x < sList.size();) {
            //as long as event is not meeting with ocpd or implementation event
            if (sList.get(x).getStage().equalsIgnoreCase("Implementation") || sList.get(x).getStage().equalsIgnoreCase("Bidding")) {
                x++;
            } else {
                if (sList.get(x).getEvent().equalsIgnoreCase("Meeting with OCPD")) {
                    x++;
                } else {

                    s2 = new Schedule();
                    s2 = sList.get(x);
                    length = daysBetween(df.parse(sList.get(x).getStartdate()), df.parse(sList.get(x).getEnddate()));
                    c.add(Calendar.DATE, 1);
                    s2.setStartdate(df.format(c.getTime()));

                    if (length == 0) {
                        s2.setEnddate(df.format(c.getTime()));
                    } else {
                        c.add(Calendar.DATE, length);
                        s2.setEnddate(df.format(c.getTime()));
                    }
                    newSched.add(s2);
                    x++;
                }
            }
        }

        for (Schedule sc : newSched) {
            updateScheduleDate(sc);
        }

        updateStart(v);

    }

    public void adjustForMeeting(Schedule s, ArrayList<Schedule> sList) throws ParseException {
        ArrayList<Schedule> newSched = new ArrayList<>();
        int index = 0;
        for (int x = 0; x < sList.size(); x++) {
            if (sList.get(x).getStatus().equalsIgnoreCase("Unconfirmed") && sList.get(x).getEvent().equalsIgnoreCase(s.getEvent())) {
                index = x;
                x = sList.size();
            }
        }

        Schedule s2 = null;
        c.setTime(df.parse(sList.get(index).getEnddate()));

        int length = 0;
        for (int x = index; x < sList.size();) {
            //as long as event is not meeting with ocpd or implementation event
            if (sList.get(x).getStage().equalsIgnoreCase("Implementation") || sList.get(x).getStage().equalsIgnoreCase("Bidding")) {
                x++;
            } else {
                if (sList.get(x).getEvent().equalsIgnoreCase("Meeting with OCPD")) {
                    x++;
                } else {

                    s2 = new Schedule();
                    s2 = sList.get(x);
                    length = daysBetween(df.parse(sList.get(x).getStartdate()), df.parse(sList.get(x).getEnddate()));

                    c.add(Calendar.DATE, 1);
                    s2.setStartdate(df.format(c.getTime()));

                    if (length == 0) {
                        s2.setEnddate(df.format(c.getTime()));
                    } else {
                        c.add(Calendar.DATE, length);
                        s2.setEnddate(df.format(c.getTime()));
                    }
                    newSched.add(s2);
                    x++;
                }
            }
        }
        for (Schedule sc : newSched) {
            updateScheduleDate(sc);
        }

    }

    public void insertEdit(Project p) throws ParseException {
        ArrayList<Schedule> pList = p.getSchedule();
        ArrayList<Schedule> newList = new ArrayList<>();
        int index = 0;
        for (int x = 0; x < pList.size(); x++) {
            if (pList.get(x).getEvent().equalsIgnoreCase("Meeting with OCPD")) {
                index = x;
            }
        }
        Date d = df.parse(pList.get(index).getEnddate());

        c.setTime(d);
        Schedule edit = new Schedule(0, "Edit Proposal", null, null, "Pending", "GS", "Planning");
        c.add(Calendar.DATE, 1);
        edit.setStartdate(df.format(c.getTime()));
        c.add(Calendar.DATE, 7);
        edit.setEnddate(df.format(c.getTime()));
        insertSchedDB(edit, p);

        Schedule review = new Schedule(0, "Review Proposal", null, null, "Pending", "OCPD", "Planning");
        c.add(Calendar.DATE, 1);
        review.setStartdate(df.format(c.getTime()));
        c.add(Calendar.DATE, 1);
        review.setEnddate(df.format(c.getTime()));
        insertSchedDB(review, p);
    }

    public void changeStartDate(int id, String start, String end) {
        Schedule s = new Schedule();
        s.setId(id);
        s.setStartdate(start);
        s.setEnddate(end);
        updateScheduleDate(s);
    }

    public int daysBetween(Date d1, Date d2) {
        return (int) ((d2.getTime() - d1.getTime()) / (1000 * 60 * 60 * 24));
    }

    //WHEN ENDING AN ACTIVITY
    public void updateScheduleStatus(Schedule s, String stat) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update schedule set actualenddate = now(), status = ? where id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, stat);
            statement.setInt(2, s.getId());
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void updateBiddingStatus(Schedule s, String stat) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update schedule set actualenddate = ?, status = ? where id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, s.getEnddate());
            statement.setString(2, stat);
            statement.setInt(3, s.getId());
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateScheduleStart(Schedule s) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update schedule set StartDate = ? where ID = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, s.getStartdate());
            statement.setInt(2, s.getId());
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //ADJUST THE FOLLOWING EVENTS
    public void updateScheduleDate(Schedule s) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update schedule set StartDate = ?, EndDate = ? where ID = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, s.getStartdate());
            statement.setString(2, s.getEnddate());
            statement.setInt(3, s.getId());
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateStart(Schedule s) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update schedule set StartDate = ? where ID = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, s.getStartdate());
            statement.setInt(2, s.getId());
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //FOR EDIT AND REVIEW
    public void insertSchedDB(Schedule s, Project p) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String schedule = "insert into schedule (Event,StartDate,EndDate,Status,Project_ID,Stage,Department) values (?,?,?,?,?,?,?)";

            statement = connection.prepareStatement(schedule);
            statement.setString(1, s.getEvent());
            statement.setString(2, s.getStartdate());
            statement.setString(3, s.getEnddate());
            statement.setString(4, s.getStatus());
            statement.setString(5, p.getId());
            statement.setString(6, s.getStage());
            statement.setString(7, s.getDept());

            statement.executeUpdate();
            statement.close();

            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Schedule getSchedDetails(String event, String id) {
        Schedule s = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String schedule = "select * from schedule where event = ? and project_id = ?";

            statement = connection.prepareStatement(schedule);
            statement.setString(1, event);
            statement.setString(2, id);
            result = statement.executeQuery();

            while (result.next()) {
                s = new Schedule();
                s.setId(result.getInt("ID"));
                s.setEvent(result.getString("Event"));
                s.setStartdate(result.getString("Startdate"));
                s.setEnddate(result.getString("Enddate"));
                s.setActualenddate(result.getString("ActualEndDate"));
                s.setStatus(result.getString("Status"));
            }

            statement.close();

            connection.close();
            return s;
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public Schedule getSchedDetails(String event, String status, String id) {
        Schedule s = null;
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String schedule = "select * from schedule where event = ? and status=? and project_id = ?";

            statement = connection.prepareStatement(schedule);
            statement.setString(1, event);
            statement.setString(2, status);
            statement.setString(3, id);
            result = statement.executeQuery();

            while (result.next()) {
                s = new Schedule();
                s.setId(result.getInt("Id"));
                s.setEvent(result.getString("Event"));
                s.setStartdate(result.getString("Startdate"));
                s.setEnddate(result.getString("Enddate"));
                s.setActualenddate(result.getString("ActualEndDate"));
                s.setStatus(result.getString("Status"));
            }

            statement.close();

            connection.close();
            return s;
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public void changeStatus(Schedule s, String stat) {
        try {
            myFactory = ConnectionFactory.getInstance();
            connection = myFactory.getConnection();
            String query = "update schedule set status = ? where id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, stat);
            statement.setInt(2, s.getId());
            statement.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(GSDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
