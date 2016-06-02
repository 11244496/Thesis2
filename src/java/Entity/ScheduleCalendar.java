/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author RoAnn
 */
public class ScheduleCalendar {

    private ArrayList<Schedule> planning;
    private ArrayList<Schedule> bidding;
    private ArrayList<Schedule> implementation;
    private DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    private Calendar c = Calendar.getInstance();
    private Project p;
    private Schedule s;
    String date;

    public void createPlanningSched() {
        planning = new ArrayList<>();
        c.setTime(new Date());

        s = new Schedule(0, "Submission", dateFormat.format(c.getTime()), dateFormat.format(c.getTime()), "Done", "GS", "Planning");
        planning.add(s);
        date = dateFormat.format(c.getTime());

        //Start: End of Submission | End: Next day
        c.add(Calendar.DATE, 1);
        s = new Schedule(0, "Receive Proposal", date, dateFormat.format(c.getTime()), "Pending", "OCPD", "Planning");
        planning.add(s);
        date = dateFormat.format(c.getTime());

        //Start: End of Receive | End: c.add 2 days
        c.add(Calendar.DATE, 2);
        s = new Schedule(0, "Review Proposal", date, dateFormat.format(c.getTime()), "Pending", "OCPD", "Planning");
        planning.add(s);

        //Start: Next day | End: 14 days
        c.add(Calendar.DATE, 1);
        s = new Schedule(0, "Approve Proposal", dateFormat.format(c.getTime()), null, "Pending", "OCPD", "Planning");
        c.add(Calendar.DATE, 14);
        s.setEnddate(dateFormat.format(c.getTime()));
        planning.add(s);

    }

    public void createBiddingSched() throws ParseException {
        bidding = new ArrayList<>();

        //Start: Next day | End: 3 days
//        c.add(Calendar.DATE, 1);
//        s = new Schedule(0, "Preparation of Bidding Documents", dateFormat.format(c.getTime()), null, "Pending", "BAC", "Bidding");
//        c.add(Calendar.DATE, 3);
//        s.setEnddate(dateFormat.format(c.getTime()));
//        bidding.add(s);

        //Start: Next day | End: Same day
        c.add(Calendar.DATE, 1);
        checkWeekend(c);
        s = new Schedule(0, "Pre-procurement Conference", dateFormat.format(c.getTime()), dateFormat.format(c.getTime()), "Pending", "BAC", "Bidding");
        bidding.add(s);

        //Start: Next day | End: Same
        c.add(Calendar.DATE, 1);
        checkWeekend(c);
        s = new Schedule(0, "Post Invitation to Bid", dateFormat.format(c.getTime()), dateFormat.format(c.getTime()), "Pending", "BAC", "Bidding");
        bidding.add(s);
        String sDates = dateFormat.format(c.getTime());

        //Start: See ITB | End: 5 days
        c.add(Calendar.DATE, 5);
        s = new Schedule(0, "Receipt of LOI and Application for Eligibility", sDates, dateFormat.format(c.getTime()), "Pending", "BAC", "Bidding");
        bidding.add(s);

        //Start: Next day | End: Same Day
        c.add(Calendar.DATE, 1);
        checkWeekend(c);
        s = new Schedule(0, "Pre-bid conference", dateFormat.format(c.getTime()), dateFormat.format(c.getTime()), "Pending", "BAC", "Bidding");
        bidding.add(s);
        c.add(Calendar.DATE, 12);
        String openingDate = dateFormat.format(c.getTime());
        c.add(Calendar.DATE, -12);

        //Start: See ITB | End: Add1
        c.add(Calendar.DATE, 1);
        s = new Schedule(0, "Issuance of Bid Documents", sDates, dateFormat.format(c.getTime()), "Pending", "BAC", "Bidding");
        bidding.add(s);

        //Start: See ITB | End: add 1
        c.add(Calendar.DATE, 1);
        s = new Schedule(0, "Issuance of Eligibility Forms", sDates, dateFormat.format(c.getTime()), "Pending", "BAC", "Bidding");
        bidding.add(s);

        //Start: See ITB | End: get time
        s = new Schedule(0, "Receipt of Eligibility Requirements", sDates, dateFormat.format(c.getTime()), "Pending", "BAC", "Bidding");
        bidding.add(s);

        //Start: See ITB | End: 14 days
        s = new Schedule(0, "Notice of Results of Eligibility Check", sDates, addDate(c, 1), "Pending", "BAC", "Bidding");
        bidding.add(s);

        c.setTime(dateFormat.parse(openingDate));
        checkWeekend(c);
        s = new Schedule(0, "Receipt and Opening of Bids", dateFormat.format(c.getTime()), dateFormat.format(c.getTime()), "Pending", "BAC", "Bidding");
        bidding.add(s);

        c.add(Calendar.DATE, 1);
        s = new Schedule(0, "Post Qualification", dateFormat.format(c.getTime()), null, "Pending", "BAC", "Bidding");
        c.add(Calendar.DATE, 7);
        s.setEnddate(dateFormat.format(c.getTime()));
        bidding.add(s);

        c.add(Calendar.DATE, 3);
        checkWeekend(c);
        s = new Schedule(0, "Awarding", dateFormat.format(c.getTime()), dateFormat.format(c.getTime()), "Pending", "BAC", "Bidding");
        bidding.add(s);

        c.add(Calendar.DATE, 15);
        checkWeekend(c);
        s = new Schedule(0, "Issuance of Notice to Proceed", dateFormat.format(c.getTime()), dateFormat.format(c.getTime()), "Pending", "BAC", "Bidding");
        bidding.add(s);

    }

    public void createImplementationSched(String startdate, String json) throws ParseException {
        implementation = new ArrayList<>();
        Date date = dateFormat.parse(startdate);
        c.setTime(date);
        String[] stringparts = json.split(",");
        ArrayList<String> schedulestring = new ArrayList<String>();

        for (int x = 0; x < stringparts.length; x++) {
            stringparts[x] = stringparts[x].substring(stringparts[x].indexOf("\"") + 1, stringparts[x].lastIndexOf("\""));
            schedulestring.add(stringparts[x]);
        }

        int counter = 0;
        int num = 0;

        for (String sc : schedulestring) {

            //GETS FIRST COLUMN VALUE
            if (counter == 0) {
                s = new Schedule();
                s.setId(0);
                s.setStatus("Pending");
                s.setEvent(sc);
                s.setStage("Implementation");
                s.setDept("GS");
                if (implementation.size() == 0) {
                    s.setStartdate(startdate);
                } else {
                    c.add(Calendar.DATE, 1);
                    s.setStartdate(dateFormat.format(c.getTime()));
                }
                counter++;

                //GETS SECOND COLUMN VALUE
            } else if (counter == 1) {
                num = Integer.parseInt(sc);
                counter++;

                //GETS THIRD COLUMN VALUE
            } else if (counter == 2) {
                if (sc.equalsIgnoreCase("Week/s")) {
                    num *= 7;
                } else if (sc.equalsIgnoreCase("Month/s")) {
                    num *= 30;
                }
                c.add(Calendar.DATE, num);
                s.setEnddate(dateFormat.format(c.getTime()));
                implementation.add(s);
                counter = 0;
            }
        }

    }

    public int convertdays(String label, int number) {
        int days = 0;

        if (label.equalsIgnoreCase("Day/s")) {
            days = number;
        } else if (label.equalsIgnoreCase("Week/s")) {
            days = number * 7;
        } else if (label.equalsIgnoreCase("Month/s")) {
            days = number * 30;
        }

        return days;
    }

    public void setImplementationSched(ArrayList<Schedule> bidding) {
        this.bidding = bidding;
    }

    public String addDate(Calendar c, int days) {
        for (int x = 0; x < days; x++) {
            c.add(Calendar.DATE, 1);
        }
        if (c.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) {
            c.add(Calendar.DATE, 2);
        } else if (c.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
            c.add(Calendar.DATE, 1);

        }
        return dateFormat.format(c.getTime());
    }

    public String reduceDate(Calendar c, int days) {

        for (int x = 0; x < days; x++) {
            int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);

            if (dayOfWeek == Calendar.MONDAY) {
                c.add(Calendar.DATE, -3);
            } else if (dayOfWeek == Calendar.SUNDAY) {
                c.add(Calendar.DATE, -2);
            } else {
                c.add(Calendar.DATE, -1);
            }
        }
        return dateFormat.format(c.getTime());

    }

    public void checkWeekend(Calendar c) {
        int day = c.get(Calendar.DAY_OF_WEEK);
        if (day == Calendar.SATURDAY) {
            c.add(Calendar.DATE, 2);
        } else if (day == Calendar.SUNDAY) {
            c.add(Calendar.DATE, 1);
        }
    }

    public ArrayList<Schedule> getPlanning() {
        return planning;
    }

    public ArrayList<Schedule> getBidding() {
        return bidding;
    }

    public ArrayList<Schedule> getImplementation() {
        return implementation;
    }

//    public ArrayList<Schedule> getviewSchedule(ArrayList<Schedule> thelist) throws ParseException{
//        
//        Calendar c = Calendar.getInstance();
//        c.setTime(dateFormat.parse(thelist.get(0).getStartdate()));
//        
//        for(int x = 0;x< thelist.size();x++){
//            Schedule s = new Schedule();
//            s.setId(thelist.get(x).getId());
//            s.setEvent(thelist.get(x).getEvent());
//            
//            LocalDate start = LocalDate.parse(thelist.get(x).getStartdate());
//            LocalDate end = LocalDate.parse(thelist.get(x).getEnddate());
//            
//            long days = ChronoUnit.DAYS.between(start, end);
//            
//            for(int y = 0;y<days;y++){
//                int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
//                
//                s.setStartdate(c.getTime().toString());
//                
//                
//            }
//        }
//        
//        return thelist;
//    }
}
