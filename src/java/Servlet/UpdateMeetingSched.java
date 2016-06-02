/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ActivityDAO;
import DAO.AdjustSchedule;
import DAO.AjaxDAO;
import DAO.NotificationDAO;
import DAO.OCPDDAO;
import Entity.Activity;
import Entity.Employee;
import Entity.Files;
import Entity.Notification;
import Entity.Project;
import Entity.Schedule;
import Entity.Testimonial;
import Entity.User;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lenovo
 */
public class UpdateMeetingSched extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession s = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Employee e = (Employee) s.getAttribute("user");
            AjaxDAO a = new AjaxDAO();
            NotificationDAO ndao = new NotificationDAO();
            Notification n = null;
            ActivityDAO actdao = new ActivityDAO();

            int id = Integer.parseInt(request.getParameter("schedID"));
            String date = request.getParameter("setDate");
            String time = request.getParameter("setTime");
            String remark = request.getParameter("remarks");
            String dept = "";
            AdjustSchedule as = new AdjustSchedule();
            Schedule meeting = new Schedule();
            meeting.setEvent("Meeting with OCPD");
            meeting.setId(id);
            meeting.setStartdate(date);
            meeting.setEnddate(date);
            meeting.setTime(time);

            Project p = new Project();
            OCPDDAO oc = new OCPDDAO();

            if (e.getDepartment().equalsIgnoreCase("Engineering")) {
                dept = "GS";
                for (User u : ndao.getEmployeePerDept("OCPD")) {
                    n = new Notification();
                    n.setNotification("Meeting has been set on " + date + " " + time + ". Please confirm this schedule.");
                    n.setUsers_ID(u);
                    ndao.addNotification(n);
                }
                actdao.addActivity(new Activity(0,
                        e.getFirstName() + " " + e.getLastName() + " set new meeting schedule on " + date,
                        null, e.getUser()));
            } else if (e.getDepartment().equalsIgnoreCase("OCPD")) {
                dept = "OCPD";
                for (User u : ndao.getEmployeePerDept("GS")) {
                    n = new Notification();
                    n.setNotification("Meeting has been set on " + date + " " + time + ". Please confirm this schedule.");
                    n.setUsers_ID(u);
                    ndao.addNotification(n);

                }
                actdao.addActivity(new Activity(0,
                        e.getFirstName() + " " + e.getLastName() + " set new meeting schedule on " + date,
                        null, e.getUser()));

            }


            a.updateMeetingDone(date, date, id, dept, time, remark);
            p = oc.getProjectDetails(a.getSchedule(id).getProjectID());

            as.adjustForMeeting(meeting, p.getSchedule());

            String json = new Gson().toJson(date);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(UpdateMeetingSched.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(UpdateMeetingSched.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
